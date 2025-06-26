#lang racket

(define (sorted? xs)
	(define (it xs previous)
		(if (null? xs)
			#t
			(if (< (car xs) previous)
				#f
				(it (cdr xs)
					(car xs)))))
	(it xs -inf.0))

(sorted? (list 0 1 2 3))
(sorted? (list))
(sorted? (list 20 19 22))