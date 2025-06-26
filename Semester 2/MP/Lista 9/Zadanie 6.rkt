#lang plait
(require "syntax.rkt")

(define-type (ParseResult 'a)
  (parse-err)
  (parse-ok [v : 'a] [rest : (Listof S-Exp)]))

(define (parse-op0 ss)
  (type-case (Listof S-Exp) ss
    [empty (parse-err)]
    [(cons op rest)
     (cond
       [(s-exp-match? `+ op) (parse-ok (op-add) rest)]
       [(s-exp-match? `- op) (parse-ok (op-sub) rest)]
       [else (parse-err)])]))

(define (parse-op1 ss)
  (type-case (Listof S-Exp) ss
    [empty (parse-err)]
    [(cons op rest)
     (cond
       [(s-exp-match? `* op) (parse-ok (op-mul) rest)]
       [(s-exp-match? `/ op) (parse-ok (op-div) rest)]
       [else (parse-err)])]))

; ss to lista s-expression
; parse-exp0 to E0
; parse-exp1 to E1
; op0 -> "+" | "-"
; op1 -> "*" | "/"

; E0 -> E1
; E0 -> E1 op0 E0
; E2 -> NUMBER | ... rest
; E2 -> (E0)

; E1 -> E2 | E2 op1 E1

(define (parse-exp0 ss)
  (type-case (ParseResult Exp) (parse-exp1 ss)
    [(parse-err) (parse-err)] ; jesli jest puste albo coś nie dziala ???
    [(parse-ok e1 rest)
     (type-case (ParseResult Op) (parse-op0 rest)
       [(parse-err) (parse-ok e1 empty)] ;jesli jedno wyrazenie (konczy sie na liczbie mp)
       [(parse-ok op rest2)
        (type-case (ParseResult Exp) (parse-exp0 rest2)
          [(parse-err) (parse-err)] ;jesli jest operator i nie ma za nim liczby / wyrazenia
        ;   [(parse-ok value rest) (parse-ok (exp-op op e1 value) empty)])])])) ; bo
          [(parse-ok e2 rest) (parse-ok (exp-op op e2 e1) empty)])])])) ; bo

(define (parse-exp1 ss)
  (type-case (ParseResult Exp) (parse-exp2 ss)
    [(parse-err) (parse-err)] ; jesli jest puste albo coś nie dziala ???
    [(parse-ok e1 rest)
     (type-case (ParseResult Op) (parse-op0 rest)
       [(parse-err) (parse-ok e1 empty)] ;jesli jedno wyrazenie (konczy sie na liczbie mp)
       [(parse-ok op rest2)
        (type-case (ParseResult Exp) (parse-exp1 rest2)
          [(parse-err) (parse-err)] ;jesli jest operator i nie ma za nim liczby / wyrazenia
        ;   [(parse-ok value rest) (parse-ok (exp-op op e1 value) empty)])])])) ; bo
          [(parse-ok e2 rest) (parse-ok (exp-op op e2 e1) empty)])])])) ; bo

(define (parse-exp2 ss)
  (type-case (Listof S-Exp) ss
    [empty (parse-err)]
    [(cons s rest)
     (cond
       [(s-exp-number? s) (parse-ok (exp-number (s-exp->number s)) rest)] ;jesli mamy liczbe
       [(s-exp-list? s)
        (type-case (ParseResult Exp) (parse-exp0 (s-exp->list s)) ;jesli mamy wyrazenie
          [(parse-err) (parse-err)]
          [(parse-ok e rest2) (parse-ok e rest)])])]));rest2 jest puste z zalozenia, wiec nie trzeba if-owac

(define (parse-exp s) ;
  (type-case (ParseResult Exp) (parse-exp0  (list (list->s-exp (reverse (s-exp->list s)))))
    [(parse-err) (error 'parse-exp "Syntax error")]
    [(parse-ok e rest) e]))

