#lang racket

(define morse-table
  (hash
    #\a "._"
    #\b "_..."
    #\c "_._."
    #\d "_.."
    #\e "."
    #\f ".._."
    #\g "__."
    #\h "...."
    #\i ".."
    #\j ".___"
    #\k "_._"
    #\l "._.."
    #\m "__"
    #\n "_."
    #\o "___"
    #\p ".__."
    #\q "__._"
    #\r "._."
    #\s "..."
    #\t "_"
    #\u ".._"
    #\v "..._"
    #\w ".__"
    #\x "_.._"
    #\y "_.__"
    #\z "__.."
    #\0 "_____"
    #\1 ".____"
    #\2 "..___"
    #\3 "...__"
    #\4 "...._"
    #\5 "....."
    #\6 "_...."
    #\7 "__..."
    #\8 "___.."
    #\9 "____."
    #\space  ""
    ))

(define ex "Metody    Programowania")

;string-downcase - zamienia caly string na lowercase
;string-normalize-spaces - zamienia ciąg whitespace na jedną spacje

(define (morse-code s)
  (string-join
    (map
      (lambda (x)(hash-ref morse-table x))
      (string->list
        (string-normalize-spaces
          (string-downcase s))))))

(morse-code ex)

; (string->list
;   (string-normalize-spaces ex))