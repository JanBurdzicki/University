#lang racket

10 ; wynikiem jest 10
(+ 5 3 4) ; wynikiem jest 12
(- 9 1) ; wynikiem jest 8
(/ 6 2) ; wynikiem jest 3
(+ (* 2 4) (- 4 6)) ; wynikiem jest 8 + (-2) = 6
(define a 3) ; wynikiem jest NIC (deklaracja)
(define b (+ a 1)) ; wynikiem jest NIC (deklaracja)
(+ a b (* a b)) ; wynikiem jest 3 + 4 + 3 * 4 = 19
(= a b) ; wynikiem jest #f
(if (and (> b a) (< b (* a b)))
	b
	a) ; wynikiem jest TAK and TAK -> b = 4
(cond [(= a 4) 6]
	  [(= b 4) (+ 6 7 a)]
	  [else 25]) ; wynikiem jest 6 + 7 + 3 = 16
(+ 2 (if (> b a) b a)) ; wynikiem jest 2 + 4 = 6
(* (cond [(> a b) a]
		 [(< a b) b]
		 [else -1])
   (+ a 1)) ; 4 * 4 = 16
