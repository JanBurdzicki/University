#lang racket

(require rackunit)

(define (my-compose f g)
	(lambda (x) (f (g x))))

(define (square x)
	(* x x))

(define (inc x)
	(+ x 1))

(check-equal? ((my-compose square inc) 5) 36)
(check-equal? ((my-compose inc square) 5) 26)