#lang racket

(define-struct matrix (a b c d))

(define (matrix-mult m n)
	(matrix
	(+ (* (matrix-a m) (matrix-a n))
       (* (matrix-b m) (matrix-c n)))
	(+ (* (matrix-a m) (matrix-b n))
       (* (matrix-b m) (matrix-d n)))
	(+ (* (matrix-c m) (matrix-a n))
       (* (matrix-d m) (matrix-c n)))
	(+ (* (matrix-c m) (matrix-b n))
	   (* (matrix-d m) (matrix-d n)))))

(define matrix-id (matrix 1 0 0 1))

(define (matrix-expt-fast m k)
	(define (it n podstawa acc)
		(if (= n 0)
			acc
			(it (floor (/ n 2))
				(matrix-mult podstawa podstawa)
				(if (even? n)
					acc
					(matrix-mult acc podstawa)))))
	(it k m matrix-id))

; Jak podniesiemy macierz [1, 1], [1, 0] do k-tej potegi, to otrzymamy [Fib(k+1), Fib(k)], [Fib(k), Fib(k - 1)]

(define (fib-fast k)
	(matrix-b (matrix-expt-fast (matrix 1 1 1 0) k)))

(fib-fast 0)
(fib-fast 1)
(fib-fast 2)
(fib-fast 3)
(fib-fast 4)
(fib-fast 5)
(fib-fast 6)
(fib-fast 7)
(fib-fast 8)
(fib-fast 9)
(fib-fast 121)