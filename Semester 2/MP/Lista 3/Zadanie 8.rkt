#lang racket

(require rackunit)

(define (list->llist xs)
	(lambda (ys) (append xs ys)))

(define (llist->list f)
	(f null))

(define llist-null
	(lambda (ys) ys))

(define (llist-null2 ys)
	ys)

(define (llist-singleton x)
	(lambda (ys) (cons x ys)))

(define (llist-append f g)
	(lambda (h) (f (g h))))

(define (foldr-llist-reverse xs)
	(llist->list (foldr (lambda (y ys) (llist-append ys (llist-singleton y))) llist-null xs)))

(define test-list-function (list->llist `(1 3 5)))

(check-equal? (llist->list test-list-function) `(1 3 5))

(check-equal? (test-list-function `(7 9 11)) `(1 3 5 7 9 11))

(check-equal? (foldr-llist-reverse `(1 2 5)) `(5 2 1))

(length (foldr-llist-reverse (build-list 10000000 identity)))

; liniowka -> TODO: