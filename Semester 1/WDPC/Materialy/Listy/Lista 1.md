**Zadanie 1 (10 punktów)**

Program ma wyznaczyć wartość minimalną i maksymalną spośród n liczb. Wczytaj najpierw liczbę n > 10 ze standardowego wejścia a następnie wylosuj n wartości rzeczywistych x0, x1, …, xn-1 z przedziału [0, 1] i wskaż, która z wylosowanych liczb była najmniejsza a która największa. Do losowania użyj funkcji rand() z pliku nagłówkowego <stdlib.h>; funkcja rand() zwraca liczbę całkowitą, więc aby tą wartość przekształcić na liczbę zmiennopozycyjną z przedziału [0, 1] zastosuj następujący wzór:

rand() / (double)RAND_MAX

Nie zapomnij na początku programu zainicjalizować generator liczb pseudolosowych bieżącym czasem systemowym za pomocą funkcji:

srand(time(NULL))

Funkcja time() pobiera czas systemowy i jest zadeklarowana w pliku nagłówkowym <time.h>.

Wynik wypisz z dokładnością do 3 miejsc po kropce dziesiętnej.

**Zadanie 2 (10 punktów)**

Napisz program do interaktywnego testowania prostopadłości i równoległości pary odcinków. Program powinien działać w nieskończonej pętli i za każdym razem pytać użytkownika o współrzędne końców pary odcinków P = ab i Q = cd na płaszczyźnie, gdzie  a = (xa, ya), b = (xb, yb), c = (xc, yc), d = (xd, yd); zakładamy, że współrzędne są liczbami zmiennopozycyjnymi. Po wpisaniu danych program na odpowiedzieć napisem „prostopadle” dla odcinków prostopadłych, „rownolegle” dla odcinków równoległych albo znakiem minus „–” w pozostałych przypadkach.

Wskazówka: skorzystaj z prawa Talesa.

Za każdym razem sprawdź poprawność danych – odcinki nie mogą być zerowej długości.

Z nieskończonej pętli w programie można wyjść skrótem klawiszowym Ctrl+C.