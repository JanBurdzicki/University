#lang racket

(define (select xs)
  (define (it-min xs acc)
    (if (null? xs)
        acc
        (if (< (car xs) acc)
            (it-min (cdr xs) (car xs))
            (it-min (cdr xs) acc))))

  (define minimum (it-min xs +inf.0))

  (define (it xs acc)
    (if (null? xs)
        acc
        (if (= (car xs) minimum)
            (append acc (cdr xs))
            (it (cdr xs) (cons (car xs) acc)))))

  (define result (it xs null))

  (cons minimum result))

(define (selectsort xs)
  (if (null? xs)
      null
      (let [(x (select xs))]
          (cons (car x) (selectsort (cdr x))))))



(select '(5 4 3 2 1))
(selectsort '(5 4 3 2 6 1))
(selectsort '())
(selectsort '(1))
(selectsort '(2 1))