#lang racket

(define (elem? x xs)
	(if (null? xs)
		#f
		(if (equal? (car xs) x)
			#t
			(elem? x (cdr xs)))))

(elem? 20 (list 10 23 21 12))

(elem? 10 (list 200 10 20))

(elem? 10 (list))

(elem? 2 (list 1 2 3))
(elem? 4 (list 1 2 3))