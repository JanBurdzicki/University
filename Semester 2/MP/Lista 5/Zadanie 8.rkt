#lang plait

(define-type Prop
	(var [v : String])
	(conj [l : Prop] [r : Prop])
	(disj [l : Prop] [r : Prop])
	(neg [f : Prop]))

(define (eval hash prop)
	(cond [(var? prop) (some-v (hash-ref hash (var-v prop)))]
		  [(neg? prop) (not (eval hash (neg-f prop)))]
		  [(conj? prop) (and (eval hash (conj-l prop)) (eval hash (conj-r prop)))]
		  [(disj? prop) (or (eval hash (disj-l prop)) (eval hash (disj-r prop)))]))

(define test (conj (var "x") (disj (var "y") (neg (var "z")))))

(define hashpri (list (pair "x" #t)
	(pair "y" #f)
	(pair "z" #t)))

(eval (hash hashpri) test)