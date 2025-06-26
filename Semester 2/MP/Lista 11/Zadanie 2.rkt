#lang plait

(module+ test
  (print-only-errors #t))

; coś tu jest zrobione ale nie jestem pewny, czemu działa
; + nie jestem pewny czy dziala zawsze ale jest do wybronienia,
; ewentualnie coś tam może być źle z counter, ale to kwestia co
; najwyżej dopisania +1 w niektórych miejscach, czy coś

; Generalnie do wybronienia, ale no ja nie do końca rozumiem
; czemu naprawiamy cos, co i tak w momencie kiedy mamy zmienne
; wolne po prostu zwraca nam error

; subst '{let (x y) (+ x y)} 'y {+ x y}) -> gdzie, za co, co
; ^ mielismy x z "gdzie" zwiazanego, a x z podstawienia gdzieś na zewnątrz
; (let x (+ x y) (+ x (+ x y))) -> mamy zwiazane wszystko do x "gdzie"
; (vars e2 ...) = '(x y)
; (vars e1 ...) = '(x y)

; boimy się o przechwycenie zmiennych wolnych, bo pojawiają się błędy
; (subst e1 x e2) -> {let y a b} -> {let z a b[y -> z]} -> gdzie z to świeża zmienna
; e[x1 -> e1] -> e[y -> z][x1 -> e1] -> przy napotkaniu kolejnych letów to mi rośnie, ale nie musimy przelatwywać po całym podtermie, tworzymy listę podstawień i schodzimy rekurencyjnie raz -> opt


;; abstract syntax -------------------------------

(define-type Op
  (add) (sub) (mul) (div) (eql) (leq))

(define-type Exp
  (numE [n : Number])
  (trueE)
  (falseE)
  (opE [op : Op] [l : Exp] [r : Exp])
  (ifE [b : Exp] [l : Exp] [r : Exp])
  (varE [x : Symbol])
  (letE [x : Symbol] [e1 : Exp] [e2 : Exp]))

;; parse ----------------------------------------

(define (parse [s : S-Exp]) : Exp
  (cond
    [(s-exp-match? `SYMBOL s)
     (varE (s-exp->symbol s))]
    [(s-exp-match? `{let SYMBOL ANY ANY} s)
     (letE (s-exp->symbol (second (s-exp->list s)))
           (parse (third (s-exp->list s)))
           (parse (fourth (s-exp->list s))))]
    [(s-exp-match? `NUMBER s)
     (numE (s-exp->number s))]
    [(s-exp-match? `{SYMBOL ANY ANY} s)
     (opE (parse-op (s-exp->symbol (first (s-exp->list s))))
          (parse (second (s-exp->list s)))
          (parse (third (s-exp->list s))))]
    [(s-exp-match? `{if ANY ANY ANY} s)
     (ifE (parse (second (s-exp->list s)))
          (parse (third (s-exp->list s)))
          (parse (fourth (s-exp->list s))))]
    [(s-exp-match? `true s)
     (trueE)]
    [(s-exp-match? `false s)
     (falseE)]
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
  (test/exn (parse `{+ 1})
            "invalid input")
  (test/exn (parse `{^ 1 2})
            "unknown operator")
  (test (parse `{let x 1 {+ x 1}})
        (letE 'x (numE 1) (opE (add) (varE 'x) (numE 1)))))

;; binding

(define-type-alias (Setof 'a) (Listof 'a))

