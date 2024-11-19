Zadanie 1 (10 punktów). 

Napisz program, który będzie sprawdzać podzielność zadanej długiej liczby naturalnej T przez kolejne wartości całkowite typu int wprowadzane przez użytkownika. Program będzie więc działać w pętli, w której za każdym razem użytkownik wprowadza ze standardowego wejścia liczbę N a program sprawdza, czy N jest podzielnikiem T; warunkiem wyjścia z pętli będzie wpisanie przez użytkownika liczby ≤ 0.

Długa liczba naturalna T ma być zadana przez argument wywołania programu. Argument wywołania powinien być dokładnie jeden i powinien składać się tylko z cyfr dziesiętnych, bez zer wiodących na początku liczby. Jeśli takiego argumentu nie ma, albo argumentów jest kilka albo argument nie spełnia warunków, to wypisz na standardowe wyjście dla błędów czytelny komunikat i zakończ działanie programu kodem 1 (funkcja main() ma zakończyć działanie instrukcją return 1). Aby program mógł używać argumentów wywołania programu, funkcja main() musi mieć następujący nagłówek:

int main(int argc, char *argv[])

Do sprawdzenia podzielności liczby T skorzystaj z następującej własności:

niech B będzie ostatnią cyfrą w zapisie liczby T;
liczbę T można więc zapisać jako T = A ۰ 10 + B, gdzie A = floor(T / 10)
jeśli A mod N = k, wówczas T mod N = (k ۰ 10 + B) mod N.
Zadanie 2 (10 punktów). 

Napisz program, który przepisze tekst ze standardowego wejścia na standardowe wyjście z zastosowaniem określonego filtru.

Oto reguły dotyczące filtrowania:

przepisywane są tylko znaki widoczne (te które znajdują się na klawiaturze) o kodach z zakresu od 32 (spacja) do 126 (tylda) oraz znak przejścia do nowej linii '\n' o kodzie 10;
znak tabulacji '\t' o kodzie 9 jest zamieniany na spację;
każdy ciąg kilku spacji jest zastępowany pojedynczą spacją;
wszystkie małe litery są przesunięte o 3 (tak jak w kodowaniu Cezara) zgodnie ze wzorem: L + 3 mod 26, gdzie L jest kodem litery a operacja mod oznacza zawinięcie dla trzech ostatnich liter.
