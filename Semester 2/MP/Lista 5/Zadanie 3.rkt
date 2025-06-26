#lang plait

(define (apply f x) (f x))
(define (compose f g) (lambda (x) (f (g x))))
(define (flip f) (lambda (x y) (f y x)))
(define (curry f) (lambda (x) (lambda (y) (f x y))))

(curry compose)
((curry compose) (curry compose))
((curry compose) (curry apply))
((curry apply) (curry compose))
(compose curry flip)


(curry compose)

; curry:
; (('a 'b -> 'c) -> ('a -> ('b -> 'c)))

; compose:
; (('x -> 'y) ('z -> 'x) -> ('z -> 'y))

; (curry compose):
; 'a = ('x -> 'y)
; 'b = ('z -> 'x)
; 'c = ('z -> 'y)

; co zwraca curry:
; ('a -> ('b -> 'c))
; (('x -> 'y) -> (('z -> 'x) -> ('z -> 'y)))

; sprawdzenie:
; (('_a -> '_b) -> (('_c -> '_a) -> ('_c -> '_b)))


((curry compose) (curry compose))

; (curry compose) po lewej:
; (('x -> 'y) -> (('z -> 'x) -> ('z -> 'y))) -> wiemy z podpunktu 1

; (curry compose) po prawej:
; (('a -> 'b) -> (('c -> 'a) -> ('c -> 'b))) -> wiemy z podpunktu 1

; ((curry compose) (curry compose)):
; 'x = ('a -> 'b)
; 'y = (('c -> 'a) -> ('c -> 'b))

; co zwraca (curry compose):
; (('z -> 'x) -> ('z -> 'y))
; (('z -> ('a -> 'b)) -> ('z -> (('c -> 'a) -> ('c -> 'b))))

; sprawdzenie:
; (('_a -> ('_b -> '_c)) -> ('_a -> (('_d -> '_b) -> ('_d -> '_c))))

((curry compose) (curry apply))

; 1. (curry apply):

; apply:
; (('x -> 'y) 'x -> 'y)

; curry:
; (('a 'b -> 'c) -> ('a -> ('b -> 'c)))

; (curry apply):
; 'a = ('x -> 'y)
; 'b = 'x
; 'c = 'y

; co zwraca curry:
; ('a -> ('b -> 'c))
; (('x -> 'y) -> ('x -> 'y))   <--- (curry apply)

; 2. (curry compose):
; (('a -> 'b) -> (('c -> 'a) -> ('c -> 'b))) -> wiemy z podpunktu 1

; 3. ((curry compose) (curry apply))
; 'a = ('x -> 'y)
; 'b = ('x -> 'y)

; co zwraca (curry compose):
; (('c -> 'a) -> ('c -> 'b))

; (('c -> ('x -> 'y)) -> ('c -> ('x -> 'y)))

; sprawdzenie:
; (('_a -> ('_b -> '_c)) -> ('_a -> ('_b -> '_c)))


((curry apply) (curry compose))

; (curry apply):
; (('x -> 'y) -> ('x -> 'y)) -> wiemy z podpunktu 3

; (curry compose):
; (('a -> 'b) -> (('c -> 'a) -> ('c -> 'b))) -> wiemy z podpunktu 1

; ((curry apply) (curry compose)):
; 'x = ('a -> 'b)
; 'y = (('c -> 'a) -> ('c -> 'b))

; co zwraca (curry apply):
; ('x -> 'y)
; (('a -> 'b) -> (('c -> 'a) -> ('c -> 'b)))

; sprawdzenie:
; (('_a -> '_b) -> (('_c -> '_a) -> ('_c -> '_b)))


(compose curry flip)

; compose:
; (('a -> 'b) ('c -> 'a) -> ('c -> 'b))

; curry:
; (('d 'e -> 'f) -> ('d -> ('e -> 'f)))

; flip:
; (('g 'h -> 'i) -> ('h 'g -> 'i))

; co przyjmuje compose:
; ('a -> 'b) ('c -> 'a)

; pierwsze podstawienie:

; 'a = ('d 'e -> 'f) i jednoczesnie 'a = ('h 'g -> 'i)
; 'b = ('d -> ('e -> 'f))
; 'c = ('g 'h -> 'i)

; drugie podstawienie (wynikajace z niejednoznacznosci 'a):
; 'h = 'd
; 'g = 'e
; 'i = 'f

; zatem ostateczne podstawienie jest postaci:
; 'a = ('d 'e -> 'f)
; 'b = ('d -> ('e -> 'f))
; 'c = ('e 'd -> 'f)

; co zwraca compose:
; ('c -> 'b)
; (('e 'd -> 'f) -> ('d -> ('e -> 'f)))

; sprawdzenie:
; (('_a '_b -> '_c) -> ('_b -> ('_a -> '_c)))