(define (emptyS) : (Setof 'a)
  empty)

(define (singletonS [x : 'a]) : (Setof 'a)
  (list x))

(define (inS [x : 'a] [s : (Setof 'a)]) : Boolean
  (member x s))

(define (unionS [s1 : (Setof 'a)] [s2 : (Setof 'a)]) : (Setof 'a)
  (append (filter (λ (x) (not (member x s2))) s1) s2))

(define (removeS [x : 'a] [s : (Setof 'a)]): (Setof 'a)
  (filter (λ (y) (not (eq? x y))) s))

(define (subsetS [s1 : (Setof 'a)] [s2 : (Setof 'a)]) : Boolean
  (empty? (filter (λ (x) (not (member x s2))) s1)))

(define (equalS [s1 : (Setof 'a)] [s2 : (Setof 'a)]) : Boolean
  (and (subsetS s1 s2) (subsetS s2 s1)))

(define (fromList [xs : (Listof 'a)]) : (Setof 'a)
  (foldr (λ (x s) (unionS (singletonS x) s))
         (emptyS)
         xs))

(define (fv [e : Exp]) : (Setof Symbol)
  (type-case Exp e
    [(numE n) (emptyS)]
    [(trueE) (emptyS)]
    [(falseE) (emptyS)]
    [(opE o l r) (unionS (fv l) (fv r))]
    [(ifE b l r)
     (unionS (fv b) (unionS (fv l) (fv r)))]
    [(varE x)
     (singletonS x)]
    [(letE x e1 e2)
     (unionS (fv e1)
             (removeS x (fv e2)))]))

(module+ test
  (test (equalS (fv (parse `2))
                (emptyS))
        #t)
  (test (equalS (fv (parse `x))
                (singletonS 'x))
        #t)
  (test (equalS (fv (parse `{* x {+ y x}}))
                (fromList '(x y)))
        #t)
  (test (equalS (fv (parse `{let x 1 {+ x 1}}))
                (emptyS))
        #t)
  (test (equalS (fv (parse `{let x x {+ x y}}))
                (fromList '(x y)))
        #t)
    (test (equalS (fv (parse `{let x 1 {let y x y}}))
                (emptyS))
        #t))

;; eval --------------------------------------

(define-type Value
  (numV [n : Number])
  (boolV [b : Boolean]))

(define (value->exp [v : Value]) : Exp
  (type-case Value v
    [(numV n)
     (numE n)]
    [(boolV b)
     (if b (trueE) (falseE))]))

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

(define (eval [e : Exp] counter) : Value ; zmieniamy, dodajemy counter
  (type-case Exp e
    [(numE n) (numV n)]
    [(trueE) (boolV #t)]
    [(falseE) (boolV #f)]
    [(opE o l r) ((op->proc o) (eval l counter) (eval r counter))]
    [(ifE b l r)
     (type-case Value (eval b counter)
       [(boolV v)
        (if v (eval l counter) (eval r counter))]
       [else
        (error 'eval "type error")])]
    [(varE x)
     (error 'eval "unbound variable")]
    [(letE x e1 e2)
     (let ([v1 (eval e1 counter)])
       (eval (subst e2 x (value->exp v1) counter) (+ 1 counter)))]))

;; new names for variables:

(define (variable n)
  (string->symbol (string-append "x" (to-string n))))

(define (subst [e : Exp] [x : Symbol] [a : Exp] counter) : Exp ; zmieniamy, dodajemy counter
  (type-case Exp e
    [(numE n) (numE n)]
    [(trueE) (trueE)]
    [(falseE) (falseE)]
    [(opE o l r) (opE o (subst l x a counter) (subst r x a counter))]
    [(ifE b l r) (ifE (subst b x a counter) (subst l x a counter) (subst r x a counter))]
    [(varE y)
     (if (eq? x y) a (varE y))]
    [(letE y e1 e2)
     (let ([e1-new (subst e1 x a counter)]
           [e2-new (if (eq? x y)
                       (subst e2 y (varE (variable counter)) counter)
                       (subst (subst e2 y (varE (variable counter)) (+ counter 1)) x a (+ 2 counter)))])
       (letE (variable counter) e1-new e2-new))]))

(define (run [e : S-Exp]) : Value
  (eval (parse e) 0))

; (subst `{let x 1 {+ x {let x {+ x 1} {* x 3}}}})

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
  (test (run `{let x 1 ; dodany test, ale dziala tez w poprzednim
                {+ x {let y x
                       {let x 3 {+ y x}}}}})
        (numV 5)))

;; printer ———————————————————————————————————-

(define (value->string [v : Value]) : String
  (type-case Value v
    [(numV n) (to-string n)]
    [(boolV b) (if b "true" "false")]))

(define (print-value [v : Value]) : Void
  (display (value->string v)))

(define (main [e : S-Exp]) : Void
  (print-value (eval (parse e) 0)))