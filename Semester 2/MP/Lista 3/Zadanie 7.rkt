#lang racket

(define (foldr-reverse xs)
(foldr (lambda (y ys) (append ys (list y))) null xs))

(length (foldr-reverse (build-list 10000 identity)))

; append jest kwadratowy
; nieużytki - append od appenda rekurencyjnie robi consy
; ilość consów = n * (n + 1) / 2
; ilość nieużytków spośród consów = (n * (n + 1) / 2) - n

; naprawić: użyć foldla i consa zamiast foldra i appenda