#lang plait

; fukcja przyjmuje jakies dwa argumenty, którym zostają przypisane typy
; odpowiednio 'a i 'b. Zwracany jest pierwszy argument, czyli ten o typie 'a.
; i wychodzi: ('a 'b - > 'a), czyli to co chcielismy
(define (foo_1 a b) a)

; Chcemy otrzymac (('a 'b -> 'c) ('a -> 'b) 'a -> 'c),
; czyli jest to pewna funkcja, która pobiera trzy argumenty:
; ('a 'b -> 'c), ('a -> 'b), 'a     (*)
; i zwraca jeden argument 'c.
; Skoro przed strzalka sa trzy argumenty to juz wiemy że nasza funkcja
; pobiera dokladnie 3 parametry, deklaracja wyglada wiec tak
; (define (foo_2 f g a) ... ), gdzie f, g, a to te nasze argumenty.

; Pytanie teraz: co mamy zrobic, żeby po pierwsze cała funkcja zwracała
; coś typu 'c, a po drugie żeby te nasze funkcje f, g, a same sobie
; wywnioskowaly, że mają przyjąć typy wypisane w (*).

; Kluczem w zrozumieniu tego zadania jest kierowanie się tym, co nasza
; funkcja zwraca, czyli po prostu jedna wartosc typu 'c, ale mamy ją
; otrzymać pewnymi operacjami, w których niejawnie traktujemy nasze
; f, g, a tak, jakby były już tego typu, do którego dążymy.

; (przykład: jeśli w ciele funkcji wywołasz w któryms miejscu (f coś coś2)
; to ta funkcja już wie, że jest dwuargumentowa, czyli przed strzałką ma
; dwa typy)

; Kontynuując, zapis
; (('a 'b -> 'c) ('a -> 'b) 'a -> 'c)   (**)
; oznacza, że mamy otrzymać typ z prawej strony strzałki, mając do
; dyspozycji wyłącznie pewne zależnosći z lewej strony strzałki.

; Skoro chcemy uzyskać 'c, to popatrzmy na typ pierwszej funkcji (f):
; ('a 'b -> 'c).
; Widzimy, że to jedyne miejsce, w którym wystepuje 'c. Musimy więc jakoś
; ten typ 'c wyciągnąć z tej funkcji. Wystarczy zatem zaaplikować do f
; dwie wartosci o typach odpowiednio 'a i 'b.
; Wtedy (f coś_typu_a coś_typu_b) zwróci nam nasze 'c i jesteśmy w domu.
; Tylko teraz jest problem, bo skąd mam wziąć coś typu 'a i coś typu 'b.
; No i okazuje się, że przecież trzeci parametr funkcji (a) od razu jest
; typu 'a, to widać z (**). Więc mamy już:
; (f a coś_typu_b).
; Analogicznie, chcemy teraz uzyskać coś typu b, i widzimy, że drugi
; parametr funkcji (g) jest w stanie zwrócic typ 'b pod warunkiem, że
; nakarmi się go typem 'a. A my już mamy typ 'a, jest to po prostu
; nasz parametr a. Zatem (g a) jest typu 'b i w tym momencie możemy
; to podstawić do ostatecznego ciała funkcji:
; (f a (g a)).

; Zauważ, że nigdzie jawnie nie podawałeś typów tych parametrów.
; Plait sam się domyslil jakie to maja byc typy i zrobil to dzięki
; temu, że sam sobie założyłeś w głowie, że te parametry działają zgodnie
; z typami po lewej stronie strzałki i trzymales sie tych typów przy
; kazdej operacji w ciele funkcji.

; W skrócie, jak bedziesz dążył do uzyskania typu z prawej strony strzalki,
; to funkcja napisze się sama.
(define (foo_2 f g a)
	(f a (g a)))

; Typy można wymusić też jawnie, wcale nie trzeba zlecać wszystkiego Plaitowi.
; No i to znacznie ulatwilo ten przyklad. Deklaracja funkcji foo_3
; oznacza tyle, że fukcja ta przyjmuje jakis argument a, gdzie a jest typu
; (('a -> 'a) -> 'a).

; (skladnia narzucania typu to cos w stylu:
; [nazwa_zmiennej : typ_zmiennej]

; W tym przykladzie chcemy, zeby funkcja foo3 byla typu:
; ((('a -> 'a) -> 'a) -> 'a)

; No to teraz analogicznie do poprzedniego przykladu, dysponujemy czyms
; po lewej stronie strzałki, a chcemy otrzymac prawą stronę, czyli
; jakas wartosc typu 'a.

; Zauważ, że lewa strona strzałki (czyli nasz parametr a) to tak naprawde
; funkcja, która przyjmuje kolejną funkcje.
; (('a -> 'a) -> 'a)
; Chcemy z tego wyciagnac 'a, wiec musimy nakarmić tę funkcję inną funkcją
; postaci ('a -> 'a). No a my znamy taką wbudowaną funkcję, to po prostu
; identycznosc (bierze typ 'a i zwraca to samo).

; Zatem jak zrobisz (a identity) to dostaniesz typ 'a i w ten sposob
; otrzymales prawa strone strzalki.
(define (foo_3 [a : (('a -> 'a) -> 'a)])
	(a identity))

; (define (id x) x)

; (define (foo_3 f)
	; (f (lambda (x) x)))


; Chcemy otrzymac:
; (('a -> 'b) ('a -> 'c) -> ('a -> ('b * 'c)))

; Ta gwiazdka to nie jest mnozenie tylko oznaczenie pary. Więc
; ('b * 'c) to jest para czegoś typu 'b i czegoś typu 'c.

; Po lewej stronie strzałki są dwie rzeczy, zatem nasza
; funkcja foo_4 przyjmuje dokladnie dwa argumenty (będące funkcjami o
; podanych typach).

; Chcemy dostać funkcję z typu 'a w parę ('b * 'c).

; Skoro mamy dostac funkcję, to juz wiemy, że używamy lambdy.

; Pytanie teraz: jaka to ma być fukcja. A no taka żeby przyjmowała typ 'a.
; No to niech lambda bedzie postaci:
; (lambda (a) ...)

; Lambda ma zwracac parę, zatem mamy:
; (lambda (a) (pair _ _))

; Na pierwszym miejscu pary ma byc cos typu 'b. Widzimy, że możemy
; użyć pierwszego parametru funkcji foo_4, bo jest typu:
; ('a -> 'b)

; Jeśli nakarmimy ten parametr czyms typu 'a, to dostaniemy nasze 'b.

; Ale skad wziac cos typu 'a? Zauważ, że tego typu użyłeś juz jako parametr
; lambdy (zmienna o nazwie a). Zatem robimy:

; (lambda (a) (pair (f a) _))

; i analogicznie dla drugiego miejsca w parze (tylko tym razem z funkcją g)

; (lambda (a) (pair (f a) (g a)))

; i mamy co chcielismy.
(define (foo_4 f g)
	(lambda (a) (pair (f a) (g a)))) ; pair == cons == values


; Chcemy uzyskac funkcje foo_5 o typie:
; (('a -> (Optionof ('a * 'b))) 'a -> (Listof 'b))

; Chcemy dostac listę elementow typu 'b.
; Mamy do dyspozycji jakas funkcje typu:

; ('a -> (Optionof ('a * 'b)))

; i jakis parametr typu 'a.

; Optionof oznacza, że jeśli para istnieje, to zostanie zwrocona, a jesli
; nie istnieje to zwroci się jakieś none, czyli odpowiednik racketowego
; nulla, którego w plaicie nie ma z jakiegos powodu.

; No dobra, skoro chcesz dostac liste elementow typu 'b, to znaczy, że
; musisz karmić funkcję g parametrem a, wtedy zostanie ci zwrocona para
; ('a * 'b), ale ty chcesz tylko 'b, wiec sobie je wyciągasz za pomocą
; snd (to takie wbudowane second). Analogicznie, jak zrobisz to samo ale
; z fst (czyli first) to dostaniesz znow element typu 'a.

; I w ten sposob mozesz sobie rekurencyjnie tworzyc listę elementow b.
; Czyli robisz cons z elementem typu 'b, który udalo ci sie wyciągnąc
; z pary z wywołaniem rekurencyjnym, gdzie nową wartością a jest
; pierwszy element pary.

; Teraz moglbys zapytac, dlaczego nie mozesz podawać ciagle tego samego
; a, które dostales jako parametr, przeciez wyszloby na to samo, bo
; operujemy na typach, a nie konkretnych wartosciach. No i wlasnie
; nieprawda. To jest istotne, bo jak bedziesz podawal ciagle to samo a, to
; twoja funkcja foo_5 nie domysli się, że pierwszy element pary też jest
; typu 'a. Plait sobie tam wciśnie jakis nowy typ, którego jeszcze nie
; użyłeś.

; W tej funkcji foo_5 przed każdą parą wystepuje jakies some-v. To jest tylko
; po to żeby wyciągać wartości z Optionof. Bo tak naprawde dostajesz
; typ (Optionof (a * b)), a nie (a * b).
(define (foo_5 g a)
	(if (none? (g a))
		empty ; ()'
		(cons (snd (some-v (g a)))
			  (foo_5 g (fst (some-v (g a)))))))   ; nie moge uzyc tego samego "a". trzeba pokazac procedurze, że pierwszy element pary tez ma byc typu 'a

; TODO: poprawic leta
(define (foo_5_v2 g a)
	(let ([result g a])
		 [(if (none? (g a))
		 	 empty ; ()'
			 (cons (snd (some-v (g a)))
				   (foo_5_v2 g (fst (some-v (g a))))))]))