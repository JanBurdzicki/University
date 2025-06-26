; Jan Burdzicki

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
  (appE [e0 : Exp] [e1 : Exp])
  (ambE [e1 : Exp] [e2 : Exp]) ; dodaję amb i fail
  (failE))

;; semantics: the identity monad and values

(define-type-alias (M 'a) (Listof 'a))

(define (returnM [v : 'a]) : (M 'a) ; zmiana monady powoduje zmianę typu do zwrócenia
  (list v))


; wywołujemy funkcję bindM na całej liście i wrzucamy wszystko do listy wynikowej,
; składającej się z rezultatów zastosowania funkcji na każdym elemencie listy c
(define (bindM [c : (M 'a)] [f : ('a -> (M 'b))]) : (M 'b)
  (if (empty? c)
      empty
      (append (f (first c)) (bindM (rest c) f))))

(define (errorM [l : Symbol] [m : String]) : (M 'a)
  (list (error l m)))

; join
(define (join lst)
  (if (empty? lst)
      ""
      (foldl (lambda (s acc) (string-append acc (string-append " " s)))
         (first lst)
         (rest  lst))))

(define (showM [c : (M Value)]) : String
  (join (map value->string c)))

(define-type Value
  (numV [n : Number])
  (funV [f : (Value -> (M Value))])
  (listV [vs : (Listof Value)]))

(define (value->string [v : Value]) : String
  (type-case Value v
    [(numV n) (to-string n)]
    [(funV _) "#<procedure>"]
    [else (error 'value->string "not supported type")]))

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
    ; evaluator dla fail i amb
    [(ambE e1 e2)
      (append (eval e1 env) (eval e2 env))] ; ewaluuję pierwszy i sklejam z drugim
    [(failE) empty] ; w przypadku fail zwracam pustą listę
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

(module+ test
  (test (run `{+ {* 2 3} {+ 5 8}})
         "19")
  (test (run `{{lambda {x} {+ x 1}} 5})
         "6")
  (test/exn (run `{1 2})
             "not a function")
  (test (run `{amb 1 2})
         "1 2")
  (test (run `{amb 1 fail})
         "1")
  (test (run `{+ {amb 1 10} {amb 100 1000}})
         "101 1001 110 1010")
  (test (run `{+ {amb 1 fail} {amb 100 1000}})
         "101 1001"))

;; parse ----------------------------------------

(define (parse [s : S-Exp]) : Exp
  (cond
    ; dodanie amb i fail
    [(s-exp-match? `{amb ANY ANY} s)
     (ambE (parse (second (s-exp->list s)))
                  (parse (third (s-exp->list s))))]
    [(s-exp-match? `fail s)
     (failE)]
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


#|
DOWÓD PRAW MONADYCZNYCH
(bindM (returnM a) f) ≡ (f a)
(bindM c returnM ) ≡ c
(bindM (bindM c f) g) ≡ (bindM c (λ (a) (bindM (f a) g)))

(define-type-alias (M 'a) ( Listof 'a))

(define (returnM [v : 'a]) : (M 'a)
  (list v))

(define (bindM [c : (M 'a)] [f : ('a -> (M 'b))]) : (M 'b)
  (if (empty? c)
      empty
      (append (f (first c)) (bindM (rest c) f))))

1#
Niech a=(list v) oraz niech (f (list v)) oznacza wykonanie funkcji na liście
(bindM (returnM a) f) => (bindM (list v) f) => (f (list v)) ≡ (f a)

2#
(bindM c returnM) => (returnM (list v)) ≡ (list v)
                       wykonuję returnM na każdym elemencie listy i wszystko dodaję do pierwszego elementu, merge list
3#
(bindM (bindM c f) g) ≡ (bindM c (λ (a) (bindM (f a) g)))
(bindM (f (list v)) g) ≡ (bindM c (λ (a) (g (f a)))) => ((λ (a) (g (f a))) (list v)) ; wywołuję lambdę z listą
(g (f (list v))) ≡ (g (f (list v)))
|#
