Zadanie 1 (10 punktów). 

Zdefiniuj strukturę zegar do pamiętania godziny – struktura ma zawierać trzy pola typu short int przeznaczone do przechowywania godzin, minut i sekund.

Zdefiniuj też kilka użytecznych funkcji dla struktury zegar:

zegar ustaw(short g, short m, short s);  – ta funkcja ma stworzyć strukturę zegara z pozycjami określającymi godzinę w znormalizowanej postaci (godziny z zakresu 0…23 oraz minuty i sekundy z zakresu 0…59) – wartości wykraczające poza zakres należy obciąć i przenieść do pola ogólniejszego (część całkowitą z sekund podzielonych przez 60 należy dodać do minut, część całkowitą z minut podzielonych przez 60 należy dodać do godzin, w godzinach pozostawić resztę z dzielenia przez 24);
bool sprawdz(zegar z);  – ta funkcja ma sprawdzić, czy struktura zegara zawiera pozycje godzinowe w znormalizowanej postaci;
zegar normuj(zegar z);  – ta funkcja ma stworzyć nową strukturę zegara z pozycjami godzinowymi w znormalizowanej postaci;
void dodajgodziny(zegar *z, short g);  – ta funkcja ma dodać zadaną liczbę godzin do czasu przechowywanego na wskazanym zegarze (efektem ubocznym ma być normalizacja czasu w zegarze);
void dodajminuty(zegar *z, short g);  – ta funkcja ma dodać zadaną liczbę minut do czasu przechowywanego na wskazanym zegarze (efektem ubocznym ma być normalizacja czasu w zegarze);
void dodajsekundy(zegar *z, short g);  – ta funkcja ma dodać zadaną liczbę sekund do czasu przechowywanego na wskazanym zegarze (efektem ubocznym ma być normalizacja czasu w zegarze);
void drukuj(FILE *f, zegar z);  – ta funkcja ma wypisać godzinę w takiej postaci jak na zegarku: godziny, minuty i sekundy pooddzielane znakiem dwukropka, przy czym wartości te mają zajmować dwa pola z zerami wiodącymi (na przykład 15:04:07).
Zdefiniuj także niemodyfikowalną statyczną strukturę zegar reprezentującą początek doby i ustawioną na godzinę 00:00:00.

Rzetelnie przetestuj każdą z tych funkcji.

Zadanie 2 (10 punktów). 

Zdefiniuj strukturę osoba do przechowywania danych personalnych – struktura ma zawierać pola przeznaczone do pamiętania imienia i nazwiska (oba typu char*), wieku w latach, wagi w kilogramach i wzrostu w metrach.

Zdefiniuj następnie tablicę kilkunastu takich struktur, zainicjalizują ją prawdopodobnymi wartościami, posortuj i wypisz (wraz ze współczynnikiem otyłości). Zaimplementuj sortowanie przez wstawianie. Jako kryterium sortowania przyjmij:

nazwisko i imię (porównaj leksykograficznie nazwiska, a gdy to porównanie nie rozstrzygnie to według imion);
wiek;
wskaźnika otyłości BMI = waga / wzrost2.
Parametrem algorytmu sortującego niech będzie wskaźnik do funkcji porównującej typu bool (*mniejsze)(osoba*, osoba*).
