#lang plait

(module+ test
  (print-only-errors #t))

;; abstract syntax -------------------------------

(define-type Op
  (add) (sub) (mul))

(define-type Exp
  (numE [n : Number])
  (opE [op : Op] [e1 : Exp] [e2 : Exp])
  (varE [x : Symbol])
  (lamE [x : Symbol] [e : Exp])
  (appE [e0 : Exp] [e1 : Exp]))

;; semantics: the error monad and values

; zmieniamy typ naszej monady
(define-type (M 'a)
  (valM [val : 'a])
  (errM [l : Symbol] [m : String]))

; zwracamy część monady
(define (returnM [v : 'a]) : (M 'a)
  (valM v))

; przerabiamy bind analogicznie do tego co w error-ans-monad
(define (bindM [c : (M 'a)] [f : ('a -> (M 'b))]) : (M 'b)
  (type-case (M 'a) c
    [(valM v) (f v)]
    [(errM l m) (errM l m)])) ; propagujemy blad, ten sam typ

; korzystamy z monady błędu,
; zwaracane wartości zawsze będą miały typ (M Value), bo to wynika z faktu, że ewaluator zawsze zwraca (M Value)
(define (errorM [l : Symbol] [m : String]) : (M 'a)
  (errM l m))

(define (showM [c : (M Value)]) : String
  ; rozważamy przypadki dla (M Value)
  (type-case (M Value) c
    [(valM v) (string-append "value: " (value->string v))]
    [(errM l m) (error->string l m)]))

(define-type Value
  (numV [n : Number])
  (funV [f : (Value -> (M Value))]))

(define (error->string [l : Symbol] [m : String]) : String
  (string-append (string-append (string-append "error in " (symbol->string l)) ": ") m))

(define (value->string [v : Value]) : String
  (type-case Value v
    [(numV n) (to-string n)]
    [(funV _) "#<procedure>"]))

;; environments

(define-type Binding
  (bind [name : Symbol]
        [val : Value]))

(define-type-alias Env (Listof Binding))

(define mt-env empty)

(define (extend-env [env : Env] [x : Symbol] [v : Value]) : Env
  (cons (bind x v) env))

(define (lookup-env [x : Symbol] [env : Env]) : (M Value)
  (type-case (Listof Binding) env
    [empty
     (errorM 'lookup-env "unbound variable")]
    [(cons b rst-env)
     (cond
       [(eq? x (bind-name b))
        (returnM (bind-val b))]
       [else
        (lookup-env x rst-env)])]))

;; primitive operations

; zmieniamy, zeby byla monada, np returnM, errorM
(define (op-num-num->proc [f : (Number Number -> Number)]) : (Value Value -> (M Value))
  (λ (v1 v2)
    (type-case Value v1
      [(numV n1)
       (type-case Value v2
         [(numV n2)
          (returnM (numV (f n1 n2)))]
         [else
          (errorM 'prim-op "not a number")])]
      [else
       (errorM 'prim-op "not a number")])))

(define (op->proc [op : Op]) : (Value Value -> (M Value))
  (type-case Op op
    [(add) (op-num-num->proc +)]
    [(sub) (op-num-num->proc -)]
    [(mul) (op-num-num->proc *)]))

;; evaluation function (eval/apply)

(define (eval [e : Exp] [env : Env]) : (M Value)
  (type-case Exp e
    [(numE n)
     (returnM (numV n))]
    [(opE o e1 e2)
     (bindM (eval e1 env)
            (λ (v1) (bindM (eval e2 env)
                           (λ (v2) ((op->proc o) v1 v2)))))]
    [(varE x)
     (lookup-env x env)]
    [(lamE x b)
     (returnM (funV (λ (v) (eval b (extend-env env x v)))))]
    [(appE e0 e1)
     (bindM (eval e0 env)
            (λ (v0) (bindM (eval e1 env)
                           (λ (v1) (apply v0 v1)))))]))

(define (apply [v0 : Value] [v1 : Value]) : (M Value)
  (type-case Value v0
    [(funV f) (f v1)]
    [else (errorM 'apply "not a function")]))

(define (run [e : S-Exp]) : String
  (showM (eval (parse e) mt-env)))

;; parse ----------------------------------------

(define (parse [s : S-Exp]) : Exp
  (cond
    [(s-exp-match? `NUMBER s)
     (numE (s-exp->number s))]
    [(s-exp-match? `{lambda {SYMBOL} ANY} s)
     (lamE (s-exp->symbol
            (first (s-exp->list
                    (second (s-exp->list s)))))
           (parse (third (s-exp->list s))))]
    [(s-exp-match? `{SYMBOL ANY ANY} s)
     (opE (parse-op (s-exp->symbol (first (s-exp->list s))))
          (parse (second (s-exp->list s)))
          (parse (third (s-exp->list s))))]
    [(s-exp-match? `SYMBOL s)
     (varE (s-exp->symbol s))]
    [(s-exp-match? `{ANY ANY} s)
     (appE (parse (first (s-exp->list s)))
           (parse (second (s-exp->list s))))]
    [else (error 'parse "invalid input")]))

(define (parse-op [op : Symbol]) : Op
  (cond
    [(eq? op '+) (add)]
    [(eq? op '-) (sub)]
    [(eq? op '*) (mul)]
    [else (error 'parse "unknown operator")]))


(module+ test
  (test (run `{+ {* 2 3} {+ 5 8}})
        "value: 19")
  (test (run `{{lambda {x} {+ x 1}} 5})
        "value: 6")
  (test (run `{lambda {x} {+ x 1}})
        "value: #<procedure>")
  (test (run `{1 2})
        "error in apply: not a function")
  (test (run `x)
        "error in lookup-env: unbound variable")
  (test (run `{+ 1 {lambda {x} x }})
        "error in prim-op: not a number"))


#|
DOWÓD PRAW MONADYCZNYCH DLA  returnM i bindM
do udowodnienia:
#1 (bindM (returnM a) f) ≡ (f a)
#2 (bindM c returnM) ≡ c
#3 (bindM (bindM c f) g) ≡ (bindM c (λ (a) (bindM (f a) g)))

(define (returnM [v : 'a]) : (M 'a)
  (valM v))

(define (bindM [c : (M 'a)] [f : ('a -> (M 'b))]) : (M 'b)
  (type-case (M 'a) c
    [(valM v) (f v)]
    [(errM l m) (errM l m)]))

#1 (bindM (returnM a) f) ≡ (f a)
a może być tylko (valM v), bo errory są w innej monadzie

(bindM (returnM a) f) => (bindM (valM v) f) ≡ (f a) ; a to musiało być (valM v)

#2 (bindM c returnM ) ≡ c

1st c = (valM v)
 (bindM c returnM) => (returnM c) => (valM v) ≡ c

2nd c = (errM l m)
 (bindM c returnM) => (errM l m) ≡ c ; korzystam z definicji dla drugiego przypadku

#3 (bindM (bindM c f) g) ≡ (bindM c (λ (a) (bindM (f a) g)))

1st c = (valM v)
(bindM (f v) g) ≡ (bindM c (λ (a) (g (f a))))
(g (f v)) ≡ (bindM c (λ (a) (g (f a)))) => ((λ (a) (g (f a)) v) ; aplikujemy v do lambdy
(g (f v)) ≡ (g (f v))

2nd c = (errM l m)
; korzystam z definicji bindM
(bindM (errM l m) g) ≡ (bindM c (λ (a) (g (f a)))) => (errM l m)
(errM l m) ≡ (errM l m)
|#
