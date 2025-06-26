#lang racket

(define (my-map f xs)
  (if (null? xs)
      null
	  (cons (f (car xs)) (my-map f (cdr xs)))))

(define (my-filter p? xs)
  (if (null? xs)
      null
	  (if (p? (car xs))
	      (cons (car xs) (my-filter p? (cdr xs)))
		  (my-filter p? (cdr xs)))))

(define (my-foldr f x xs)
  (if (null? xs)
      x
	  (f (car xs) (my-foldr f x (cdr xs)))))

(define (new-append xs ys)
  (my-foldr cons ys xs))

(define (new-map f xs)
  (define (g y ys)
    (cons (f y) ys))
  (my-foldr g null xs))

(define (new-map2 f xs)
  (my-foldr (lambda (y ys) (cons (f y) ys)) null xs))

(define (new-filter2 p? xs)
  (my-foldr (lambda (y ys) (if (p? y) (cons y ys) ys)) null xs))

(define (new-filter p? xs)
  (define (g y ys)
    (if (p? y)
	  (cons y ys)
	  ys))
  (my-foldr g null xs))

(define (my-foldl f x xs)
  (define (it xs acc)
    (if (null? xs)
	    acc
        (it (cdr xs) (f (car xs) acc))))
  (it xs x))

(define (my-reverse xs)
  (define (it xs acc)
    (if (null? xs)
	    acc
		(it (cdr xs) (cons (car xs) acc))))
  (it xs null))

(define (my-reverse2 xs)
  (my-foldl cons null xs))

(define (my-length xs)
  (define (it xs acc)
    (if (null? xs)
	    acc
		(it (cdr xs) (+ acc 1))))
  (it xs 0))

(define (my-length2 xs)
  (my-foldl (lambda (y acc) (+ acc 1)) 0 xs))

(define (my-sum xs)
  (define (it xs acc)
    (if (null? xs)
	    acc
		(it (cdr xs) (+ acc (car xs)))))
  (it xs 0))

(define (my-sum2 xs)
  (my-foldl + 0 xs))

(define (my-new-map2 f xs)
  (my-foldl (lambda (y ys) (cons (f y) ys)) null xs))

(define my-list '(1 2 3 4))
(define my-list2 '(5 6 7 8))

(my-reverse2 (my-new-map2 (lambda (x) (+ x 1)) my-list))

(define (my-new-append2 xs ys)
  (my-foldl cons ys xs))

(my-new-append2 (my-reverse my-list) my-list2)

(define (my-new-foldr f x xs)
  ((my-foldl (lambda (y g) (lambda (acc) (g (f y acc)))) identity xs) x))

(define (my-new-foldl f x xs)
  ((my-foldr (lambda (y g) (lambda (acc) (g (f y acc)))) identity xs) x))

(define (my-new-strange-append xs ys) (my-new-foldr cons ys xs))

(define (my-new-strange-sum xs) (my-new-foldl + 0 xs))

(my-new-strange-append my-list my-list2)
(my-new-strange-sum my-list)

; (define (my-foldr proc init lst)
;   (my-foldl proc init (reverse lst)))


