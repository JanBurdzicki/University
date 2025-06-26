#lang racket

; (* (+ 2 2) 5) -> 20

; (* (+ 2 2) (5) ) -> BŁĄD, bo () mówi że będzie jakiś operator (5 nie jest procedurą)

; (* (+ (2 2) 5)) -> BŁĄD, bo operator + poza nawiasem (pierwsza 2 nie jest procedurą)

; (* (+ 2 2) 5) -> 20

;(5 * 4) -> BŁĄD, bo operator * powinien być przed argumentami

;(5 * (2 + 2) ) -> BŁĄD, bo operatory *, + powinny być przed argumentami

; ((+ 2 3)) o ile + 2 3 da liczbe to mamy to samo co w drugim

;+

; (define + (* 2 3)) -> zdefiniowaliśmy operator +

; + -> #<procedure:+>

; (* 2 +) -> 12

; (define (five) 5) -> zdefiniowaliśmy procedurę five

; (define four 4) -> zdefiniowaliśmy zmienną four

; (five ) -> 5

; four -> 4

; five -> #<procedure:five>

; (four) -> BŁĄD, bo four nie jest procedurą