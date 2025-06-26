; op_0 -> + | -
; op_1 -> * | /
; op_2 -> ^
; op_u -> ! | -

; E0 -> E1
; E0 -> E1 op0 E0
; E1 -> E1.5
; E1 -> E2 op1 E1.5
; E1.5 -> E2 / -E2
; E2 -> E3
; E2 -> E3 op2 E1.5
; E3 -> "("E0")"
; E3 -> N
; E3 -> E3 "!" / "-" E3


G = (T, N, P, S)

Zero -> 0
Cyfry -> {1, 2, 3, 4, 5, 6, 7, 8, 9}
Liczby -> Zero | Cyfry | CyfryLiczby | CyfryLiczbyLiczby

S -> Liczby

; Operator -> + | - | * | / | ! | ~ | ^, gdzie ~ oznacza operator liczby przeciwnej (unarny minus)

Op1 -> + | -
Op2 -> * | /
Op3 -> ~
Op4 -> ^
Op5 -> !

!4 + ~3 * 4 ^ 2
((4!) + ((~3) * (4 ^ 2)))
3 * 1 ^ 4 + 2!

Operacje_w_lewo -> S Op1 S | S Op2 S
Operacje_w_prawo -> Op3 S | Op4 S | Op5 S

Operacje_w_prawo -> S Op1 (Operacje_w_prawo) |  (Operacja_w_prawo (Operacje_w_prawo))

a + b ^ c
(a ^ (b ^ c))

; Priorytet operatorów (od najmniej do najbardziej silnych):
; +, -
; *, /
; ~
; ^
; !

; Łączność:
; * lewo: +, -, *, /
; * prawo: ~, ^, !