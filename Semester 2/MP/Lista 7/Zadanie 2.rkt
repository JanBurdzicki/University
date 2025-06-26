#lang plait

(define-type (Tree23 'a)
	(leaf)
	(node-two [l : (Tree23 'a)] (elem : 'a) [r : (Tree23 'a)])
	(node-three [l : (Tree23 'a)] (elemA : 'a) [mid : (Tree23 'a)] (elemB : 'a) [r : (Tree23 'a)]))

; typ dla splita

(define-type (SplitTree 'a)
	(leaf)
	(for-two [l : (Tree23 'a)] (elem : 'a) [r : (Tree23 'a)] [parent : (Tree23 'a)] [which_child : number])
	(for-three [l : (Tree23 'a)] (elemA : 'a) [mid : (Tree23 'a)] (elemB : 'a) [r : (Tree23 'a)] [parent : (Tree23 'a)][which_child : number]))

(define (split tree x)
	; TODO: zamarkowana funkcja
	tree)

(define (insert tree x)
	(type-case (Tree23 'a) tree
	[(leaf) (node-two (leaf) x (leaf))]
	[(node-two l y r) (if (< x y)
							(if (leaf? l)
								(split tree x)
								(insert l x))
							(if (leaf? r)
								(split tree x)
								(insert r x)))]
	[(node-three l A mid B r) (cond [(< x B) (if (leaf? l)
												 (split tree x)
												 (insert l x))]
									[(> x A) (if (leaf? r)
												 (split tree x)
												 (insert r x))]
									[else (if (leaf? mid)
												 (split tree x)
												 (insert mid x))])]))