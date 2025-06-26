#lang plait

(define (my-foldr f x xs)
  (if (empty? xs)
      x
	  (f (first xs) (my-foldr f x (rest xs)))))

(define (my-foldl f x xs)
  (local [(define (it xs acc)
    (if (empty? xs)
        acc
	   (it (rest xs) (f (first xs) acc))))]
  (it xs x)))

(define my-list '(1 2 3 4))

(my-foldl cons empty my-list)

(define-type-alias MyNumber Number)
(define-type-alias MySuperNumberList (Listof Number))

(define-type (Tree 'a)
  (leaf)
  (node [l : (Tree 'a)] [elem : 'a] [r : (Tree 'a)]))

(define-type MyNumberList
  (my-empty)
  (my-cons [first : Number] [rest : MyNumberList]))

(define-type NumberTree
  (nleaf)
  (nnode [l : NumberTree] [elem : Number] [r : NumberTree]))

(define my-number-list  (my-cons 1 (my-cons 2 (my-cons 3 (my-cons 4 (my-empty))))))

(define (my-foldl-new f x xs)
  (local [(define (it xs acc)
        (if (my-empty? xs)
            acc
            (it (my-cons-rest xs) (f (my-cons-first xs) acc))))]
  (it xs x)))

(my-foldl-new my-cons (my-empty) my-number-list)


; (Number (Tree Number)) ->  (Optionof Number)
(define (bst-lookup [x : Number] [t : (Tree Number)]) : (Optionof Number)
  (type-case (Tree Number) t
    [(leaf) (none)]
    [(node l elem r)
	  (cond [(= x elem) (some elem)]
	        [(< x elem) (bst-lookup x l)]
	        [(> x elem) (bst-lookup x r)])]))

(define example-tree (node (node (leaf) 0 (leaf))
                      1 (node (leaf) 2 (leaf))))

(define (print-lookup [x : Number] [t : (Tree Number)]) : Number
  (let ([x (bst-lookup x t)])
       (if (none? x)
	       (error 'print "None Wywala")
		   (some-v x))))

(print-lookup 0 example-tree)
(print-lookup 1 example-tree)
(print-lookup 4 example-tree)
