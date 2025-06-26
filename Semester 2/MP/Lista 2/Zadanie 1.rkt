#lang racket

; (let ([x 3])
	; (+ x y)) ; x jest zwiazany, y nie jest zwiazany, + nie jest zwiazany

; (let ([x 1]
	;   [y (+ x 2)])
	; (+ x y)) ; x jest zwiazany, y nie jest zwiazany (bo w deklaracji y nie wiemy co to jest x), + nie jest zwiazany

; (let ([x 1])
	; (let ([y (+ x 2)])
	; (* x y))) ; x, y sa zwiazane, +, * nie jest zwiazany

; (define (f x y)
	; (* x y z)) ; x, y sa zwiazane, z nie jest zwiazany, * nie jest zwiazany

; (define (f x)
	; (define (g y z)
		; (* x y z))
	; (f x x x)) ; f jest zwiazany, x jest zwiazany, za duza arnosc funkcji f -> f to funkcja unarna, a przekazujemy 3 argumenty