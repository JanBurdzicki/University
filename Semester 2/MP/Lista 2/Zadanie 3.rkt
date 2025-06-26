#lang racket

; #:transparent -> daje nam dostep do klasy
; TODO: dodac testy jednostkowe
(define-struct matrix (a b c d) #:transparent)

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

; TODO: komentarz co to jest a, b, c, d, co to matrix-id
(define matrix-id (matrix 1 0 0 1))

(define (matrix-expt m k)
	(define (it n acc)
		(if (= n 0)
			acc
			(it (- n 1) (matrix-mult acc m))))
	(if (= k 0)
		matrix-id
		(it k matrix-id)))

; Jak podniesiemy macierz [1, 1], [1, 0] do k-tej potegi, to otrzymamy [Fib(k+1), Fib(k)], [Fib(k), Fib(k - 1)]

(define (fib-matrix k)
	(matrix-b (matrix-expt (matrix 1 1 1 0) k)))


(matrix-a (matrix-mult (matrix 1 2 1 1) (matrix 2 3 2 2)))

(fib-matrix 3)