(define nats2
  (stream-cons 0 (map2 + ones nats2)))

(define fact
  (stream-cons 1 (map2 * fact (stream-cdr nats2))))

(define partial-sums-nats
  (stream-cons 0 (map2 + (stream-cdr nats2) (partial-sums-nats nats2))))

(define (partial-sums stream)
  (stream-cons (stream-car stream) (map2 + (stream-cdr stream) (partial-sums stream))))


map2 f a[i] b[i]

(define (scale stream n)
  (stream-cons (* n (stream-car stream)) (scale (stream-cdr stream) n)))

(define padovan
  (stream-cons 1 (stream-cons 1 (stream-cons 1 (map2 + (stream-cdr padovan) padovan)))))



(define padovan2
  (stream-cons 1 (stream-cons 1 (stream-cons 1 (map2 + (stream-cdr (stream-cdr padovan2)) padovan2)))))

; 0  1  2  3  4  5  6
; 1, 1, 1, 2, 3, 4, 6
; |     |

(stream-ref padovan2 6)


Zadania Dubiela:

Zad 1

0 1 2  3
3 6 12 24

(define s1
  (stream-cons 3 (* s1 2)))