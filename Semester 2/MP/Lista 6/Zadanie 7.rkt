#lang plait


(define-type (Formula 'v)
	(var [var : 'v])
	(neg [f : (Formula 'v)])
	(conj [l : (Formula 'v)] [r : (Formula 'v)])
	(disj [l : (Formula 'v)] [r : (Formula 'v)]))

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

(define (to-nnf formula)
	(cond [(neg? formula) (neg-nff (to-nnf (neg-f formula)))]
		  [(conj? formula) (nnf-conj (to-nnf (conj-l formula)) (to-nnf (conj-r formula)))]
		  [(disj? formula) (nnf-disj (to-nnf (disj-l formula)) (to-nnf (disj-r formula)))]
		  [(var? formula) (nnf-lit #t (var-var formula))]))

(define (eval-formula S form)
	(cond [(var? form) (S (var-var form))]
		  [(neg? form) (not (eval-formula S (neg-f form)))]
		  [(conj? form) (and (eval-formula S (conj-l form))
							 (eval-formula S (conj-r form)))]
		  [(disj? form) (or (eval-formula S (disj-l form))
							(eval-formula S (disj-r form)))]))

#|
Zasada indukcji strukturalnej dla FORMUŁ:
Niech P będzie własnością FORMUŁ, taką że:
i) P(var)
ii) Dla każdego l, r będącymi formułami, jeśli P(l) i P(r), to P((conj l r))
iii) Dla każdego l, r będącymi formułami, jeśli P(l) i P(r), to P((disj l r))
iv) Dla każdego l będącą formułą, jeśli P(l), to P((neg l)) -> TODO:
Wówczas dla dowolnej formuły zachodzi P(TODO:)

---
Twierdzenie: (eval-nnf Sigma (to-nnf φ)) ≡ (eval-formula Sigma φ)
---

Dowód indukcyjny:

Podstawa indukcji:
i) (eval-nnf Sigma (to-nnf var)) ≡ (eval-formula Sigma var)
L: (eval-nnf Sigma (to-nnf var)) ≡ (eval-nnf Sigma nnf-lit (#t)) ≡ (Sigma var)
P: (eval-formula Sigma var) = (Sigma var)

Zatem L ≡ P

Krok indukcyjny:
ii) Załóżmy, że (eval-nnf Sigma (to-nnf L)) ≡ (eval-formula Sigma L) oraz
(eval-nnf Sigma (to-nnf R)) ≡ (eval-formula Sigma R) chcemy pokazać że to zachodzi również dla
(eval-nnf Sigma (to-nnf (conj L R))) ≡ (eval-formula Sigma (conj L R))

L: (eval-nnf Sigma (to-nnf (conj L R))) ≡ (eval-nnf Sigma (nnf-conj (to-nnf L) (to-nnf R))) ≡
(and (eval-nnf Sigma (to-nnf L)) (eval-nnf Sigma (to-nnf R))) ≡ (and (eval-formula Sigma L) (eval-formula Sigma R))

P: (and (eval-formula Sigma L) (eval-formula Sigma R)) = L

dla disj analogicznie -> TODO:

iii) załóżmy że mamy (eval-nnf Sigma (to-nnf L)) ≡ (eval-formula Sigma L) i chcemy pokazać że
(eval-nnf Sigma (to-nnf (neg L))) ≡ (eval-formula Sigma (neg L))

L: (eval-nnf Sigma (neg-nff (to-nff L))) ≡ (not (eval-nff Sigma (to-nff L))) ≡ (not eval-formula Sigma L)

P: (eval-formula Sigma (neg L) ≡ (not eval-formula Sigma L) ≡ L

Zatem L ≡ P

Na mocy twierdzenia o indukcji strukturalnej ... TODO:
|#