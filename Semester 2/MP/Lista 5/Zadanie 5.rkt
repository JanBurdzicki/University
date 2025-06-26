#lang plait

(define-type (Tree 'c)
	(leaf)
	(node [l : (Tree 'c)] [elem : 'c] [r : (Tree 'c)]))

(define example-tree
	(node (node (leaf)
				1
				(leaf))
		  5
		  (node (leaf) 7 (leaf))))

(define (process-tree wezel lisc [left : ('acc 'c -> 'acc)] [right : ('acc 'c -> 'acc)] acc  t)
	(cond [(leaf? t) (lisc acc)]
		  [(node? t) (wezel acc
						(process-tree wezel lisc left right (left acc (node-elem t)) (node-l t))
						(node-elem t)
						(process-tree wezel lisc left right (right acc (node-elem t)) (node-r t)))]))

(define (sum-paths tree)
	(process-tree (lambda (a b c d) (node b (+ a c) d)) (lambda (x) (leaf)) (lambda (x y) (+ x y)) (lambda (x y) (+ x y)) 0 example-tree))

(define (bst? tree)
	(local [(define (is_sorted? xs prev)
		(if (empty? xs) #t
			(if (< (first xs) prev)
				#f
				(is_sorted? (rest xs) (first xs)))))]

	(if (is_sorted? (process-tree (lambda (a b c d) (append b (append (list c) d))) (lambda (x) '()) (lambda (x y) '()) (lambda (x y) '()) '() tree) -inf.0)
		#t
		#f)))

(sum-paths example-tree)
(bst? example-tree)