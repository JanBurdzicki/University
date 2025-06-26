#lang racket

(define (mult2 x)
	(* x 2))

(define (inc x)
	(+ x 1))

(define (identycznosc x)
	x)

; pozytywne to dane "wyjściowe", a negatywne to dane "wejściowe"
; czyli jak piszemy funkcję to to co funkcja zwraca jest pozytywne, a jej argumenty są negatywne
; za każdym razem, kiedy się pojawia jakaś nowa funkcja jako argument to się wtedy odwraca

; (parametric->/c [a b] (-> a[neg] b[neg] a[poz]))
(define/contract (fun1 a b)
	(parametric->/c [a b] (-> a b a))
	a)

; (parametric->/c [a b c] (-> (-> a[poz] b[poz] c[neg]) (-> a[poz] b[neg]) a[neg] c[poz]))
(define/contract (fun2 f g a)
	(parametric->/c [a b c] (-> (-> a b c) (-> a b) a c))
	(f a (g a)))

; (parametric->/c [a b c] (-> (-> b[poz] c[neg]) (-> a[poz] b[neg]) (-> a[neg] c[poz])))
(define/contract (zlozenie f g)
	(parametric->/c [a b c] (-> (-> b c) (-> a b) (-> a c)))
	(lambda (x) (f (g x))))

; (parametric->/c [a] (-> (-> (-> a[neg] a[poz]) a[neg]) a[poz]))
(define/contract (id f)
	(parametric->/c [a] (-> (-> (-> a a) a) a))
	(f (lambda (x) x)))
