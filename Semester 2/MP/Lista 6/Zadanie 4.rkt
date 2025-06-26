#lang plait

(define-type (NNF 'v)
	(nnf-lit [polarity : Boolean] [var : 'v])
	(nnf-conj [l : (NNF 'v)] [r : (NNF 'v)])
	(nnf-disj [l : (NNF 'v)] [r : (NNF 'v)]))

(define (neg-nff formula)
	(cond [(nnf-lit? formula) (if (nnf-lit-polarity formula) ; if (equal? (nnf-lit-polarity formula) #t)
								(nnf-lit #f (nnf-lit-var formula))
								(nnf-lit #t (nnf-lit-var formula)))]
		  [(nnf-conj? formula) (nnf-disj
								(neg-nff (nnf-conj-l formula))
								(neg-nff (nnf-conj-r formula)))]
		  [(nnf-disj? formula) (nnf-conj
								(neg-nff (nnf-disj-l formula))
								(neg-nff (nnf-disj-r formula)))]))

#|
Zasada indukcji strukturalnej dla NNF:
Niech P będzie własnością formuł w NNF, taką że:
i) P(nnf-lit)
ii) Dla każdego l, r będącymi formułami w NNF, jeśli P(l) i P(r), to P((nnf-conj l r))
iii) Dla każdego l, r będącymi formułami w NNF, jeśli P(l) i P(r), to P((nnf-disj l r))
Wówczas dla dowolnej formuły w NNF zachodzi P(TODO:)

---
Twierdzenie: (neg-nff (neg-nff φ)) ≡ φ, gdzie φ to dowolna formuła
---

Dowód indukcyjny:
Załóżmy, że φ jest dowolną formułą.

Podstawa indukcji:
i) φ = nnf-lit
(neg-nff (neg-nff φ)) ≡ (neg-nff (neg-nff nnf-lit)) ≡ (neg-nff (nnf-lit (diff polarity))) ≡ nnf-lit ≡ φ

Krok indukcyjny:
ii) Weźmy dowolne formuły w NNF l, r i załóżmy, że:
	(neg-nff (neg-nff l)) ≡ l oraz (neg-nff (neg-nff r)) ≡ r
Niech φ = (nnf-conj l r). Pokażemy, że zachodzi też:
	(neg-nff (neg-nff φ) ≡ φ

L: (neg-nff (neg-nff φ) ≡ (neg-nff (neg-nff (nnf-conj l r)) ≡ (neg-nff (nnf-disj (neg-nff l) (neg-nff r))) ≡ (nnf-conj (neg-nff (neg-nff l)) (neg-nff (neg-nff r))) ≡ (z zał. ind.) ≡ (nnf-conj l r) ≡ φ

P: φ

Zatem L ≡ P

iii) Weźmy dowolne formuły w NNF l, r i załóżmy, że:
	(neg-nff (neg-nff l)) ≡ l oraz (neg-nff (neg-nff r)) ≡ r
Niech φ = (nnf-disj l r). Pokażemy, że zachodzi też:
	(neg-nff (neg-nff φ) ≡ φ

L: (neg-nff (neg-nff φ) ≡ (neg-nff (neg-nff (nnf-disj l r)) ≡ (neg-nff (nnf-conj (neg-nff l) (neg-nff r))) ≡ (nnf-disj (neg-nff (neg-nff l)) (neg-nff (neg-nff r))) ≡ (z zał. ind.) ≡ (nnf-disj l r) ≡ φ

P: φ

Zatem L ≡ P

Na mocy twierdzenia o indukcji strukturalnej ... TODO:
|#


