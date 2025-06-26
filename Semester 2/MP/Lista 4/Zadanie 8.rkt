#lang racket

(require rackunit)

(define-struct ord (val priority) #:transparent)

(define-struct hleaf ())

(define-struct hnode (elem rank l r) #:transparent)

(define (make-node elem heap-a heap-b)
		(if (>= (rank heap-a) (rank heap-b))
			(hnode elem (+ (rank heap-b) 1) heap-a heap-b)
			(hnode elem (+ (rank heap-a) 1) heap-b heap-a)))

(define (hord? p h)
	(or (hleaf? h)
		(<= p (ord-priority (hnode-elem h)))))

(define (rank h)
	(if (hleaf? h)
		0
		(hnode-rank h)))

(define (heap? h)
	(or (hleaf? h)
		(and (hnode? h)
			 (heap? (hnode-l h))
			 (heap? (hnode-r h))
			 (<= (rank (hnode-r h))
				 (rank (hnode-l h)))
			 (= (hnode-rank h) (+ 1 (hnode-rank (hnode-r h))))
			 (hord? (ord-priority (hnode-elem h))
					(hnode-l h))
			 (hord? (ord-priority (hnode-elem h))
					(hnode-r h)))))

(define (merge A B)
	(if (hleaf? (hnode-l A))
		(make-node (hnode-elem A)
				   (heap-merge (hnode-r A) B)
				   (hleaf))
		(if (> (hnode-rank (hnode-l A)) (hnode-rank (heap-merge(hnode-r A) B)))
			(make-node (hnode-elem A)
					   (hnode-l A)
					   (heap-merge (hnode-r A) B))
			(make-node (hnode-elem A)
					   (heap-merge (hnode-r A) B)
					   (hnode-l A)))))

; funkcja łącząca 2 kopce
(define (heap-merge heap-a heap-b)
	(define (merge_v2 A B)
		(make-node (hnode-elem A)
				   (heap-merge (hnode-r A) B)
				   (hnode-l A)))
	(cond [(hleaf? heap-a) heap-b] ; TODO: chyba tak mozna sprawdzic czy jest null
		  [(hleaf? heap-b) heap-a]
		  [(< (ord-priority (hnode-elem heap-a)) (ord-priority (hnode-elem heap-b)))
		   (merge_v2 heap-a heap-b)]

		  [(>= (ord-priority (hnode-elem heap-a)) (ord-priority (hnode-elem heap-b)))
		   (merge_v2 heap-b heap-a)]))