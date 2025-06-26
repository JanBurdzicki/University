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

(define (fold-tree f x t)
	(cond [(leaf? t) x]
		  [(node? t)
		   (f
			(fold-tree f x (node-l t))
			(node-elem t)
			(fold-tree f x (node-r t)))]))

; predykat sprawdzający, czy zadane drzewo spełnia własność BST - wolna wersja
(define (bst-slow? t)
	(define (minimum l x r)
		(cond [(and (< l x) (< l r)) l]
			  [(and (< x l) (< x r)) x]
			  [(and (< r x) (< r l)) r]))
	(define (maksimum l x r)
		(cond [(and (> l x) (> l r)) l]
			  [(and (> x l) (> x r)) x]
			  [(and (> r x) (> r l)) r]))

	(cond [(leaf? t) #t]
		  [(node? t) (and (< (fold-tree maksimum 0 (node-l t)) (node-elem t))
						  (> (fold-tree minimum +inf.0 (node-r t)) (node-elem t)))]))

(define test (node (leaf)
				   5
				   (node (node (leaf) 2 (leaf))
						 8
						 (leaf))))

(bst-slow? test)
(bst-slow? example-tree)

; predykat sprawdzający, czy zadane drzewo spełnia własność BST - szybka wersja
(define (bst? t)
	(define (bst-iter? t)
		(cond [(leaf? t) (cons (cons +inf.0 -inf.0) #t)]
			  [(node? t) (cons (cons
								(if (< (node-elem t) (caar (bst-iter? (node-l t)))) (node-elem t) (caar (bst-iter? (node-l t))))
								(if (> (node-elem t) (cdar (bst-iter? (node-r t)))) (node-elem t) (cdar (bst-iter? (node-r t)))))
							   (and (cdr (bst-iter? (node-l t)))
								(cdr (bst-iter? (node-r t)))
								(< (node-elem t) (caar (bst-iter? (node-r t))))
								(> (node-elem t) (cdar (bst-iter? (node-l t))))))]))
	(cdr (bst-iter? t)))

(bst? test)
(bst? example-tree)

; funkcja produkująca drzewo o tym samym kształcie co t,
; w którym etykietą danego węzła jest suma wartości węzłów na ścieżce od korzenia drzewa do tego węzła
(define (sum-paths t)
	(define (it t acc)
		(cond [(leaf? t) (leaf)]
			  [(node? t) (node (it (node-l t) (+ acc (node-elem t)))
							   (+ (node-elem t) acc)
							   (it (node-r t) (+ acc (node-elem t))))]))
	(it t 0))

(sum-paths example-tree)