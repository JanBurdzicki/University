Uwaga: ostatnie trzy listy zawierają (poza zadaniem sprawdzaczkowym) tylko jedno zadanie. Zadanie to należy zaprogramować i zaprezentować je osobiście na kolejnej pracowni (co w szczególności dla listy nr 10 oznacza pierwszą pracownię bez list). Kod powinien być przejrzysty i należy umieć go precyzyjnie i zrozumiale zreferować w ciągu 5 minut.

Zadanie 1 (15 punktów). 

Rozważmy uporządkowane drzewa 26-arne, w których każdy węzeł może mieć do 26 synów etykietowanych literami alfabetu angielskiego. Węzły takiego drzewa reprezentują słowa: korzeń to słowo puste, synowie korzenia to słowa jednoliterowe, ich synowie to słowa dwuliterowe itd. W ogólności każda ścieżka od korzenia do wybranego węzła reprezentuje słowo złożone z liter znajdujących się w węzłach (albo na krawędziach) tej ścieżki – tak więc każdy węzeł w drzewie reprezentuje jakieś słowo.



Opisane powyżej drzewo nazywa się drzewem Trie (czytaj tri, od angielskiego słowa retrieve – pobrać, odzyskać). Wykorzystaj drzewo Trie do zgromadzenia wszystkich słów zapisanych  we wskazanych plikach tekstowych (zawartością każdego pliku ma być tekst w języku angielskim). Nazwy plików przekaż do programu poprzez argumenty wywołania.

Sam program powinien działać dwu etapowo według następującego scenariusza: najpierw tworzone jest puste drzewo Trie, następnie jest wypełniane słowami odczytanymi ze wskazanych plików, a na koniec użytkownik zapytuje o kolejne słowa a program odpowiada ile razy takie słowo wystąpiło w podanych plikach. Ewentualne błędy związane z operacjami we/wy wypisz na standardowym wyjściu dla błędów stderr.

Operacje na drzewach Trie (utworzenie pustego drzewa, wstawienie nowego słowa do drzewa, sprawdzenie czy słowo jest zapisane w drzewie, wypisanie słów i liczby ich wystąpień w kolejności alfabetycznej, usunięcie drzewa) powinny być zaimplementowane w osobnym module i zadeklarowane w pliku nagłówkowym.

Uwaga. Drzewo Trie należy wzbogacić o informację, czy węzeł w strukturze jest końcem jakiegoś słowa (chodzi o węzły wewnętrzne, bo liście zawsze są końcami słów), co ma rozwiązać problem w sytuacji, gdy jedno słowo jest prefiksem innego dłuższego słowa; dodatkowo w węźle powinien się znaleźć licznik wystąpień słowa w tekście (sam licznik może też pełnić rolę znacznika końca słowa).
