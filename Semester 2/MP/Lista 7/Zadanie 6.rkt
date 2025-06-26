#lang racket

(define/contract (fold-right fun acc list)
	(parametric->/c [a b] (-> (-> a b b) b (listof a) b))
	(define (it acc list)
		(if (null? list)
			acc
			(it (fun (car list) acc)
				(cdr list))))
	(it acc list))

(define/contract (foldr-bad fun acc list)
	(parametric->/c [a] (-> (-> a a a) a (listof a) a))

	; (parametric->/c [a b] (-> (-> a b b) b (listof a) b))
	(define (it acc list)
		(if (null? list)
			(fun acc acc)
			(it (fun (car list) acc)
				(cdr list))))
	(it acc list))

; zmienienie kontraktu nas nawet nie ogranicza ale zmiana typu wymusza w plaicie rzeczy czy coś elo320


; 1: chcemy, żeby był typ, a typ a mają argumenty listy xs stąd musimy użyć first xs
; 2: tak, bo przykłady

(foldr-bad + 1 '(1 2 3 4))
(fold-right + 1 '(1 2 3 4))

; 3: w foldr-bad przez to że mamy first