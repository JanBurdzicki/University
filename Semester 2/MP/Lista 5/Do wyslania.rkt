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

(define (InOrderRoseTreev2 tree xs)
	(cond [(empty? (node-child tree)) (cons (node-elem tree) xs)]
		  [else (InOrderRoseTreev2 (first (node-child tree))
								   (cons (node-elem tree)
									   (foldr (lambda (x xs) (InOrderRoseTreev2 x xs))
											  xs
											  (rest (node-child tree)))))]))

(InOrderRoseTreev2 test '())