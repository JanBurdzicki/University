#lang racket

(define (maximum xs)
	(define (it xs acc)
		(if (null? xs)
			acc
			(it (cdr xs) (if (> (car xs) acc)
							 (car xs)
							 acc))))
	(it xs -inf.0))

(maximum (list 10 0 12 -1))
(maximum (list -100))
(maximum (list))

(maximum (list 1 5 0 7 1 4 1 0))