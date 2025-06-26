#lang racket

(define/contract (sublists xs)
	(parametric->/c [a] (-> (listof a) (listof (listof a))))
	(match xs
		['() (list null)]
		[(cons x xs) (append-map
					 (lambda (ys) (cons (cons x ys) (list ys)))
					 (sublists xs))]))

(append* (map (lambda (ys) (cons (cons 1 ys) (list ys))) (list null)))