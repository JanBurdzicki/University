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

; funckja usuwająca dany klucz z drzewa BST
(define (delete x t)
	(define (merge-tree right left)
		(if (leaf? right)
			left
			(node
			 (merge-tree (node-l right) left)
			 (node-elem right)
			 (node-r right))))
	(cond [(leaf? t) (leaf)]
		  [(node? t)
		   (cond [(= (node-elem t) x) (merge-tree (node-r t) (node-l t))]
				 [(< (node-elem t) x) (node
									   (node-l t)
									   (node-elem t)
									   (delete x (node-r t)))]
				 [(> (node-elem t) x) (node
									   (delete x (node-l t))
									   (node-elem t)
									   (node-r t))])]))

(delete 2 example-tree)