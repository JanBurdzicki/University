Zadanie 1 (10 punktów). 

Często potrzebujemy sprawdzać oraz zmieniać wartości pojedynczych bitów w słowie maszynowym typu unsigned int. Zdefiniuj dwie funkcje: jedną do odczytywania wartości określonego bitu w słowie (funkcja ma zwracać wartość 0 lub 1) a drugą do zmiany wartości określonego bitu z 0 na 1 albo z 1 na 0 (funkcja ma zanegować bit):

unsigned jakiBit (unsigned liczba, unsigned nrBitu);

void zmienBit (unsigned *liczba, unsigned nrBitu);

Na koniec przetestuj działanie obu funkcji pisząc program, który wczyta ze standardowego wejścia liczbę naturalną a następnie wypisze ją na standardowym wyjściu bitowo (wypisz wszystkie 32 bity zaczynając od bitu najbardziej znaczącego) oraz dwójkowej za pomocą funkcji rekurencyjnej.

Dodatkowo program ma policzyć i wypisać ile jest w zadanej liczbie bitów zapalonych oraz dla liczb niezerowych wskazać pozycję pierwszej jedynki z lewej strony (najbardziej znaczący zapalony bit) i z prawej strony (najmniej znaczący zapalony bit).

Zadanie 2 (10 punktów). 

Napisz program, który wczyta ze standardowego wejścia liczby całkowite n oraz s typu int i przesunie cyklicznie wszystkie bity liczby n o s pozycji w lewo.

Wskazówka. Gdy przesuwamy liczbę o jedną pozycję w lewo, to bit z pozycji 0 zostanie przeniesiony na pozycję 1, bit z pozycji 1 zostanie przeniesiony na pozycję 2 itd.; bit najbardziej znaczący zostanie przeniesiony na pozycję 0. Gdy s < 0 to tak, jakbyśmy ją przesuwali w prawo.

Uwaga. Program ma wypisać najpierw pierwotną wartość liczby n w postaci bitowej (wszystkie bity zaczynając od bitu znaku) i w następnej linii nową wartość po transformacji.

Przykład 1: dla liczb 19 i 3 program powinien wypisać:

00000000000000000000000000010011
00000000000000000000000010011000

Przykład 2: dla liczb 19 i -2 program powinien wypisać:

00000000000000000000000000010011
11000000000000000000000000000100

Przykład 3: dla liczb 19 i 32 program powinien wypisać:

00000000000000000000000000010011
00000000000000000000000000010011
