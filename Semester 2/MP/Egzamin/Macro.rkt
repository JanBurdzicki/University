#lang plait

(define-syntax my-print
  (syntax-rules ()
    [(my-print) (display "XD")]
    [(my-print a ...) (display (list a ...))]))

(my-print '(1 2 3 4))

(define-syntax my-and
  (syntax-rules ()
    [(my-and) #t]
    [(my-and e1) e1]
    [(my-and e1 e2 ...) (if e1 (my-and e2 ...) #f)]))

(define-syntax my-or
  (syntax-rules ()
    [(my-or) #f]
    [(my-or e1) e1]
    [(my-or e1 e2 ...)
    ;  (let ([t e1])
    ;    (if t t (my-or e2 ...)))]))
       (if e1 e1 (my-or e2 ...))]))


(my-and (= 0 0) (= 1 1))
(my-and (= 0 0) (= 1 2))
(my-or (= 0 0) (= 1 1))
(my-or (= 0 0) (= 1 2))
(my-or (= 0 1) (= 1 2))
