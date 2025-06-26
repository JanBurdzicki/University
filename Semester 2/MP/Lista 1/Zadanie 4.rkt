#lang racket

(require rackunit)

(define (sum_squares a b)
	(+ (* a a) (* b b)))

(define (sum_max a b c)
	(if (> a b)
		(if (> b c) (sum_squares a b) (sum_squares a c))
		(if (> a c) (sum_squares a b) (sum_squares b c))
	))

(sum_max 2 3 5)

(check-equal? (sum_max 2 3 5) 34)
(check-equal? (sum_max 2 5 3) 34)
(check-equal? (sum_max 3 2 5) 34)
(check-equal? (sum_max 3 5 2) 34)
(check-equal? (sum_max 5 2 3) 34)
(check-equal? (sum_max 5 3 2) 34)