#lang racket

; TODO: dodac informacje o zalozeniach wywolania funkcji -> n >= 0 w tym przypadku
(define (fib n)
	(if (= n 0)
		0
		(if (= n 1)
			1
			(+ (fib (- n 1)) (fib (- n 2))))))

; TODO: nadmiar informacji w funkcji -> zmienic, zeby nie bylo acc
(define (fib-iter n)
	(define (it tmp n-2 n-1 acc)
		(if (= tmp n)
			acc
			(it (+ tmp 1) n-1 acc (+ acc n-1))))
	(if (= n 0)
		0
		(if (= n 1)
			1
			(it 2 0 1 1))))

; Rekurencja ogonowa jest tak szybka jak iteracja. Rekurencja zwykła ma stos wywołań, dlatego jest wolna.

(fib 4)
(fib 6)

(fib-iter 4)
(fib-iter 6)

(fib 40)
(fib-iter 40)