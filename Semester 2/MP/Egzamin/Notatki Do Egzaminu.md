# Notatki Do Egzaminu

* [Notatki Do Egzaminu](#notatki-do-egzaminu)
	* [Wykład 1](#wykład-1)
		* [Cele wykładu](#cele-wykładu)
		* [Notatki](#notatki)
			* [O czym będzie przedmiot?](#o-czym-będzie-przedmiot)
			* [Czym jest Racket?](#czym-jest-racket)
			* [Dr Racket](#dr-racket)
			* [Podstawy Racketa](#podstawy-racketa)
			* [PODSTAWIENIOWY MODEL OBLICZEŃ](#podstawieniowy-model-obliczeń)
			* [Testy jednostkowe w Racketcie](#testy-jednostkowe-w-racketcie)
	* [Wykład 2](#wykład-2)
		* [Cele wykładu](#cele-wykładu-1)
		* [Notatki](#notatki-1)
	* [Wykład 3](#wykład-3)
		* [Cele wykładu](#cele-wykładu-2)
		* [Notatki](#notatki-2)
	* [Wykład 4](#wykład-4)
		* [Cele wykładu](#cele-wykładu-3)
		* [Notatki](#notatki-3)
	* [Wykład 5](#wykład-5)
		* [Cele wykładu](#cele-wykładu-4)
		* [Notatki](#notatki-4)
	* [Wykład 6](#wykład-6)
		* [Cele wykładu](#cele-wykładu-5)
		* [Notatki](#notatki-5)
			* [Indukcja](#indukcja)
				* [1. (append (map f xs) (map f ys))](#1-append-map-f-xs-map-f-ys)
				* [2. (length (append xs ys)) = (+ (length xs) (length ys))](#2-length-append-xs-ys---length-xs-length-ys)
				* [3. (filter p (map f xs)) = (map f (filter (lambda (x) (p (f x))) xs)](#3-filter-p-map-f-xs--map-f-filter-lambda-x-p-f-x-xs)
				* [4. (foldr + 0 ns) = (foldl + 0 ns), gdzie ns jest listą liczb całkowitych](#4-foldr--0-ns--foldl--0-ns-gdzie-ns-jest-listą-liczb-całkowitych)
				* [5. Zadanie z egzaminu z poprzednich lat](#5-zadanie-z-egzaminu-z-poprzednich-lat)
	* [Wykład 7](#wykład-7)
		* [Cele wykładu](#cele-wykładu-6)
		* [Notatki](#notatki-6)
			* [Kontrakty parametryczne](#kontrakty-parametryczne)
	* [Wykład 8](#wykład-8)
		* [Cele wykładu](#cele-wykładu-7)
		* [Notatki](#notatki-7)
	* [Wykład 9](#wykład-9)
		* [Cele wykładu](#cele-wykładu-8)
		* [Notatki](#notatki-8)
	* [Wykład 10](#wykład-10)
		* [Cele wykładu](#cele-wykładu-9)
		* [Notatki](#notatki-9)
	* [Wykład 11](#wykład-11)
		* [Cele wykładu](#cele-wykładu-10)
		* [Notatki](#notatki-10)
	* [Wykład 12](#wykład-12)
		* [Cele wykładu](#cele-wykładu-11)
		* [Notatki](#notatki-11)
	* [Wykład 13](#wykład-13)
		* [Cele wykładu](#cele-wykładu-12)
		* [Notatki](#notatki-12)
	* [Wykład 14](#wykład-14)
		* [Cele wykładu](#cele-wykładu-13)
		* [Notatki](#notatki-13)
	* [Wykład 15](#wykład-15)
		* [Cele wykładu](#cele-wykładu-14)
		* [Notatki](#notatki-14)
	* [Wstęp z MP Fajrankpacka](#wstęp-z-mp-fajrankpacka)
	* [Rozwiązania egzamin 2022](#rozwiązania-egzamin-2022)
		* [Zad 1](#zad-1)
		* [Zad 2](#zad-2)
		* [Zad 3](#zad-3)
		* [Zad 4](#zad-4)
		* [Zad 6](#zad-6)
		* [Zad 7](#zad-7)
			* [Dodatkowy przykłady na typy:](#dodatkowy-przykłady-na-typy)
		* [Zad 8](#zad-8)
		* [Zad 9 -\> DONE](#zad-9---done)
	* [Rozwiązania egzamin 2023](#rozwiązania-egzamin-2023)
		* [Zad 1](#zad-1-1)
		* [Zad 2](#zad-2-1)
		* [Zad 3](#zad-3-1)
		* [Zad 4](#zad-4-1)
			* [Zasada Indukcji](#zasada-indukcji)
			* [Dowód Praw Monadycznych](#dowód-praw-monadycznych)
		* [Zad 5](#zad-5)
		* [Zad 6](#zad-6-1)
		* [Zad 7](#zad-7-1)


## Wykład 1

### Cele wykładu

* Sprawy formalne:
	* Cele przedmiotu
	* Wykłady, repetytoria
	* Ćwiczenia i pracownie - zasady zaliczania, samodzielna praca
	* Racket i DrRacket
* Wprowadzenie do programowania w Rackecie:
	* Postać prefiksowa: wyrażenia arytmetyczne i logiczne, ciągi znaków, obrazki
	* Nazywanie wartości, definicje lokalne i globalne (forma define)
	* Procedury jako wartości, definicje procedur
	* Podstawieniowy model obliczeń
	* Podstawy testowania, rackunit
	* Podstawy projektowania programów, refactoring kodu


### Notatki

#### O czym będzie przedmiot?

* Przedmiot będzie o sposobach pisania/tworzenia programów, używania różnych języków programowania, tak żeby móc się sprawnie komunikoawć za ich pomocą z innymi programistami.
* Chcemy nauczyć się pisać programy w sposób czytelny i zrozumiały.
* Nauczymy się technik kształtowania programów.
* Chcemy umieć zapanować nad dużym problemem, dużym programem, żeby wygodnie i w łatwy sposób można było rozwijać program i go modyfikować. Testować programy, łączyć je w większe systemy.
* Na tym wykładzie skupimy się na technikach ze świata funkcyjnego

Podział przedmiotu na tercje ze względu na przerabiany materiał:
* 1 Tercja: podstawy, poznamy język programowania, podstawowe techniki, narzędzia abstrakcji
* 2 Tercja: bardziej zaawansowane techniki zarządzania złożonością programów
* 3 Tercja: w jaki sposób rozumie się same programy, traktowanie programów jak dane, możemy je interpretować, przetwarzać


#### Czym jest Racket?

Racket wywyodzi się od języka LISP, Scheme (?), język funkcyjny, język beztypowy (ale )
Nie stosuje się go raczej w przemyśle, jest to język przeznaczony do celów edukacyjnych, naukowych
Jest to prosty język funkcyjny
Idee o których będziemy mówić, powinny być bardzo dobrze widoczne
Idee będą się naturalnie przenosić na inne języki programowania


#### Dr Racket

Dr Racket -> środowisko/edytor do pracy z Racketem

Po lewej stronie edytor, po prawej linia poleceń, interpreter (mówi się też REPL TODO:)

```
 (ang. read-eval-print loop) – proste, interaktywne środowisko programowania. Pojęcie to jest najczęściej stosowane w odniesieniu do języka programowania Lisp, lecz może być też zastosowany do wiersza poleceń powłoki. Popularne są również środowiska dla innych języków takich jak Smalltalk, Perl, Python, Ruby, Haskell, Scheme, Clojure i wielu innych. Praktycznie każdy język uruchamiany jako interpreter posiada REPL.

Dzięki REPL użytkownik może wprowadzać polecenia, które zostaną wykonane a ich wynik wypisany na ekran.

TODO: jeszcze ten link: https://blog.gutek.pl/2009/05/24/repl/
```

TODO: napisać o możliwości dodawania extensions, vim keybinding, pokrycie testami, itd

#### Podstawy Racketa

> **Racket używa notacji prefiksowej**

Przykład notacji prefiksowej:

```Racket
(+ 2 2)

("OPERATOR" ARGUMENTY)
```

Zasady notacji prefiksowej:
* najpierw "operator" (a właściwie to procedura, TODO: tutaj pomyśleć, bo są formy specjalne)
* argumenty
* nawiasy mówią, że całe wyrażenie w środku chcemy policzyć w jakiś określony sposób -> chcemy zastosować argumenty do "operatora" (procedury)

Nawiasy w Racketcie:
* W Racketcie nie ma czegoś takiego jak priorytety "operatorów" (procedur) lub siła ich wiązania. Tym zajmujemy się sami, stawiając nawiasy w odpowiednich miejscach. Jest to dość intuicyjne, bardziej zagnieżdżone rzeczy wykonają się najpierw, zagnieżdżenia na tym samym poziomie wykonują się od lewej do prawej (TODO: sprawdzić czy to jest jeszcze jakoś błędami uwarunkowane, TODO: sprawdzić co z gorliwością/leniwością)

* Racket wspiera różne rodzaje nawiasów i ich nie rozróżnia (traktuje je tak samo). Ale trzeba je w poprawny sposób parować, domykać nawiasy, najpierw nawias otwierający danego typu, a potem zamykający tego samego typu. Używamy różnych nawiasów w celu poprawienia czytelności kodu + są pewne konwencje

> **Konwencja nazewnicza rzeczy w Racketcie -> używamy kilku słów i łączymy je myślnikami**

* **Number** - np 1, 2, 69
* **String (ciągi znaków)** - np “Nice”, “Aglet”, “piwo”
* **Boolean (wartości boolowskie)** - #t, #f
* **procedure** - +, -, /, *, string-append, <, =, >, string->number, string?
* **formy specjalne** - np and, or, let (pierwsze dwie te funkcje są leniwe, nie zapominajcie!)

```Racket
(+ 2 (/ 2 2)) -> operacje arytmetyczne, procedura przyjmuje liczby i zwraca liczby
(and #t #f) -> operacje logiczne, procedura przyjmuje wartości boolowskie i zwraca wartość boolowską
(or #f #t)

(string-append "abc" "def") -> do pierwszego argumenty dokleja drugi, procedura przyjmująca stringi jako argumenty i zwracająca stringa

(= 1 2)
(< 1 2) -> operatory porównania, przyjmuję argumenty jakiegoś typu (tego samego), zwracają wartość boolowską
(number->string 42) -> rzutowanie typów, przyjmuje dany typ, zwraca inny

(string->number "42") -> 42
(string->number "abc") -> #f -> nie zawsze podanie niewłaściwego argumentu kończy się zwróceniem błedu (komunikatem o błędzie), czasami funkcja zwraca coś nietypowego, nietypowy typ, np. fałsz

```

> **Znak zapytania na końcu procedury oznacza, że dana procedura jest predykatem (taka konwencja). Predykat to taka procedura, która zawsze zwraca wartość boolowską (ale może przyjmować różną ilość argumentów, różnych typów, typy nie muszą być identyczne)**

Popularne predykaty: TODO:
```Racket

Troszke predykatów
* (procedure? +)
* (boolean? #f)
* (number? 1)
* (real? 1)
* (integer? 1)
* (positive? 1)
* (negative? -1)
* (even? 2) ważne, nie róbcie tego co ja i piszcie (modulo cos 2)
* (string? "Apple")
* (symbol? 'apple)
* (pair? (cons 1 2)) = (pair? (list 1 2)) = (pair? '(1 2)) = (pair? (cons 2 '()))
* (null? lista)
* (list? '(1 2)) = (list? (cons 1 (cons 2 '())))
* (mpair? para mutowalna)
Liczby
* +inf.0/-inf.0 : +/- nieskończoność na liczbach całkowitych
* +inf.f/-inf.f : +/- nieskończoność na floatach

predykaty do sprawdzenia czy typy się zgadzają
(string? "abc")
(number? 42)

(string=? "abc" "abc") -> sprawdzenie czy równe wartości
```

UWAGA! Domyślnie wbudowane procedury takie jak string-append, +, itd. mają kontrakty popisane, danie złych argumentów narusza kontrakt (contract violation)

Mamy jeszcze arytmetykę obrazów -> można wkleić do REPLa obrazek, robić na nim działania, może być argumentem funkcji itd
Żeby móc korzystać z obrazków, to musimy dołączyć moduł/bibliotekę (TODO: sprawdzić jak to się nazywa) -> (require 2htdp/image)

```Racket
(image-width OBRAZEK)
(image-height OBRAZEK)
(circle 10 "solid" "red")
(rectangle 30 20 "outline" "blue")
(overlay (rectangle 50 50 "outline" "blue") OBRAZEK) -> łączenie obrazków ze sobą
(place-image (circle 5 "solid" "green") 50 80 (empty-scene 100 100))
```

^ gdzie obrazek, to rakieta


```Racket
(define foo 42) -> definiowanie obiektu, którego wartość to jakaś stała
(define bar (* foo 2)) -> definiowanie obiektu, którego wartość to wynik jakiegoś wyrażenia
```

UWAGA! Nie można odwoływać się do rzeczy, które jeszcze nie są zdefiniowane (np. są zdefiniowane poniżej w kodzie lub w ogóle). Czyli komputer widzi tylko to, co zostało zdefiniowane powyżej TODO: lepiej to napisać

Definicja lokalna, wewnątrz danego wyrażenia -> let (tłumaczymy sobie jako niech)
	TODO: formy, formy specjalne
```Racket
(let ([x 5]) (+ x 2)) -> 7
(let ([x 5]) (+ x x)) -> 10
(let ([x 5]) (+ x (let ([x 3]) x))) -> 8
(let ([x 5]) (+ (let ([x 3]) x) x)) -> 8
```

UWAGA! Protip, jak najeżdżamy myszką na elementy w Dr Racketcie, to pokazuje nam miejsce definicji, miejsce związania
UWAGA! Używamy wcięć, zazwyczaj jest to przerwa 2 spacji "  " lub też wyrównuje się do danego nawiasu, żeby jeden pod drugim nawias był (taka konwencja)

```Racket
(define baz
  (let ([x 5])
    (+ (let ([x 3]) x)
       x)))
```

^ TODO: pojęcie wiązania leksykalnego, jest to analogiczne do wiązania w logice za pomocą kwantyfikatorów

W Racketcie procedury i wartości to bardzo podobne rzeczy (w przeciwieństwie do więszkości języków programowania)

```Racket
(define + *) -> bezpowrotnie tracimy +
(define add +) -> danie nowej nazwy czemuś co się wcześniej nazywało +, jak coś zdefiniujemy, to jest zdefiniowane, nie można zmieniać 2 razy czegoś definiować, ale można np przysłonić coś
(add 2 3) -> 5
```

Możemy lokalnie sobie procedury definiować
```Racket
(define baz
  (+ 2 (let ([+ *]) (+ 2 3))))
```

Można wiele rzeczy deklarować za pomocą leta
```Racket
(let ([x 2] [y 3]) (+ x y)) -> 5
(let ([x 2] [y x]) (+ x y)) -> nie możemy, bo jednocześnie deklaruje (x przy deklaracji y odwołuje się do zewnętrznego środowiska)
```

Rzeczy, które występują zaraz po otwierającym nawiasie, a nie są procedurami -> formy specjalne
Są traktowane przez język w specjalny sposób -> nazwalibyśmy je słowami kluczowymi w typowych językach programowania
Tutaj takie wyrażenia nazywamy formami specjalnymi. Formy specjalne mogą zachowywać się na innych prawach niż normalne wyrażenia (mogą mieć swoje ciekawe cechy)

```
define
let
require
and i or -> zachowuje się jak procedura, ale jest formą specjalną!
if
cond
```

Przy and i or w pewnych sytuacjach od razu wiemy jaki będzie wynik i odpowiednia wartość jest zwracana. Czasami kolejne wyrażenia mogą być niepoprawnymi argumentami (contract violation), ale nie są obliczane, więc kontrakt nie został naruszony (bo tak kontrakty działają!), podobnie to wygląda jeśli mamy ifa i wchodzimy do WYNIK_IF, a w WYNIK_ELSE mielibyśmy normalnie contract violation (np. dzielenie przez 0)

```Racket
(if (warunek) WYNIK_IF WYNIK_ELSE) -> warunek, w Racketcie wszystko jest prawdą poza fałszem
```

mamy taki fajny bajer jak let, weźmy coś prostego

```Racket
(let ([x 5])
    (+ (let ([x 3]) x)
        x))
```

Czytamy to w następujący sposób:
Niech nasz x będzie równy 5, oraz niech nasz wewnętrzny x będzie równy 3, czyli mamy (+ 3 5) a to jest równe 8

niżej zamieszczę bajer zrobiony przez materzoka, imo jest to napisane spoko, polecam przeczytać

#### PODSTAWIENIOWY MODEL OBLICZEŃ

```
(+ 2 (* 2 2)) -> (+ 2 4) -> 6
```
```
(addition 2 (* 2 2)) -> (addition 2 4) -> (+ 2 4) -> 6
```

jeśli obliczane wyrażenie to:
* zmienna -> pobierz wartość zmiennej ze środowiska
* wyrażenie pierwotne (np. stała liczbowa, boolowska, ciąg znaków, obrazek) -> zwróć jego wartość
* kombinacja (ciąg wyrażeń w nawiasie) ->
	* obliczyć wartość wszystkich składowych kombinacji
	* patrzymy na wartość pierwszego wyrażenia kombinacji (operatora):
	* jeśli jest to procedura wbudowana (np. +, *) -> oblicz wartość
	* jeśli to procedura zdefiniowana przez programistę ->
		* podstaw wartości argumentów w ciele procedury
		* oblicz ciało procedury
* forma specjalna -> stosujemy reguły obliczeń tej formy specjalnej

Racket (opisane powyżej): gorliwa kolejność obliczeń

Gorliwa -> bo obliczamy od razu wartości poszczególnych wyrażeń

kolejność leniwa (nie występuje naturalnie w pan racket!):
```
(addition 2 (* 2 2)) -> (+ 2 (* 2 2)) -> (+ 2 4) -> 6
```

formy specjalne:
```
(if (= 1 2) (/ 2 0) (* 2 3)) -> (if #f (/ 2 0) (* 2 3)) -> (* 2 3) -> 6
```
```
(let ([x (+ 2 2)]) (* x x)) -> (let ([x 4]) (* x x)) -> (* 4 4) -> 16
```

UWAGA! W Racketcie możemy sobie odpalić Debug, a potem stepować, dzięki temu możemy zobaczyć czy kolejność jest gorliwa czy leniwa, co jest po kolei obliczane, itd

#### Testy jednostkowe w Racketcie

```Raket
(require rackunit)
check-equal? -> czy 2 rzeczy są takie same
check-true
check-false
```
```
(require rackunit)

(define (+two x)
  (+ x 2))

(check-equal? (+two 2) 4)
(check-true (number? (+two 0)))
```

TODO: umieścić coś o rysowaniu rakiety!!!

Materiały do wykładu:
```Racket
(define (+two x)
  (+ x 2))

(define (zero) 0)

(define (returns-zero)
  zero)

(define (foo)
  (define (bar x)
    (* 2 x))
  bar)

(define (baz) baz)

(define (infinite) (infinite))

(define (addition x y)
  (+ x y))

(define (return-first x y) x)

; (+ 2 (* 2 2)) -> (+ 2 4) -> 6

; gorliwa kolejność
; (addition 2 (* 2 2))
; -> (addition 2 4)
; -> (+ 2 4)
; -> 6

; (return-first (+ 1 0) (/ 1 0))
; -> (return-first 1 **wyjątek**)
; -> **wyjątek**

; leniwa kolejność
; (addition 2 (* 2 2))
; -> (+ 2 (* 2 2))
; -> (+ 2 4)
; -> 6

; (return-first (+ 1 0) (/ 1 0))
; -> (+ 1 0)
; -> 1
```


## Wykład 2

### Cele wykładu

* Leksykalne wiązanie zmiennych
	* Wystąpienia wolne i związane
	* Miejsca wiązania zmiennych
	* Formy specjalne let, let*
* Rekursja i iteracja
	* Rekurencyjna i iteracyjna implementacja silni
	* Rekursja w modelu podstawieniowym
	* Wywołania ogonowe, stos wywołań
* Abstrakcja danych
	* Pary w Rackecie
	* Konstruktory, selektory i predykaty
	* Konwencjonalna abstrakcja danych
	* Struktury w Rackecie
* Listy
	* Wartość null
	* Listy jako struktury rekurencyjne
	* Procedury operujące na listach: list-ref, append, reverse
	* Rekursja strukturalna
	* Sortowanie przez wstawianie

### Notatki

Rekurencja ogonowa TODO:

```
(silnia 0)
-> (if (= 0 0) 1 (* 0 (silnia (- 0 1))))
-> (if #t 1 (* 0 (silnia (- 0 1))))
-> 1
```

```
(silnia 1)
-> (if (= 1 0) 1 (* 1 (silnia (- 1 1))))
-> (if #f 1 (* 1 (silnia (- 1 1))))
-> (* 1 (silnia (- 1 1)))
-> (* 1 (silnia 0))
-> ... (kroki dla (silnia 0))
-> (* 1 1)
-> 1
```

Jeśli nie mamy kontraktów, to może dojść do różnych nieprzewidzianych sytuacji. Np. jeśli argumentem silni nie będzie liczba naturalna, to nigdy nie dojdziemy do 0 (co jest naszym niezmiennikiem, że w skończonej liczbie kroków możemy do 0 dojść), czego skutkiem jest nieskończona rekurencja i przekroczenie limitu pamięci

Jak pisać iterację. Konwencja z it i acc

```
(silnia-iter 5)
-> (it 5 1)
-> (if (= 5 0) 1 (it (- 5 1) (* 1 5))
-> (it 4 5)
-> (it 3 20)
-> (it 2 60)
-> (it 1 120)
-> (it 0 120)
-> 120
```

Iterację uzyskujemy poprzez rekurencję ogonową -> ogonowe wywołanie procedury it

**Iteracja i rekurencja**
* Funkcja silni
* Przebieg obliczania obu wersji w modelu podstawieniowym, stos

Para może zawierać dowolne typy

```Racket
(cons 1 2) -> '(1 . 2)
(cons (cons 1 "foo") 42) -> '((1 . "foo") . 42)
(car para)
(cdr para)
(cdaadr para) -> można skracać zapis dając środkowe literki z car i cdr, czyli a i d odpowiednio
```

Są to dość dziwne nazwy, nic nie mówiące. Maszyna IBM 704, pierwsza implementacja Lispu
Przypadkowy, historyczny powód
car -> Contents of Address part of Register
cdr -> Contents of Decrement part of Register

Konstruktor par: (cons a b)
Selektory:
* car
* cdr
Predykat: (pair? p)

Konwencjonalna abstrakcja danych

Jest pokusa, żeby korzystać z jakiś rzeczy, które są dostępne z języka, bo czasami szybciej. Ale specjalnie nakładamy abstrakcję, żeby się nią posługiwać, tworzymy nowy abstrakcyjny typ danych, który wewnątrz może bazować na rzeczach dostepnych w języku -> TODO: sprawdzić czy głupot nie piszę. Możemy to tak pisać jako definicje kolejnych procedur (ustalanie takich jakby geterów i seterów)

Konwencjonalną abstrakcję danych możemy wymusić za pomocą define-struct -> automatycznie tworzą się konstruktor, selektory, predykat
Konstruktor -> (NAZWA_STRUCTA WARTOŚCI_PÓL)
Selektory -> NAZWA_STRUCTA-NAZWA_POLA
Predykat -> NAZWA_STRUCTA?
UWAGA! Wprowadza też nowy typ danych NAZWA_STRUCTA, który jest odróżnialny od pozostałych typów danych (np. jak zrobimy sobie swoją parę, to to nie będzie pair) -> do weryfikacji tego możemy użyć np. predykatu NAZWA_STRUCTA?

(define-struct NAZWA_STRUCTA (NAZWY_PÓL))
* pierwszy argument define-struct: nazwa nowego typu danych (i konstruktora)
* drugi argument define-struct: nazwy pól definiowanej struktury

TODO: define-struct -> forma specjalna

**Pary**
* Konstruktor cons
* Selektory car i cdr, i ich formy złożone
* Pochodzenie nazw “Contents of Address part of Register”, “… Decrement …” - IBM 704, pierwsza implementacja Lispu
* Predykat pair?

**Abstrakcja danych**
* Konstruktory, selektory, predykaty
* Budowanie danych abstrakcyjnych: pozycje (pozycja rakiety)
* Abstrakcja danych, abstrakcja konwencjonalna

**Struktury**
* Forma define-struct na przykładzie:
* (define-struct pos (x y) #:transparent)
* Konstruktory, selektory, predykaty w strukturach
* Pozycje przy użyciu struktur

Budowa listy:
* 0 elementów: null
* więcej niż 0 elementów: (cons pierwszy_element lista_pozostałych_elementów)

Zamiast pisać (cons 1_element (cons 2_element (cons 3_element (cons ... (cons n_element null))))), możemy użyć procedury list
(list 1_element 2_element 3_element ... n_element)

Możemy używać procedur car, cdr na listach i skrótowych form caadadr, itp.
Możemy też używać procedur first, second, third, itd. zwracające tak jak intuicja podpowiada pierwszy, drugi, trzeci, itd. element listy

UWAGA! (equal? struktura_1 struktura_2) -> zwróci fałsz, bo nie mamy dostępu do pól struktur. Musimy dodać :transparent

**Listy**
* Wartość null, predykat null?
* Budowa listy, procedura list, predykat list?
* Selektory first, second … last
* Predykat equal?
* Procedury list-ref, append, length, reverse
* Pojęcie rekursji strukturalnej
* Większy przykład dla list
* Sortowanie przez wstawianie

Przydatne procedury na listach:
* (list-ref LISTA NUMER_ELEMENTU) -> UWAGA! Numerujemy standardowo od 0
* (append LISTA_1 LISTA_2) -> dodaje elementy -> TODO: uwaga to było trickowe, ogarnąć i ładnie opisać co się tutaj dzieje
* (length LISTA)
* (reverse LISTA)

Konwencja listy nazywamy literkami z końca alfabetu dodając 's' -> xs, ys, zs, itp.
Chodzi o to, że lista składa się z wielu x'ów, y'ów, z'ów, itp.
Łatwo możemy odróżnić, że coś jest listą

```Racket
(define (my-list-ref xs n)
  (if (= n 0)
      (car xs)
	  (my-list-ref (cdr xs) (- n 1))))
```

TODO: przykładowe wywołanie my-list-ref

```Racket
(define (my-append xs ys)
  (if (null? xs)
      ys
	  ((cons (car xs) (my-append (cdr xs) ys)))))
```

TODO: przykładowe wywołanie my-append

```Racket
(define (my-reverse xs)
  (define (it xs acc)
    (if (null? xs)
	    acc
		(it (cdr xs) (cons (car xs) acc))))
  (it xs null))
```


2:23:33 TODO: Wyklad

* jest define z nazwą procedury
* jest if ze sprawdzeniem czy lista jest pusta (predykat null?) - mamy zatem 2 możliwe przypadki
	* jeśli lista jest pusta, to zwracamy wynik
	* jeśli nie jest pusta, to robimy wywołanie rekurencyjne (UWAGA! Tylko w tym miejscu mamy jedno wywołanie rekurencyjne)
		* UWAGA! nową listą w wywołaniu rekurencyjnym jako argument jest ogon listy poprzedniej, czyli nowy_xs = (cdr xs)
		* UWAGA! mamy gwarancję, że przejdziemy po kolei po każdym elemencie listy w takiej kolejności w jakiej są na liście (TODO: to jest chyba niezmiennik)

^ taki wzorzec nazywa się rekursją (rekurencją) strukturalną

Rekursja (rekurencja) strukturalna dla list:
* ; dwa przypadki:
; - dla listy pustej (null)
; - i niepustej (cons)
; wywołanie rekurencyjne w przypadku dla listy niepustej
; wykonywane na ogonie (reszcie) listy

TODO: dowodzi się tego za pomocą indukcji strukturalnej

Sortowanie list:

```Racket
(sort lista <) -> musimy jeszcze dodać operator porównania
```

Sortowanie przez wstawianie - Insert Sort
```Racket
(define (insert x xs)
  (if (null? xs)
      (list x)
      (if (< x (car xs))
          (cons x xs)
          (cons (car xs) (insert x (cdr xs))))))

(define (insertsort xs)
  (define (it xs acc)
    (if (null? xs)
        acc
        (it (cdr xs) (insert (car xs) acc))))

  (it xs null))
```


> trzeba umieć zrobić proste rzeczy szybko na egzaminie


Datatypes

```Racket
(equal? wyrażenie) : głęboka równość

(eq? 'yes 'yes)
#t
```

```Racket
(equal? (make-string 3 #\z) (make-string 3 #\z))
#t
(eq? wyrażenie) : sprawdza czy to ten sam obiekt (miejsce w pamięci)

(eq? 'yes 'yes)
#t

(eq? (make-string 3 #\z) (make-string 3 #\z))
#f
```



(let [to co podkładasz] wyrażenie, w którym chcesz by to było podmienione) : ewaluuje nowe wartości od lewej do prawej, potem dla każdej z nich tworzy lokację, a dopiero na koniec wkłada wartości w lokacje. ZMIENNE MUSZĄ SIĘ RÓŻNIĆ

```Racket
(let ([x 5])
    (let ([x 2]
          [y x])
      (list y x)))
'(5 2)
```

(let* [to co podkładasz] wyrażenie) : dla każdej wartości od razu tworzy lokację i wkłada ją w nią. Przez to kiedy natrafimy drugi raz na tę samą zmienną w podawanych nowych wartościach, będzie już ona związana i wrzucimy nową wartość do istniejącej już lokacji, zamiast tworzyć nową lokację. ZMIENNE NIE MUSZĄ SIĘ RÓŻNIĆ
```Racket
    (let* ([x 1]
         [y (+ x 1)])
    (list y x))

'(2 1)
; ngl dali słaby przykład
```

(letrec [to co podkładasz] wyrażenie) : najpierw tworzone są lokacje, potem są wkładane wartości i wiązane w wyrażeniu, a na koniec zmienne są od razu inicjalizowane. ZMIENNE MUSZĄ SIĘ RÓŻNIĆ

```racket
(let ([a 1] [b 2] [c 3]) body...)

((lambda (a b c) body...) 1 2 3)
```

```racket
(let* ([a 1] [b 2] [c 3]) body...)

(let ([a 1])
  (let ([b 2])
    (let ([c 3])
      body...)))
```

```racket
(letrec ([a 1] [b 2] [c 3]) body...)

((lambda ()
   (define a nil)
   (define b nil)
   (define c nil)
   (set! a 1)
   (set! b 2)
   (set! c 3)
   body...))
```

(begin (wyrazenie)(n kolejnych)) : sposób by upychać ile wyrażeń chcesz zamiast chcieć umrzeć


```Racket
(define (split xs)
    (define (pom lista1 lista2 xs)
        (cond
            [(null? xs) (cons lista1 lista2)]
            [(= (modulo (length xs) 2) 0) (pom (append (list (car xs)) lista1) lista2 (cdr xs))]
            [(pom lista1 (append (list (car xs)) lista2) (cdr xs))]))
    (pom '() '() xs))

(split (list 8 2 4 7 4 2 1))

(define (merge xs ys )
  (define (it xs ys acc)
    (if (and (null? xs) (null? ys))
        acc
    (cond
      [(null? xs) (it xs (cdr ys) (cons (car ys) acc))]
      [(null? ys) (it (cdr xs) ys (cons (car xs) acc))]
      [(< (car xs) (car ys))
       (it (cdr xs) ys (cons (car xs) acc ))]
      [else
       (it xs (cdr ys) (cons (car ys) acc ))])))
  (reverse (it xs ys '())))

( merge ( list 1 4 4 8) ( list 2 2 7) )

(define (merge-sort xs)
  (cond [(or (null? xs)  (null? (cdr xs))) xs]
        [else (merge
               (merge-sort (car (split xs)))
               (merge-sort (cdr (split xs))))]))
( merge-sort ( list 8 2 4 7 4 2 1) )
```

> nauczcie sie dobrze kiedy zamieniać rzeczy w listy i używać appenda, a kiedy robić conse


## Wykład 3

### Cele wykładu

* Diagramy pudełkowe
	* Diagramy pudełkowe dla list
	* Współdzielenie i kopiowanie
	* Pojęcie nieużytku
	* Predykaty eq? i equal?
* Cytowanie w Rackecie
	* Symbole
	* Cytowanie wyrażeń listowych
	* Notacja z kropką
	* Kwazicytowanie
* Funkcje wyższego rzędu
	* Funkcje jako narzędzie abstrakcji
	* Funkcje map i filter
	* Funkcje foldr i foldl
	* Wyrażenia lambda

### Notatki

(lambda (argumenty) (wzór funkcji)) : funcja bez nazwy

listy (początek w zeszłym tygodniu)

dla przykładu mamy taką funkcję:

```Racket
(define (append xs ys)
   (if(null? xs)
      ys
      (cons (car xs)(append (cdr xs) ys))))
i chcemy zrobić:
(append (list 1 2) (list 3 4))
```

robi się takie magiczne gówno. W skrócie ostatnia linijka(cons (car xs)(append (cdr xs) ys)))) tworzy nam nową listę, aka nowe komórki, które współdzielą tę samą wartość, do momentu przejścia przez całe xs, po tym procesie (if(null? xs) ys [...] przypinamy nienaruszone ys.
łatwo zauważyć, że koszt pamięciowy i czasowy jest liniowy względem pierwszej listy.

samo danie cons nie spowoduje zappendowania listy.

```Racket
(define (append xs ys)
   (if(null? xs)
      ys
      (cons xs ys)))
```

zrobi nam się to:

w skrócie return będzie consem, zawierającym w sobie dwie listy, xs i ys

zastanowimy się teraz, czy kolejność appendowania ma znaczenie, skoro wynik będzie taki sam. oturz ma.


jak pamiętamy, najpierw obliczamy komórki a dopiero później z nich wynik, więc tworzymy komórkę która kopiuje element 2, a następnie łączy się z komórką z 3. Następnie wywołujemy komórkę res, która łączy się do tego co wykonaliśmy wcześniej.


tutaj jest odrobinkę inaczej, na początku tworzymy komórkę, łączącą 1, 2. Następnie wywołujemy komórkę która łączy 1, potem kolejną komórkę która łączy 2 a na końcu przepinamy wskaźnik na komórkę 3. Na końcu zostaje nam nieużytek którym zajmie się garbage collector.
na pierwszy rzut karłem ciężko to zrozumieć, ale wystarczy sobie przypomnieć działanie appenda, który polega na przejściu przez pierwszą listę do końca (wraz z tworzeniem nowych komórek) i połączeniu się z drugą, przez co całość nabiera sensu.

mamy różne predykaty

* = równość dla liczb
* equal? równość strukturalna (sprawdza bardziej wynik)
* eq? równość oparta na tożsamości, w naszym przypadku sprawdza każdy cons i zauważa nasze nieużytki


Symbole

mamy ciągi znaków “abc”, ale mamy też symbole, zawsze zaczynamy od apostrofu

```Racket
> 'abc
'abc
> (symbol? 'abc)
#t
> (string->symbol "abc")
'abc
> (symbol->string 'abc)
"abc"
```

jak łatwo zauważyć, te dwa typy danych są wyjątkowo do siebie podobne

```Racket
> (make-string 3 #\a)
"aaa"
> (eq? (make-string 3 #\a) "aaa")
#f
> (eq? (string->symbol "aaa") 'aaa)
#t
```

różnica między symbolami a stringami (na tym poziomie wiedzy) polega na tym że jeżeli są w nazewnictwie takie samo, to na pewno całościowo dla eq? jest również takie samo!
druga cecha przydatna jest taka, że dobrze wykorzystuje się ją w cytowaniach.

magia tego ' jest taka, że później mówi o tym wszystkim jako o cytacie, przez co:

```Racket
> '(cons 1 2)
'(cons 1 2)
;a nie (1 . 2)
> (length '(+ 1 2))
3
> (equal? (list '+ '1 '2) '(+ 1 2))
#t
> (number? '1)
#t
> (eq? '1 1)
#t
> (eq? '#t #t)
#t
> (eq? '"foo" "foo")
#t
> (eq? '+ +)
#f ;!!!!!
> (equal? (list '+ '1 '2) (list '+ 1 2))
#t
> (equal? (list '+ '1 '2) (list + 1 2))
#f
```

kropka przy wypisywaniu consa polega na pokazaniu tego, że ogon nie jest zakończony nullem

```Racket
> '(1 . ())
'(1)
> (car '(1 2 3 . 4))
1
>(cadr '(1 2 3 . 4))
2
>(caddr '(1 2 3 . 4))
3
>(cdddr '(1 2 3 . 4))
4
```

mamy też takie coś jak kwazicytowanie, wykonuje to co nie cytuje

```Racket
>`(1 2 ,(+ 1 2))
'(1 2 3)
```

bierzemy sortowanie z zeszłego tygodnia, chcemy tak zrobić, aby ten kod był uniwersalny dla typu wejścia

```Racket
; sortowanie przez wstawianie

(define (insert n xs)
  (if (null? xs)
      (list n)
      (if (< n (car xs))
          (cons n xs)
          (cons (car xs) (insert n (cdr xs))))))

(define (insertion-sort xs)
  (define (it xs ys)
    (if (null? xs)
        ys
        (it (cdr xs) (insert (car xs) ys))))
  (it xs null))
```

```Racket
; sortowanie dla dowolnego operatora

(define (insert-generic lt n xs)
  (if (null? xs)
      (list n)
      (if (lt n (car xs))
          (cons n xs)
          (cons (car xs) (insert-generic lt n (cdr xs))))))

(define (insertion-sort-generic lt xs)
  (define (it xs ys)
    (if (null? xs)
        ys
        (it (cdr xs) (insert-generic lt (car xs) ys))))
  (it xs null))
```

mamy też coś takiego w racketie jak map, który tak na prawdę jest wykonaniem jakiejś funkcji na każdym elemencie

```Racket
(define (my-map f xs)
  (if (null? xs)
      null
      (cons (f (car xs))
            (my-map f (cdr xs)))))
```

jest też filter, który polega na odfiltrowaniu elementów w liście

```Racket
(define (my-filter p? xs)
  (if (null? xs)
      null
      (if (p? (car xs))
          (cons (car xs) (my-filter p? (cdr xs)))
          (my-filter p? (cdr xs)))))
```

znając te 3 funckje, postaramy wyciągnąć jeszcze więcej części wspólnych

```Racket
; wyprowadzenie foldr

(define (my-append xs ys)
  (if (null? xs)
      ys
      (cons (car xs) (my-append (cdr xs) ys))))

(define (my-map f xs)
  (if (null? xs)
      null
      (cons (f (car xs))
            (my-map f (cdr xs)))))

(define (my-filter p? xs)
  (if (null? xs)
      null
      (if (p? (car xs))
          (cons (car xs) (my-filter p? (cdr xs)))
          (my-filter p? (cdr xs)))))

(define (my-foldr f x xs)
  (if (null? xs)
      x
      (f (car xs) (my-foldr f x (cdr xs)))))

(define (new-append xs ys)
  (my-foldr cons ys xs))

(define (new-map f xs)
  (define (g y ys)
    (cons (f y) ys))
  (my-foldr g null xs))

(define (new-filter p? xs)
  (define (g y ys)
    (if (p? y)
        (cons y ys)
        ys))
  (my-foldr g null xs))
```

chcemy napisać jeszcze zwięźlej, pomoże nam w tym lambda, jest to procedura która bierze nam zmienną, i pokazuje co z nią robi, aka procedura nienazwana

```Racket
> ((lambda (x) (+x 1)) 1)
2
```

i znowu “upraszczamy” (japierdoleeeeeeeeeeeeeee):

```Racket
; lambdy

(define (new-map2 f xs)
  (my-foldr (lambda (y ys) (cons (f y) ys))
            null xs))

(define (new-filter2 p? xs)
  (my-foldr (lambda (y ys)
              (if (p? y) (cons y ys) ys))
            null xs))
```

jednak nie wszędzie foldr jest skuteczny, na szczęście mamy foldl

```Racket
; wyprowadzenie foldl

(define (my-reverse xs)
  (define (it xs acc)
    (if (null? xs)
        acc
        (it (cdr xs) (cons (car xs) acc))))
  (it xs null))

(define (my-length xs)
  (define (it xs acc)
    (if (null? xs)
        acc
        (it (cdr xs) (+ acc 1))))
  (it xs 0))

(define (my-sum xs)
  (define (it xs acc)
    (if (null? xs)
        acc
        (it (cdr xs) (+ acc (car xs)))))
  (it xs 0))

(define (my-foldl f x xs)
  (define (it xs acc)
    (if (null? xs)
        acc
        (it (cdr xs) (f (car xs) acc))))
  (it xs x))

(define (my-reverse2 xs)
  (my-foldl cons null xs))

(define (my-length2 xs)
  (my-foldl (lambda (y acc) (+ acc 1)) 0 xs))

(define (my-sum2 xs)
  (my-foldl + 0 xs))
```

Najważniejsza rzecz dotycząca foldl, foldr - sposób działania:
`(foldr f x (cons A (cons B (cons C (cons D null)))))`
Czytamy jako:
`(f A (f B (f C (f D x))))`

`(foldl f x (cons A (cons B (cons C (cons D null)))))`
Czytamy jako:
`(f D (f C (f B (f A x))))`


## Wykład 4

### Cele wykładu

* Drzewiaste struktury danych
	* Konstrukcja drzew przy użyciu struktur w języku Racket
	* Drzewa przeszukiwań binarnych
* Abstrakcja danych w większych programach. Kodowanie Huffmana
	* Problem kompresji tekstu. Drzewa kodowe Huffmana
	* Programowanie względem interfejsów. Proste struktury danych jako prototypy.
	* Reprezentacja drzew kodowych i słowników. Konstrukcja drzew kodowych przy użyciu kolejek priorytetowych
	* Kodowanie i dekodowanie ciągów symboli


### Notatki

Wcześniej używaliśmy `define-struct` do definiowania rzeczy o stałym rozmiarze, dodawanie abstrakcji, interfejsu
Teraz będziemy budować struktury danych, które mają teoretycznie nieograniczony rozmiar

TODO: eq? jest szybki, ale nie sprawdza struktur, sprawdza tylko tożsamość -> czy ten sam obiekt, w tym samym miejscu w pamięci
equal? -> czy takie same obiekty pod względem struktury

UWAGA! Jeśli nie damy transparent, to equal? będzie zwracał fałsz -> bo nie ma dostępu do pól struktury -> TODO: sprawdzić jak to jest z eq?

TODO: w append elementy pierwszej listy były kopiowane, a elementy drugiej listy były współdzielone
Listy -> mają graficznie 2 pola (wartość i wskaźnik na następny element)
Drzewa -> mają graficznie 3 pola (wartość i 2 wskaźniki na dzieci)

TODO: narysowć przykład współdzielenia w drzewach

Protip: jak sprawdzać czy coś jest współdzielone? -> eq? struktura_1 struktura_2

TODO: def nieużytku -> DaBi mówił, że to jest względne, zależy od kontekstu

TODO: Dodać UWAGA! not to jest procedura!!!

Drzewo binarne
* puste drzewo
* niepuste drzewo

bst
będziemy pisali drzewo binarne, wykorzystamy do tego struktury

```Racket
#lang racket

(require rackunit)

(define-struct leaf () #:transparent)
(define-struct node (l elem r) #:transparent)

; predykat sprawdzający czy struktura danych jest prawidłowym drzewem binarnym
(define (tree? x)
  (cond [(leaf? x) #t]
        [(node? x) (and (tree? (node-l x)) (tree? (node-r x)))]
        [else #f]))

(define example-tree (node (node (leaf) 1 (leaf))
                           2
                           (node (node (leaf) 3 (leaf))
                                 4
                                 (node (leaf) 5 (leaf)))))

(check-true (tree? example-tree))

(define (find-bst x t)
  (cond [(leaf? t) #f]
        [(node? t)
         (cond [(= x (node-elem t)) #t]
               [(< x (node-elem t))
                (find-bst x (node-l t))]
               [else
                (find-bst x (node-r t))])]))

(check-true (find-bst 1 example-tree))
(check-false (find-bst 100 example-tree))

(define (insert-bst x t)
  (cond [(leaf? t) (node (leaf) x (leaf))]
        [(node? t)
         (cond [(= x (node-elem t)) t]
               [(< x (node-elem t))
                (node
                 (insert-bst x (node-l t))
                 (node-elem t)
                 (node-r t))]
               [else
                (node
                 (node-l t)
                 (node-elem t)
                 (insert-bst x (node-r t)))])]))
```

definiujemy liścia i node, liść jest taką naszą zaślepką która informuje, że nie ma już z tej strony nic niżej. #:transparent powoduje, że equal? nam normalnie działa
funkcja (tree? x) jest przyjemna, najpierw sprawdza jest w liściu, jeżeli nie to schodzi na lewo i na prawo sprawdzając czy tam jest liściem, jeżeli coś się dzieje niepożądanego to zwraca nam #f, co wyłapuje nam and
funkcja (find-bst x t) wykorzystuje właściwości drzewa bst i szuka daną wartość
funkcja (insert-bst x t) rozbijamy na podprzypadki:

* jak jest leafem to tworzymy node i zwracamy
* jeżeli znajdziemy duplikat to zwracamy drzewo i nic nie robimy
* jeżeli x jest mniejszy od lewego elementu to tworzymy node, gdzie z lewej strony wywołujemy funkcję a resztę zostawiamy nienaruszoną
* odpowiednio w prawą stronę

działa, ale teraz zastanawia nas, jak z punktu pamięciowego działa sam insert, czy kopiuje, czy co?
możemy zauważyć, że funkcja idzie tylko wzdłuż ścieżki, resztę elementów jest po prostu “łączona” wskaźnikami do starego drzewa, picrel

dzięki temu też eq normalnie działa na współdzielonych elementach

kodowanie huffomana

```Racket
; słowniki
; reprezentacja: listy postaci:
; '((k1 . v1) (k2 . v2) ... (kn . vn))

(define-struct dict (list))

(define empty-dict (dict '()))

(define (dict-remove k d)
  (dict (filter (lambda (p) (not (eq? k (car p))))
                (dict-list d))))

(define (dict-insert k v d)
  (dict (cons (cons k v) (dict-list (dict-remove k d)))))

; (dict-find k d) -> (cons k v) (jeśli para (k, v) jest w słowniku)
; (dict-find k d) -> #f         (jeśli jej nie ma)
(define (dict-find k d)
  (define (f xs)
    (cond [(null? xs) #f]
          [(eq? (caar xs) k) (car xs)]
          [else (f (cdr xs))]))
  (f (dict-list d)))

; (dict-find-else k e d) -> v  (jeśli para (k, v) jest w słowniku)
; (dict-find-else k e d) -> e  (jeśli jej nie ma)
(define (dict-find-else k e d)
  (define p (dict-find k d))
  (if (cons? p)
      (cdr p)
      e))

; (dict-find-or-error k d) -> v           (jeśli para (k, v) jest w słowniku)
; (dict-find-or-error k d) -> (error ...) (jesli jej nie ma)
(define (dict-find-or-error k d)
  (define p (dict-find k d))
  (if (cons? p)
      (cdr p)
      (error "Not found" k)))

(define example-dict (dict-insert 1 #t (dict-insert 2 'foo empty-dict)))

(check-equal? (dict-find 1 example-dict) '(1 . #t))
(check-equal? (dict-find 2 example-dict) '(2 . foo))
(check-equal? (dict-find 3 example-dict) #f)

(define (dict->list d)
  (dict-list d))
```

najpierw deklarujemy naszą strukturę, która będzie dosyć prosta, będzie to lista par w konwencji klucz -> wartość

(dict-remove k d) polega na tym, że odfiltrowuje wszystkie elementy mające klucz równy k w słowniku d,
(lambda (p) (not (eq? k (car p)))) czyli weź p, wypisz #t kiedy k != klucz

(dict-find) odnajduje
(dict->list) wypisuje, w sumie w tych dwóch nie ma żadnej większej magii

kolejki priorytetowe

```Racket
; kolejki priorytetowe
; reprezentacja: listy postaci
; (list (ord v1 p1) (ord v2 p2) ... (ord vn pn))
; i p1 <= p2 <= ... <= pn

(define-struct ord (val priority) #:transparent)

(define-struct prio-queue (list))

(define empty-pq (prio-queue '()))

(define (pq-insert elt h)
  (define (ins xs)
    (cond [(null? xs) (cons elt null)]
          [(< (ord-priority elt)
              (ord-priority (car xs)))
           (cons elt xs)] ; <- tu był błąd na wykładzie (było null)
          [else (cons (car xs) (ins (cdr xs)))]))
  (prio-queue (ins (prio-queue-list h))))

(define (pq-pop h)
  (prio-queue (cdr (prio-queue-list h))))

(define (pq-min h)
  (car (prio-queue-list h)))

(define (pq-empty? h)
  (null? (prio-queue-list h)))

(define example-pq (pq-insert (ord 'foo 5)
                              (pq-insert (ord 'bar 3) empty-pq)))

(check-equal? (pq-min example-pq) (ord 'bar 3))
(check-true (pq-empty? (pq-pop (pq-pop example-pq))))

(define example-pq-2 (pq-insert (ord 'bar 3)
                                (pq-insert (ord 'bar 5) empty-pq)))

(check-equal? (pq-min example-pq) (pq-min example-pq-2))
(check-false (pq-empty? (pq-pop example-pq-2)))
```

kolejka będzie składała się z dwóch elementów, (ord v_n p_n) gdzie v_n to cokolwiek, a p_n to klucz po którym będziemy sortowali w kolejności p1 <= p2 <= … <= pn
pq-insert ma h i elt. h to jest nasza kolejka, a elt to para składająca się z v i p sprawdza xs, jeżeli jest nullem to znaczy że wsadzamy gdzie jesteśmy i dajemy wskaźnik na null (dosyć oczywiste), jeżeli nasz klucz będzie większy to znaczy że znaleźliśmy się tam gdzie chcieliśmy i wsadzamy to elt wraz z przypięciem aby szło dalej
pq-pop jest sprytne, skoro chcemy spopować pierwszy element to wystarczy wskaźnik przesunąć na drugi i po problemie
pq-min chce wypisać najmniejszy klucz, a my wiemy z góry że to będzie pierwszy element
pq-empty? chyba tłumaczy się samo

```Racket
(define (dict-find-else k e d)
  (define p (dict-find k d))
  (if (cons? p)
      (cdr p)
      e))
      ; obliczanie częstości wystąpień

(define (make-frequency-dict xs)
  (define (it xs d)
    (if (null? xs)
        d
        (it (cdr xs) (dict-insert (car xs)
                                  (+ 1 (dict-find-else (car xs) 0 d))
                                  d))))
  (it xs empty-dict))

(define (string-frequency-list str)
  (dict->list (make-frequency-dict (string->list str))))

(define example-string "konstantynopolitańczykowianeczka")

(define example-frequency-list (string-frequency-list example-string))
```

make-frequency-dict dotyczy znowu słowników. mamy d, będące naszym słownikiem kktouwymyślałrtakwnieczytelneanazwy?

oraz xs będące jakąś listą, każdy element polega na tym że w d jest sprawdzane czy występuje powtórka, jeżeli taka powtórka jest, to powiększamy ilość o 1, usuwamy ten stary i dodajemy nowy, w przeciwnym wypadku dodajemy nową parę zawierającą jakiś znak i ilość równą 1


;todo drzewo kodowe, na wykładzie wytłumaczone po ciulu

```Racket
; drzewo kodowe
; idea jest taka, że każda ścieżka w tym drzewie będzie oznaczać jakiś tam kod, wartości w node będą nam mówić gdzie mamy iść, a liście mają znak, wtedy wiemy, że dany znak ma dany kod

; będziemy mieli kolejkę priorytetową, gdzie priorytetem jest suma priorytetów dla drzewa, chcemy wyjmować drzewa, które mają najmniejsze priorytety, grupujemy je potem w drzewa

(define-struct htnode (l r) #:transparent)
(define-struct htleaf (c) #:transparent)

(define (make-code-tree xs)
  (define (pq-insert-leaf p h)
    (pq-insert (ord (htleaf (elem-key p)) (elem-val p)) h))
  (define (initial-pq xs)
    (foldl pq-insert-leaf empty-pq xs))
  (define (ord-htnode e1 e2) ; TODO: mozna tutaj l i r zamiast e1, e2
    (ord (htnode (ord-val e1) (ord-val e2))
         (+ (ord-priority e1) (ord-priority e2))))
  (define (algo h)
    (let ([e1 (pq-min h)]
          [h1 (pq-pop h)])
      (if (pq-empty? h1)
          (ord-val e1)
          (let ([e2 (pq-min h1)]
                [h2 (pq-pop h1)])
            (algo (pq-insert (ord-htnode e1 e2) h2))))))
  (algo (initial-pq xs)))

(define example-code-tree
  (make-code-tree (dict->list example-frequency-dict)))

; słownik drzewa kodowego

(define (code-tree->dict t)
  (define (aux t rcpref d)
    (if (htleaf? t)
        (dict-insert (elem (htleaf-c t) (reverse rcpref)) d)
        (aux (htnode-r t)
             (cons 1 rcpref)
             (aux (htnode-l t)
                  (cons 0 rcpref)
                  d))))
  (aux t '() empty-dict))

(define example-code-dict
  (code-tree->dict example-code-tree))

; kodowanie
; najpierw szukamy kodów, znajduje lub zwraca błąd

(define (encode xs d)
  (foldr append null
         (map (lambda (x) (dict-find-or-error x d)) xs)))

(define (encode-string str d)
  (encode (string->list str) d))

(define example-encoded-string
  (encode-string example-string example-code-dict))

; dekodowanie
; t to drzewo kodowe, mamy 2 stany -> koniec napisu/początek nowego lub przechodzenie po kolejnych bitach i chodzenie po drzewie
(define (decode bits t)
  (define (start bits)
    (if (null? bits)
        '()
        (walk bits t)))
  (define (walk bits cur-t)
    (cond [(htleaf? cur-t)
           (cons (htleaf-c cur-t) (start bits))]
          [(null? bits)
           (error "Incomplete code")]
          [(= 0 (car bits))
           (walk (cdr bits) (htnode-l cur-t))]
          [(= 1 (car bits))
           (walk (cdr bits) (htnode-r cur-t))]))
  (start bits))

(define (decode-string bits t)
  (list->string (decode bits t)))

(define example-decoded-string
  (decode-string example-encoded-string example-code-tree))


```


## Wykład 5

### Cele wykładu

* Programowanie z typami w języku Plait
	* Podstawowe typy danych (liczby, ciągi znaków, wartości boolowskie)
	* Typy procedur
	* Inferencja typów
	* Pary i listy w języku Plait
	* Definicje aliasów typów
	* Definicje własnych typów danych

### Notatki

Istnieje język, który nazywa się `type racket`, czyli typowany Racket. Ale jest dość kłopotliwy w początkowej nauce. Dlatego został wybrany język typowany `plait`, który jest bardzo podobny do Racketa, ale są pewne różnice.

Trzeba język Plait zainstalować, bo nie jest domyślnie dostępny.

`raco pkg install plait`

```racket
1 -> Number 1
"x" -> String "x"
#t -> Boolean #t
```

Plait poda nam nie tylko wartość wyrażenia, ale też jego typ

```
(+ 2 2) -> Number 4
(string-length "foo") -> Number 3
(string-append "foo" "bar") -> String "foobar"
(< 1 2) -> Boolean #t
```

Różnica pomiędzy typami a kontraktami -> TODO: gdzieś ładnie było napisane
Przed uruchomieniem sprawdzane typy, a kontrakty w momencie obliczania wyrażenia

```
+ -> (Number Number -> Number) #<procedure:+>
string-length -> (String -> Number) #<procedure:string-length>
string-append -> (String String -> String) #<procedure:string-append>
```

Wiemy, że 0 i 1 są typu Number, procedura = jest typu (Number Number -> Boolean), procedury * i - są typu (Number Number -> Number), a więc możemy wnioskować, że x jest typu Number, a procedura fact jest typu (Number -> Number)
```racket
(define (fact x)
  (if (= x 0)
      1
	  (* x (fact (- x 1)))))

fact -> (Number -> Number) #<procedure:fact>
```

```racket
(define (foo x)
  (if x x x))

foo -> (Boolean -> Boolean) #<procedure:foo>
```


```racket
(define (id x) x)

id -> ('a -> 'a) #<procedure:id>
```

```racket
equal? ('a 'a -> Boolean)
```

```racket
pair -> ('a 'b -> ('a * 'b))
fst -> (('a * 'b) -> 'a)
snd -> (('a * 'b) -> 'b)
```

```
(pair 1 1) -> (Number * Number) (values 1 1)
(values 1 2 3 4) -> (Number * Number * Number * Number) (values 1 2 3 4)
```

`values` tworzy krotkę

```
(define (pair-ns)
  (pair (id 1) (id "x")))

pair-ns -> (-> (Number * String))
```

Przykład procedury, która się nie typuje:
```
(define (pair-ns-2 f)
  (pair (f 1) (f "x")))

pair-ns-2 -> (? -> Pair)
* (Number -> 'a)
* (String -> 'a)
```

```
(define (pair-ns-3 f g)
  (pair (f 1) (g "x")))

pair-ns-3 -> ((Number -> 'a) (String -> 'b) -> ('a * 'b))
```

Co ciekawe, jeśli możemy coś wnioskować dodatkowo o typach, to to robimy:
```
(pair-ns-3 id id) -> (Number * String)
```

```
(let [x 1] x) -> Number 1
(let [f (lamda (x) x)] f) -> ('_a -> '_a)
```

Definicja czegoś podobnego do listy w stylu racketa nie przechodzi, ponieważ się nie typuje
Dostajemy komunikat, że definicja typu się zapętla TODO:
```
(define (bar x)
 (pair x (bar (+ x 1))))
```

Ale jeśli użyjemy `cons`, to śmiga
```
(define (bar x)
 (cons x (bar (+ x 1))))

(Number -> (Listof Number))
```

```
cons -> ('a (Listof 'a) -> (Listof 'a))
```

W Plait nie ma wartości `null`, odpowiednikiem wartości `null` jest wartość `empty`
```
empty -> (Listof 'a) '()
```

W Plait nie ma wartości `car` i `cdr`, odpowiednikami wartości `car` i `cdr` są odpowiednio wartości `first` i `rest`
```
first -> ((Listof 'a) -> 'a)
rest -> ((Listof 'a) -> ('Listof 'a))
```

```racket
(define (my-length xs)
  (if (empty? xs)
      0
      (+ 1 (my-length (rest xs)))))
```

Plait rozumie też składnię racketową -> '(1 2), (cons 1 (cons 2 empty)), (list 1 2)

UWAGA!
W Plait nie ma procedur, które mogą przyjmować dowolną ilość argumentów (przez typowanie)

Zatem, żeby zachować podobną składnię do języka Racket, w języku Plait `list` jest formą specjalną

Zauważmy, że Plait nie pozwala nam napisać w następujący sposób funkcji `sum`, ponieważ nie można robić zagnieżdżonych define:
```racket
(define (sum xs)
  (define (it xs acc)
    (if (empty? xs)
        acc
        (it (rest xs) (+ (first xs) acc))))
  (it xs 0))
```

```
(define (it xs acc)
  (if (empty? xs)
      acc
      (it (rest xs) (+ (first xs) acc))))

it -> ((Listof Number) Number -> Number)
```

Musimy to zrobić używając formy specjalnej `local` lub `let`:

```
(define (sum xs)
  (local [(define (it xs acc)
    (if (empty? xs)
        acc
        (it (rest xs) (+ (first xs) acc))))]
  (it xs 0)))
```

```
(define (sum2 xs)
  (letrec [it (lambda (xs acc)
    (if (empty? xs)
        acc
        (it (rest xs) (+ (first xs) acc))))]
  (it xs 0)))
```

Używamy letrec, bo w definicji lambdy używamy rekurencji, a jeśli użylibyśmy let, to w definicji lambdy it byłaby zmienną wolną
UWAGA! W Racketcie też można używać formy specjalnej `local`, ale nie jest to konieczne


```
(define (my-foldr f x xs)
  (if (empty? xs)
      x
	  (f (first xs) (my-foldr f x (rest xs)))))

(define (my-foldl f x xs)
  (local [(define (it xs acc)
    (if (empty? xs)
        acc
	   (it (rest xs) (f (first xs) acc))))]
  (it xs x)))

my-foldr -> (('a 'b -> b) 'b (Listof 'a) -> 'b)
my-foldl -> (('a 'b -> b) 'b (Listof 'a) -> 'b)
```

Implementacja reverse za pomocą foldl:
```
(define (my-reverse xs)
  (my-foldl cons empty xs))
```

Możemy definiować aliasy na typy
```
(define-type-alias NumberList (Listof Number))
```

Zawężanie typu:
```
(define x : NumberList empty)
```

Definiowanie własnych typów:
```
(define-type MyNumberList
  (my-empty)
  (my-cons [first : Number] [rest : MyNumberList]))
```

define-type jest podobny do define-struct z Racketa, ale wszystkie elementy zdefiniowane w define-type, to osobne definicje struktur, które są definiowanego typu

```
my-empty -> (-> MyNumberList)
(my-empty) -> MyNumberList
my-cons -> (Number (Listof Number) -> MyNumberList)
```

Podobnie jak to było w Racketcie, dostaliśmy nowe:
* predykaty: `my-empty?`, `my-cons?`
* selektory: `my-cons-first`, `my-cons-rest`

Definiowanie typu drzew, zawierającego liczby (typ Number):
```
(define-type NumberTree
  (nleaf)
  (nnode [l : NumberTree] [elem : Number] [r : NumberTree]))
```

Definiowanie typu drzew dowolnego typu (typu 'a):
```
(define-type (Tree 'a)
  (leaf)
  (node [l : (Tree 'a)] [elem : 'a] [r : (Tree 'a)]))
```


```
; bst-lookup : (Number (Tree (Number * 'a)) -> 'a)
(define (bst-lookup x t)
  (cond [(leaf? t) (error 'bst-lookup "Not found")]
        [(= x (fst (node-elem t))) (snd (node-elem t))]
		[(< x (fst (node-elem t)))
		 (bst-lookup x (node-l t))]
		[else
		 (bst-lookup x (node-r t))]))
```

```
; bst-lookup-opt : (Number (Tree (Number * 'a)) -> (Optionof 'a))
(define (bst-lookup-opt x t)
  (cond [(leaf? t) (none)]
        [(= x (fst (node-elem t))) (some (snd (node-elem t)))]
		[(< x (fst (node-elem t)))
		 (bst-lookup-opt x (node-l t))]
		[else
		 (bst-lookup-opt x (node-r t))]))
```

```
none -> (-> Optionof 'a) #<procedure:none>
(none) -> Optionof 'a
some -> ('a -> Optionof 'a)
```

<!-- ---------------------------------------------- -->

TODO: czym jest język Plait


Typy
typy są wykorzystywane w celu ochrony przed wrzuceniem złego rodzaju do np funkcji
stricte w racketcie nie ma typów, więc będziemy korzystali z plaita, który jest podobny składniowo, chociaż są drobne zmiany:

po wpisaniu np liczby plait wypisuje najpierw typ, a dopiero później tę liczbę, tak samo przy funkcjach mniej i bardziej zaawansowanych
(number?) i te podobne nie działa, ponieważ kompilator samemu pilnuje typy
może ktoś za chwilę powiedzieć że hola hola, przecież w rakiecie też tak się dzieje, że nie możesz łączyć np numbera z stringiem appendem ale haczyk jest taki że nie do końca, na przykład (if) jest formą specjalną leniwą, która nie rozpatruje całości, przez co (if #f (+ "foo" 3) 42) olewa błąd w pierwszym, bo tak czy inaczej wykonuje drugi fragment, plait natomiast elegancko wypluwa błąd typów, fajna sprawa bo ułatwia kontrolę nad kodem. Tak samo dla niego (if #f "foo" 42) będzie błędem. ponieważ wtedy if będzie wypisywał wynik różnych typów.

Pora spojrzeć na to jak wypisuje procedury, na przykład dajemy +, plait wypisze nam (Number Number -> Number) widzimy, że plait przyjmuje wyłącznie 2 argumenty i wypisuje 1 będący liczbą. Weźmy przykład

```Racket
(define (fact x)
  (if (= x 0)
      1
      (* x (fact (- x 1)))))
```

po wpisaniu samej procedury fact
plait wypisuje (Number -> Number)
inny przykład, dla

```Racket
(define (foo x)
  (if x x x))
```

wpisanie samego foo da nam (Boolean -> Boolean)

weźmy teraz (define (id x) x), po sprawdzeniu dowiadujemy się że jest ('a -> 'a), czyli cokolwiek wstawiamy i cokolwiek wypisuje
np equal? wypisuje nam ('a 'a -> Boolean), przez co po wpisaniu np (equal? #t 1) wywala błąd
również nie mamy czegoś takiego jak null

pary i listy w plait
pary w plait nazywają się pair i są typu ('a 'b -> ('a * 'b)). fst np jest typu(('a * 'b) -> 'a). po wpisaniu (pair 1 1) wypisuje nam (Number * Number) (values 1 1). values ogółem może przyjmować więcej niż dwie wartości cyfrowe, ale nie będzie nas to interesowało. Np (pair 1 +) wypisuje nam (Number * (Number Number -> Number)) (values 1 #<procedure:+>)
zróbmy przykład

```Racket
(define (pair-ns)
  (pair (id 1) (id "x")))
```
jest on typu ( -> (Number * String))

zróbmy kolejny przykład

```Racket
(define (pair-ns2 f)
  (pair (f 1) (f "x")))
```

wywala on złowieszczy błąd mówiący o tym, że funkcja jest zła bo raz przyjmuje Number, a raz String. jak dajemy funkcję w argumencie to ona staje się dosyć nieresponsywna, przez ograniczenia zamierzone z plaita

a w innym przykładzie

```Racket
(define (pair-ns3 f g)
  (pair (f 1) (g "x")))
```

wypisuje nam ((Number -> 'a) (String -> 'b) -> ('a * 'b))

oraz w tym przypadku zadziała (pair-ns3 id id), mimo że wcześniej równoznaczna funkcja co do operacji nie działała, dlaczemu? oturz te id jakby są dwiema osobnymi bytami, pierwszy id przyjmuje number i daje number, drugi przyjmuje string i daje string

(let ([x 1]) x) czyli niech x będzie 1 wypisz x, daje on napis Number i wynik 1. (let ([f (lambda (x) x)]) f) daje ('_a -> '_a)

również pair nie nadaje się za bardzo do robienia list. Na szczęście mamy taki zestaw do robienia list, nazywa się cons, jest on typu ('a (Listof 'a) -> (Listof 'a)), z tego też możemy wywnioskować, że listy mogą być wyłącznie jednego typu
sprawdźmy jedną funkcję

```Racket
(define (bar-bledny x)
(pair x (bar (+ x 1))))

(define (bar x)
(cons x (bar (+ x 1))))
```

po wpisaniu bar-bledny wyskoczy nam błąd w typowaniu, natomiast po wpisaniu bar wyskoczy nam (Number -> (Listof Number)) czyli bierze liczbę i robi listę liczb.

Można się teraz zastanowić jak zrobić żeby lista się kończyła, gdy nie mamy nulla? oturz do tego mamy empty która jest typu (Listof 'a) i wypisuje '()
zróbmy własną funkcję my-length !

```Racket
(define (my-length xs)
  (if (empty? xs)
      0
      (+ 1 (my-length (rest xs)))))
```

tutaj jest kolejna zmiana względem rakiety, posiadamy zamiast car i cdr -> first i rest

a listy pisze się tak (cons 1 (cons 2 empty)) i tworzy nam '(1 2), takie coś jako składnia jest akceptowana, jest również list ale nie jest procedurą tylko formą specjalną, ponieważ żadna procedura nie może mieć niezdefiniowaną ilość typów

Ważna rzecz, nie można definiować funkcje wewnątrz funkcji, ale można to obejść przez dodanie funkcji local:

```Racket
(define (sum xs)
  (local [(define (it xs acc)
            (if (empty? xs)
                acc
                (it (rest xs) (+ acc (first xs)))))]
    (it xs 0)))
```

jest jeszcze druga opcja przez wykorzystanie letrec:

```Racket
(define (sum2 xs)
  (letrec [(it (lambda (xs acc)
                             (if (empty? xs)
                acc
                (it (rest xs) (+ acc (first xs))))))]
    (it xs 0)))
```

letrec powoduje że można wykorzystać funkcję it.

mamy se foldr i foldl:

```Racket
(define (my-foldr f x xs)
  (if (empty? xs)
      x
      (f (first xs) (my-foldr f x (rest xs)))))

(define (my-foldl f x xs)
  (if (empty? xs)
      x
      (my-foldl f (f (first xs) x) (rest xs))))
```

foldr i foldl ma to samo typowanie: (('a 'b -> 'b) 'b (Listof 'a) -> 'b) więc mamy procedurę f, wartość x i listę xs, mamy listę 'a, oraz wartość nazwaną 'b. Można zauważyć że f robi tak (f (first xs) (my-foldr f x (rest xs))) czyli najpierw bierze element z xs, tj nasz typ 'a, oraz wchodzi wgłąb, gdzie ostatecznie wypisze x z powodu (if (empty? xs), czyli bierze nasz typ 'b i wypisuje całościowo typ 'b który też stanie się naszym wynikiem, czyli wynik będzie typu 'b.
weźmy przykład (my-foldl cons empty '(1 2 3))
naszym 'a będzie (Listof Number) '(1 2 3) i 'b jest (Listof 'c), funkcja nasza cons przyjmuje Number i (Listof Number) (zgodnie z definicją ('a (Listof 'a) -> (Listof 'a))) przez co całość ma wynik typu (Listof Number)

definiowanie własnych typów

```Racket
(define-type-alias NumberList (Listof Number))
(define x : NumberList empty)
```

powoduje że jak wbijemy do konsoli x to dostaniemy wynik (Listof Number) mimo że wykorzystaliśmy empty który z definicji dowolnym listofem udało nam się ograniczyć jego funkcjonalność do tylko liczb. Do tego to nasze nazwanie aliasu nie wyświetla nam się w konsoli, ma działanie głównie kosmetyczne - ułatwia pisanie.

```Racket
(define-type MyNumberList
  (my-empty)
  (my-cons [first : Number] [rest : MyNumberList]))
```

define-type działa podobnie do define-struct ale jego główną zaletą jest to, że można w tym pierwszym definiować wiele struktur
po wpisaniu my-empty widzimy, że jest typu -> MyNumberList a my-cons jest typu (Number MyNumberList -> MyNumberList)
możemy zrobić np (my-cons 1 (my-cons 2 (my-empty))) i będzie typu MyNumberList
możemy do tych struktur dodać znak zapytania który sprawdzi typy zadanej rzeczy
również do tych typów mamy selektory first i rest dzięki czemu możemy utworzyć np my-cons-first

```Racket
; define-type powyżej definiuje:
; typ MyNumberList
; konstruktory:
;   my-empty : (-> MyNumberList)
;   my-cons : (Number MyNumberList -> NumberList)
; predykaty:
;   my-empty? : (MyNumberList -> Boolean)
;   my-cons? : (MyNumberList -> Boolean)
; selektory:
;   my-cons-first : (MyNumberList -> Number)
;   my-cons-rest : (MyNumberList -> MyNumberList)
```

a teraz poniżej będzie pokazany przykład drzewa w plait:

```Racket
(define-type NumberTree
  (nleaf)
  (nnode [l : NumberTree] [elem : Number] [r : NumberTree]))
```

mamy drzewo w którym możemy dać wyłącznie liczby, jeżeli chcemy wsadzać tam dowolne typy, należy zrobić jak poniżej

```Racket
(define-type (Tree 'a)
  (leaf)
  (node [l : (Tree 'a)] [elem : 'a] [r : (Tree 'a)]))

(define example-tree
  (node (node (leaf) (pair 1 "foo") (leaf))
        (pair 2 "bar")
        (node (leaf) (pair 3 "baz") (leaf))))
```
```Racket
; (bst-lookup : (Number (Tree (Number * 'a)) -> 'a)
(define (bst-lookup x t)
  (cond [(leaf? t) (error 'bst-lookup "Not found")]
        [(= x (fst (node-elem t))) (snd (node-elem t))]
        [(< x (fst (node-elem t)))
         (bst-lookup x (node-l t))]
        [else
         (bst-lookup x (node-r t))]))
```

ten bst lookup operuje na drzewie par i patrzy czy 1 element zgadza się z wejściem, jak tak to wypisz drugi element pary.

```Racket
; (bst-lookup : (Number (Tree (Number * 'a)) -> (Optionof 'a))
(define (bst-lookup-opt x t)
  (cond [(leaf? t) (none)]
        [(= x (fst (node-elem t))) (some (snd (node-elem t)))]
        [(< x (fst (node-elem t)))
         (bst-lookup-opt x (node-l t))]
        [else
         (bst-lookup-opt x (node-r t))]))
```

w tym kodzie wykorzystujemy optionof który mówi nam że może coś zwrócić, albo dać nic, np: some ('a -> Optionof 'a) i none ( -> Optionof 'a)
gratuluję, koniec tercji I


## Wykład 6

### Cele wykładu

* Wnioskowanie o programach
	* Równoważność programów
	* Indukcja i rekursja strukturalna
	* Dowodzenie poprawności względem specyfikacji

### Notatki

Ciekawe stwierdzenie by Polesiuk
```
dane     mają strukturę
programy mają strukturę
dowody   mają strukturę

I to jest ta sama struktura
```

TODO: notaki Emi + materialy z wykladu

TODO: przygotować najlepszą wersję zasady indukcji

Zajmujemy się językiem typowanym, więc przyjmujemy, że wszystko ładnie się typuje

Jeśli chodzi o równoważność programów (lub ich części), to jest kilka rzeczy trickowych
Możemy mieć różne podejścia:
* programy są identyczne, jeśli spełniają specyfikację
* programy są identyczne, jeśli mają identyczny wynik działania (w tym efekty uboczne)


#### Indukcja

**Zasada indukcji dla list:**
Niech $P$ będzie własnością list, taką że:
* Zachodzi $P(null)$,
* Dla każdej wartości $x$ oraz dowolnej listy $xs$, jeśli $P(xs)$, to $P((cons\ x\ xs))$.

Wówczas dla dowolnej listy $xs$ zachodzi $P(xs)$.

##### 1. (append (map f xs) (map f ys))
```racket=
; definicja map
(define (map f xs)
    (if (null? xs)
        null
        (cons (f (car xs))
              (map f (cdr xs)))))

; definicja append
(define (append xs ys)
    (if (null? xs)
        ys
        (cons (car xs)
              (append (cdr xs) ys))))
```

**Teza:**
Dla dowolnej poprawnej funkcji $f$ oraz list $xs$ i $ys$ zachodzi:
($append$ ($map$ $f$ $xs$) ($map$ $f$ $ys$)) $\equiv$ ($map$ $f$ ($append$ $xs$ $ys$)).

---

Będziemy robić indukcję po $xs$.
**Dowód:**
* Baza indukcji: $P(null)$

$L$ $\equiv$ ($append$ ($map$ $f$ $null$) ($map$ $f$ $ys$)) $\equiv$ (niech $ys'$ będzie listą po wykonaniu funkcji $map$)
$\equiv$ ($append$ $null$ $ys'$) $\equiv$ $ys'$

$P$ $\equiv$ ($map$ $f$ ($append$ $null$ $ys$)) $\equiv{z\ def.\ append}$
$\equiv$ ($map$ $f$ $ys$) $\equiv{z\ def.\ map}$
$\equiv$ $ys'$

Zatem $L$ $\equiv$ $P$.

---

* Krok indukcyjny:
Niech $x$ będzie dowolnym elementem, a $xs$ dowolną listą. Załóżmy, że zachodzi $P(xs)$. Pokażemy, że $P((cons\ x\ xs))$.

$L$ $\equiv$ ($append$ ($map$ $f$ $(cons\ x\ xs)$) ($map$ $f$ $ys$)) $\equiv{z\ def.\ map}$
$\equiv$ ($append$ ($cons$ ($f$ $x$) ($map$ $f$ $xs$)) ($map$ $f$ $ys$)) $\equiv{z\ def.\ map}$
$\equiv{z\ def.\ append}$
$\equiv$ ($cons$ ($f$ $x$) ($append$ ($map$ $f$ $xs$) ($map$ $f$ $ys$))) $\equiv{z\ zał.\ ind.}$
$\equiv$ ($cons$ ($f$ $x$) ($map$ $f$ ($append$ $xs$ $ys$)))

$P$ $\equiv$ ($map$ $f$ ($append$ $(cons\ x\ xs)$ $ys$)) $\equiv{z\ def.\ append}$
$\equiv$ ($map$ $f$ ($cons$ $x$ ($append$ $xs$ $ys$))) $\equiv{z\ def.\ map}$
($cons$ ($f$ $x$) ($map$ $f$ ($append$ $xs$ $ys$)))

Zatem $L$ $\equiv$ $P$.

---

Na mocy zasady indukcji mamy
($append$ ($map$ $f$ $xs$) ($map$ $f$ $ys$)) $\equiv$ ($map$ $f$ ($append$ $xs$ $ys$))
dla dowolnej list $xs$, $ys$ i dowolnych funkcji $f$.

##### 2. (length (append xs ys)) = (+ (length xs) (length ys))
```racket=
; definicja length
(define (length xs)
    (if (null? xs)
        0
        (+ 1 (length (cdr xs)))))

; definicja append
(define (append xs ys)
    (if (null? xs)
        ys
        (cons (car xs) (append (cdr xs) ys))))
```

**Teza:**
Dla dowolnych list $xs$ i $ys$ zachodzi:
($length$ ($append$ $xs$ $ys$)) $\equiv$ ($+$ ($length$ $xs$) ($length$ $ys$)).

---

Będziemy robić indukcję po $xs$.
**Dowód:**
* Baza indukcji: $P(null)$

$L$ $\equiv$ ($length$ ($append$ $null$ $ys$)) $\equiv{z\ def.\ append}$
$\equiv$ ($length$ $ys$)

$P$ $\equiv$ ($+$ ($length$ $null$) ($length$ $ys$)) $\equiv{z\ def.\ length}$
$\equiv$ (+ $0$ ($length$ $ys$)) $\equiv{z\ def.\ +}$
$\equiv$ ($length$ $ys$)

Zatem $L$ $\equiv$ $P$.

---

* Krok indukcyjny:
Niech $x$ będzie dowolnym elementem, a $xs$ dowolną listą. Załóżmy, że zachodzi $P(xs)$. Pokażemy, że $P((cons\ x\ xs))$.

$L$ $\equiv$ ($length$ ($append$ $(cons\ x\ xs)$ $ys$)) $\equiv{z\ def.\ append}$
$\equiv$ ($length$ ($cons$ $x$ ($append$ $xs$ $ys$))) $\equiv{z\ def.\ length}$
$\equiv$ ($+$ $1$ ($length$ ($append$ $xs$ $ys$))) $\equiv{z\ zał.\ ind.}$
($+$ $1$ ($+$ ($length$ $xs$) ($length$ $ys$))) $\equiv{z\ def.\ +}$
$\equiv$ ($+$ $1$ ($length$ $xs$) ($length$ $ys$))


$P$ $\equiv$ ($+$ ($length$ $(cons\ x\ xs)$) ($length$ $ys$)) $\equiv{z\ def.\ length}$
$\equiv$ ($+$ ($+$ $1$ ($length$ $xs$)) ($length$ $ys$)) $\equiv{z\ def.\ +}$
($+$ $1$ ($length$ $xs$) ($length$ $ys$))

Zatem $L$ $\equiv$ $P$.

---

Na mocy zasady indukcji mamy
($length$ ($append$ $xs$ $ys$)) $\equiv$ ($+$ ($length$ $xs$) ($length$ $ys$))
dla dowolnej list $xs$ i $ys$.

##### 3. (filter p (map f xs)) = (map f (filter (lambda (x) (p (f x))) xs)
```racket=
; definicja map
(define (map f xs)
    (if (null? xs)
        null
        (cons (f (car xs))
              (map f (cdr xs)))))

; definicja append
(define (filter p? xs)
    (if (null? xs)
        null
        (if (p? (car xs))
            (cons (car xs) (filter p? (cdr xs)))
            (filter p? (cdr xs)))))
```

**Teza:**
Dla dowolnej list $xs$, predykatu p i funkcji f zachodzi:
($filter$ $p$ ($map$ $f$ $xs$)) $\equiv$ ($map$ $f$ ($filter$ ($lambda$ ($x$) ($p$ ($f$ $x$))) $xs$).

---

Będziemy robić indukcję po $xs$.
**Dowód:**
* Baza indukcji: $P(null)$

$L$ $\equiv$ ($filter$ $p$ ($map$ $f$ $null$)) $\equiv{z\ def.\ map}$
$\equiv$ ($filter$ $p$ $null$) $\equiv{z\ def.\ filter}$
$\equiv$ $null$

$P$ $\equiv$ ($map$ $f$ ($filter$ ($lambda$ ($x$) ($p$ ($f$ $x$))) $null$) $\equiv{z\ def.\ filter}$
$\equiv$ ($map$ $f$ $null$) $\equiv{z\ def.\ map}$
$\equiv$ $null$

Zatem $L$ $\equiv$ $P$.

---

* Krok indukcyjny:
Niech $x$ będzie dowolnym elementem, $xs$ dowolną listą, $p$ predykatem, a $f$ prawidłową funkcją. Załóżmy, że zachodzi $P(xs)$. Pokażemy, że $P((cons\ x\ xs))$.

$L$ $\equiv$ ($filter$ $p$ ($map$ $f$ $(cons\ x\ xs)$)) $\equiv{z\ def.\ map}$
$\equiv$ ($filter$ $p$ ($cons$ ($f$ $x$) ($map$ $f$ $xs$))) $\equiv{z\ def.\ filter}$
$\equiv$ $...$

Musimy tutaj rozważyć 2 przypadki:
1. Gdy zmapowany element $x$ będzie zwróci #t dla ($p$ ($f$ $x$)), czyli będzie należał do wyniku,
2. W przeciwym wypadku #f, czyli nie będzie należał do wyniku.

**1 przypadek**:
$...$ $\equiv$ ($cons$ ($f$ $x$) ($filter$ $p$ ($map$ $f$ $xs$))) $\equiv{z\ zał.\ ind.}$
$\equiv$ ($cons$ ($f$ $x$) ($map$ $f$ ($filter$ ($lambda$ ($x$) ($p$ ($f$ $x$))) $xs$)))

**2 przypadek**:
$...$ $\equiv$ ($filter$ $p$ ($map$ $f$ $xs$)) $\equiv{z\ zał.\ ind.}$
$\equiv$ ($map$ $f$ ($filter$ ($lambda$ ($x$) ($p$ ($f$ $x$))) $xs$)

---

$P$ $\equiv$ ($map$ $f$ ($filter$ ($lambda$ ($x$) ($p$ ($f$ $x$))) $(cons\ x\ xs)$)) $\equiv{z\ def.\ filter}$ $\equiv$ $...$

Tutaj tak samo musi rozbić na przypadki:
**1 przypadek**:
$...$ $\equiv$ ($map$ $f$ ($cons$ $x$ ($filter$ ($lambda$ ($x$) ($p$ ($f$ $x$))) $xs$)))
$\equiv{z\ def.\ map}$ $\equiv$
($cons$ ($f$ $x$) ($map$ $f$ ($filter$ ($lambda$ ($x$) ($p$ ($f$ $x$))) $xs$)))
Zatem $L$ $\equiv$ $P$.

**2 przypadek**:
$\equiv$ ($map$ $f$ ($filter$ ($lambda$ ($x$) ($p$ ($f$ $x$))) $xs$))
Zatem $L$ $\equiv$ $P$.

---

Na mocy zasady indukcji mamy
($filter$ $p$ ($map$ $f$ $xs$)) $\equiv$ ($map$ $f$ ($filter$ ($lambda$ ($x$) ($p$ ($f$ $x$))) $xs$)
dla dowolnej listy $xs$, predykatu $p$ i funkcji f.

##### 4. (foldr + 0 ns) = (foldl + 0 ns), gdzie ns jest listą liczb całkowitych
```racket=
(define (foldr f acc xs)
  (if (null? xs)
      acc
      (f (car xs) (foldr f acc (cdr xs)))))

(define (foldl f acc xs)
  (if (null? xs)
      acc
      (foldl f (f (car xs) acc) (cdr xs))))
```
TODO

##### 5. Zadanie z egzaminu z poprzednich lat
![](https://hackmd.io/_uploads/HkTdNagdn.png)

**Zasada indukcji dla $AList$:**
Niech $P$ będzie własnością $AList$, taką że:
* Zachodzi $P(a-null)$,
* Dla dowolnego elementu $x$ typu $'a$ oraz dowolnej listy $xs$ typu $(AList\ 'a)$ jeśli zachodzi $P(xs)$, to zachodzi $P((a-cons\ x\ xs))$,
* Dla dowolnych list $xs$ i $ys$ typu $(AList\ 'a)$, jeśli zachodzi $P(xs)$ i $P(ys)$, to zachodzi $P((a-append\ xs\ ys))$.

Wówczas dla dowolnej listy $xs$ typu $(AList\ 'a)$ zachodzi $P(xs)$.

![](https://hackmd.io/_uploads/By7-tClu3.png)
![](https://hackmd.io/_uploads/rkEzYAeO2.png)

**Teza:**
Dla dowolnej listy $xs$ typu $(AList\ 'a)$ zachodzi (to-list (a-rev $xs$)) $\equiv$ (reverse (to-list $xs$)).

**Dowód:**
* Baza indukcji: $P(a-null)$

$L$ $\equiv$ (to-list (a-rev $(a-null)$)) $\equiv_{z\ def.\ a-rev}$
$\equiv$ (to-list $(a-null)$) $\equiv_{z\ def.\ to-list}$
$\equiv$ $empty$

$P$ $\equiv$ (reverse (to-list $(a-null)$)) $\equiv_{z\ def.\ to-list}$
$\equiv$ (reverse $empty$) $\equiv_{z\ def.\ reverse}$
$\equiv$ $empty$

Zatem $L$ $\equiv$ $P$.

* Krok indukcyjny 1:
Weźmy dowolny element $x$ typu $'a$ oraz dowolna listę $xs$ typu $(AList\ 'a)$. Załóżmy, że zachodzi $P(xs)$. Pokażemy, że $P((a-cons\ x\ xs))$.

$L$ $\equiv$ (to-list (a-rev $(a-cons\ x\ xs)$)) $\equiv_{z\ def.\ a-rev}$
$\equiv$ (to-list (a-append (a-rev $xs$) $(a-cons\ x\ (a-null))$)) $\equiv_{z\ def.\ to-list}$
$\equiv$ (append (to-list (a-rev $xs$)) (to-list $(a-cons\ x\ (a-null))$)) $\equiv_{z\ zał.\ ind.}$
$\equiv$ (append (reverse (to-list $xs$)) (to-list $(a-cons\ x\ (a-null))$)) $\equiv_{z\ def.\ to-list}$
$\equiv$ (append (reverse (to-list $xs$)) $(cons\ x\ empty)$)

$P$ $\equiv$ (reverse (to-list $(a-cons\ x\ xs)$)) $\equiv_{z\ def.\ to-list}$
$\equiv$ (reverse $(cons\ x\ (to-list\ xs))$) $\equiv_{z\ def.\ reverse}$
$\equiv$ (append (reverse (to-list $xs$)) (cons $x$ $empty$))

Zatem $L$ $\equiv$ $P$.

* Krok indukcyjny 2:
Weźmy dowolne listy $xs$ i $ys$ typu $(AList\ 'a)$. Załóżmy, że $P(xs)$ i $P(ys)$. Pokażemy, że $P((a-append\ xs\ ys))$.

$L$ $\equiv$ (to-list (a-rev $(a-append\ xs\ ys)$)) $\equiv_{z\ def.\ a-rev}$
$\equiv$ (to-list (a-append (a-rev $ys$) (a-rev $xs$))) $\equiv_{z\ def.\ to-list}$ $\equiv$
(append (to-list (a-rev $ys$)) (to-list (a-rev $xs$))) $\equiv_{z\ zał.\ ind.}$
$\equiv$ (append (reverse (to-list $ys$)) (reverse (to-list $xs$)))

Lemat:
Dla dowolnej listy $xs$ i $ys$ typu $(AList\ 'a)$ zachodzi:
(append (reverse (to-list $ys$)) (reverse (to-list $xs$))) $\equiv$ (reverse (append (to-list $xs$) (to-list $ys$)))

P $\equiv$ (reverse (to-list $(a-append\ xs\ ys)$)) $\equiv_{z\ def.\ to-list}$
$\equiv$ (reverse (append (to-list $xs$) (to-list $ys$))) $\equiv_{z\ lem.}$
$\equiv$ (append (reverse (to-list $ys$)) (reverse (to-list $xs$)))

Zatem L $\equiv$ P.

---

Na mocy zasady indukcji dla dowolnej listy $xs$ typu $(AList 'a)$ spełniona jest własność $P$.


## Wykład 7

### Cele wykładu

* Dopasowanie wzorca
* Programowanie z typami (w języku Plait)
	* Projektowanie struktur danych
	* Wyrażanie niezmienników w typach
* Kontrakty w języku Racket
	* Dynamiczne sprawdzanie poprawności ­– asercje
	* Kontrakty proste
	* Kontrakty złożone
	* Kontrakty parametryczne
	* Kontrakty dla typów danych

### Notatki

Chcemy głównie trwałe struktury danych (implementacja Queue)

TODO: ogarnąć różnicę pomiędzy ifowaniem typów poprzez predykaty, a type-case'owaniem
Wydaje mi się, że type-case'owanie jest bardziej w duchu korzystania z języka typowanego

```
(define (my-map f xs)
  (type-case (Listof 'a) xs
    [(cons x xs) (cons (f x) (my-map f xs))]
    [empty       empty]))

(define-type (Tree 'a)
  (leaf)
  (node [l : (Tree 'a)] [elem : 'a] [r : (Tree 'a)]))

(define (insert x t)
  (type-case (Tree 'a) t
    [(leaf) (node (leaf) x (leaf))]
    [(node l y r)
     (if (< x y)
         (node (insert x l) y r)
         (node l y (insert x r)))]))

; ===========================================================

; Niezmiennik:
; Lista (cons h f) jest pusta wtw cała kolejka jest pusta

; Innymi słowy:
; albo cała kolejka jest pusta albo pierwsza lista jest niepusta

(define-type (Queue 'a)
  (empty-queue)
  (queue (h : 'a) (f : (Listof 'a)) (r : (Listof 'a))))

(define (mk-queue f r)
  (type-case (Listof 'a) f
    [empty
      (type-case (Listof 'a) (reverse r)
        [empty (empty-queue)]
        [(cons h f) (queue h f empty)])]
    [(cons h f) (queue h f r)]))

(define queue-empty
  (empty-queue))

(define (push q x)
  (type-case (Queue 'a) q
    [(empty-queue) (queue x empty empty)]
    [(queue h f r) (queue h f (cons x r))]))

(define (is-empty? q)
  (type-case (Queue 'a) q
    [(empty-queue) #t]
    [(queue h f r) #f]))

(define (peek q)
  (type-case (Queue 'a) q
    [(empty-queue) (none)]
    [(queue h f r) (some h)]))

(define (pop q)
  (type-case (Queue 'a) q
    [(empty-queue) (error 'pop "Queue is empty")]
    [(queue h f r) (mk-queue f r)]))

(define (pop-z-nagrania q)
  (type-case (Queue 'a) q
    [(empty-queue) (none)]
    [(queue h f r) (some (mk-queue f r))]))
```

Definicja silni:
```
(define (fact n)
  (if (= n 0)
      1
      (* n (fact (- n 1)))))
```

Możemy upewnić się, że input jest poprawny w następujący sposób:
```
(define (fact n)
  (if (natural? n)
      (if (= n 0)
          1
          (* n (fact (- n 1)))
	  (error 'fact "Niepoprawny intput")))
```

Ale zaciemnił nam się program, musieliśmy sami dodawać w jakiegoś ifa swój program, dodawać else'a z errorem. Definicja funkcji fact stała się mniej czytelna (mogliśmy gdzieś popełnić błąd)

Możemy wykorzystać na początku naszej funkcji mechanizm, który często jest domyślny w językach programowania, czyli funkcja assert. W `rackunit` mamy funkcję `checj-pred`, która przyjmuje 2 parametry (pierwszy, to jaki typ danych musi być spełniany, a drugi to argument/input). (już trochę lepsze rozwiązanie, nie straciliśmy na czytelności, doszła 1 linijka na początku definicji funkcji). Minusem jest, że check-pred się nie zatrzymuje, tylko program wykonuje się dalej
```
(require rackunit)

(define (fact n)
  (check-pred natural? n)
  (if (= n 0)
      1
      (* n (fact (- n 1)))))
```

W racketcie jest mechanizm, który został do tego stworzony, nazywa się kontraktami
Możemy sobie do definicji funkcji przypiąć sobie "testy" dotyczące argumentów wejściowych i wyjściowych danej funkcji, które będą sprawdzane za każdym razem. Jeśli nie będzie spełnione, to będzie krzyczeć

`any/c` to predykat

Typy są sprawdzane podczas kompilacji programu (statycznie, jeszcze przed uruchomieniem), kontrakty są sprawdzane w czasie działania programu

```
; wejście - liczba naturalna (natural?)
; wyjście - dowolny typ (any/c)
(define/contract (fact n)
  (-> natural? any/c)
  (if (= n 0)
      1
      (* n (fact (- n 1)))))
```

Możemy definiować własne kontrakty, konwencja jest taka, że nazwa kontraktu musi być zakończona na `/c`

Mamy do dyspozycji operacje logiczne na kontraktach, które są procedurami `and/c, or/c`
and/c -> Bierze wszystkie kontrakty i jeśli każdy jest spełniony, to tworzy nowy kontrakt

```
(define positive-natural/c
  (and/c natural? positive?))
```

W kontraktach możemy wyrazić dużo bardziej skomplikowane rzeczy niż w typach, bo np. w typach nie mamy za bardzo jak powiedzieć, że coś jest liczbą naturalną dodatnią (nie mamy takiego typu)

W prosty sposób możemy tworzyć własne predykaty, a dzięki nim własne kontrakty. Minusem jest to, że czas potrzebny na sprawdzanie kontraktów może szybko rosnąć (bo kontrakty są sprawdzane za każdym razem)

`->` w kontraktach to forma specjalna
`parametric->/c` w kontraktach to forma specjalna

```
; zamiast f, można napisać p? (predykat)
; UWAGA! Listę pustą zapisujemy jako ()', a nie jako null (podobnie jeśli chodzi o empty) -> bo wtedy wszystko się do tego dopasuje i dostajemy funkcję identycznościową
(define/contract (my-filter f xs)
  ; (-> procedure? list? list?) -> słaby kontrakt, możemy dać procedurę, która nie zwraca boola
  ; (-> (-> any/c boolean?) list? list?) -> mamy to co chcieliśmy, ale jeszcze chcemy powiązać typ listy wejściowej do typu danych wejściowych do funkcji i typ danych wyjściowych z typem danych wyjściowych z funkcji
  ; (-> (-> any/c boolean?) (listof number?) (listof number?)) -> tutaj powiązaliśmy, ale ograniczamy się tylko do liczb, ale chcielibyśmy mieć to parametryczne, dostajemy dowolny typ i mamy powiązanie od razu sprawdzane, nie musimy wymyślać wszystkich możliwych typów i próbować tego sprawdzać
  (parametric->/c [a] (-> (-> a boolean?) (listof a) (listof a)))
  (match xs
    ['()         null]
    [(cons x xs)
	 (if (f x) ; tutaj to nie jest to samo f, które przekazaliśmy jako argument do funkcji, tylko f owinięte w kontrakt (tutaj się może wywalić (jeśli nie będziemy zwracać boola), jeśli zaaplikujemy funkcję do argumentu)
	     (cons x (my-filter f xs))
		 (my-filter f xs))]))
```

Interpretacja z pudełkiem:
niektóre wystąpienia należy włożyć do pudełka, a niektóre z niego wyjąć

Pozytywne - wyjmujemy z pudełka
Negatywne - wkładamy do pudełka

Pozytywne i negatywne pozycje
Pozytywna jeśli parzyście wiele razy wystąpiła po lewej stronie strzałki (po stronie argumentu)
a -> argument argumentu
listof b -> wynik funkcji
listof a -> argument funkcji
b -> wynik argumentu
(parametric->/c [a b] (-> (-> a b) (listof a) (listof b)))
                        + (2) - (1)  - (1)       + (0)


UWAGA! Musimy pamiętać, że jak piszemy kontrakt i wkładamy coś do pudełka, to musimy z niego też wyjąć. Trzeba się kierować logiką, robić wszystko z uwagą i nie kombinować za bardzo i wszystko będzie dobrze!
```
; poprawny kontrakt
(define/contract (id x)
  (parametric->/c [a] (-> a a))
  x)

; niepoprawny kontrakt -> złe działanie funkcji
(define/contract (bad-id x)
  (parametric->/c [a] (-> a any/))
  x)
```

`struct/c` -> forma specjalna przyjmująca konstruktor i argumenty (może inaczej to się nazywa?) dla konstruktora

```
(struct leaf () #:transparent)
(struct node (l elem r) #:transparent)

; używanie predykatu tree? może być kosztowne, trzeba myśleć jak mądrze napisać kontrakt, żeby nie było wolno
(define (tree? t)
  (or (leaf? t)
      (and (node? t) (tree? (node-l t)) (tree? (node-r t)))))

; zapętla się, or/c jest procedurą, czeka na policzenie argumentów i się zapętla
; tutaj c (argument) to kontrakt do sprawdzania wartości elementów w drzewie
(define (bad-treeof c)
  (or/c (struct/c leaf)
        (struct/c node (bad-treeof c) c (bad-treeof c))))

; kontrakty zapewniają nam możliwość tworzenia rekurencyjnych kontraktów dla rekurencyjnych struktur danych (funkcji bazujących na takich strukturach) lub innych rekurencyjnych funkcji
; dostajemy operator punktu stałego (TODO: nie pamiętam czy to tak się nazywało), dzięki któremu mamy możliwość tworzenia rekurencyjnych kontraktów
; flat-rec-contract (flat jest od płaskiego kontraktu, a nie płaskiej rekursji!, kontrakty flat to takie kontrakty, które są sprawdzane w miarę od razu, a nie jak zazwyczaj, że trzeba coś wywołać, żeby był sprawdzony)
; działa trochę jak or/c -> dajemy kilka rzeczy, a on bierze ich alternatywę
; flat-rec-contract NAZWA_WYWOŁAŃ
(define (treeof c)
  (flat-rec-contract tree
                     (struct/c leaf)
                     (struct/c node tree c tree)))

; insert z kontraktem
; z matchowaniem struktur (dopasowanie wzorca dla struktur)
(define/contract (insert x t)
  (-> number? (treeof number?) (treeof number?))
  (match t
    [(leaf) (node (leaf) x (leaf))]
    [(node l y r)
     (if (< x y)
         (node (insert x l) y r)
         (node l y (insert x r)))]))
```

```
(define (assert name b)
  (if b #t
      (error name "Assertion failed")))

#;(define (fact n)
  (assert 'fact (natural? n))
  (if (= n 0)
      1
      (* n (fact (- n 1)))))

(define/contract x
  number?
  42)

(define/contract (fact n)
  (-> natural? (and/c natural? positive?))
  (if (= n 0)
      1
      (* n (fact (- n 1)))))

(define/contract (my-map f xs)
  (parametric->/c [a b] (-> (-> a b) (listof a) (listof b)))
  (match xs
    ['()         null]
    [(cons x xs) (cons (f x) (my-map f xs))]))

(define/contract (foo x)
  (parametric->/c [a] (-> a a))
  x)

(struct leaf () #:transparent)
(struct node (l elem r) #:transparent)

(define/contract (insert x t)
  (-> number? (treeof number?) (treeof number?))
  (match t
    [(leaf) (node (leaf) x (leaf))]
    [(node l y r)
     (cond [(= x y) t]
           [(< x y) (node (insert x l) y r)]
           [(> x y) (node l y (insert x r))])]))
```



```Racket
#lang racket

;; Najpierw odpowiedź na zadane pytanie, czyli
;; przykład działania kontraktu wraz z informacją, jak polaryzacja
;; wpływa na obarczanie winą za złamanie kontraktu

;; Dobra implementacja foldla wygląda tak:

(define/contract (foldl f x xs)
  (parametric->/c (a b) (-> (-> a b b) b (listof a) b))
  (if (empty? xs)
      x
      (foldl f (f (car xs) x) (cdr xs))))

;; (foldl (λ (x y) (+ 1 y)) 0 '(1 2 3 4)) działa dobrze i mówi, że ta lista ma długość 4

;; po wywołaniu (foldl (λ (y) (+ 1 y)) 0 '(1 2 3 4))
;; dostajemy informację:

; foldl: contract violation
; [...]
;   in: the 1st argument of [...]
;   blaming: [...] użytkownik

;; czyli został złamany kontrakt na pierwszym argumencie (czyli
;; argumencie "f"), bo podaliśmy mu funkcję o złej arności. Argument
;; "f" występuje na negatywnej pozycji (jak go sobie wyobrazimy
;; w postaci [f x xs -> foldl] to na lewo od strzałki), więc to
;; wina użytkownika.


;; Zamieńmy teraz kolejność parametrów w funkcji f:

(define/contract (foldl-zły f x xs)
  (parametric->/c (a b) (-> (-> a b b) b (listof a) b))
  (if (empty? xs)
      x
      (foldl-zły f (f x (car xs)) (cdr xs))))

;; próba wywołania (foldl-zły (λ (x y) (+ 1 y)) 0 '(1 2 3 4)) skutkuje złamanym kontraktem

; foldl-zły: broke its own contract
;   promised: a
;   produced: #<b>
;   in: the 1st argument of
;       the 1st argument of

;; bo obiecano przynieść argument w pudełku podpisanym "a", a
;; tymczasem przyszło coś w pudełku podpisanym "b".

;; Okazało się przy tym, że złamanie kontraktu nastąpiło w innym miejscu:
;; w pierwszym argumencie pierwszego argumentu, czyli w pierszym argumencie "f", tym
;; oznaczonym literą "a". Argument "a" występuje na negatywnej pozycji
;; w (-> a b b), ale (-> a b b) występuje na negatywnej pozycji w
;; (-> (-> a b b) b (listof a) b), zatem (to nasze wystąpienie argumentu) "a"
;; występuje na pozytywnej pozycji w  (-> (-> a b b) b (listof a) b).
;; Dlatego za złamanie kontraktu winiony jest autor funkcji foldl-zły, a nie jej użytkownik

;; ----------------------------------prostszy przykład----------------------------------------


;; podobnie jest z prostszymi kontraktami
(define/contract (plus x y z)
  (-> positive? positive? positive? positive?)
  (+ x y z))

;; w kontrakcie (-> positive? positive? positive? positive?)
;; pierwsze trzy wystąpienia "positive?" są na negatywnych pozycjach,
;; a czwarte na pozytywnej

;; wywołanie (plus -1 2 3) to błąd z winy uzytkownika
;; (bo -1 na negatywnej pozycji nie spełnia kontraktu "positive?"

;; a zła implementacja

(define/contract (plus-zły x y z)
  (-> positive? positive? positive? positive?)
  (- x y z))

;; po wywołaniu (plus-zły 1 2 3) daje błąd z winy autora, bo wynik -4
;; na pozytywnej pozycji nie spełnia kontraktu "positive?"


;; ---------------------------koniec odpowiedzi na pytanie-----------------------------------

;; A teraz o tym drugim przykładzie, który spowodował wystawienie grzyba biedakowi pod tablicą
(define/contract (foldl-zły2 f x xs)
  (parametric->/c (a b) (-> (-> a b b) b (listof a) b))
  (if (empty? xs)
      x
      (foldl-zły2 f (f (car xs) x 0) (cdr xs))))

;; po wywołaniu  (foldl-zły2 (λ (x y) (+ 1 y)) 0 '(1 2 3 4)) Racket napisał
; arity mismatch;
;  the expected number of arguments does not match the given number
;   expected: 2
;   given: 3

;; Grzyb został wystawiony za to, że delikwent pod tablicą nie
;; wiedział na jakiej pozycji został złamany kontrakt.

;; Tymczasem kontrakt nie został złamany. Racket nie wspomina o
;; łamaniu kontraktu.

;; Żeby zrozumieć, dlaczego kontrakt nie został złamany, trzeba
;; wiedzieć, jak kontrakty są zaimplementowane.

;; O ile rozumiem, funkcja binarna "f" owinięta w kontrakt pozostaje
;; funkcją binarną. Jeśli takiej funkcji przekażemy trzy argumenty, to
;; ewaluator nie będzie umiał uruchomić funkcji "f" z powodu złej
;; arności. A skoro nie daje się uruchomić funkcji, to nie daje się
;; też zrobić pierwszej rzeczy podczas uruchamiania, czyli sprawdzić
;; kontraktu. Kontrakt niesprawdzony nie zostaje też złamany.


;; Podobnie jest z prostszym kontraktem dla plusa wyżej, gdzie
;; wywołanie (plus 1 2) daje bląd arności a nie złamanie kontraktu.



;; A dlaczego ten problem nie wystąpił przy przekazywaniu (poprawnej)
;; funkcji foldl unarnej funkcji (λ (y) (+ 1 y)) ?
;;
;; Bo po uruchomieniu foldl Racket zaczyna sprawdzenie
;; kontraktu (na tyle, na ile można go sprawdzić na tym etapie),
;; w szczególności sprawdza, czy (λ (y) (+ 1 y)) jest
;; binarną funkcją — a to można zrobić bez jej uruchamiania.

;; Co ciekawe, nasza implementacja kontraktów z wykładu 7 sobie z tym nie radzi.
;; Po dodaniu do pliku "kontrakty.rkt" z wykładu 7 definicji

;; (define (foldl f x xs)
;;   (if (empty? xs)
;;       x
;;       (foldl f (f (car xs) x) (cdr xs))))

;; (define foldl-contracted
;;   (wrap-contract
;;    (parametric/c (lambda [a b]
;;                    (->/c (->/c a b b) b (list/c a) b)))
;;    foldl))

;; i wywołaniu  (foldl-contracted (lambda (y) (+ 1 y)) 0 '(1 2 3 4))
;; dostajemy błąd arności a nie informację o złamaniu kontraktu
```

#### Kontrakty parametryczne

```racket
(require rackunit)

(define/contract (apply g e)
  (parametric->/c [a b] (-> (-> a b) a b))
  (g e))

(check-equal? (apply + 1) 1)
(check-equal? (apply identity 1) 1)

(define/contract (f2 f)
  (parametric->/c [a b c] (-> (-> a b c) (-> (cons/c a b) c)))
  (lambda (e) (f (car e) (cdr e))))

(check-equal? ((f2 +) (cons 1 2)) 3)

(define/contract (f3 list_of_f list_of_a)
  (parametric->/c [a b] (-> (listof (-> a b)) (listof a) (listof b)))
  (if (null? list_of_a)
      null
      (cons ((car list_of_f) (car list_of_a)) (f3 (cdr list_of_f) (cdr list_of_a)))))

(check-equal? (f3 (list (lambda (x) (* x x)) (lambda (x) (+ x x))) (list 10 20))
              (list 100 40))

(define/contract (f4 f e)
  (parametric->/c [a b] (-> (-> b (or/c false/c (cons/c a b))) b (listof a)))
  (let ([value (f e)])
    (if value
        (list (car value))
        null)))

(check-equal? (f4 (lambda (x) (cons x x)) 5) (list 5))

(define/contract (split-filter p? xs)
  (parametric->/c [a] (-> (-> a boolean?) (listof a) (cons/c (listof a) (listof a))))
  (foldr (lambda (x acc)
           (if (p? x)
               (cons (cons x (car acc))
                             (cdr acc))
               (cons (car acc)
                     (cons x (cdr acc)))))
         (cons null null)
         xs))

(check-equal? (split-filter number? (list 1 "1" 2 "2")) '((1 2) "1" "2"))

(define/contract (f6 f xs)
  (parametric->/c [a b] (-> (-> a b) (listof a) (-> b (listof a))))
  (lambda (b) xs))

(check-equal? ((f6 + '(1 2 3)) #t) '(1 2 3))

; Zadanie z egzaminu

(define/contract (append/map f xs)
  (parametric->/c [a b] (-> (-> a (listof b)) (listof a) (listof b)))
  (if (null? xs)
      null
      (append (f (car xs)) (append/map f (cdr xs)))))
```


## Wykład 8

### Cele wykładu

* Implemetacja systemu kontraktów
	* Kontrakty proste
	* Kontrakty dla funkcji
	* Polarność wystąpienia i blaming
	* Kontrakty parametryczne
* Wstęp do programowania Imperatywnego w Rackecie

### Notatki

Programowanie imperatywne -> TODO: def

Zmienianie wartości zmiennych za pomocą formy specjalnej`set!`
```
(define x 24)
(set! x 42)
```

```
(define (foo x)
  (set! x 1))

(define y 2)
(foo y)
y -> nadal będzie 2, bo foo to funkcja i w Racketcie mamy taki model obliczeń, że za x podstawimy wartość wszędzie, a następnie będziemy coś liczyć -> dlatego set! musi być formą specjalną, bo inaczej liczymy (miejsce w pamięci pod którym jest x musi zostać)
```

Zastanówmy się co to znaczy, że 2 programy są równe

```
(define (make-counter)
  (define cnt 0) ; lokalna zmienna
  (lambda ()
          (set! cnt (+ cnt 1))
          cnt))

(define cnt1 (make-counter)) ; -> cnt1 to procedura, która jest licznikiem
(define cnt2 (make-counter)) ; -> mamy drugi, niezależny licznik
(cnt1) ; -> 1
(cnt1) ; -> 2
(cnt1) ; -> 3
(cnt1) ; -> 4
(cnt2) ; -> 1
```

cnt1 i cnt2 nie są równe (mają inny wewnętrzny stan licznika) pomimo że wyglądają identycznie. Tutaj mamy przykład, gdzie 2 programy nie są identyczne, bo mają różne efekty uboczne

Można też stworzyć funkcje, które nie będą korzystały ze stanu w oczywisty sposób (korzysta ze stanu, który nigdzie w programie nie jest wspomniany), ale też nie będą równe
To bardzo komplikuje myślenie o programach

```
(define (bar1 f)
  (+ (f) (f)))

(define (bar2 f)
  (let ([x (f)]) (+ x x)))

(bar1 (make-counter)) -> 3
(bar2 (make-counter)) -> 2
```

Więc będziemy robić założenia, ale przez to musimy wprowadzić pewną samodyscyplinę:
* Możemy nie korzystać z programowania ze stanem (programowania imperatywnego), programować czysto funkcyjnie
* stan jest zawsze tylko lokalny, użycie stanu jest tylko lokalne (ograniczone do małego fragmentu kodu, pozostała część kodu nie musi wiedzieć, że programujemy imperatywnie)

TODO: ogarnąć
Przykład:
```
; s jest stanem, który nigdzie na zewnątrz nie wycieka
(define (foldl-map f s xs)
  (define ys (map (lamda (x) (let ([p (f x s)])
						      (set! s (cdr p))
							  (car p))
				  xs)))
  (cons ys s))
```

Twórcy Racketa stwierdzili, że nie chcemy modyfikować list, listy to jest trwała struktura danych

Możemy tworzyć listy, które nie są trwałe (czyli mutowalne, gdzie możemy zmieniać wartości listy, przepinać wskaźniki), ale do tego mamy specjalny konstruktor `mcons`

mcons ma strukturę identyczną do list trwałych, też to są takie pudełka, ale nie wyświetla się tak ładnie (lista - '(1 2), mutowalna lista - (mcons 1 (mcons 2 null))). W metadanych mają zapisane, że są mcons, a nie cons

```
(define p (mcons 1 2))
(mcar p) -> odpowiednik car (tylko dla mutowalnych par storzonych przy pomocy mcons)
(mcdr p) -> odpowiednik cdr (tylko dla mutowalnych par storzonych przy pomocy mcons)
```

mcons, mcar, mcdr są procedurami

set-mcar!, set-mcdr! -> UWAGA! to już jest procedura, a nie forma specjalna jak set!

Wykrzyknik na końcu, to jest konwencja (w LISPie wykrzyknik przy funkcjach, które modyfikują jakąś zawartość pamięci)

Dodawanie w listach
```
(define (insert-after p1 p2)
  (define p3 (mcdr p1))
  (set-mcdr! p2 p3)
  (set-mcdr! p1 p2))
```

TODO: queue na 2 listach ma zamortyzowany czas O(1)

Pomysł na kolejkę wygląda tak, że będziemy chcieli trzymać dodatkową parę, która trzyma wskaźniki na początek i koniec listy. I ta para to będzie właśnie nasza kolejka (moglibyśmy traktować parę i listę jako kolejkę, ale chcemy to tutaj wyodrębnić)

Konwencja nazywania zmiennych mutowalnych lub procedur, które są wersjami procedur normalnych, tylko że odnoszą się do mutowalnych zmiennych -> dodanie na początku nazwy m (mcons, mcar, mcdr, mqueue)

Struktury domyślnie są trwałe, więc jeśli chcemy stworzyć strukturę, która ma pole mutowalne (lub cała jest mutowalna), to do pola musimy dodać #:mutable (jeśli cała ma być mutowalna, to albo do każdego pola dopisujemy albo po wymienieniu wszystkich pól piszemy)

Uwaga, jeśli używamy struktury mutowalnej, to automatycznie tworzą nam się procedury do zmiany wartości pola -> set-NAZWA_STRUCT-NAZWA_POLA!

```
(provide
 mqueue?
 nonempty-mqueue?
 (contract-out
   [mqueue-empty? (-> mqueue? boolean?)]
   [make-mqueue   (-> mqueue?)]
   [mqueue-push   (-> mqueue? any/c void?)]
   [mqueue-pop    (-> nonempty-mqueue? any/c)]
   ; [mqueue-peek    (-> nonempty-mqueue? any/c)]
   [mqueue-join   (-> nonempty-mqueue? nonempty-mqueue? void?)]))

(struct mqueue
  ([front #:mutable]
   [back  #:mutable]))

(define (mqueue-empty? q)
  ; (null? (mqueue-front q)) -> moim zdaniem to wystarczy, bo jak nie ma początku to nie ma końca
  (and (null? (mqueue-front q))
       (null? (mqueue-back  q))))

(define (nonempty-mqueue? q)
  (and (mqueue? q) (mpair? (mqueue-front q))))

(define (make-mqueue)
  (mqueue null null))

(define (mqueue-push q x)
  (define p (mcons x null))
  (if (mqueue-empty? q)
      (set-mqueue-front! q p)
      (set-mcdr! (mqueue-back q) p))
  (set-mqueue-back! q p))

(define/contract (mqueue-pop q)
  (-> nonempty-mqueue? any/c)
  (define p (mqueue-front q))
  (set-mqueue-front! q (mcdr p))
  (if (null? (mcdr p))
      (begin
        (set-mqueue-back! q null)
        (mcar p))
      (mcar p)))

(define (mqueue-join q1 q2)
  (set-mcdr! (mqueue-back q1) (mqueue-front q2))
  (set-mqueue-back! q1 (mqueue-back q2))
  (set-mqueue-front! q2 null)
  (set-mqueue-back!  q2 null))
```

TODO: dodać
```
; definicja kontraktu -> można zastąpić predykat
(define (nonempty-mqueue/c
  (and/c mqueue? (not/c mqueue-empty?))))

(define (mqueue-peek q)
  (mcar (mqueue-front q)))
```

Tworząc programy imperatywne należy jasno określić co gdzie należy, co co ma robić. Jak mają obiekty o jakiś własnościach wchodzić ze sobą w interakcję i co ma się dziać

Podzielmy dane na byty, które mają swoją tożsamość i określmy za co odpowiadają, co do nich należy co nie, gdzie są granice (jasne granice)

TODO: predykat mpair?

Żeby zapanować nad złożonością, budujemy abstrakcję. Najpierw małe rzeczy, potem co raz większe (zapominamy jak działają, co robią te mniejsze, po prostu z nich korzystamy -> wierzymy, że działają dobrze, tak jak my chcemy, w określony sposób i że wszystko z nimi jest ok)

Jak wymusić abstrakcję na programiście?

Możemy podzielić program na moduły, które implementują jakąś funkcjonalność i dostęp do funkcjonalności z innych modułów mamy poprzez udostępniony interfejs/API, czyli zbiór funkcji (do których wnętrza nie możemy zaglądać), nie mamy dostępu do funkcji pomocnicznych/lokalnych

Możemy korzystać z modułów, dołączać inne pliki (importować ich zawartość lub interfejs)
```
(require "mqueue.rkt")
```

Tylko że musimy je najpierw udostępnić z danego modułu (interfejs modułu). Możemy dodatkowo przy udostępnianiu funkcji je okontraktować za pomocą `(contract-out (NAZWY_FUNKCJI KONTRAKTY))`, `(provide NAZWY_FUNKCJI)`
```
(provide
 mqueue?
 nonempty-mqueue?
 (contract-out
   [mqueue-empty? (-> mqueue? boolean?)]
   [make-mqueue   (-> mqueue?)]
   [mqueue-push   (-> mqueue? any/c void?)]
   [mqueue-pop    (-> nonempty-mqueue? any/c)]
   ; [mqueue-peek    (-> nonempty-mqueue? any/c)]
   [mqueue-join   (-> nonempty-mqueue? nonempty-mqueue? void?)]))
```

UWAGA! Nazwy plików (modułów) importowanych nie mogą zawierać spacji

Chcemy zaimplementować symulator obwodów logicznych.

Mamy druty, które możemy łączyć za pomocą bramek logicznych

Suma 2 liczb:
```
--- XOR ---
   X
--- AND ---
```

Chcemy, żeby bramka logiczna nasłuchiwała czy wartość na drucie się zmieniła, jeśli tak, to policzy wynik bramki logicznej jeszcze raz. To może być trudne, ale możemy odwrócić sytuację i to drut będzie propagował (przekazywał) informację, że coś się zmieniło do bramki logicznej

```
TODO: dodać implementację
```

Procedura `void` -> nic nie rób, przydaje się gdy w ifie chcemy nic nie robić
Forma specjalna `begin` -> po niej możemy napisać ciąg wyrażeń lub definicji i one są wykonywane jedna po drugiej. Używaliśmy wcześniej cukru syntaktycznego

```
(define (id x)
  (begin
   x))
```


## Wykład 9

### Cele wykładu

* Programowanie ze stanem
* Składnia konkretna i abstrakcyjna

### Notatki

Kalkulator

Struktura drzewiasta programów, wyrażeń:
```
    +
   /  \
  2    *
      / \
     3   -
        / \
	   7   21
2 + 3 * (7 - 21)
```

Składnia abstrakcyjna -> to jak myślimy o wyrażeniach
Składnia konkretna -> to jak zapisujemy wyrażenia

Parsowanie -> składnia konkretna na składnię abstrakcyjną
Pretty printing -> składnia abstrakcyjna na składnię konkretną

Zamiast dawać ciąg znaków `"(+ 123 78)"` będziemy dawać `` `(+ 123 78) ``, ponieważ pozbywamy się problemu jak parsować ciągi znaków (byłoby to wieloetapowe i jest to trudniejsze), ponieważ nie wiemy od razu, że 123 to jest liczba. Poprzez cytowanie korzystamy z typu S-Exp (S-wyrażenia) z języka LISP.

To co się dzieje, to powoduje, że nawiasów już nie mamy, mamy za to listę tokenów.

`` `(+ 123 78) `` -> `(+ 123 78)`, gdzie tokenami są `+`, `123`, `78`

UWAGA! To jest właśnie różnica pomiędzy Plaitem a Racketem. W Racketcie mamy cytowanie (`'`) i quasi-cytowanie (`` ` ``), a w Plait `'` służy do wprowadzania list (konstruktor listy (TODO:), a elemenenty muszą być tego samego typu), a `` ` `` do wprowadzania S-wyrażeń. Co ciekawe S-wyrażenia możemy od S-wyrażać tak jak to było w Racketcie (za pomocą `,`)

Konwecja -> `se` nazywamy argument, który jest S-wyrażeniem

Do sprawdzania typów mamy predykatory: s-exp-NAZWA_TYPU?

```racket
; parser Polesia (bardzo słaby)

(define (s-exp->op se)
  (if (s-exp-symbol? se)
      (let ([sym (s-exp->symbol se)])
	       (cond
		    [(symbol=? sym '+) (op-add)]
		    [(symbol=? sym '-) (op-sub)]
		    [(symbol=? sym '*) (op-mul)]
		    [(symbol=? sym '/) (op-div)]))
	  (error 's-exp->op "Syntax error")))

(define (s-exp->exp se)
  (cond
   [(s-exp-number? se) (exp-number (s-exp->number se))]
   [(s-exp-list? se)
     (let ([se-list (s-exp->list se)])
	      (if (= (length se-list) 3)
		      (exp-op (s-exp->op (first se-list))
			          (s-exp->exp (second se-list))
			          (s-exp->exp (third se-list)))
			  (error 's-exp->exp "Syntax error")))]
   ))
```

Jest funkcja `s-exp-match? WZORZEC S-wyrażenie`, która bierze 2 S-wyrażenia i sprawdza czy s-wyrażenie pasuje do wzorca.

Wzorzec powstaje jako stworzenie S-wyrażenia z tokenów, np. `` `(SYMBOL ANY ANY) ``, gdzie SYMBOL oznacza symbol, a ANY dowolne wyrażenie

Funkcja `(apply action list)`, TODO:
Np. jeśli action to operator +, a lista zawiera liczby, to dostaniemy sumę liczb, które zawiera lista

TODO: dowiedzieć się co znaczy `_` w condzie

`(require (only-in plait s-exp-content))` -> jeśli chcemy zaimportować z plaita jedną funkcję do Racketa, ponieważ jeśli zrobilibyśmy `(require plait)`, to otrzymalibyśmy to samo co ustawienie `#lang plait`, czyli pisalibyśmy w plaitcie

Jeśli chcemy zaimportować jakąś funkcję z Racketa do plaita, to możemy, ale musimy ją otypować, ponieważ Racket nie ma typów, a Plait je ma.
`(require (typed-in "parser.rkt"
                   (parse-Exp : (S-Exp -> Exp))))`

UWAGA! Tutaj się tworzy kontrakt (generowany przez Plaita), który jest dynamicznie sprawdzany, czyli jeśli chcielibyśmy go okłamać i wpisać typ, który by pasował i przeszedł typowanie, to nie przejdzie kontraktu

Jak się łączy języki typowane z beztypowymi, to się dzieją dziwne rzeczy na styku.

Funkcja `(assoc KLUCZ LISTA_KLUCZ_WARTOŚĆ)` i zwraca parę, w której klucz jest równy podanemu kluczowi

```
; syntax.rkt
(define-type Op
  (op-add) (op-mul) (op-sub) (op-div))

(define-type Exp
  (exp-number [n : Number])
  (exp-op [op : Op] [e1 : Exp] [e2 : Exp]))
```


```
; calc.rkt / eval.rkt
(require "syntax.rkt")
(require (typed-in "parser.rkt"
                   (parse-Exp : (S-Exp -> Exp))))

(define (eval-op op)
  (type-case Op op
    [(op-add) +]
    [(op-sub) -]
    [(op-mul) *]
    [(op-div) /]))

(define (eval e)
  (type-case Exp e
    [(exp-number n)    n]
    [(exp-op op e1 e2)
     ((eval-op op) (eval e1) (eval e2))]))

(define (calc s)
  (eval (parse-Exp s)))
```

`(require "pliczek")` w Plait daje chyba dostęp do wszystkiego


```
; parser.rkt
(require "syntax.rkt")
(require (only-in plait s-exp-content))
(provide parse-Exp)

(define (match-sexp pat s)
  (match pat
    ['ANY    (list s)]
    ['SYMBOL (and (symbol? s) (list s))]
    ['NUMBER (and (number? s) (list s))]
    ['()     (and (null? s)   null)]
    [(cons p1 p2)
     (and (pair? s)
          (let ([r1 (match-sexp p1 (car s))])
            (and r1
                 (let ([r2 (match-sexp p2 (cdr s))])
                   (and r2 (append r1 r2))))))]
    [_
     (cond
       [(symbol? pat) (and (symbol? s) (eq? pat s) null)])]))

(define (run-parser p s)
  (match p
    ['() (error "Syntax error")]
    [(cons (list pat action) rest-p)
     (let ([r (match-sexp pat s)])
       (if r
           (apply action r)
           (run-parser rest-p s)))]))

; ================================================

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
```

Gramatyki bezkontekstowe:
* Terminale (tokeny, atomy)
* Nieterminale (np. "expression", "operator")
* Lista produkcji:
	* "expression" -> NUMBER
	* "expression" -> "expression" "operator" "expression"
	* "operator" -> +
	* "operator" -> -
	* "operator" -> *
	* "operator" -> /

Możemy mieć niejednoznaczne gramatyki, czyli takie gdzie można rozumieć na kilka sposobów jakieś wyrażenie (różne drzewa powstają) lub jednoznaczne, gdzie jest tylko jeden sposób interpretacji

Musimy pokazać łączność, priorytety

Gramatyka wyrażeń arytmetycznych:
"expression" -> "expression" "add-operator" "mult-exp"
"expression" -> "mult-exp"
"mult-exp" -> "mult-exp" "mult-operator" "atop-exp"
"mult-exp" -> "atop-exp"
"atop-exp" -> NUMBER
"atop-exp" -> ( "expression" )


## Wykład 10

### Cele wykładu

* Gramatyki bezkontekstowe
* Parsowanie

### Notatki

DSL -> Domain Specific Language

UWAGA! Podczas pisania parserów, korzystając z abstrakcji gramatyk bezkontekstowych, trzeba uważać na kolejność podawania reguł (produkcji), ponieważ przeglądamy je zachłannie i zła kolejność może powodować, że coś nam się nie sparsuje lub sparsuje się nie tak jak tego oczekujemy

Ciekawostka -> Są parsery ll, lr i inne

Gramatyki często nie lubią lewostronnej rekursji

`(build-list n funkcja)` -> buduje listę n-elementową, gdzie funkcja przyjmuje indeks (od 0) i zwraca wartość

Prolog -> język do przeszukiwania wszystkich możliwości




## Wykład 11

### Cele wykładu

* Interpretery i kompilatory
* Składnia konkretna i abstrakcyjna, parsowanie (przypomnienie)
* Plait jako metajęzyk, S-wyrażenia jako składnia konkretna, algebraiczne typy danych jako składnia abstrakcyjna
* Strukturalny, metacykliczny interpreter wyrażeń arytmetycznych i logicznych
* Maszyna abstrakcyjna dla wyrażeń arytmetycznych
* Maszyna wirtualna i kompilator dla wyrażeń arytmetycznych
* Read-Eval-Print-Loop (REPL)
* Wyjątki/błędy (efekty obliczeniowe, interpretacja metacykliczna, monada błędów, notacja do jako makro, maszyna abstrakcyjna)

### Notatki

Interpreter == Ewaluator

Program text -> Front-end (Parser) -> Syntax Tree (Drzewo składni abstrakcyjnej) -> Interpreter (+ być może Real World, czyli interakcji ze światem zewnętrznym, np. w postaci input-output, stan zewnętrzny, komunikacja sieciowa, system plików) -> Answer

Komunikacja ze światem zewnętrznym może być efektem ubocznym, który dostarcza nam dodatkowych informacji do policzenia czegoś


Trzeba ustalić język interpretujący, czyli definiujący albo jeszcze inaczej meta-język, jest to język, w którym będziemy pisać interpretery

Będziemy do tego wykorzystywać język Plait (statyczne typy), dzięki typom Plaita możemy kontrolować strukturę interpreterów w znacznie lepszy sposób niż w przypadku wykorzystania czystego Racketa

Wyraźnie oddzielimy składnię konkretną od składni abstrakcyjnej

W Racketcie mamy tę własność, że dane i programy są praktycznie nie rozróżnialne, programy to są listy (S-wyrażenia tak naprawdę). Moglibyśmy zlać składnię abstrakcyjną i składnię konkretną w jedną całość i po prostu interpretować S-wyrażenia

Możemy sobie myśleć, że definiując typ Exp definiujemy produkcje naszej gramatyki bezkontekstowej składni abstrakcyjnej (mamy konstruktory drzewka)

Funkcja `parse` będzie nam mówić jak wygląda składnia konkretna naszego języka, które rzeczy są "dobre" (bo zawężamy wszystkie S-wyrażenia do tych, które potrafimy parsować)

Konwencja -> używamy takich nawiasów {} do programów w składni konkretnej, chcemy żeby to się jeszcze troszeczkę odróżniało wizualnie od meta-języka, np. `{SYMBOL ANY ANY}`


Testowanie:
Mamy procedurę `test` (testy pozytywne), która przyjmuje 2 argumenty, oblicza je i sprawdza czy otrzymaliśmy to samo, jeśli nie, to zgłasza błąd

Mamy procedurę `test/exn` (testy negatywne, rzucające bład), które przyjmuje 2 argumenty, oblicza je i sprawdza czy otrzymaliśmy ten samo bład, ten sam wyjątek (porównuje wiadomości zwrócone)

Możemy takie testy grupować, żeby były ładnie uporządkowane za pomocą
```
(module+ test
  (test (parse `2) (numE 2))
  (test/exn (parse `{{+ 1 2}}) "invalid input"))
```

Możemy sobie wielokrotnie w programie otwierać ten moduł i dodawać testy po napisaniu jakiegoś fragmentu kodu.

Testy zostaną "zgromadzone" na końcu pliku i dopiero wykonane, pozwala to na pisanie testów sprawdzających specyfikację funkcji przed jej zdefiniowaniem

```racket
(module+ test (print-only-errors #t))
```

Jeśli testy nie przejdą, to dostajemy informację (w której linijce był test, jak wyglądał, czego oczekiwano i co otrzymano), a jeśli przejdą, to nic nie dostajemy. Jeśli tej linijki byśmy nie dodali, to dostaniemy informacje o każdym teście nawet tym, który przeszedł pomyślnie

Możemy dodać jeszcze opcję pokrycia testami w DrRacketcie:
Language -> Choose Language -> Show Details -> Syntactic test suite coverage

Dostajemy zaznaczone fragmenty kodu, które nie są pokryte w testach jednostkowych

Ewaluator jest zdefiniowany strukturalnie rekurencyjnie!
Dzięki temu łatwo jest o tym wnioskować za pomocą indukcji strukturalnej i program jest czytelny

Możemy chcieć kontrolować to co użytkownik dostanie na wyjściu -> do tego wykorzystujemy `printer`


`(trace eval)` -> chcemy poznać historię wywołań i powrotów z wywołań funkcji eval -> wcięcia mówią nam co sobie odpowiada

Możemy coś odraczać, jeśli nie wiemy jeszcze jak coś napisać, ale chcemy, żeby całość się parsowała i typowała -> `....` (to taki placeholder) -> Jest to wyrażenie o dowolnym typie

UWAGA! Pozostała część kodu nie może korzystać z elementu, w którym jest placeholder `....`, ponieważ dostaniemy wyjątek

Maszyna abstrakcyjna:

Maszyna abstrakcyjna zmienia obraz obliczeń, zawiera zawsze pełną informację co trzeba zrobić, żeby doliczyć się do wartości -> otrzymujemy to za pomocą dodania stosu (tak zwany Control Stack), stosu, który zawiera informacje o przepływie sterowania w programie, co dalej ma się wydarzyć (później się dowiemy, że to jest kontynuacja w pewnej pierwszorzędowej reprezentacji)

Konwencja -> nazywamy `evalAM`, `continueAM`, `runAM`, żeby podkreślić, że używamy maszyny abstrakcyjnej

W `evalAM` mamy rekurencję ogonową, czyli dochodzi do takiej iteracji aż dojdziemy do wartości

Zauważmy, że funkcja `evalAM` przestała być strukturalnie rekurencyjna!


Mamy inny sposób interpretowania programów, korzystając z kompilatora

Program text -> Front-end (Parser) -> Syntax Tree (Drzewo składni abstrakcyjnej) -> Compiler -> Translated Program -> Interpreter (or Machine, Virtual Machine) (+ być może Real World, czyli interakcji ze światem zewnętrznym, np. w postaci input-output, stan zewnętrzny, komunikacja sieciowa, system plików) -> Answer

Powinniśmy dostać odpowiedzi odpowiadające sobie, korzystając z kompilatora (+ może maszyny wirtualnej) jak i natychmiastowej interpretacji.

UWAGA! One nie muszą być identyczne (np. mogą się różnić formatem), ale powinny w pewnym ustalonym sensie sobie odpowiadać

Tutaj definiujemy sobie tak bardziej abstrakcyjnie stos jako alias na typ danych i operacje, które chcemy wykonywać na tym stosie (ale można tak jak poprzednio)


Można skorzystać z akumulatora w procedurze `compile`


Rozszerzymy sobie nasz język o wyrażenia boolowskie, dołożymy do składni abstrakcyjnej 2 operatory `eql` (równość liczb, ==), `leq` (mniejsza lub równa liczba, <=), a do wyrażeń dorzucamy `ifE`, `condE`

`ANY ...` -> oznacza, że oczekujemy 0 lub więcej (dowolnej) rzeczy postaci ANY, czyli dowolnej

Konwencja -> listę S-wyrażeń oznaczamy `ss`

UWAGA! Do języka nie dorzuciliśmy stałych `true` i `false`, ponieważ nie jest to konieczne do obsługi wyrażeń boolowskich, które nas interesują (ale moglibyśmy)

Chcemy być eleganccy, więc typ wartości wynikowej dzielimy na liczby `numV` i wartości boolowskie `boolV`

Musimy zdefiniować sobie jak rozumiemy operatory, dzielimy je po tym jakie mają argumenty i co zwracają -> do każdej musimy napisać funkcję, która będzie nam zwracać funkcję, dzięki której będziemy wiedzieć jak coś liczyć (TODO: ?)

Mamy tutaj doczynienia z meta-cyklicznością, czyli meta-język interpretuje rzeczy z języka definiowanego za pomocą takich samych konstrukcji

Rozumiejąc strukturę conda, czyli fakt, że cond to są zagnieżdżone ify, potraktujemy conda jako cukier (lukier) syntaktyczny

Będziemy odcukrzać conda w procedurze `cond->if`, czyli zamieniać conda na zagnieżdżone ify

UWAGA! Kolejność rzeczy w parserze ma znaczenie, ponieważ jak dopasuje wzorzec, to wchodzi w ten warunek

Więc jeśli mamy `` `{cond ANY ...} `` i `` `{SYMBOL ANY ANY} ``, to musimy to dać w kolejności: `` `{cond ANY ...} ``, `` `{SYMBOL ANY ANY} ``

UWAGA! Odcukrzanie można robić w wielu miejscach, możemy to zrobić np. w parserze lub ewaluatorze (to rozwiązanie jest słabe jeśli mamy rekurencję, bo odcukrzamy pewne rzeczy wielokrotnie). Ale fajnie też jest zrobić drugiego parsera, który jako input przyjmuje output z pierwszego parsera i odcukrza wszystko co może

UWAGA! Jeśli odcukrzymy rzeczy w parserze, to będą one występować w postaci nieodcukrzonej tylko w składni konkretnej, nie będzie ich w składni abstrakcyjnej!

My tutaj kontrolujemy typy dynamicznie, my sami zajmujemy się rzucaniem ewentualnych wyjątków dotyczących typów. Tutaj nie mamy systemu typów (ale moglibyśmy sobie język o niego wzbogacić i miałby on miejsce zaraz po parserze, sprawdzilibyśmy raz typy statycznie i więcej byśmy się typ nie przejmowali)

System typów jest taką aproksymacją rozróżnienia co jest bezpieczne do wykonania a co nie. System typów będzie trochę podobny do ewaluatora. Zbudowanie dobrego systemu typów pozwoli na to, że w ewaluatorze nie powinien być rzucony wyjątek dotyczący "type error"

UWAGA! System typów będzie zawsze wyrzucał za dużo (prawie zawsze), ale wszystko co przepuści, będzie dobrze wykonane (przepuszczone rzeczy mają taką własność)

Parser -> kontrola poprawności względem pewnej gramatyki
System typów -> kontrola poprawności pod względem semantycznej (w sposób syntaktyczny zapewnia nas o tym, że jak będę interpretował program, to złe rzeczy się nie wydarzą)


REPL to będzie taki prompt -> repl.rkt (TODO: dodać)

Dodanie errora do języka, dodajemy formę specjalną `errorE`, który będzie przyjmować 2 argumenty: lokalizację (kto jest winny) i informacja o błędzie

Możemy `errorE` z naszego języka opisać w ewaluatorze jako `error` (napisany wcześniej mechanizm rzucania wyjątków w Plaitcie), ale to spowoduje, że będziemy w przypadku błędu wyskakiwać z REPLa (ponieważ wyjątek będzie się propagował)

Ale możemy też dodać nowy typ wartości wynikowej ewaluacji Answer (gdzie albo to będzie wartość typu Value albo error składający się lokalizacji i informacji o błędzie)

Stworzyliśmy sobie errora, ale co jeśli będziemy chcieli dodać do siebie 1 i jakiś wyjątek? (powinniśmy zwrócić wyjątek)

Wykorzystamy operację `bind`, która przyjmuje 2 argumenty: coś typu Answer i funkcję, która mówi nam co się wydarzy, jeśli pierwszy argument zwrócił wartość (czyli nie było tam wyjątku). W `bind` propagujemy wyjątki!

Zastosowaliśmy monadę błędów (error monad). Wcześniej poznaliśmy monadę identyczności

Monada to jest taka struktura, która mówi o pewnym typie i o 2 operacjach: `return`, `bind`

`return` -> jak z wartości zrobić obliczenie
`bind` -> jak składać ze sobą obliczenia

Wszystkie systemu LISPowe słyną z kilku różnych rzeczy, wśród tych cech dość unikatowych jest system makr, który pozwala na konstruowanie form specjalnych (pozwala na więcej, ale to będzie nas teraz głównie interesować) -> dzięki temu możemy samemu stworzyć np. swojego leniwego anda, który jest formą specjalną, swojego leta, swojego let*, swojego ora

Systemu makr użyjemy, żeby nie pisać wielokrotnie `bind` w ewaluatorze -> `do` (inspirowane Haskellem), który wiąże zmienne z wartościami (jeśli coś się do wartości oblicza, czyli nie zwraca wyjątku)

`do` to taki uogólniony let* (bo kolejne związania mogą być widoczne w kolejnych wyrażeniach)

`do` jest takie imperatywne w swoim sformułowaniu, wyrażenia w naszym języku nie tylko dają wartości, ale coś jeszcze robią, mogą powodować efekty. To już jest bardziej wykonanie instrukcji, a nie liczenie wartości wyrażenia

Jak dokładamy wyjątki do języka, to stajemy się bardziej imperatywni

`define-syntax` -> definiowanie makr
`syntax-rule` -> będą reguły dopasowania

TODO: dodać `do`



## Wykład 12

### Cele wykładu

* Interpretery języka z wiązaniem zmiennych (wyrażenia let): model podstawieniowy vs. model środowiskowy
* Adresowanie leksykalne (indeksy de Bruijna)
* Funkcje jako wartości pierwszego rodzaju: interpretacja metacykliczna

### Notatki

Chcemy dodać możliwość występowania zmiennych w naszym języku, dlatego do składni abstrakcyjnej dodamy konstruktor zmiennych `varE` (symbol x) i lokalną defincję zmiennej (wiązanie zmiennej) `letE` (symbol x, wartość wyrażenia e1, ma być widoczna w wyrażeniu e2)

Przechwycenie zmiennej -> UWAGA! Trzeba bardzo uważać

TODO: def

Przykład przechwycenia zmiennej:
`` (subst (parse `{let x 1 y}) 'y (parse `x)) ``
`(letE 'x (numE 1) (varE 'x))`

Model podstawieniowy
Model środowiskowy

W modelu podstawieniowym są pewne pułapki

Środowisko -> zoptymalizowane podstawienie, odroczone podstawienie -> struktura danych, która będzie pamiętała, co powinno być wstawione za daną zmienną, ale będzie dokonywać podstawienia tylko wtedy, gdy sięgamy po tą zmienną

Kiedy korzystamy ze środowiska, to tak bardzo nie potrzebujemy stałych, nie musimy reprezentować wartości logicznych przez stałe logiczne, wystarczy trzymać odpowiednie wartości w środowisku

Środowisko wiąże zmienne z ich wartościami, wiąże identyfikatory z pewnymi informacjami o nich

Jedną z możliwych implementacji środowiska jest lista wiązań (binding)

`extend-env` -> rozszerzenie środowiska o nową parę identyfikatora i informacji o nim
`lookup-env` -> wyszukiwanie informacji o danym identyfikatorze

Kiedy środowisko to funkcje z identyfikatorów w informacje o nich, to dużo łatwiej napisać `lookup-env`, ponieważ to jest aplikacja, trochę trudniejsza implementacja `extend-env`, ale nie bardzo

Można też wykorzystywać bardziej optymalne struktury danych, jak kopce czy drzewa, gdzie koszt wyszukiwania w środowisku identyfikatora i rozszerzania środowiska będzie dużo mniejszy

Przy tworzeniu translatorów bardzo często wykorzystuje się środowiska

W ewaluatorze przy ewaluowaniu zmiennej, szukamy wartości w środowisku
W ewaluatorze przy ewaluowaniu leta, odraczamy podstawienie i przygotowywujemy środowisko, rozszerzając je

UWAGA! Jak szukamy czegoś w środowisku, to jak znajdziemy pierwsze wystąpienie, to kończymy

UWAGA! Środowisko początkowe nie musi być puste, może zawierać predefiniowane rzeczy


Alfa-równoważność -> wyrażenia, które różnią się tylko nazwami zmiennych związanych, można je skompilować do jednoznacznej, identycznej postaci beznazwowej (TODO: ?)

Może zamiast nazw zmiennych, powinniśmy używać miejsc, w których dane zmienne zostały związane, jak daleko od miejsca związania zmienna zostaje użyta (chcemy używać liczb)

Jak definiujemy odległość?
Ile letów dzieli wystąpienie zmiennej od jej definicji == pozycja na liście w środowisku (zaczynamy od 0, nowe rzeczy dajemy na początek)

`` `{let x 1 {let y 2 {+ x y}}} ``
`(nlet (num 1) (nlet (num 2) (+ (var 0) (var 1))))`

W `nlet` nazwy nie mają znaczenia, liczy się tylko pozycja wystąpienia wiązania. W ten sposób łatwiej pokazać, że 2 rzeczy są równe

Taką reprezentację z leksykalnymi adresami (indeksami De Browna/Bruijna TODO: -> on wprowadził je do rachunku lamda, ci co zajmują się kompilatorami myślą bardziej o offsetach, adresach statycznych/leksykalnych, gdzie liczymy stopień zagnieżdżenia letów)

UWAGA! Ponieważ nie mamy nazw zmiennych, to środowisko składa się tylko z informacji o identyfikatorach (wartościach)

Żeby przejść od zmiennych z nazwami do zmiennych bez nazw, musimy skorzystać z funkcji `translate`

`address-of` -> znajduje adres/indeks zmiennej w środowisku



## Wykład 13

### Cele wykładu

* Domknięcie funkcji, operacje prymitywne jako wartości, wiązanie statyczne a dynamiczne
* Rekursja: kodowania w terminach funkcji i aplikacji, a także referencji
* Letrec: interpreter metacykliczny, wykorzystanie jawnych referencji w metajęzyku (typ Boxof)
* Modyfikowalny stan: niejawne referencje w stylu Racketa (set!) z wykorzystaniem jawnych referencji w metajęzyku

### Notatki

dorzucamy lambda-abstrakcję `lamE` (inaczej procedura, funkcja) i aplikację `appE`

TODO: zrozumieć te rzeczy + def
* jest jeszcze jedna możliwość
* Call by name
* Będzie to język gorliwy

Z definicji typu `Value` możemy ułożyć następujące równanie (bo mamy `funV`):
`Value = (Value -> Value)` -> tutaj "=" w pewnym sensie i przy pominięciu `numV`, `boolV`

Takie równanie to jest istota interpretacji funkcji w świecie bez typów (gdy nasz język, który interpretujemy nie ma typów)

Model eval/apply -> budujemy 2 funkcje, które mają ze sobą współpracować -> funkcja `apply` ma za zadanie aplikować rzeczy aplikowalne do wartości (to mogą być funkcje, operacje prymitywne)

W `eval` zmienia się lambda-abstrakcja i aplikacja

UWAGA! Poprawnie mówi się -> `aplikujemy funkcję do argumentu`


Chcemy dodać domknięcia funkcji

Dodając środowisko tworzymy statyczne wiązanie zmiennych, jeśli byśmy tego nie dodali, to mielibyśmy dynamiczne wiązanie zmiennych

Statyczne wiązanie zmiennych -> funkcja zapamiętuje wartości zmiennych wolnych z momentu swojej definicji i te wartości wykorzystuje później, gdy jest aplikowana
Statyczne wiązanie zmiennych -> funkcja nie zapamiętuje wartości zmiennych wolnych z momentu swojej definicji i sięga po te wartości w momencie aplikacji (w szczególności te wartości mogą być zupełnie inne)

Domknięcie -> dodanie środowiska


Rekurencja

```racket
(define (fact n)
  (if (= n 0)
      1
	  (* n (fact (- n 1)))))
```

```racket
(letrec ([fact (lambda (n)
                 (if (= n 0)
                     1
	                 (* n (fact (- n 1)))))]))
```

```racket
(define (fact-self n)
  (define (fact f)
	(lambda (n)
      (if (= n 0)
          1
  	      (* n ((f f) (- n 1))))))
  ((fact fact) n))
```

```racket
#|
(fact-self 3)
=>
((fact fact) 3)
=>
((λ (n) (if (= n 0) 1 (* n ((fact fact) (- n 1))))) 3)
=>
(if (= 3 0) 1 (* 3 ((fact fact) (- 3 1)))))
=>
(* 3 ((fact fact) (- 3 1))))
=>
(* 3 ((λ (n) (if (= n 0) 1 (* n ((fact fact) (- n 1))))) 2))
=>
(* 3 (* 2 * ((fact fact) 1)))
=>
...
=>
6
|#
```

Można w podobny sposób zdefiniować sobie rekurencyjną definicję silni, nie korzystając z rekurencji. Skorzystamy z operatoru punktu stałego (operator `fix`)

W naszym przypadku operator punktu stałego znajdzie dla naszego funkcjonału punkt stały, który jest definicją rekurencyjną funkcji `fact`

UWAGA! Jest nieskończenie wiele operatorów punktu stałego

```racket
(define (fact-fix n)
  (define (fix f)
    (let ([w (lambda (g) (f (lambda (z) ((g g) z))))])
      (w w)))
  (define (fact g)
    (lambda (n)
      (if (= n 0)
          1
          (* n (g (- n 1))))))
  ((fix fact) n))
```

```racket
#|
(fact-fix 3)
=>
((fix fact) 3)
=>
((w_fact w_fact) 3) (UWAGA! to nie jest w tylko omega, jest to omega_fact)
gdzie w_fact = (λ (g) (fact (λ (z) ((g g) z))))
=>
(fact ((λ (z) ((w_fact w_fact) z))) 3)
=>
((λ (n) (if (= n 0) 1 (* n ((λ (z) ((w_fact w_fact) z)) (- n 1))))) 3)
=>
(if (= 3 0) 1 (* 3 ((λ (z) ((w_fact w_fact) z)) (- 3 1))))
=>
(* 3 ((λ (z) ((w_fact w_fact) z)) (- 3 1)))
=>
(* 3 ((w_fact w_fact) 2))
=>
...
=>
6
|#
```

Chcemy dodać letreca do naszego języka

W ewaluatorze przy interpretacji letreca musimy zrobić tricka, bo normalnie mamy 2 rzeczy definiowane wzajemnie rekurencyjne, ale jeszcze się nie policzyły, więc drugiej nie możemy zdefiniować, dlatego jedną z wartości, której używamy do definicji drugiej pakujemy w bezargumentową lambdę (odroczenie) (+ modyfikacja środowiska zamiast `Value` trzymamy `-> Value`)

Możemy jeszcze otrzymać rekurencję za pomocą mutowalnego stanu:

```racket
(define (fact-state n)
  (let ([fact 'undefined]) ; można tu wrzucić fałsz lub cokolwiek innego
    (begin
      (set! fact
            (lambda (n) (if (= n 0)
                       1
                       (* n (fact (- n 1))))))
      (fact n))))
```

```racket
#|
< (fact-state 3) | env >

=>

< (begin
    (set! fact
          (λ (n) (if (= n 0)
                     1
                     (* n (fact (- n 1))))))
    (fact 3))

| env' >

gdzie env' = env[fact : 'undefined]

=>

< (begin
    (set! fact v)
    (fact 3))

| env' >

gdzie v = (funV n (if (= n 0) 1 (* n (fact (- n 1)))))) env')

=>

< (fact 3) | env'' >

gdzie env'' = env[fact : v]
      v = (funV n '(if (= n 0) 1 (* n (fact (- n 1)))))) env'')

=>

< (if (= n 0) 1 (* n (fact (- n 1)))))) | env''[n : 3] >

=>

< (* 3 (fact 2)) | env''[n : 3] >

=>

...

=>

6
|#
```

`box` -> zaalokowanie pamięci i wrzucenie wartości
`unbox` -> dereferencja
`set-box!` -> modyfikowanie zawartości pamięci

Nasz język rozszerzamy o `beginE` (chcemy zmodyfikować pamięć za pomocą `setE`, ale potem musimy wykonać sekwencję operacji, dlatego to dodajemy), `setE`

Do typu `Value` dodajemy `voidV` (to mogłoby być cokolwiek innego, np. wartość 42) -> `setE` zwraca `voidV`


## Wykład 14

### Cele wykładu

* Referencje jako wartości
* Własna implementacja sterty w interpreterze, monada stanu
* Listy leniwe i strumienie, odraczanie obliczeń i spamiętywanie wartości, interpreter języka ze strumieniami

### Notatki

Nasza implementacja sterty to będzie lista wartości typu `Storable` (będziemy adresować rzeczy od 0, pozycja na liście to adres)

Potrzebujemy zarówno naszego środowiska jak i naszej sterty do ewaluowania


Za pomocą systemu makr wprowadzimy małe usprawnienie notacyjne

`with` -> słowo kluczowe (nasze makro)


Leniwość -> odraczamy obliczenia + spamietujemy ich wynik

W obliczeniach często dobrze jest robić tyle ile trzeba, a nie tyle ile można. W szczególności pewne fragmenty obliczeń zdrowo jest odraczać do momentu, kiedy ich wartości naprawdę są potrzebne


`delay` -> forma specjalna
`force` -> wymuszenie wyliczenia


Strumienie == listy leniwe

Strumień -> głowa listy i odroczony ogon

`stream-ref` -> wzięcie n-tego elementu strumienia
`stream-filter` -> przefiltrowanie strumienia

`stream-ref`, `stream-filter` piszemy analogicznie do odpowiadających funkcji na zwykłych listach

Nieskończone strumienie (infinite streams)

Skoro możemy coś odraczać, to możemy pomyśleć o nieskończonych strumieniach (w nieskończoność, bardzo daleko w czasie coś odraczamy)

Możemy nieskończone strumienie ze sobą składać

`map2` -> bierze 2 strumienie i przemapowywuje je na nowy strumień za pomocą funkcji f


Dzięki składaniu nieskończonych strumieni możemy w łatwy sposób tworzyć dowolne ciągi arytmetyczne lub geometryczne jak i inne funkcje rekurencyjne





Implementacja nieskończonych list/list leniwych/strumieni

Nasz język rozszerzamy o 3 konstrukcje, które pozwolą nam na zaimplementowanie strumieni -> `consE`, `carE`, `cdrE`

Typ `Value` powiększa nam się o `consV` (równie dobrze możemy to nazwać `streamV`)

`Promise` -> alias na typ `Boxof Thunk`, czyli na referencję/pudełko z `Thunk`
`Thunk` -> odroczone obliczenie


Styl przekazywania kontynuacji (CPS - Continuation Passing Style)

W ewaluatorze dokładamy kontynuację `k : (Value -> 'a)` jako argument funkcji `eval`


## Wykład 15

### Cele wykładu

* Interpreter w stylu kontynuacyjnym, operator sterowania call/cc
* Inferencja typów w języku funkcyjnym z typami prostymi

### Notatki

Continuations -> `call/cc` -> TODO: coś dodatkowego

Styl kontynuacyjny (CPS)

```racket
(define (fact n cont)
  (if (= n 0)
      (cont 1)
	  (fact (- n 1) (lambda (v)
	    (cont (* n v))))))

; cont -> (lamda (x) x)
; cont -> co chcemy zrobić z wynikiem funkcji, która nam się policzy, np. (lamda (x) (+ x 1)) da nam n! + 1
```

Styl kontynuacyjny pozwala nam oddzielić istotę algorytmu od implementacji konkretnych elementów.

Można wiele rzeczy wyrazić za pomocą stylu kontynaucyjnego, obliczenia z wbudowanym stanem, przeszukiwania z nawrotami, wyjątki



## Wstęp z MP Fajrankpacka

TODO: manual racket -> stronka

Syntactic Forms
(require require-spec …) : Importowanie innego pliku
(provide provide-spec …) : Eksportowanie do innego pliku


Listy
po co ja poszłam na studia ja pierdole było pracować w żabce pofarbowałabym włosy na różowo i mówiła kochanie do klientów
(cons rzecz rzecz) : zwraca parę

```Racket
(cons 1 2)
'(1 . 2)

(cons 1 '())
'(1)

(cons 1 (list 2 3 4))
'(1 2 3 4)

(cons (list 1 2 3) (list 4 5 6))
'((1 2 3) 4 5 6)

(cons (list 1 2 3) 4)
'((1 2 3) . 4)
```

(build-list n proc) : tworzy liste aplikując proc na liczby od 0 do n-1
(length n) : długość listy
(list-ref lista n) : zwraca n-ty element w liście licząc od 0
(append lista lista …) : zwraca listę, która jest konkatenacją danych list

```Racket
(append 1 (list 2 3 4))
rzuca expected list? given 1

(append (list 1) (list 2 3 4))
'(1 2 3 4)

(append (list 1 2) (list 3 4) (list 5 6) (list 7 8))
'(1 2 3 4 5 6 7 8)
```

(reverse lista) : odwraca listę
(map proc lista) : zwraca listę z procedurą zaaplikowaną do każdego elementu listy od początku do końca
(foldl proc init lista) : dorzuca każdy element z listy po procedurze do obiektu podanego w init

```Racket
(foldl cons '() '(1 2 3 4))
'(4 3 2 1)

(foldl + 0 '(1 2 3 4))
10

(foldl (lambda (x y) (- y x)) 0 '(1 2 3 4))
-10
```

Mutowalne pary i listy, vectory
(mcons rzecz rzecz) : też para tylko mutowalna lol
(mcar para mutowalna)
(mcdr para), (mcdr para) : nie działa dla zwykłej pary
(set-mcar! {co chcesz zmienić} {na co}) : sens mutowalnych par jest taki że możesz zmieniać ich wartości
(set-mcdr! {co chcesz zmienić} {na co}) : jak powyżej
vector: tablica o stałej liczbie komórek z stałym czasem ich accessowania
(make-vector rozmiar [typ]) : tworzy wektor o podanej ilości komórek danego typu
(vector-ref vector pozycja) : accessuje n-tą komórkę w podanym vectorze
(vector-set! vector pozycja wartość) : no chyba zrozumiale nie

Structy
(struct nazwa ([nazwa pola] [nazwa pola] …)) : tworzenie szkieletu struktury (jak w c), z którego potem będziemy mogli robić prawdziwe obiekty

(struct cos (pole) #:transparent)
[nazwa rzeczy #:mutable]
(nazwa (nazwa struktu wartości pól)) : obiekt
(define nazwa (nazwa struktu wartosci pol)) : no i teraz fajno bo masz sobie strukt i mozesz sie do niego odnosic a nawet edytować jak mutable dałeś
(set-{nazwa struktu}-{nazwa pola}! nazwa zdefiniowanego structu wartość komórki)

```Racket
(struct papiez ([godzina_smierci #:mutable]) #:transparent)
(define rzulty (papiez 2137))
(set-papiez-godzina_smierci! rzulty 69)
```


## Rozwiązania egzamin 2022

### Zad 1

### Zad 2

A = cons
B = list
C = cons
D = append
E = list

### Zad 3

```racket
(define (split xs)
    (define mid (floor (/ (length xs) 2)))
    (define (it xs acc1 acc2)
        (if (null? xs)
            (cons acc1 acc2)
            (if (<= (length xs) mid)
                (it (cdr xs) acc1 (cons (car xs) acc2))
                (it (cdr xs) (cons (car xs) acc1) acc2))))

    (define result (it xs '() '()))
    (cons (reverse (car result)) (reverse (cdr result)))
)

(define (merge xs ys)
  (cond [(null? xs) ys]
        [(null? ys) xs]
	[else (if (<= (car xs) (car ys))
		     (cons (car xs) (merge (cdr xs) ys))
		     (cons (car ys) (merge xs (cdr ys))))]))

(define (mergesort xs)
  (if (<= (length xs) 1)
      xs
	  (let ([yss (split xs)])
           (merge (mergesort (car yss)) (mergesort (cdr yss))))))
```

Funkcja nie generuje nieużytków -> NIE


### Zad 4

Zasada indukcji:

```
Niech P będzie własnością AList, jeżeli zachodzą warunki:
* zachodzi P(a-null)
* dla dowolnego elementu x typu 'a oraz dowolnej listy xs typu (AList 'a), jeśli zachodzi P(xs), to zachodzi P((a-cons x xs))
* dla dowolnych list xs, ys typu (AList 'a) jeśli zachodzi P(xs) i P(ys), to zachodzi P((a-append xs ys))

Wtedy P jest własnością AList
```

### Zad 6

```racket
(define/contract (append/map f xs)
  (parametric->/c [a b] (-> (-> a (listof b)) (listof a) (listof b)))
  (if (null? xs)
      null
      (append (f (car xs)) (append/map f (cdr xs)))))
```

Kontrakty są sprawdzane w czasie działania programu w momencie, kiedy funkcja jest wywoływana, a typy są sprawdzane w czasie kompilacji

### Zad 7

`(lambda (x) (lambda (y) ( lambda (z) ((x z) (y z)))))`

`('X -> 'Y)`
`('X -> ('Y -> 'Z))`
`('X -> ('Y -> ('Z -> 'W)))`
`('X -> ('Y -> ('Z -> (('X 'Z) ('Y 'Z)))))`
`('('Z -> 'A) -> ('Y -> ('Z -> (('X 'Z) ('Y 'Z)))))`
`(('Z -> 'A) -> (('Z -> 'B) -> ('Z -> (('X 'Z) ('Y 'Z)))))`
`(('Z -> ('B -> 'C)) -> (('Z -> 'B) -> ('Z -> 'C)))`

Typuje się i typ to: `(('a -> ('b -> 'c)) -> (('a -> 'b) -> ('a -> 'c)))`

`((lambda (x) (x x)) (lambda (x) (x x)))`

Nie typuje się!

`(((lambda (x) x) (lambda (x) x)) 42)`

Typuje się i typ to: Number

#### Dodatkowy przykłady na typy:

`(lambda (x) (lambda (y) (lambda (z) (+ x (+ y z)))))`

`('a -> ('b -> ('c -> 'd)))`
`'a = Number`
`'b = Number`
`'c = Number`
`'d = Number`

`(Number -> (Number -> (Number -> Number)))`

Wiemy, że `+` to procedura, której typ to `(Number Number -> Number)`


`(lambda (x) (lambda (y) (lambda (z) (z x y))))`

`('a -> ('b -> ('c -> 'd)))`
`('a -> ('b -> (('a 'b -> 'd) -> 'd)))`


### Zad 8

```racket
(define padovan
  (stream-cons 1 (stream-cons 1 (stream-cons 1 (map2 + (stream-cdr padovan) padovan)))))
```

### Zad 9 -> DONE


## Rozwiązania egzamin 2023

### Zad 1

### Zad 2

A = cons
B = cons
C = cons
D = append
E = cons
F = list


### Zad 3

```racket
(define (insert-bst x t)
  (if (leaf? t)
        (node (leaf) x (leaf))
        (cond [(= x (node-elem t)) t]
              [(< x (node-elem t))
                (node
                 (insert-bst x (node-l t))
                 (node-elem t)
                 (node-r t))]
              [(> x (node-elem t))
                (node
                 (node-l t)
                 (node-elem t)
                 (insert-bst x (node-r t)))])))
```

```racket
(foldl insert-bst (leaf) xs)
```

```racket
(define (bst->list t)
  (if (leaf? t)
      empty
      (append (bst->list (node-l t))
              (cons (node-elem t)
                    (bst->list (node-r t))))))
```

```racket
(define (bst->list t)
  (match t
    [(leaf) null]
	[(node l e r) (append (bst->list l)) (cons e (bst->list r))]))
```

Funkcja geneneruje nieużytki -> TAK


### Zad 4

```racket
(define-type (Form 'a)
    (varF [x : 'a])
    (botF)
    (impF [l : (Form 'a)] [r : (Form 'a)]))

(define (returnM x)
    (varF x))

(define (bindM m f)
  (type-case (Form 'a) m
    [(varF x) (f x)]
	[(botF) (botF)]
	[(impF m1 m2) (impF (bindM m1 f) (bindM m2 f))]))
```

#### Zasada Indukcji

Niech P będzie własnością wartości typu (Form 'a), taką że:
* dla dowolnego x typu 'a zachodzi P((varF x))
* zachodzi P((botF))
* jeśli dla dowolnych l, r typu (Form 'a) zachodzi odpowiednio P(l) i P(r), to zachodzi P((impF l r))
Wtedy dla wszystkich wartości typu (Form 'a) zachodzi własność P


#### Dowód Praw Monadycznych

* (bindM (returnM a) f) ≡ (f a)
* (bindM c returnM) ≡ c
* (bindM (bindM c f) g) ≡ (bindM c (λ (a) (bindM (f a) g)))

1. (bindM (returnM a) f) ≡ (f a)
	1.1 Niech a ≡ (varF v), gdzie v jest dowolną wartością typu 'a

	(bindM (returnM a) f) ≡ (bind (returnM (varF v)) f) ≡ (bindM (varF (varF v)) f) ≡ (f (varF v)) ≡ (f a)

	1.2 Niech a ≡ (botF)

	(bindM (returnM a) f) ≡ (bindM (returnM (botF)) f) ≡ (bindM (varF (botF)) f) ≡ (f (botF)) ≡ (f a)

	1.3 Niech a ≡ (impF m1 m2)

	(bindM (returnM a) f) ≡ (bindM (returnM (impF m1 m2)) f) ≡ (bindM (varF (impF m1 m2)) f) ≡ (f (impF m1 m2)) ≡ (f a)

2. (bindM c returnM) ≡ c
	TODO: Dowodzimy przez indukcję
	Baza indukcji:

	* c ≡ (varF v), gdzie v jest dowolną wartością typu 'a
		(bindM c returnM) ≡ (bindM (varF v) returnM) ≡ (returnM v) ≡ (varF v) ≡ c
	* c ≡ (botF)
		(bindM c returnM) ≡ (bindM (botF) returnM) ≡ (returnM (botF)) ≡ (botF) ≡ c

	Krok indukcyjny:

	Weźmy dowolne wartości l, r typu (Form 'a). Załóżmy, że dla l i r zachodzi `(bindM c returnM) ≡ c`. Pokażemy, że `(bindM c returnM) ≡ c` zachodzi dla wartości `(impF l r)`

	(bindM c returnM) ≡ (bindM (impF l r) returnM) ≡ (impF (bindM l returnM) (bindM r returnM)) ≡ (impF l r) ≡ c

	Na mocy zasady indukcji dla typu (Form 'a), dla dowolnych wartości typu (Form 'a) zachodzi `(bindM c returnM) ≡ c`

3. (bindM (bindM c f) g) ≡ (bindM c (λ (a) (bindM (f a) g)))

	Przez indukcję

	Baza indukcji:

	c ≡ (varF v), gdzie v jest dowolną wartością typu 'a

	(bindM (bindM (varF v) f) g) ≡ (bindM (varF v) (λ (a) (bindM (f a) g)))
	(bindM (f v)) g) ≡ ((λ (a) (bindM (f a) g)) v)
	(bindM (f v)) g) ≡ (bindM (f v) g)

	c ≡ (botF)
	(bindM (bindM (botF) f) g) ≡ (bindM (botF) (λ (a) (bindM (f a) g)))
	(bindM (botF) g) ≡ (botF)
	(botF) ≡ (botF)

	Krok indukcyjny:

	Weźmy dowolne wartości l, r typu (Form 'a). Załóżmy, że dla l i r zachodzi `(bindM (bindM c f) g) ≡ (bindM c (λ (a) (bindM (f a) g)))`. Pokażemy, że `(bindM (bindM c f) g) ≡ (bindM c (λ (a) (bindM (f a) g)))` zachodzi dla wartości `(impF l r)`

	(bindM (bindM (impF l r) f) g) ≡ (bindM (impF l r) (λ (a) (bindM (f a) g)))
	(bindM (impF (bindM l f) (bindM r f)) g) ≡ (impF (bindM l (λ (a) (bindM (f a) g))) (bindM r (λ (a) (bindM (f a) g))))
	Z zał ind:
	(impF (bindM l (λ (a) (bindM (f a) g))) (bindM r (λ (a) (bindM (f a) g)))) ≡ (impF (bindM l (λ (a) (bindM (f a) g))) (bindM r (λ (a) (bindM (f a) g))))

	Na mocy zasady indukcji dla typu (Form 'a), dla dowolnych wartości typu (Form 'a) zachodzi `(bindM (bindM c f) g) ≡ (bindM c (λ (a) (bindM (f a) g)))`

```
Inna możliwość zrobienia 2 podpunktu (dłuższa, trudniejsza i też potrzebujemy indukcji):
	Rozważmy przypadki:
	* niech m1 = (varF v1), m2 = (varF v2)

	(bindM c returnM) ≡ (bindM (impF m1 m2) returnM) ≡ (bindM (impF (varF v1) (varF v2)) returnM) ≡ (impF (bindM (varF v1) returnM) (bindM (varF v2) returnM)) ≡ (impF (returnM v1) (returnM v2)) ≡ (impF (varF v1) (varF v2)) ≡ (impF m1 m2) ≡ c

	* niech m1 = (varF v1), m2 = (botF)

	(bindM c returnM) ≡ (bindM (impF m1 m2) returnM) ≡ (bindM (impF (varF v1) (botF)) returnM) ≡ (impF (bindM (varF v1) returnM) (bindM (botF) returnM)) ≡ (impF (returnM v1) (botF)) ≡ (impF (varF v1) (botF)) ≡ (impF m1 m2) ≡ c

	* niech m1 = (botF), m2 = (varF v2)

	(bindM c returnM) ≡ (bindM (impF m1 m2) returnM) ≡ (bindM (impF (botF) (varF v2)) returnM) ≡ (impF (bindM (botF) returnM) (bindM (varF v2) returnM)) ≡ (impF (botF) (returnM v2)) ≡ (impF (botF) (varF v2)) ≡ (impF m1 m2) ≡ c

	* niech m1 = (botF), m2 = (botF)

	(bindM c returnM) ≡ (bindM (impF m1 m2) returnM) ≡ (bindM (impF (botF) (botF)) returnM) ≡ (impF (bindM (botF) returnM) (bindM (botF) returnM)) ≡ (impF (botF) (botF)) ≡ (impF m1 m2) ≡ c

	---
	Poniższe przypadki dowodzimy przez indukcję:
	---

	* niech m1 = (varF v1), m2 = (impF m1 m2)
	* niech m1 = (impF m1 m2), m2 = (varF v2)
	* niech m1 = (botF), m2 = (impF m1 m2)
	* niech m1 = (impF m1 m2), m2 = (botF)
	* niech m1 = (impF m1 m2), m2 = (impF m1 m2)
```

### Zad 5

Typ bind: `((Form 'a) ('a -> Form 'b) -> Form 'b)`

`'a ?= (Form 'b)` -> tak bo lambda jest identycznością

Typ foo: `(Form (Form 'b)) -> (Form 'b)`

Kontrakty są sprawdzane w czasie działania programu w momencie, kiedy funkcja jest wywoływana, a typy są sprawdzane w czasie kompilacji


### Zad 6

G = (T, N, P, S)

* `T` jest skończonym zbiorem symboli terminalnych
* `N` jest skończonym zbiorem symboli nieterminalnych
* `P` jest skończonym zbiorem reguł typu (produkcje): `L -> R`, gdzie `L` należy do `N`, a R należy do `(T suma N)*`
* `S` należący do `N` jest wyróżnionym elementem początkowym

Produkcje:
* `S -> #f | x`, gdzie x jest symbolem
* `S -> S => (S)`


### Zad 7

```racket
#lang plait

; składnia abstrakcyjna

(define-type Exp
  (numE [n : Number])
  (addE [e1 : Exp] [e2 : Exp])
  (varE [x : Symbol])
  (funE [params : (Listof Symbol)] [body : Exp])
  (appE [f : Exp] [args : (Listof Exp)])
  (letE [bindings : (Listof (Symbol * Exp))] [body : Exp]))

; typ wartości

(define-type Val
  (numV [n : Number])
  (funV [params : (Listof Symbol)] [body : Exp] [env : (Env Val)]))

(define (extend-env env x v)
  (error 'extend-env "not implemented"))

(define (lookup-env x env)
  (error 'lookup-env "not implemented"))

(define (params-to-env [params : (Listof Symbol)] [argsV : (Listof Val)] [env : (Env Val)]) : (Env Val)
  (cond
    [(and (eq? params empty) (eq? argsV empty)) env]
    [(or (eq? params empty) (eq? argsV empty)) (error 'eval "arity missmatch")]
    [else (params-to-env (rest params) (rest argsV) (extend-env env (first params) (first argsV)))]))

(define (eval [e : Exp] [env : (Env Val)]) : Val
  (type-case Exp e
    [(numE n) (numV n)]
    [(addE e1 e2) (let [(v1 (eval e1 env)) (v2 (eval e2 env))]
                    (type-case Val v1
                      [(numV n1) (type-case Val v2
                                   [(numV n2) (numV (+ n1 n2))]
                                   [else (error 'eval "type error")])]
                      [else (error 'eval "type error")]))]
    [(varE x) (lookup-env x env)]
    [(funE params body) (funV params body env)]
    [(appE f args) (let [(fv (eval f env)) (argsV (map (lambda (a) (eval a env)) args))]
                     (type-case Val fv
                       [(funV params body env1) (eval body (params-to-env params argsV env1))]
                       [else (error 'eval "type error")]))]
    [(letE bindings body) (eval body (foldl (lambda (binding env-acc) (extend-env env-acc (fst binding) (eval (snd binding) env))) env bindings))]))
```

Desugar:

```racket
(define (desugar [e : Egz]) : Egz
  (type-case Egz e
    [(numE n) (numE n)]
    [(varE v) (varE v)]
    [(addE e1 e2)
     (addE (desugar e1) (desugar e2))]
    [(funE ls b)
     (funE ls (desugar b))]
    [(appE f ls)
     (appE (desugar f)
           (map desugar ls))]
    [(letE ls b)
     (appE
      (funE (map (lambda (x) (fst x)) ls) (desugar b))
      (map (lambda (x) (snd x)) ls))]))
```

desugar polega na tym że np (letE (x 2) (+ x 3)) przerabiasz na (appE (funE (x) (+ x 3)) (2))

letE -> (appE (funE SYMBOLE ZDESUGAROWANE_CIAŁO) WARTOŚCI)

