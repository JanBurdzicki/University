#lang racket

(define (insert x xs)
  (if (null? xs)
      (list x)
      (if (< x (car xs))
          (cons x xs)
          (cons (car xs) (insert x (cdr xs))))))

(define (insertsort xs)
  (define (it xs acc)
    (if (null? xs)
        acc
        (it (cdr xs) (insert (car xs) acc))))

  (it xs null))

(insertsort '(5 4 3 2 6 1))
(insertsort '())
(insertsort '(1))
(insertsort '(2 1))
