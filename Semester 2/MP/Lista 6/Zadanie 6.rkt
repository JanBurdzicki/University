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