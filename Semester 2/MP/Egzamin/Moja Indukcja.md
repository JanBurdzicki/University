# Indukcja

## Zad 1

Następnie pokaż, że dla dowolnych funkcji
`f` i `g` oraz listy `xs` zachodzi `(map f (map g xs)) ≡ (map (lambda (x) (f (g x))) xs)`

```racket
(define (map f xs)
    (if (null? xs)
        null
        (cons (f (car xs))
              (map f (cdr xs)))))
```


### Zasada indukcji strukturalnej dla LIST:

Niech P będzie własnością list, taką że:
* zachodzi P(empty)
* dla dowolnej wartości x i dowolnej listy xs, jeśli zachodzi P(xs), to zachodzi P((cons x xs))

Wtedy dla dowolnej listy xs zachodzi P(xs)

---
Twierdzenie: (map f (map g xs)) ≡ (map (lambda (x) (f (g x))) xs)
---

Dowód indukcyjny:
Weźmy dowolne funkcje f, g

Podstawa indukcji:
* xs ≡ empty
	L ≡ (map f (map g xs)) ≡ (map f (map g empty)) ≡ (z def. map) ≡ (map f empty) ≡ (z def. map) ≡ empty
	P ≡ (map (lambda (x) (f (g x))) xs) ≡ (map (lambda (x) (f (g x))) empty) ≡ empty

	Korzystając z def. map, otrzymujemy, że L ≡ P.

Krok indukcyjny:
Weźmy dowolne xs oraz x. Załóżmy, że zachodzi:
	`(map f (map g xs)) ≡ (map (lambda (x) (f (g x))) xs)`

Pokażemy, że zachodzi również:
	`(map f (map g (cons x xs))) ≡ (map (lambda (x) (f (g x))) (cons x xs))`

L ≡ (map f (map g (cons x xs))) ≡ (map f cons ((g x) (map g xs))) ≡ (cons (f (g x)) (map f (map g xs)))

P ≡ (map (lambda (x) (f (g x))) (cons x xs)) ≡ (cons (f (g x)) (map (lambda (x) (f (g x))) xs)) ≡ (z zał. ind.) ≡ (cons (f (g x)) (map f (map g xs)))

Zatem L ≡ P

Na mocy twierdzenia o indukcji strukturalnej ...

## Zad 2

### Zasada indukcji strukturalnej dla LIST:

Niech P będzie własnością list, taką że:
* zachodzi P(empty)
* dla dowolnej wartości x i dowolnej listy xs, jeśli zachodzi P(xs), to zachodzi P((cons x xs))

Wtedy dla dowolnej listy xs zachodzi P(xs)

---
Twierdzenie: (append xs ys) ≡ zs, gdzie xs, ys to dowolne listy, a zs to lista
---

Lemat (*):
Dla dowolnej listy xs mamy: (append empty xs) ≡ (append xs empty) ≡ xs

Lemat (**):
Jeśli xs jest listą, to (cons x xs) też jest listą, gdzie x to dowolna wartość.


Dowód indukcyjny:

Załóżmy, że ys jest dowolną listą. Zrobimy indukcję strukturalną względem listy xs.

Podstawa indukcji:
* xs ≡ empty
	(append xs ys) ≡ (append empty ys) ≡ (z lematu (*)) ≡ ys, czyli zs = ys
	Skoro ys jest listą, to zs też jest listą

Krok indukcyjny:
Weźmy dowolne xs oraz x. Załóżmy, że zachodzi:
`(append xs ys) ≡ zs`
Pokażemy, że zachodzi również:
`(append (cons x xs) ys) ≡ zs_2`, gdzie zs_2 jest listą

(append (cons x xs) ys) ≡ (cons x zs) ≡ zs'

L ≡ (append (cons x xs) ys) ≡ (cons x (append xs ys)) ≡ (z zał. ind.) ≡ (cons x zs) ≡ (z lematu (**)) ≡ zs_2

P ≡ zs_2

Zatem L ≡ P

Na mocy twierdzenia o indukcji strukturalnej ...


## Zad 3

