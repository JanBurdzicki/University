#lang racket

(require rackunit)

(define (empty-set x)
	(lambda (x) #f))

(define (singleton a)
	(lambda (x) (equal? x a)))

(define (in a s)
	(s a))

(define (union s t)
	(lambda (x) (or (s x) (t x))) )

(define (intersect s t)
	(lambda (x) (and (s x) (t x))))

(define set1 (union (union (singleton 1) (singleton 2)) (singleton 3)))
(define set2 (foldl (lambda (x xs) (union xs (singleton x))) (empty-set 2) (list 3 4 5)))

; (singleton 1)

(check-equal? (in 2 set1) #t)
(check-equal? (in 5 set1) #f)

(in 2 set1)
(in 5 set1)

(check-equal? (in 2 set2) #f)
(check-equal? (in 5 set2) #t)

(in 2 set2)
(in 5 set2)