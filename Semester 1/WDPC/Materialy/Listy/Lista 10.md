Uwaga: ostatnie trzy listy zawierają (poza zadaniem sprawdzaczkowym) tylko jedno zadanie. Zadanie to należy zaprogramować i zaprezentować je osobiście na kolejnej pracowni (co w szczególności dla listy nr 10 oznacza pierwszą pracownię bez list). Kod powinien być przejrzysty i należy umieć go precyzyjnie i zrozumiale zreferować w ciągu 5 minut.

Zadanie 1 (15 punktów). 

Graf to struktura umożliwiająca modelowanie relacji pomiędzy obiektami. W teorii grafów te obiekty są nazywane wierzchołkami a relacje krawędziami. Zbiór wierzchołków nigdy nie jest pusty, najczęściej jest z góry ustalony a same wierzchołki są ponumerowane kolejnymi liczbami naturalnymi. Krawędź to relacja pomiędzy parą wierzchołków, tak więc każda krawędź jest zapisywana jako para wierzchołków albo para dwóch liczb naturalnych skojarzonych z wierzchołkami; w grafach prostych krawędź nie może łączyć wierzchołka samego ze sobą oraz krawędzie nie mogą się dublować.

W notacji matematycznej graf definiujemy jako parę zbioru wierzchołków i zbioru krawędzi G = (V, E), gdzie V = {v1, v2, …, vn} to wierzchołki (często w implementacji informatycznej numerujemy je od 0 do n-1, gdzie n to liczba wierzchołków) a E = {e1, e2, …, em} to krawędzie (każdy krawędź to para wierzchołków, czyli para różnych liczb ze zbioru {0, 1, …, n-1}).

Grafy, a zwłaszcza grafy rzadkie o niewielkiej liczbie krawędzi w stosunku do grafu pełnego, są reprezentowane w postaci list sąsiadów. W reprezentacji tej przechowuje się n list z sąsiadami dla każdego spośród n wierzchołków. Wskaźniki do tych list trzymane są w n-elementowej tablicy, gdzie j-ty element tablicy jest skojarzony z wierzchołkiem grafu o numerze j, a lista w j-tej komórce to sąsiedzi wierzchołka j-tego. Sumaryczna długość wszystkich list to m, czyli podwojona ilość krawędzi (ponieważ każda krawędź łączy ze sobą dwa wierzchołki).

Bazując na reprezentacji grafu w postaci list sąsiadów zaimplementuj rekurencyjną metodę przeszukiwanie grafu w głąb DFS i wykorzystaj ją do policzenia składowych spójności w zadanym grafie prostym.

Sam graf zapisany jest w pliku tekstowym, którego nazwa powinna być do programu przekazana poprzez argumenty wywołania. Format pliku tekstowego z definicją grafu jest następujący: w pierwszej linii wejścia dana jest para liczb n i m, które oznaczają liczbę wierzchołków (0 < n ≤ 1000000) oraz liczbę krawędzi (0 ≤ m ≤ 1000000) w grafie; następnie danych jest m linii, a w każdej z nich liczby a i b (0 ≤ a, b < n oraz a ≠ b), które oznaczają, że istnieje krawędź między wierzchołkami a i b w grafie.
