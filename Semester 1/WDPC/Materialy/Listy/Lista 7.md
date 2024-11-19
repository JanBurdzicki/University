Zadanie 1 (10 punktów). 

Zdefiniuj funkcję, która wydzieli z zadanego łańcucha znakowego wszystkie występujące  w nim fragmenty złożone z widocznych znaków – znaki z zakresu od '!' (kod 33) do '~' (kod 126). Separatorami takich fragmentów są ciągi białych znaków (funkcja isspace() z pliku nagłówkowego <ctype.h>). Oto deklaracja tej funkcji:

char** split(const char[]);

Funkcja ma wrócić wartość typu char**, czyli tablicę wskaźników na łańcuchy znakowe; ostatni element tej tablicy powinien zawierać wskaźnik pusty NULL (oznaczenie końca danych). Na przykład dla napisu "See the reference for the <ctype.h> header file." funkcja split() powinna zwrócić taką tablicę:

["See", " the", " reference", " for", "the", "<ctype.h>", " header", "file.", NULL]

Zarówno tablica wskaźników jak i wskazywane ciągi znaków mają zostać utworzone w pamięci dynamicznej.

Na zakończenie napisz program testowy, który będzie w pętli odczytywał kolejne linie tekstu ze standardowego wejścia i rozdzielał je na słowa za pomocą funkcji split(), aż do napotkania linii pustej albo zamknięcia strumienia. Nie zapomnij na końcu zwolnić pamięci przydzielonej funkcją split().

Zadanie 2 (10 punktów). 

Zdefiniuj strukturę kalendarz do pamiętania daty – struktura ma zawierać trzy pola typu short int przeznaczone do przechowywania roku, miesiąca i dnia w miesiącu. Zdefiniuj także funkcję, która porównuje dwie daty, jak relacja mniejszości:

bool mniejszy(kalendarz *k1, kalendarz *k2);

Zdefiniuj także funkcję do sortowania tablicy ze wskaźnikami na daty (zaimplementuj zwykłe sortowanie bąbelkowe) – funkcja ta ma posortować tylko wskaźniki, tak aby wskazywały na daty od najwcześniejszej do najpóźniejszej:

void babelkowe(kalendarz *tab[], int n);

W programie testowym stwórz tablicę wskaźników do dat oraz daty w pamięci dynamicznej – wprowadź ze standardowego wejścia najpierw liczbę n (stwórz n-elementową tablicę) a potem n dat (rok, miesiąc, dzień). Następnie posortuj te daty i wypisz w kolejności od najwcześniejszej do najpóźniejszej.
