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

(create-list (conj (var "x") (disj (var "jd") (var "x"))) '())

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

(free-vars (conj (var "x") (disj (var "jd") (var "x"))))