#lang racket

(require rackunit)

(define-struct leaf () #:transparent)
(define-struct node (l elem r) #:transparent)

(define (fold-tree f x t)
	(cond [(leaf? t) x]
		  [(node? t)
		   (f
			(fold-tree f x (node-l t))
			(node-elem t)
			(fold-tree f x (node-r t)))]))

; funkcja zwracająca listę wszystkich elementów występujących w drzewie, w kolejności infiksowej
(define (flatten t)
	(define (flat l x r)
		(append l (list x) r))
	(fold-tree flat (list) t))

(define (tree? x)
	(cond [(leaf? x) #t]
		  [(node? x) (and (tree? (node-l x)) (tree? (node-r x)))]
		  [else #f]))

(define example-tree (node (node (leaf) 1 (leaf))
						   2
						   (node (node (leaf) 3 (leaf))
								 4
								 (node (leaf) 5 (leaf)))))

(define (insert-bst x t)
	(cond [(leaf? t) (node (leaf) x (leaf))]
		  [(node? t)
		   (cond [(= x (node-elem t))
				  (node
				   (insert-bst x (node-l t))
				   (node-elem t)
				   (node-r t))]
				 [(< x (node-elem t))
				  (node
				   (insert-bst x (node-l t))
				   (node-elem t)
				   (node-r t))]
				 [else
				  (node
				   (node-l t)
				   (node-elem t)
				   (insert-bst x (node-r t)))])]))

; funkcja sortująca listę przy użyciu drzewa BST (tworzy drzewo BST z listy i przechodzi je w kolejności infiksowej)
(define (treesort xs)
	(define (make-tree xs tree)
		(if (null? xs) (flatten tree) (make-tree (cdr xs) (insert-bst (car xs) tree))))
	(make-tree xs (leaf)))

(treesort (list 5 2 1 2 4 44))