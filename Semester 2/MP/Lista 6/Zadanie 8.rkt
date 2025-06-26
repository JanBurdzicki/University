#lang plait

; TODO: sprawdzić czy funkcje dobrze napisane w stosunku do indukcji

(define (sorted? xs)
	(cond [(empty? xs) #t]
		  [(empty? (rest xs)) #t]
		  [else (if (<= (first xs) (second xs))
					(sorted? (rest xs))
					#f)]))

(define (insert x xs)
	(if (empty? xs)
		(list x)
		(if (<= x (first xs))
			(cons x xs)
			(cons (first xs) (insert x (rest xs))))))

#|
Zasada indukcji strukturalnej dla LIST:
Niech P będzie własnością list, taką że:
i) P(empty)
ii) Dla każdej wartości x i każdej listy xs, jeśli P(xs), to P((cons x xs))
Wówczas dla dowolnej listy xs zachodzi P(xs)

---
Twierdzenie: jeśli (sorted? xs) ≡ #t, to (sorted? (insert x xs)) ≡ #t, gdzie x jest dowolną wartością, a xs dowolną listą

Zauważmy, że chcemy pokazać implikację!
---

Dowód indukcyjny:

Podstawa indukcji:

i) xs = empty
Załóżmy, że zachodzi: (sorted? xs) ≡ #t, czyli (sorted? empty) ≡ #t
Chcemy pokazać, że (sorted? (insert x xs)) ≡ #t
Zauważmy, że:
(sorted? (insert x xs)) ≡ (sorted? (insert x empty)) ≡ (sorted? x (lista 1 - elem)) ≡ #t

Krok indukcyjny:
ii) Weźmy dowolną listę xs i x i załóżmy, że zachodzi:
	jeśli (sorted? xs) ≡ #t, to (sorted? (insert x xs)) ≡ #t
Pokażemy, że zachodzi też:
	jeśli (sorted? (cons y xs)) ≡ #t, to (sorted? (insert x (cons y xs))) ≡ #t

Załóżmy, że zachodzi: (sorted? (cons y xs)) ≡ #t. (Jeśli jest fałszem to działa zawsze (implikacja)) -> zał [*]
Chcemy pokazać, że (sorted? (insert x (cons y xs))) ≡ #t

a) (x <= (first (cons y xs)))
(sorted? (insert x (cons y xs))) ≡ (z zał. (a)) ≡ (sorted? (cons x (cons y xs))) ≡ (z zał. ind i zał. [*]) ≡ #t

; (and [1](sorted? (cons y xs)) [2](bound x (cons y xs))), ale wiemy że [1] z założenia [*] i [2] z (a)

b) (x > (first (cons y xs)))
(sorted? (insert x (cons y xs))) ≡ (z zał. (b)) ≡ (sorted? (cons y (insert x xs))) ≡ #t

; (and (sorted? (insert x xs)) (bound y (insert x xs)))
; pierwszy warunek mamy spełniony (założenie indukcyjne) a drugi wiemy że (y > x) oraz że (sorted? (cons y xs)) czyli y > dla całej listy xs

Na mocy twierdzenia o indukcji strukturalnej ... TODO:
|#