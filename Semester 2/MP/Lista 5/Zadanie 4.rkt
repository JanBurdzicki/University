#lang plait

; generujemy liste z kazdym mozliwym
; wlozeniem x do P
; np dla 3 i '(1 2)
; dostajemy '((3 1 2) (1 3 2) (1 2 3))
(define (InsertIntoPerm x P)
	(local [(define (it LeftP RightP Acc)
		(if (empty? RightP)
			(append Acc (list (append LeftP (list x))))
			(it
				(append LeftP (list (first RightP)))
				(rest RightP)
				(append Acc (list (append (append LeftP (list x)) RightP))))))]
		(it empty P empty)))

; generujemy liste z kazdym mozliwym
; wlozeniem x do listy w zbiorze list Perms
(define (InsertIntoPerms x Perms)
	(if (empty? Perms)
		Perms
		(append (InsertIntoPerm x (first Perms))
				(InsertIntoPerms x (rest Perms)))))

; rekurencyjnie schodz coraz nizej az zostanie tylko jedna liczba
; i zacznij od niej generowac permutacje
(define (perms numbers)
	(if (equal? 1 (length numbers))
		(list numbers)
		(InsertIntoPerms (first numbers)
						 (perms (rest numbers)))))

(define ExampleList '(1 2 3 4))

(perms ExampleList)
