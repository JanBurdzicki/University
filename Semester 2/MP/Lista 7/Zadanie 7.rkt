#lang racket

(define (raise-contract-violation pol val)
	(error "Contract violation\nBlaming:"
				(if pol 'Programmer 'User)))

(struct contract [wrap])

(define (wrap-contract c v)
	(wrap-with-polarity #t c v))

(define (wrap-with-polarity pol c v)
	(if (contract? c)
		((contract-wrap c) pol v)
		(if (c v)
			v
			(raise-contract-violation pol v))))

(define any/c (contract (lambda (pol v) v)))

(define v (wrap-contract any/c 42))

(define (->/c . cs)
	(define arity (- (length cs) 1))
	(define val/c (last cs))
	(define arg/cs (take cs arity))
	(define (wrap pol f)
		(lambda xs
		(define args
			(map (curry wrap-with-polarity (not pol))
				arg/cs
				xs))
		(wrap-with-polarity pol val/c (apply f args))))
	(contract wrap))

(define id
	(wrap-contract (->/c boolean? boolean?)
				   (lambda (x) x)))

(define (list/c c)
	(define (wrap pol xs)
		(if (list? xs)
			(map (curry wrap-with-polarity pol c) xs)
			(raise-contract-violation pol xs)))
	(contract wrap))

(define head
	(wrap-contract (->/c (list/c any/c) any/c)
				car))

(struct box [tag val])

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Zadanie 7 + 8

;(define (box/c tag)
;  (define (wrap pol val)
;    (if pol
;        (if (and (box? val) (eq? tag (box-tag val)))
;            (box-val val)
;            (raise-contract-violation pol val))
;        (box tag val)))
;  (contract wrap))

;; Zad 8: procedura box/c zwraca kontrakt, który pamięta
;; nie tylko tag, ale i biegunowość parametrycznej funkcji;
;; wystarczy wtedy porównać bieżącą biegunowość z tą zapamiętaną

(define (box/c tag def-pol)
	(define (wrap pol val)
		(if (eq? pol def-pol)
			(if (and (box? val) (eq? tag (box-tag val)))
				(box-val val)
				(raise-contract-violation pol val))
			(box tag val)))
	(contract wrap))

;(define (parametric/c body)
;  (define arity (procedure-arity body))
;  (define cs (map (lambda (i) (box/c (gensym))) (range arity)))
;  (apply body cs))

;; Zad 7: procedura parametric/c zwraca kontrakt funkcyjny, tak jak ->/c
;; gdzie okontraktowana funkcja val jest reprezentowana przez funkcję
;; przyjmującą listę argumentów xs;
;; nowe tagi dla parametrów są generowane każdorazowo po zaaplikowaniu
;; tej funkcji, następnie wyliczana jest instancja kontraktu c dla funkcji
;; val, po czym okontraktowana funkcja val otrzymuje argumenty xs

(define (parametric/c body)
	(define (wrap pol val)
		(lambda xs
		(define arity (procedure-arity body))
		(define cs (map (lambda (i) (box/c (gensym) pol)) (range arity)))
		(define c (apply body cs))
		(apply ((contract-wrap c) pol val) xs)))
	(contract wrap))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define map-contracted
	(wrap-contract
	(parametric/c (lambda [a b]
					(->/c (->/c a b) (list/c a) (list/c b))))
		map))

#|
(define foo
(wrap-contract
(parametric/c (lambda [a]
				(->/c boolean? a (->/c a any/c) any/c)))
(lambda (b x f)
	(if b x (f (f x))))))

(foo #f (foo #t 42 identity) identity)
|#

(define bar
	(wrap-contract
	(->/c (parametric/c (lambda [a] (->/c a a))) number?)
	(lambda (f) (f 42))))

(bar identity)
