#lang plait

(define (append xs ys)
	(if (empty? xs)
		ys
		(cons (first xs)
			(append (rest xs) ys))))

#|
Zasada indukcji strukturalnej dla LIST:
Niech P będzie własnością list, taką że:
i) P(empty)
ii) Dla każdej wartości x i każdej listy xs, jeśli P(xs), to P((cons x xs))
Wówczas dla dowolnej listy xs zachodzi P(xs)

---
Twierdzenie: (append xs ys) ≡ zs, gdzie xs, ys to dowolne listy, a zs to lista
---

Lemat (*):
Dla dowolnej listy xs mamy: (append empty xs) ≡ (append xs empty) ≡ xs

Lemat (**):
Jeśli xs jest listą, to (cons x xs) też jest listą, gdzie x to dowolna wartość.

Dowód indukcyjny:
Załóżmy, że ys to dowolna lista. Zrobimy indukcję strukturalną po liście xs.

Podstawa indukcji:
i) xs = empty, (append xs ys) ≡ (append empty ys) ≡ (z lematu (*)) ≡ ys, czyli zs = ys
Skoro ys jest listą, to zs też jest listą

Krok indukcyjny:
ii) Weźmy dowolną listę xs i x i załóżmy, że:
	(append xs ys) ≡ zs, gdzie zs jest listą
Pokażemy, że zachodzi też:
	(append (cons x xs) ys) ≡ zs_2, gdzie zs_2 jest listą

L: (append (cons x xs) ys) ≡ (cons x (append xs ys)) ≡ (z zał. ind.) ≡ (cons x zs) ≡ (z lematu (**)) ≡ zs_2

P: zs_2

Zatem L ≡ P

Na mocy twierdzenia o indukcji strukturalnej ... TODO:
|#