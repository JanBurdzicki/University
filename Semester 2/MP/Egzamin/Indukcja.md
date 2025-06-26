# Zadania przygotowujące do egzaminu z Metod Programowania

## Indukcja

**Zasada indukcji dla list:**
Niech $P$ będzie własnością list, taką że:
* Zachodzi $P(null)$,
* Dla każdej wartości $x$ oraz dowolnej listy $xs$, jeśli $P(xs)$, to $P((cons\ x\ xs))$.

Wówczas dla dowolnej listy $xs$ zachodzi $P(xs)$.

### 1. (append (map f xs) (map f ys))
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

### 2. (length (append xs ys)) = (+ (length xs) (length ys))
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

### 3. (filter p (map f xs)) = (map f (filter (lambda (x) (p (f x))) xs)
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

### 4. (foldr + 0 ns) = (foldl + 0 ns), gdzie ns jest listą liczb całkowitych
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

### 5. Zadanie z egzaminu z poprzednich lat
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

