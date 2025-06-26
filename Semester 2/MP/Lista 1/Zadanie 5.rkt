#lang racket

(define (a-plus-abs-b a b)
	((if (> b 0) + -) a b)) ; zwraca a + abs(b)

(a-plus-abs-b 20 -10) ; przykład demonstrujący działanie