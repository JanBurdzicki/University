#lang plait

(module+ test
  (print-only-errors #t))

;; abstract syntax -------------------------------

(define-type Op
  (add) (sub) (mul) (div) (eql) (leq))

(define-type Exp
  (numE [n : Number])
  (opE [op : Op] [l : Exp] [r : Exp])
  (ifE [b : Exp] [l : Exp] [r : Exp])
  (varE [x : Symbol])
  (letE [x : Symbol] [e1 : Exp] [e2 : Exp])
  (lamE [xs : (Listof Symbol)] [e : Exp])
  (appE [e1 : Exp] [exps : (Listof Exp)]))

;; parse ----------------------------------------

(define (parse-all [exps : (Listof S-Exp)]) : (Listof Exp)
  (if (empty? exps)
      empty
      (cons (parse (first exps)) (parse-all (rest exps)))))

(define (all->symbol [sexps : (Listof S-Exp)]) : (Listof Symbol)
  (if (empty? sexps)
      empty
      (cons (s-exp->symbol (first sexps)) (all->symbol (rest sexps)))))

(define (parse [s : S-Exp]) : Exp
  (cond
    [(s-exp-match? `NUMBER s)
     (numE (s-exp->number s))]
    [(s-exp-match? `{lambda {ANY ANY ...} ANY} s) ; lambda ma przyjmowac minimum 1 rzecz
     (lamE (all->symbol (s-exp->list (second (s-exp->list s))))
           (parse (third (s-exp->list s))))]
    [(s-exp-match? `{SYMBOL ANY ANY} s)
     (opE (parse-op (s-exp->symbol (first (s-exp->list s))))
          (parse (second (s-exp->list s)))
          (parse (third (s-exp->list s))))]
    [(s-exp-match? `{if ANY ANY ANY} s)
     (ifE (parse (second (s-exp->list s)))
          (parse (third (s-exp->list s)))
          (parse (fourth (s-exp->list s))))]
    [(s-exp-match? `SYMBOL s)
     (varE (s-exp->symbol s))]
    [(s-exp-match? `{let SYMBOL ANY ANY} s)
     (letE (s-exp->symbol (second (s-exp->list s)))
           (parse (third (s-exp->list s)))
           (parse (fourth (s-exp->list s))))]
    [(s-exp-match? `{ANY ANY ANY ...} s) ; co najmniej jedna rzecz aplikuje
     (appE (parse (first (s-exp->list s)))
           (parse-all (rest (s-exp->list s))))]
    [else (error 'parse "invalid input")]))

(define (parse-op [op : Symbol]) : Op
  (cond
    [(eq? op '+) (add)]
    [(eq? op '-) (sub)]
    [(eq? op '*) (mul)]
    [(eq? op '/) (div)]
    [(eq? op '=) (eql)]
    [(eq? op '<=) (leq)]
    [else (error 'parse "unknown operator")]))

(module+ test
  (test (parse `2)
        (numE 2))
  (test (parse `{+ 2 1})
        (opE (add) (numE 2) (numE 1)))
  (test (parse `{* 3 4})
        (opE (mul) (numE 3) (numE 4)))
  (test (parse `{+ {* 3 4} 8})
        (opE (add)
             (opE (mul) (numE 3) (numE 4))
             (numE 8)))
  (test (parse `{if {= 0 1} {* 3 4} 8})
        (ifE (opE (eql) (numE 0) (numE 1))
             (opE (mul) (numE 3) (numE 4))
             (numE 8)))
  (test/exn (parse `{{+ 1 2}})
            "invalid input")
  (test (parse `{+ 1})
        (appE (varE '+) (list (numE 1))))
  (test/exn (parse `{^ 1 2})
            "unknown operator")
  (test (parse `{let x 1 {+ x 1}})
        (letE 'x (numE 1) (opE (add) (varE 'x) (numE 1))))
  (test (parse `{lambda {x} 9})
        (lamE (list 'x) (numE 9)))
  (test (parse `{double 9})
        (appE (varE 'double) (list (numE 9))))
  (test (parse `{{lambda {x y z t} {+ x {+ y {+ z t}}}} 1 2 3 4}) ; dodany test
        (appE (lamE (list 'x 'y 'z 't)
                    (opE (add) (varE 'x)
                         (opE (add) (varE 'y)
                              (opE (add) (varE 'z) (varE 't)))))
            (list (numE 1) (numE 2) (numE 3) (numE 4)))))


;; eval --------------------------------------

;; values

(define-type Value
  (numV [n : Number])
  (boolV [b : Boolean])
  (funV [f : ((Listof Value) -> Value)])) ; zmieniony typ -> Value zmienia się na Listof Value

(define-type Binding
  (bind [name : Symbol]
        [val : Value]))

;; environments

(define-type-alias Env (Listof Binding))

(define mt-env empty)
(define (extend-env [env : Env] [xs : (Listof Symbol)] [vs : (Listof Value)]) : Env ; zmienione
  (if (empty? xs)
      env
      (if (empty? vs)
          (error 'eval "not enought values for lambda")
          (extend-env (cons (bind (first xs) (first vs)) env) (rest xs) (rest vs)))))

(define (lookup-env [n : Symbol] [env : Env]) : Value
  (type-case (Listof Binding) env
    [empty (error 'lookup "unbound variable")]
    [(cons b rst-env) (cond
                        [(eq? n (bind-name b))
                         (bind-val b)]
                        [else (lookup-env n rst-env)])]))

;; primitive operations

(define (op-num-num->proc [f : (Number Number -> Number)]) : (Value Value -> Value)
  (λ (v1 v2)
    (type-case Value v1
      [(numV n1)
       (type-case Value v2
         [(numV n2)
          (numV (f n1 n2))]
         [else
          (error 'eval "type error")])]
      [else
       (error 'eval "type error")])))

(define (op-num-bool->proc [f : (Number Number -> Boolean)]) : (Value Value -> Value)
  (λ (v1 v2)
    (type-case Value v1
      [(numV n1)
       (type-case Value v2
         [(numV n2)
          (boolV (f n1 n2))]
         [else
          (error 'eval "type error")])]
      [else
       (error 'eval "type error")])))

(define (op->proc [op : Op]) : (Value Value -> Value)
  (type-case Op op
    [(add) (op-num-num->proc +)]
    [(sub) (op-num-num->proc -)]
    [(mul) (op-num-num->proc *)]
    [(div) (op-num-num->proc /)]
    [(eql) (op-num-bool->proc =)]
    [(leq) (op-num-bool->proc <=)]))

;; evaluation function (eval/apply)

(define (eval-all [es : (Listof Exp)] [env : Env]) : (Listof Value) ; dodane
  (if (empty? es)
      empty
      (cons (eval (first es) env) (eval-all (rest es) env))))

(define (eval [e : Exp] [env : Env]) : Value
  (type-case Exp e
    [(numE n) (numV n)]
    [(opE o l r) ((op->proc o) (eval l env) (eval r env))]
    [(ifE b l r)
     (type-case Value (eval b env)
       [(boolV v)
        (if v (eval l env) (eval r env))]
       [else
        (error 'eval "type error")])]
    [(varE x)
     (lookup-env x env)]
    [(letE x e1 e2)
     (let ([v1 (eval e1 env)])
       (eval e2 (extend-env env (list x) (list v1))))]
    [(lamE xs b) ; zmienione
     (funV (λ (vs) (eval b (extend-env env xs vs))))]
    [(appE e es) ; zmienione
     (apply (eval e env) (eval-all es env))]))

(define (apply [v1 : Value] [vs : (Listof Value)]) : Value ; zmieniony typ
  (type-case Value v1
    [(funV f) (f vs)]
    [else (error 'apply "type error")]))


(define (run [e : S-Exp]) : Value
  (eval (parse e) mt-env))

(module+ test
  (test (run `2)
        (numV 2))
  (test (run `{+ 2 1})
        (numV 3))
  (test (run `{* 2 1})
        (numV 2))
  (test (run `{+ {* 2 3} {+ 5 8}})
        (numV 19))
  (test (run `{= 0 1})
        (boolV #f))
  (test (run `{if {= 0 1} {* 3 4} 8})
        (numV 8))
  (test (run `{let x 1 {+ x 1}})
        (numV 2))
  (test (run `{let x 1 {+ x {let y 2 {* x y}}}})
        (numV 3))
  (test (run `{let x 1
                {+ x {let x {+ x 1}
                       {* x 3}}}})
        (numV 7))
  (test (run `{{lambda {x} {+ x 1}} 5})
        (numV 6))
  (test (run `{{lambda {x y z t} {+ x {+ y {+ z t}}}} 1 2 3 4}) ; dodany test
        (numV 10))
  (test (run `{{lambda {x y z t} {+ x {+ y {- z t}}}} 1 2 3 4}) ; dodany test (sprawdza czy kolejnosc dzialan jest ok)
        (numV 2)))

;; printer ———————————————————————————————————-

(define (value->string [v : Value]) : String
  (type-case Value v
    [(numV n) (to-string n)]
    [(boolV b) (if b "true" "false")]
    [(funV _) "#<procedure>"]))

(define (print-value [v : Value]) : Void
  (display (value->string v)))

(define (main [e : S-Exp]) : Void
  (print-value (eval (parse e) mt-env)))