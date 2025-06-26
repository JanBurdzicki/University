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

(define (eval-nff sigma formula)
	(cond [(nnf-lit? formula) (if (nnf-lit-polarity formula) ; if (equal? (nnf-lit-polarity formula) #t
								(sigma (nnf-lit-var formula))
								(not (sigma (nnf-lit-var formula))))]
		  [(nnf-conj? formula) (and
								(eval-nff sigma (nnf-conj-l formula))
								(eval-nff sigma (nnf-conj-r formula)))]
		  [(nnf-disj? formula) (or
								(eval-nff sigma (nnf-disj-l formula))
								(eval-nff sigma (nnf-disj-r formula)))]))


#|
Zasada indukcji strukturalnej dla NNF:
Niech P będzie własnością formuł w NNF, taką że:
i) P(nnf-lit)
ii) Dla każdego l, r będącymi formułami w NNF, jeśli P(l) i P(r), to P((nnf-conj l r))
iii) Dla każdego l, r będącymi formułami w NNF, jeśli P(l) i P(r), to P((nnf-disj l r))
Wówczas dla dowolnej formuły w NNF zachodzi P(TODO:)

---
Twierdzenie: (eval-nff S (neg-nff φ)) ≡ (not (eval-nff S φ)), gdzie φ to dowolna formuła
---

Dowód indukcyjny:



Podstawa indukcji:
σ = S
i) (eval-nff S (neg-nff nnf-lit)) ≡ (not (eval-nff S nnf-lit))
L: (eval-nff S (not nnf-lit))
a) nnf-lit = #t
(eval-nff S var) ≡ (S (not var))
P: (not (S var)) ≡ L
 b) nnf-lit = #f
symetrycznie

Krok indukcyjny:
ii) weźmy dowolne wartościowanie S oraz funkcje F, G
Wiemy, że (eval-nff S (neg-nff F)) ≡ (not (eval-nff S F) oraz (eval-nff S (neg-nff G)) ≡ (not (eval-nff S G)
Chcemy pokazać że (eval-nff S (neg-ngg (nff-conj F G)))  ≡ (not (eval-nff S (nff-conj F G)))
L: (eval-nff S (nff-disj (neg-nff F) (neg-nff G))) ≡ (or (eval-nff S (neg-nff F)) (eval-nff S (neg-nff G)))
≡ (or (not (eval-nff S F)) (not (eval-nff s G))) ≡ (prawo demorgana) (not (and (eval-nff S F) (eval-nff S G)))
≡ (not (eval-nff S (nnf-conj F G))) ≡ P ckd

Na mocy twierdzenia o indukcji strukturalnej ... TODO:
|#






#|
TODO: zrobic to zad

Lemat 5.1
Chcemy pokazać:
Dla dowolnych x, y, zachodzi (not (and x y)) ~ (or (not x) (not y)), gdzie x, y są wartościami boolowskimi.

Dowód Lematu 5.1
Rozważmy 4 przypadki:

x ~ #f oraz y ~ #f
x ~ #f oraz y ~ #t
x ~ #t oraz y ~ #f
x ~ #t oraz y ~ #t
Zauważmy, że te przypadki są trywialne, więc Lemat jest prawdziwy dla dowolnych x, y.
Lemat 5.2
Chcemy pokazać:
Dla dowolnych x, y, zachodzi (not (or x y)) ~ (and (not x) (not y)), gdzie x, y są wartościami boolowskimi.

Dowód Lematu 5.2
Rozważmy 4 przypadki:

x ~ #f oraz y ~ #f
x ~ #f oraz y ~ #t
x ~ #t oraz y ~ #f
x ~ #t oraz y ~ #t
Zauważmy, że te przypadki są trywialne, więc Lemat 5.2 jest prawdziwy dla dowolnych x, y.
Dowód:
Dowód indukcyjny po fi:
Chcemy pokazać, że (eval-nnf s (neg-nnf fi)) ~ (not (eval-nnf s fi)).

Jeśli fi jest literałem:

Jeśli istnieje v takie, że fi ~ (nnf-lit #t v)
L = (eval-nnf s (neg-nnf fi)) ~ (eval-nnf s (neg-nnf (nnf-lit #t v))) ~
(eval-nnf s (nnf-lit #f v)) ~ (not (s v))
P = (not (eval-nnf s fi)) ~ (not (eval-nnf s (nnf-lit #t v))) ~ (not (s v))
Zatem L ~ P.

Jeśli istnieje v takie, że (nnf-lit #f v)
L = (eval-nnf s (neg-nnf fi)) ~
(eval-nnf s (neg-nnf (nnf-lit #f v))) ~
(eval-nnf s (nnf-lit #t v)) ~ (s v)
P = (not (eval-nnf s fi)) ~
(not (eval-nnf s (nnf-lit #f v))) ~
(not (not (s v))) ~ (s v).
Zatem L ~ P.

Jeśli fi ~ (nnf-conj l r) to:
Załóżmy, że (eval-nnf s (neg-nnf l)) ~ (not (eval-nnf s l))
oraz (eval-nnf s (neg-nnf r)) ~ (not (eval-nnf s r)),
pokażemy, że (eval-nnf s (neg-nnf fi)) ~ (not (eval-nnf s fi)).

L = (eval-nnf s (neg-nnf fi)) ~
(eval-nnf s (neg-nnf (nnf-conj l r))) ~
(eval-nnf s (nnf-disj (neg-nnf l) (neg-nnf r))) ~
(or (eval-nnf s (neg-nnf l)) (eval-nnf s (neg-nnf r))) ~
(or (not (eval-nnf s l)) (not (eval-nnf s r)))
P = (not (eval-nnf s fi)) ~
(not (eval-nnf s (nnf-conj l r))) ~
(not (and (eval-nnf s l)(eval-nnf s r))) ~ (Lemat 5.1)
(or (not (eval-nnf s l)) (not (eval-nnf s r)))
Zatem L ~ P.

Jeśli fi ~ (nnf-disj l r) to:
Załóżmy, że (eval-nnf s (neg-nnf l)) ~ (not (eval-nnf s l))
oraz (eval-nnf s (neg-nnf r)) ~ (not (eval-nnf s r)),
pokażemy, że (eval-nnf s (neg-nnf fi)) ~ (not (eval-nnf s fi)).
L = (eval-nnf s (neg-nnf fi)) ~
(eval-nnf s (neg-nnf (nnf-disj l r))) ~
(eval-nnf s (nnf-conj (neg-nnf l) (neg-nnf r))) ~
(and (eval-nnf s (neg-nnf l)) (eval-nnf s (neg-nnf r))) ~
(and (not (eval-nnf s l)) (not (eval-nnf s r)))
P = (not (eval-nnf s fi)) ~
(not (eval-nnf s (nnf-disj l r))) ~
(not (or (eval-nnf s l)(eval-nnf s r))) ~ (Lemat 5.2)
(and (not (eval-nnf s l)) (not (eval-nnf s r)))
Zatem L ~ P.

Stąd dla dowolnej formuły fi spełnione jest (eval-nnf s (neg-nnf fi)) ~ (not (eval-nnf s fi)).
|#