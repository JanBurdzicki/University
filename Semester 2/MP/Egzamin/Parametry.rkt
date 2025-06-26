#lang racket

(define (greater-than-zero-or-equal? x)
  (>= x 0))

(define my-natural/c
  (and/c integer? greater-than-zero-or-equal?))

(greater-than-zero-or-equal? 4)
(greater-than-zero-or-equal? 0)
(greater-than-zero-or-equal? -1)


(define/contract (fact n)
  (-> my-natural/c my-natural/c)
  (if (= n 0)
      1
	  (* n (fact (- n 1)))))

; (fact 5)
; (fact 0)
; (fact -2)

(define/contract (my-filter p? xs)
  (parametric->/c [a] (-> (-> a boolean?) (listof a) (listof a)))
  (match xs
    ['() null]
	[(cons x xs)
	 (if (p? x)
	     (cons x (my-filter p? xs))
		 (my-filter p? xs))]))


(define (treeof c)
  (flat-rec-contract tree
                    (struct/c leaf)
					(struct/c node tree c tree)))


(struct leaf () #:transparent)
(struct node (l elem r) #:transparent)

; używanie predykatu tree? może być kosztowne, trzeba myśleć jak mądrze napisać kontrakt, żeby nie było wolno
(define (tree? t)
  (or (leaf? t)
      (and (node? t) (tree? (node-l t)) (tree? (node-r t)))))

; insert z kontraktem
; z matchowaniem struktur (dopasowanie wzorca dla struktur)
(define/contract (insert x t)
  (-> number? (treeof number?) (treeof number?))
  (match t
    [(leaf) (node (leaf) x (leaf))]
    [(node l y r)
     (cond [(= x y) t]
           [(< x y) (node (insert x l) y r)]
           [(> x y) (node l y (insert x r))])]))


(define example-tree (node (leaf) 5 (leaf)))

(insert 2 example-tree)
(insert 2.5 example-tree)
(insert 4 (insert 3 (insert 7 (insert 6 example-tree))))
