#lang plait

(define-type (Tree23 'a)
	(leaf)
	(node-two [l : (Tree23 'a)] (elem : 'a) [r : (Tree23 'a)])
	(node-three [l : (Tree23 'a)] (elemA : 'a) [mid : (Tree23 'a)] (elemB : 'a) [r : (Tree23 'a)]))

(define (is-tree23? t)
	(local [(define (tree_iter t minimum maksimum)
		(type-case (Tree23 'a) t
		[(leaf) (pair 1 #t)]
		[(node-three l A mid B r) (let ([left (tree_iter l minimum B)]
										[right (tree_iter r A maksimum)]
										[middle (tree_iter mid B A)])
									   (pair (+ (fst left) 1)
										(and (and (= (fst left) (fst right))
												  (= (fst left) (fst middle)))
											 (snd left)
											 (snd middle)
											 (snd right)
											 (<= A maksimum)
											 (>= B minimum))))]
		[(node-two  l y r) (let ([left (tree_iter l minimum y)]
								 [right (tree_iter r y maksimum)])
								(pair (+ (fst left) 1)
									  (and (= (fst left) (fst right))
										   (snd left)
										   (snd right)
										   (>= y minimum)
										   (<= y maksimum))))]))]
		(if (leaf? t)
			#t
			(snd (tree_iter t -inf.0 +inf.0)))))

(define example_treeB (node-two (node-two (leaf) 2 (leaf)) 4 (node-three (leaf) 6 (leaf) 2 (leaf))))

(define example_treeG (node-two (node-two (leaf) 2 (leaf)) 4 (node-three (leaf) 6 (leaf) 5 (leaf))))

(is-tree23? example_treeB)
(is-tree23? example_treeG)