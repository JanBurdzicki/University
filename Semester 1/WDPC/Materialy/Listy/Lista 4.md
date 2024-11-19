Zadanie 1 (10 punktów). 

Napisz program, który wypisze wspak wszystkie argumenty wywołania programu.

Zdefiniuj i wykorzystaj w swoim programie funkcję dl() obliczającą długość napisu oraz funkcję odwr() odwracającą napis (funkcja ta powinna wykorzystać funkcję dl()) – przekształcenia tego należy dokonać w miejscu (w tablicy z napisem bez żadnych tablic pomocniczych):

int dl(const char napis[]);

void odwr(char napis[]);

Pamiętaj, aby nie pracować bezpośrednio na argumencie wywołania programu, tylko najpierw skopiować go do tablicy pomocniczej za pomocą samodzielnie napisanej funkcji kopiującej kop():

void kop(const char skad[], char dokad[]);

Zadanie 2 (10 punktów). 

Napisz program, który odczyta standardowe wejście linia po linii, aż do napotkania symbolu EOF. Każdą z linii należy umieścić w tablicy mogącej pomieścić co najwyżej 80 znaków (pozostałe znaki w dłuższej linii należy zignorować); nie umieszczaj w odczytanym napisie znaku przejścia do nowej linii ’\n’. Maksymalną długość linii zdefiniuj za pomocą dyrektywy #define.

Do każdej odczytanej linii należy wstawić zadany napis na określonej pozycji. Funkcjonalność tą należy zrealizować za pomocą funkcji wstaw(), która ma zmodyfikować napis będący jej parametrem:

void wstaw(char linia[], const char napis[], int pozycja);

Na przykład, jeśli odczytana linia to ”Ala ma kota”, to wstawienie napisu ”bama” na pozycję 3 (pozycje są numerowane od 0) da w wyniku napis ”Alabama ma kota”.

Pamiętaj, aby napis wynikowy nie przekraczał magicznej długości 80 znaków. Dodatkowo, jeśli pozycja wstawienia jest większa od długości napisu, to funkcja nie powinna modyfikować zadanego napisu.

Wstawiany napis i pozycję jego wstawienia przekaż do programu poprzez argumenty wywołania.
