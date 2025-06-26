#lang plait

(define-type (RoseTree 'a)
	(node [elem : 'a] [child : (Listof (RoseTree 'a))] ))

(define test
	(node 2
		  (list (node 3 (list))
				(node 5 (list
					(node 7 (list))
					(node 8 (list))
					(node 9 (list))))
				(node 10 (list)))))

#|
(define (InOrderRoseTree tree)
(local [(define (for-loop list_of_trees acc)
			( if (empty? list_of_trees)
				acc
				(for-loop (rest list_of_trees)
						(append acc
								(InOrderRoseTree (first list_of_trees))))))]

(cond [(empty? (node-child tree)) (list (node-elem tree))]
		[else (append (InOrderRoseTree (first (node-child tree)))
					(append (list(node-elem tree))
							(for-loop (rest (node-child tree)) '() )))])))
(InOrderRoseTree test)
|#

(define (InOrderRoseTreev2 tree xs)
	(cond [(empty? (node-child tree)) (cons (node-elem tree) xs)]
		  [else (InOrderRoseTreev2 (first (node-child tree))
								   (cons (node-elem tree)
									   (foldr (lambda (x xs) (InOrderRoseTreev2 x xs))
											  xs
											  (rest (node-child tree)))))]))

(InOrderRoseTreev2 test '())