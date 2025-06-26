#lang plait

(define-type (NNF 'v)
	(nnf-lit [polarity : Boolean] [var : 'v])
	(nnf-conj [l : (NNF 'v)] [r : (NNF 'v)])
	(nnf-disj [l : (NNF 'v)] [r : (NNF 'v)]))

#|
Zasada indukcji strukturalnej dla NNF:
Niech P będzie własnością formuł w NNF, taką że:
i) P(nnf-lit)
ii) Dla każdego l, r będącymi formułami w NNF, jeśli P(l) i P(r), to P((nnf-conj l r))
iii) Dla każdego l, r będącymi formułami w NNF, jeśli P(l) i P(r), to P((nnf-disj l r))
Wówczas dla dowolnej formuły w NNF zachodzi P(TODO:)
|#
