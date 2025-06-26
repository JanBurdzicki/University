'a -> 'a

-> 'a 'a


(or (and cond wyn_if) wyn_else)


(define (policz n)
  (define (it n acc)
    (if ()
	    0
		(it (- n 1) acc))
  (it n 0)))


(define-struct leaf () #:transparent)
(define-struct node (l elem r) #:transparent)


(define lista (list 1 2 3 4 5 6 7))

(define foo (* 2 (fifth lista)))

(define (my-list-length xs n)
  (define (it xs acc)
    (if (null? xs)
	    acc
	    (it (cdr xs) (+ acc 1))))
  (it xs 0))

(define (my-list-ref xs n)
  (if (= n 0)
	  (car xs)
	  (my-list-ref (cdr xs) (- n 1))))

(define (my-append xs ys)
  (if (null? xs)
	  ys
	  (cons (car xs) (my-append (cdr xs) ys))))

(define (my-reverse xs)
  (define (it xs acc)
    (if (null? xs)
	    acc
		(it (cdr xs) (cons (car xs) acc))))
  (it xs null))

(define (comp a b)
  (if (equal? (even? a) (even? b))
      (< a b)
	  (even? a)))

(sort lista comp)
