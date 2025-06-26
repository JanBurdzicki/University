#lang plait

(define-type Prop
	(var [v : String])
	(conj [l : Prop] [r : Prop])
	(disj [l : Prop] [r : Prop])
	(neg [f : Prop]))

(define (create-list prop acc)
	(cond [(var? prop) (cons (var-v prop) acc)]
		  [(neg? prop) (create-list (neg-f prop) acc)]
		  [(conj? prop) (create-list (conj-l prop) (create-list (conj-r prop) acc))]
		  [(disj? prop) (create-list (disj-l prop) (create-list (disj-r prop) acc))]))

(define (On-List? x ys)
	(if (empty? ys)
		#f
		(if (equal? x (first ys))
			#t
			(On-List? x (rest ys)))))

(define (free-vars prop)
	(local [(define (for-loop xs pom)
		(if (empty? xs)
			pom
			(if (On-List? (first xs) pom)
				(for-loop (rest xs) pom)
				(for-loop (rest xs) (cons (first xs) pom)))))]

	(for-loop (create-list prop '()) '())))

(define (eval hash prop)
	(cond [(var? prop) (some-v (hash-ref hash (var-v prop)))]
		  [(neg? prop) (not (eval hash (neg-f prop)))]
		  [(conj? prop) (and (eval hash (conj-l prop)) (eval hash (conj-r prop)))]
		  [(disj? prop) (or (eval hash (disj-l prop)) (eval hash (disj-r prop)))]))

(define (create-truth-table num acc xs)
	(if(= num 0) (cons acc xs)
		(create-truth-table (- num 1) (cons #t acc) (create-truth-table (- num 1) (cons #f acc) xs))))

(define (make-list-pair list1 list2 xs)
	(if (empty? list1) xs
		(make-list-pair (rest list1) (rest list2) (cons (pair (first list1) (first list2)) xs))))

(define (return-truth truth-table lista prop)
	(if (empty? truth-table) #t
		(and (eval (hash (make-list-pair lista (first truth-table) empty)) prop) (return-truth (rest truth-table) lista prop))))

(define (tautology? prop)
	(return-truth (create-truth-table (length (free-vars prop)) empty empty) (free-vars prop) prop))

(define test1 (conj (var "x") (neg (var "x"))))
(define test2 (conj (var "x") (disj (var "y") (neg (var "x")))))
(define test3 (disj (var "x") (neg (var "x"))))