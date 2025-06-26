#lang racket

; * (parametric->/c [a b] (-> (-> a b) a b))

(define/contract (apply f x)
  (parametric->/c [a b] (-> (-> a b) a b))
  (f x))

(apply (lambda (x) (+ x 1)) 1)

; * (parametric->/c [a b c] (-> (-> a b c) (-> (cons/c a b) c)))

(define/contract (foo f)
  (parametric->/c [a b c] (-> (-> a b c) (-> (cons/c a b) c)))
  (lambda (x) (f (car x) (cdr x))))

((foo (lambda (x y) (+ x y))) (cons 1 2))

; * (parametric->/c [a b] (-> (listof (-> a b)) (listof a) ( listof b)))

(define/contract (foo2 fs xs)
  (parametric->/c [a b] (-> (listof (-> a b)) (listof a) ( listof b)))
  (if (null? fs)
      null
	  (if (null? xs)
	      null
		  (map (car fs) xs))))

(foo2 (list (lambda (x) (+ x 1))) '(1 2 3 4))

; * (parametric->/c [a b] (-> (-> b (or/c false/c (cons/c a b))) b (listof a)))

(define/contract (foo4 f x)
  (parametric->/c [a b] (-> (-> b (or/c false/c (cons/c a b))) b (listof a)))
  (let ([result (f x)])
       (if (boolean? result)
	       null
		   (list (car result)))))

(foo4 (lambda (x) #f) 4)
(foo4 (lambda (x) (cons 'a' 1)) 4)

; * (parametric->/c [a] (-> (-> a boolean?) (listof a) ( cons/c ( listof a) ( listof a))))

(define/contract (foo5 f xs)
  (parametric->/c [a] (-> (-> a boolean?) (listof a) (cons/c (listof a) (listof a))))
  (if (null? xs)
      (cons null null)
      (if (f (car xs))
	       (cons xs xs)
		   (foo5 f (cdr xs)))))

(foo5 (lambda (x) (even? x)) '(1 2 3 4))

; * (parametric->/c [a b] (-> (-> a b) (listof a) (-> b (listof a))))

(define/contract (foo6 f xs)
  (parametric->/c [a b] (-> (-> a b) (listof a) (-> b (listof a))))
  (lambda (x) xs))

((foo6 (lambda (x) x) '(1 2 3 4)) 2)



; --- zad z egzaminu ---

(define/contract (append/map f xs)
  (parametric->/c [a b] (-> (-> a (listof b)) (listof a) (listof b)))
  (if (null? xs)
      null
      (append (f (car xs)) (append/map f (cdr xs)))))