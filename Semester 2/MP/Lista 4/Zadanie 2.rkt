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

; abstrakcja rekurencji na drzewach
(define (fold-tree f x t)
	(cond [(leaf? t) x]
		  [(node? t)
		   (f
			(fold-tree f x (node-l t))
			(node-elem t)
			(fold-tree f x (node-r t)))]))

; funkcja licząca sumę wszystkich wartości występujących w drzewie
(define (tree-sum t)
	(fold-tree + 0 t))

(check-true (= (tree-sum example-tree) 15))

; funkcja zamieniająca rekurencyjnie miejscami lewe poddrzewo z prawym poddrzewem
(define (tree-flip t)
	(define (flip l x r)
		(node r x l))
	(fold-tree flip (leaf) t))

(tree-flip example-tree)

; funkcja liczaca wysokość drzewa (liczba węzłów na najdłuższej ścieżce od korzenia do liścia)
(define (tree-height t)
	(define (maksimum l x r)
		(if (> l r) (+ l 1) (+ r 1)))
	(fold-tree maksimum 0 t))

(tree-height example-tree)

; funkcja zwracająca parę złożoną z wartości skrajnie prawego i skrajnie lewego wierzchołka w drzewie
; (czyli najmniejszej i największej wartości w drzewie BST)
(define (tree-span t)
	(define (minimum l x r)
		(cond [(and (< l x) (< l r)) l]
			  [(and (< x l) (< x r)) x]
			  [(and (< r x) (< r l)) r]))
	(define (maksimum l x r)
		(cond [(and (> l x) (> l r)) l]
			  [(and (> x l) (> x r)) x]
			  [(and (> r x) (> r l)) r]))
	(cons (fold-tree minimum +inf.0 t) (fold-tree maksimum 0 t)))

(tree-span example-tree)

; funkcja zwracająca listę wszystkich elementów występujących w drzewie, w kolejności infiksowej
(define (flatten t)
	(define (flat l x r)
		(append l (list x) r))
	(fold-tree flat (list) t))

(flatten example-tree)