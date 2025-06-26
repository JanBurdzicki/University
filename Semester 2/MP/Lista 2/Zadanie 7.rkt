#lang racket

(define (suffixes xs)
	(define (it xs previous acc)
		(if (null? xs)
			acc
			(it (cdr xs)
				(cons (car xs) previous)
				(cons (cons (car xs) previous) acc))))
	(it (reverse xs) null (list null)))

(suffixes (list 20 10 10 5 5))
(suffixes (list 1 2 3 4))