```racket
(define-type (NNF 'v)
	(nnf-lit [polarity : Boolean] [var : 'v])
	(nnf-conj [l : (NNF 'v)] [r : (NNF 'v)])
	(nnf-disj [l : (NNF 'v)] [r : (NNF 'v)]))
```

### Zasada indukcji strukturalnej dla NNF:

Niech P będzie własnością formuł w NNF, taką że:
i) P(nnf-lit)
ii) Dla każdego l, r będącymi formułami w NNF, jeśli P(l) i P(r), to P((nnf-conj l r))
iii) Dla każdego l, r będącymi formułami w NNF, jeśli P(l) i P(r), to P((nnf-disj l r))
Wówczas dla dowolnej formuły w NNF zachodzi P(TODO:)
|#

≡

## Zad z wykładu (nie zrobione)

```racket
(define (insert x xs)
    (if (empty? xs)
        (cons x empty)
        (if (< x (first xs))
            (cons x xs)
            (cons (first xs) (insert x (rest xs)))
        )
    )
)

(define (bound? x xs)
    (if (empty? xs)
        #t
        (<= x (first xs))
    )
)

(define (sorted? xs)
    (if (empty? xs)
        #t
        (and (sorted? (rest xs)) (bound? x (rest xs)))
    )
)
```

---
Twierdzenie: Jeśli (sorted? xs) = #t, to (sorted? (insert x xs)) = #t
---

### Zasada indukcji strukturalnej dla list:

Niech P będzie własnością list, taką że:
* dla dowolnej wartości x, zachodzi P((list x))
* dla dowolnej wartości x i dowolnej listy xs, jeśli zachodzi P(xs), to zachodzi P((insert x xs))

Wtedy dla dowolnej listy xs zachodzi P(xs)

Dowód indukcyjny:

Podstawa indukcji:
* xs ≡ (list x), gdzie x jest dowolną wartością
	Korzystając z def `sorted?` i `bound?`, dostajemy, że zachodzi `(sorted? xs) = #t`

Krok indukcyjny:
Weźmy dowolne xs oraz x. Załóżmy, że zachodzi:
`(sorted? xs) = #t`
Pokażemy, że zachodzi również:
`(sorted? (insert x xs)) = #t`

(and (sorted? (rest xs)) (bound? x (rest xs)))
(<= x (first xs))
(sorted? (insert x xs))

(if (< x (first xs))
            (cons x xs)
            (cons (first xs) (insert x (rest xs)))

Rozważmy przypadki (funkcja insert):
* zachodzi `(< x (first xs))`
  (sorted? (insert x xs)) ≡ (sorted? (cons x xs)) ≡ (and (sorted? xs) (bound? x xs)) ≡ (z zał. ind.) ≡ (and #t (bound? x xs)) ≡ (and #t #t) ≡ #t
* zachodzi `(>= x (first xs))`
  (sorted? (insert x xs)) ≡ (sorted? (cons (first xs) (insert x (rest xs)))


Na mocy twierdzenie o indukcji strukturalnej ...

(define-type (Tree 'a)
  (leaf)
  (node [l : (Tree 'a)] [elem : 'a] [r : (Tree 'a)]))

; Zasada indukcji dla typu Tree:
; Niech P będzie własności drzew t. że:
; i) P((leaf))
; ii) Dla dowolnych wartości l x r, jeśli P(l) i P(r) to P((node l x r))
; Wówczas zachodzi P(t) dla dowolnego drzewa t.

(define-type (RoseTree 'a)
  (rleaf [elem : 'a])
  (rnode [children : (Listof (RoseTree 'a))]))

; Zasada (wzajemnej) indukcji dla RoseTree:
; Niech P będzie własnością drzew różanych, a Q własnością list drzew t. że:
; i)  dla dowolnego x mamy P((rleaf x))
; ii) Dla dowolnych wartości xs, jeśli zachodzi Q(xs)
;     to P(rnode xs)
; iii) zachodzi Q(empty)
; iv) Dla dowolnych t ts jeśli P(t) i Q(ts) to Q((cons t ts))
; Wówczas zachodzi P(t) dla dowolnego drzewa t i Q(ts) dla dowolnej listy drzew różanych