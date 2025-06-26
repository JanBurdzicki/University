#lang plait

(module+ test
  (print-only-errors #t))

; abstract syntax

(define-type Op
  (add)
  (sub)
  (mul)
  (div)
  (eql)
  (leq))

(define-type Exp
  (numE [n : Number])
  (opE [op : Op] [l : Exp] [r : Exp])
  (ifE [b : Exp] [l : Exp] [r : Exp])
  (condE [cs : (Listof (Exp * Exp))])
  (errorE [loc : Symbol] [msg : String]))

; parse

(define (parse [s : S-Exp]) : Exp
  (cond [(s-exp-match? `NUMBER s)
         (numE (s-exp->number s))]
		[(s-exp-match? `{error SYMBOL STRING} s)
		 (errorE (s-exp->symbol (second (s-exp->list s)))
		         (s-exp->string (third (s-exp->list s))))]
		[(s-exp-match? `{if ANY ANY ANY} s)
		 (ifE (parse (second (s-exp->list s)))
		      (parse (third (s-exp->list s)))
		      (parse (fourth (s-exp->list s))))]
		[(s-exp-match? `{cond ANY ...} s)
		 (condE (parse-cond (rest (s-exp->list s))))]
		[(s-exp-match? `{SYMBOL ANY ANY} s)
		 (opE (parse-op (s-exp->symbol (first (s-exp->list s))))
		      (parse (second (s-exp->list s)))
		      (parse (third (s-exp->list s))))]
	    [else (error 'parse "invalid input")]))

(define (parse-op [op : Symbol]) : Op
  (cond [(eq? op '+) (add)]
        [(eq? op '-) (sub)]
        [(eq? op '*) (mul)]
        [(eq? op '/) (div)]
        [(eq? op '=) (eql)]
        [(eq? op '<=) (leq)]
        [else (error 'parse "unknown operator")]))

(define (parse-cond [ss : (Listof S-Exp)]) : (Listof (Exp * Exp))
  (type-case (Listof S-Exp) ss
    [empty empty]
	[(cons s ss)
	 (if (s-exp-match? `{ANY ANY} s)
	     (cons (pair (parse (first (s-exp->list s)))
	           (parse (second (s-exp->list s))))
	     (parse-cond ss))
		 (error 'parse-cond "invalid input: cond"))]))

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
  (test (parse `{cond {{= 0 1} {* 3 4}}
                      {{= 1 1} 8}})
        (condE (list (pair (opE (eql) (numE 0) (numE 1))
                           (opE (mul) (numE 3) (numE 4)))
                     (pair (opE (eql) (numE 1) (numE 1))
                           (numE 8))))))


; eval

(define-type Value
  (numV [n : Number])
  (boolV [b : Boolean]))

(define-type Answer
  (valueA [v : Value])
  (errorA [loc : Symbol] [msg : String]))

; error monad

(define (err [l : Symbol] [m : String]) : Answer
  (errorA l m))

(define (return [v : Value]) : Answer
  (valueA v))

(define (bind [a : Answer] [f : (Value -> Answer)]) : Answer
  (type-case Answer a
    [(valueA v)
	 (f v)]
	[(errorA l m)
	 (errorA l m)]))

(define-syntax do
  (syntax-rules ()
    [(do () a)
     a]
    [(do ([x1 a1] [x2 a2] ...) a)
     (bind a1 (λ (x1) (do ([x2 a2] ...) a)))]))

; (define (eval [e : Exp]) : Answer
;   (type-case Exp e
;     [(numE n) (valueA (numV n))]
;     [(opE op l r)
; 	 (type-case Answer (eval l)
; 	   [(valueA v-l)
; 	    (type-case Answer (eval r)
; 		  [(valueA v-r)
; 		   (valueA ((op->proc op) v-l v-r))]
; 		  [(errorA l m)
; 		   (errorA l m)])]
; 		[(errorA l m)
; 		 (errorA l m)])]
; 	[(ifE b l r)
; 	 (type-case Answer (eval b)
; 	   [(valueA v)
; 	    (type-case Value v
; 	      [(boolV u) (if u (eval l) (eval r))]
; 	      [else (errorA 'eval "type error")])]
; 	   [(errorA l m) (errorA l m)])]
; 	[(condE cs) (eval (cond->if cs))]
; 	[(errorE l m) (errorA l m)]))

(define (eval [e : Exp]) : Answer
  (type-case Exp e
    [(numE n)
     (return (numV n))]
    [(opE o l r)
     (do ([v-l (eval l)]
          [v-r (eval r)])
       ((op->proc o) v-l v-r))]
    [(ifE b l r)
     (do ([v (eval b)])
       (type-case Value v
         [(boolV u)
          (if u (eval l) (eval r))]
         [else
          (err 'eval "type error")]))]
    [(condE cs)
     (eval (cond->if cs))]
    [(errorE l m)
     (err l m)]))

(define (cond->if [cs : (Listof (Exp * Exp))]) : Exp
  (type-case (Listof (Exp * Exp)) cs
    [empty (errorE 'cond "no matching clause")]
	[(cons c cs)
	 (ifE (fst c) (snd c) (cond->if cs))]))

(define (op-num-num->proc [f : (Number Number -> Number)]) : (Value Value -> Answer)
  (lambda (v1 v2)
    (type-case Value v1
	  [(numV n1)
	   (type-case Value v2
	     [(numV n2)
		  (return (numV (f n1 n2)))]
		 [else
		  (err 'eval "type error")])]
	  [else
	   (err 'eval "type error")])))

(define (op-num-bool->proc [f : (Number Number -> Boolean)]) : (Value Value -> Answer)
  (lambda (v1 v2)
    (type-case Value v1
	  [(numV n1)
	   (type-case Value v2
	     [(numV n2)
		  (return (boolV (f n1 n2)))]
		 [else
		  (err 'eval "type error")])]
	  [else
	   (err 'eval "type error")])))

(define (op->proc [op : Op]) : (Value Value -> Answer)
  (type-case Op op
    [(add) (op-num-num->proc +)]
    [(sub) (op-num-num->proc -)]
    [(mul) (op-num-num->proc *)]
    [(div) (op-num-num->proc /)]
    [(eql) (op-num-bool->proc =)]
    [(leq) (op-num-bool->proc <=)]))

(define (run [e : S-Exp]) : Answer
  (eval (parse e)))

(define (value->string [v : Value]) : String
  (type-case Value v
    [(numV n) (to-string n)]
    [(boolV b) (if b "true" "false")]))

(define (print-value [v : Value]) : Void
  (display (value->string v)))

(define (main [e : S-Exp]) : Void
  (print-answer (eval (parse e))))

; (module+ test
;   (test (run `2)
;         (numV 2))
;   (test (run `{+ 2 1})
;         (numV 3))
;   (test (run `{* 2 1})
;         (numV 2))
;   (test (run `{+ {* 2 3} {+ 5 8}})
;         (numV 19))
;   (test (run `{= 0 1})
;         (boolV #f))
;   (test (run `{if {= 0 1} {* 3 4} 8})
;         (numV 8))
;   (test (run `{cond {{= 0 1} {* 3 4}}
;                     {{= 1 1} 8}})
;         (numV 8))
;   (test (parse `{error blad "blad"})
;         (errorE 'blad "blad")))

(module+ test
  (test (run `2)
        (valueA (numV 2)))
  (test (run `{+ 2 1})
        (valueA (numV 3)))
  (test (run `{* 2 1})
        (valueA (numV 2)))
  (test (run `{+ {* 2 3} {+ 5 8}})
        (valueA (numV 19)))
  (test (run `{= 0 1})
        (valueA (boolV #f)))
  (test (run `{if {= 0 1} {* 3 4} 8})
        (valueA (numV 8)))
  (test (run `{cond {{= 0 1} {* 3 4}}
                    {{= 1 1} 8}})
        (valueA (numV 8)))
  (test (run `{cond})
        (errorA 'cond "no matching clause")))

(define (print-answer [a : Answer]) : Void
  (type-case Answer a
    [(valueA v) (print-value v)]
	[(errorA l m)
	 (begin
	   (display l)
	   (display ": ")
	   (display m))]))

(define inpt-prompt "MP23> ")
(define newline (lambda () (display "\n")))
(define (driver-loop)
    (begin
        (display inpt-prompt)
        (let ([input (read)])
            (if (s-exp-match? input `exit)
                (void)
                (let ([output (run input)])
                    (begin
                        (print-answer output)
                        (newline)
                        (driver-loop)
                    )
                )
            )
        )
    )
)

(driver-loop)
