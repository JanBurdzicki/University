#lang racket

(require rackunit)

(define-struct leaf () #:transparent)
(define-struct node (l elem r) #:transparent)

(define (tree? x)
	(cond [(leaf? x) #t]
		  [(node? x) (and (tree? (node-l x)) (tree? (node-r x)))]
		  [else #f]))

(define example-tree (node (node (leaf) 1 (leaf))
						   2
						   (node (node (leaf) 3 (leaf))
								 4
								 (node (leaf) 5 (leaf)))))
(define (flat xs acc)
	(if (leaf? xs)
		acc
		(flat (node-l xs) (cons (node-elem xs)
								(flat (node-r xs) acc)))))

; funkcja zwracająca listę wszystkich elementów występujących w drzewie, w kolejności infiksowej
; 0 nieuzytkow
(define (flatten xs)
	(flat xs null))

(flatten example-tree)

; struktura drzewa wypuklająca niedoskonałości implementacji (w efektywnej implementacji nie można używać procedury append)

; (define (list->left-tree xs)
; (foldl (lambda (x t) (node t x (leaf))) (leaf) xs))
; (define test-tree (list->left-tree (build-list 20000 identity)))