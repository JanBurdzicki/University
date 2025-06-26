#lang plait

; abstract syntax

(define-type Op2
  (add)
  (sub)
  (mul)
  (div)
  (pow))

(define-type Op1
  (neg)
  (fact))

(define-type Exp
  (numE [n : Number])
  (opE1 [op : Op1] [e : Exp])
  (opE2 [op : Op2] [l : Exp] [r : Exp]))

(define (parse-op2 [op : Symbol]) : Op2
  (cond [(eq? op '+) (add)]
        [(eq? op '-) (sub)]
        [(eq? op '*) (mul)]
        [(eq? op '/) (div)]
        [(eq? op '^) (pow)]
		[else (error 'parse "invalid input")]))

(define (parse-op1 [op : Symbol]) : Op1
  (cond [(eq? op '-) (neg)]
        [(eq? op '!) (fact)]
		[else (error 'parse "invalid input")]))

(define (parse [s : S-Exp]) : Exp
  (cond [(s-exp-match? `NUMBER s)
         (numE (s-exp->number s))]
		[(s-exp-match? `{SYMBOL ANY} s)
		 (opE1 (parse-op1 (s-exp->symbol (first (s-exp->list s))))
		      (parse (second (s-exp->list s))))]
		[(s-exp-match? `{SYMBOL ANY ANY} s)
		 (opE2 (parse-op2 (s-exp->symbol (first (s-exp->list s))))
		      (parse (second (s-exp->list s)))
		      (parse (third (s-exp->list s))))]
		[else (error 'parse "invalid input")]))

; eval

(define (factorial n)
  (if (= n 0)
      1
	  (* n (factorial (- n 1)))))

(define (power a n)
  (if (= n 0)
      1
	  (* a (power a (- n 1)))))

(define (eval-op2 [op : Op2])
  (type-case Op2 op
    [(add) +]
    [(sub) -]
    [(mul) *]
    [(div) /]
    [(pow) power]))

(define (eval-op1 [op : Op1])
  (type-case Op1 op
    [(neg) (lambda (x) (- 0 x))]
    [(fact) factorial]))

(define (eval [e : Exp]) : Number
  (type-case Exp e
    [(numE n) n]
	[(opE1 op e) ((eval-op1 op) (eval e))]
	[(opE2 op l r) ((eval-op2 op) (eval l) (eval r))]))



(eval (parse `(* 2 (+ 2 2))))
(parse `(* 2 (+ 2 2)))
(eval (parse `(^ 2 (+ 2 2))))
(eval (parse `(* 2 (- 2))))
(eval (parse `(! (+ 2 (* 1 3)))))
