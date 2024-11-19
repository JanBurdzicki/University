Uwaga: ostatnie trzy listy zawierają (poza zadaniem sprawdzaczkowym) tylko jedno zadanie. Zadanie to należy zaprogramować i zaprezentować je osobiście na kolejnej pracowni (co w szczególności dla listy nr 10 oznacza pierwszą pracownię bez list). Kod powinien być przejrzysty i należy umieć go precyzyjnie i zrozumiale zreferować w ciągu 5 minut.

Zadanie 1 (15 punktów). 

Zaimplementuj drzewo BST przechowujące zbiór liczb całkowitych. Twój program powinien potrafić:

dodawać liczby do drzewa (wartości w drzewie mają być unikatowe);
usuwać zadaną liczbę z drzewa;
znajdować wartość maksymalną oraz minimalną w drzewie;
sprawdzać, czy zadana liczba znajduje się w drzewie;
znajdować poprzednika albo następnika podanej wartości (przez poprzednika liczby x rozumiemy taką wartość, która jest największa spośród mniejszych niż x – analogicznie definiujemy następnik);
wydrukować drzewo w postaci semigraficznej (korzeń po lewej stronie, wartość najmniejsza na górze a największa na dole, liczba wcięć  ma być związana z głębokością węzła).
Program powinien działać w sposób interaktywny i reagować na następujące polecenia (parametr X oznacza liczbę całkowitą):

ins X – należy do drzewa wstawić liczbę X (jeśli liczba X już znajduje się w drzewie, to wypisz odpowiedni komunikat na standardowe wyjście dla błędów);
del X – należy usunąć liczbę X z drzewa (jeśli liczby X nie ma w drzewie, to wypisz odpowiedni komunikat na standardowe wyjście dla błędów);
srch X – należy wypisać słowo "TAK" na standardowe wyjście, gdy X należy do drzewa, w przeciwnym razie należy wypisać słowo "NIE";
min  – należy wypisać na standardowe wyjście minimalną wartość przechowywaną w drzewie (jeśli drzewo jest puste, to wypisz odpowiedni komunikat na standardowe wyjście dla błędów);
max  – należy wypisać na standardowe wyjście maksymalną wartość przechowywaną w drzewie (jeśli drzewo jest puste, to wypisz odpowiedni komunikat na standardowe wyjście dla błędów);
prev X  – należy wypisać na standardowe wyjście największą wartość spośród liczb mniejszych od X w drzewie (jeśli drzewo jest puste bądź X jest co najwyżej wartością minimalną, to wypisz odpowiedni komunikat na standardowe wyjście dla błędów);
next X  – należy wypisać na standardowe wyjście najmniejszą wartość spośród liczb większych od X w drzewie (jeśli drzewo jest puste bądź X jest co najmniej wartością maksymalną, to wypisz odpowiedni komunikat na standardowe wyjście dla błędów);
print – należy wydrukować strukturę drzewa BST na standardowym wyjściu;
quit – zakończenie programu.
Błędne polecenia należy ignorować (wypisując jedynie odpowiedni komunikat na standardowe wyjście dla błędów).
