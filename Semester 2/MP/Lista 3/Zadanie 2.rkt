#lang racket

(require rackunit)

; iteracyjnie przechodzimy po liście i składamy operacje (*)
(define (product xs)
	(foldl * 1 xs))

(check-equal? (product (list 1 2 3 4)) 24) ; 1 * 1 * 2 * 3 * 4 -> 24
(check-equal? (product null) 1) ; 1 -> 1
