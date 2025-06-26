#lang racket

(define/contract (suffixes xs)
	(parametric->/c [a] (-> (listof a) (listof (listof a))))
	(match xs
		[(list) null]
		[(cons x xs) (cons (cons x xs) (suffixes xs))]))

(time suffixes (range 3000))