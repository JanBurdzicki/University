#lang racket
(require "Zadanie 3 Parsing.rkt")
(require (only-in plait s-exp-content))
(require (only-in plait s-exp))
(provide parse-Exp)

(define op-parser
  `((+ ,op-add)
    (- ,op-sub)
    (* ,op-mul)
    (/ ,op-div)))

(define exp-parser
  `((NUMBER ,exp-number)
    ((SYMBOL ANY ANY) ,(lambda (op e1 e2)
                         (exp-op (parse-op op)
                                 (parse-exp e1)
                                 (parse-exp e2))))))

(define (parse-op s)
  (run-parser op-parser s))

(define (parse-exp s)
  (run-parser exp-parser s))

(define (parse-Exp s)
  (parse-exp (s-exp-content s)))