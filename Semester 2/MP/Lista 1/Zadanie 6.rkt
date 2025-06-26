#lang racket

(define (my_if condition a b)
   (or (and condition a) b))

(define a #f)
(define b 2)
(define condition (eq? a #f))

(my_if condition a b)
