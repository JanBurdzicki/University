
(define (fact-fix n)
  (define (fix f)
    (let ([w (λ (g) (f (λ (z) ((g g) z))))])
      (w w)))
  (define (fact g)
    (λ (n)
      (if (= n 0)
          1
          (* n (g (- n 1))))))
  ((fix fact) n))

TODO: co to funkcjonał

Przyjmuje funkcjonał f, czyli lambdę

(define (fix f)
  (let ([w (lambda (g) (f (lambda (z) ((g g) z))))])
       (w w)))

(define (fact g) (lambad (n) (...)))

((fix fact) n)