#lang plait

(define (inc x)
	(+ x 1))

(map inc (list 1 2 3 4))

(define (moja_map function xs)
	(if (empty? xs)
		empty ; (list)
		(cons (function (first xs)) (moja_map function (rest xs)))))

(moja_map inc (list 1 2 3 4))

#|
Zasada indukcji strukturalnej dla LIST:
Niech P będzie własnością list, taką że:
i) P(empty)
ii) Dla każdej wartości x i każdej listy xs, jeśli P(xs), to P((cons x xs))
Wówczas dla dowolnej listy xs zachodzi P(xs)

---
Twierdzenie: (map f (map g xs)) ≡ (map (lambda (x) (f (g x))) xs)
---

Dowód indukcyjny:
TODO: wezmy dowolne f, g

Podstawa indukcji:
i) xs = empty
L: (map f (map g xs)) ≡ (map f (map g empty)) ≡ (z def. map) ≡ (map f empty) ≡ (z def. map) ≡ empty
P: (map (lambda (x) (f (g x))) xs) ≡ (map (lambda (x) (f (g x))) empty) ≡ empty
Korzystając z def. map, otrzymujemy, że L ≡ P.

Krok indukcyjny:
ii) Weźmy dowolne xs oraz x i załóżmy, że:
	(map f (map g xs)) ≡ (map (lambda (x) (f (g x))) xs)
Pokażemy, że zachodzi też:
	(map f (map g (cons x xs))) ≡ (map (lambda (x) (f (g x))) (cons x xs))

L: (map f (map g (cons x xs))) = (map f cons ((g x) (map g xs))) ≡ (cons (f (g x)) (map f (map g xs)))

P: (map (lambda (x) (f (g x))) (cons x xs)) ≡ (cons (f (g x)) (map (lambda (x) (f (g x))) xs)) ≡ (z zał. ind.) ≡ (cons (f (g x)) (map f (map g xs)))

Zatem L ≡ P

Na mocy twierdzenia o indukcji strukturalnej ... TODO:
|#