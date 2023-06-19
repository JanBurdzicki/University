#include <bits/stdc++.h>
using namespace std;

int rand(int a, int b)
{
	return a + rand() % (b - a + 1);
}

using Zbior_Glosow = vector <vector <bool>>;

bool czy_poprawna_karta_do_glosowania(Zbior_Glosow& karta_do_glosowania, int ilosc_kandydatow, int ILOSC_KOLUMN)
{
	int ilosc_wybranych_kandydatow = 0;

	for(int i = 0; i < ilosc_kandydatow; i++)
	{
		int suma_glosow_na_kandydata = 0;

		for(auto& x : karta_do_glosowania)
		{
			suma_glosow_na_kandydata += x[i];
		}

		if(suma_glosow_na_kandydata < ILOSC_KOLUMN - 2 || suma_glosow_na_kandydata == ILOSC_KOLUMN)
		{
			return false;
		}

		if(suma_glosow_na_kandydata == ILOSC_KOLUMN - 1)
		{
			ilosc_wybranych_kandydatow++;
		}
	}

	if(ilosc_wybranych_kandydatow == 1)
	{
		return true;
	}

	else
	{
		return false;
	}
}

// Zasada Wlaczen i Wylaczen

// Czas: O(n * ILOSC_KOLUMN)
// Pamiec: O(ILOSC_KOLUMN)

// Podobne do SOS (Subset Sum Problem)
// Pascal’s Identity

void DFS(Zbior_Glosow& rozciete_glosy, vector <bool>& czy_uzyte, vector <vector <int>>& poprawne_karty_do_glosowania, vector <int> podzbior, int ilosc_kandydatow, int ilosc_rozcietych_glosow, int ilosc, int indeks, int ILOSC_KOLUMN, int indeks_1)
{
	if(ilosc == ILOSC_KOLUMN - 1)
	{
		Zbior_Glosow karta_do_glosowania = Zbior_Glosow(ILOSC_KOLUMN);

		vector <int> indeksy_glosow(ILOSC_KOLUMN);

		indeksy_glosow[0] = indeks_1;

		for(int i = 0; i < ILOSC_KOLUMN - 1; i++)
		{
			indeksy_glosow[i + 1] = podzbior[i];
		}

		for(int i = 0; i < ILOSC_KOLUMN ; i++)
		{
			karta_do_glosowania[i] = rozciete_glosy[indeksy_glosow[i]];

			// cerr << "D: " << indeksy_glosow[i] << " ";
		}

		// cerr << "\n";

		// sprawdzamy czy glosy na karcie zostaly oddane prawidlowo
		if(czy_poprawna_karta_do_glosowania(karta_do_glosowania, ilosc_kandydatow, ILOSC_KOLUMN))
		{
			poprawne_karty_do_glosowania.push_back(indeksy_glosow);
		}

		return;
	}

	// nie ma juz elementow
	if(indeks >= ilosc_rozcietych_glosow)
	{
		return;
	}

	if(!czy_uzyte[indeks] && indeks != indeks_1)
	{
		// include
		podzbior[ilosc] = indeks;

		DFS(rozciete_glosy, czy_uzyte, poprawne_karty_do_glosowania, podzbior, ilosc_kandydatow, ilosc_rozcietych_glosow, ilosc + 1, indeks + 1, ILOSC_KOLUMN, indeks_1);
	}

	// exclude
	DFS(rozciete_glosy, czy_uzyte, poprawne_karty_do_glosowania, podzbior, ilosc_kandydatow, ilosc_rozcietych_glosow, ilosc, indeks + 1, ILOSC_KOLUMN, indeks_1);
}

void generuj_dopasowanie(Zbior_Glosow& rozciete_glosy, vector <bool>& czy_uzyte, vector <vector <int>>& poprawne_karty_do_glosowania, int ilosc_kandydatow, int ilosc_rozcietych_glosow, int ILOSC_KOLUMN, int indeks_1)
{
	vector <int> podzbior(ILOSC_KOLUMN - 1);

	DFS(rozciete_glosy, czy_uzyte, poprawne_karty_do_glosowania, podzbior, ilosc_kandydatow, ilosc_rozcietych_glosow, 0, 0, ILOSC_KOLUMN, indeks_1);
}

void wnioskowanie(Zbior_Glosow& rozciete_glosy, vector <vector <int>>& odpowiedzi, vector <bool>& czy_uzyte, int ilosc_kandydatow, int ilosc_rozcietych_glosow, int ILOSC_KOLUMN)
{
	for(int i = 0; i < ilosc_rozcietych_glosow; i++)
	{
		vector <vector <int>> poprawne_karty_do_glosowania;

		if(czy_uzyte[i])
		{
			continue;
		}

		generuj_dopasowanie(rozciete_glosy, czy_uzyte, poprawne_karty_do_glosowania, ilosc_kandydatow, ilosc_rozcietych_glosow, ILOSC_KOLUMN, i);

		if((int) poprawne_karty_do_glosowania.size() == 1)
		{
			for(auto& x : poprawne_karty_do_glosowania[0])
			{
				czy_uzyte[x] = true;
			}

			odpowiedzi.push_back(poprawne_karty_do_glosowania[0]);
		}
	}
}

void maksymalne_wnioskowanie(Zbior_Glosow& rozciete_glosy, vector <vector <int>>& odpowiedzi, int ilosc_kandydatow, int ILOSC_KOLUMN)
{
	int ilosc_rozcietych_glosow = (int) rozciete_glosy.size();

	vector <bool> czy_uzyte(ilosc_rozcietych_glosow);

	int poprzednia_ilosc_odpowiedzi = 0;

	wnioskowanie(rozciete_glosy, odpowiedzi, czy_uzyte, ilosc_kandydatow, ilosc_rozcietych_glosow, ILOSC_KOLUMN);

	while(poprzednia_ilosc_odpowiedzi < (int) odpowiedzi.size())
	{
		poprzednia_ilosc_odpowiedzi = (int) odpowiedzi.size();

		wnioskowanie(rozciete_glosy, odpowiedzi, czy_uzyte, ilosc_kandydatow, ilosc_rozcietych_glosow, ILOSC_KOLUMN);
	}
}

void print_karty_do_glosowania(Zbior_Glosow& karta_do_glosowania, int ilosc_kandydatow, int indeks_glosu, int ILOSC_KOLUMN)
{
	string znaczki = "-----";

	cout << znaczki << " " << "Poczatek glosu: " << indeks_glosu + 1 << " " << znaczki << "\n\n";

	for(int j = 0; j < ilosc_kandydatow; j++)
	{
		for(int k = 0; k < ILOSC_KOLUMN; k++)
		{
			cout << "[ " << karta_do_glosowania[k][j] << " ]";
		}

		cout << "\n";
	}

	cout << "\n";

	cout << znaczki << " " << "Koniec glosu: " << indeks_glosu + 1 << " " << znaczki << "\n\n";
}

void print_glosow(vector <Zbior_Glosow>& glosy, int ilosc_wszystkich_glosow, int ilosc_kandydatow, int ILOSC_KOLUMN)
{
	// TODO: wymyslic format printowania glosow

	for(int i = 0; i < ilosc_wszystkich_glosow; i++)
	{
		print_karty_do_glosowania(glosy[i], ilosc_kandydatow, i, ILOSC_KOLUMN);
	}
}

void print_znalezionych(vector <Zbior_Glosow>& glosy, vector <bool>& czy_znaleziony, int ilosc_wszystkich_glosow, int ilosc_kandydatow, int ILOSC_KOLUMN)
{
	for(int i = 0; i < ilosc_wszystkich_glosow; i++)
	{
		if(czy_znaleziony[i])
		{
			print_karty_do_glosowania(glosy[i], ilosc_kandydatow, i, ILOSC_KOLUMN);
		}
	}
}

void print_odpowiedzi(Zbior_Glosow& rozciete_glosy, vector <vector <int>>& odpowiedzi, int ilosc_wszystkich_glosow, int ilosc_kandydatow)
{
	// assert(ilosc_wszystkich_glosow == (int) odpowiedzi.size());

	for(auto& odp : odpowiedzi)
	{
		cout << "Odpowiedz: ";

		for(auto& x : odp)
		{
			cout << x << " ";
		}

		cout << "\n";
	}

	int ilosc_znalezionych_glosow = (int) odpowiedzi.size();

	cout << "Podsumowanie:\n";
	cout << "Ilosc wszystkich glosow: " << ilosc_wszystkich_glosow << "\n";
	cout << "Ilosc znalezionych glosow: " << ilosc_znalezionych_glosow << "\n";
	cout << fixed << setprecision(2) << "Stosunek znalezionych glosow do wszystkich glosow: " << 100.0 * ilosc_znalezionych_glosow / ilosc_wszystkich_glosow << "%\n";
}

Zbior_Glosow rozetnij_glosy(vector <Zbior_Glosow>& glosy, int ilosc_wszystkich_glosow, int ILOSC_KOLUMN)
{
	Zbior_Glosow rozciete_glosy(ilosc_wszystkich_glosow * ILOSC_KOLUMN);

	// wybieramy karte do glosowania
	for(int i = 0; i < ilosc_wszystkich_glosow; i++)
	{
		// wybieramy kolumne (glos)
		for(int j = 0; j < ILOSC_KOLUMN; j++)
		{
			rozciete_glosy[i * ILOSC_KOLUMN + j] = glosy[i][j];
		}
	}

	return rozciete_glosy;
}

// void generowanie_kart_do_glosowania(vector <vector <vector <bool>>>& glosy, int ilosc_wszystkich_glosow, int ilosc_kandydatow, int ILOSC_KOLUMN)
// {
// 	for(int i = 0; i < ilosc_wszystkich_glosow; i++)
// 	{
// 		for(int j = 0; j < ilosc_kandydatow; j++)
// 		{
// 			int indeks = rand(0, ILOSC_KOLUMN - 1);

// 			glosy[i][indeks][j] = true;
// 		}
// 	}
// }

vector <Zbior_Glosow> generowanie_glosow(int ilosc_wszystkich_glosow, int ilosc_kandydatow, int ILOSC_KOLUMN)
{
	vector <Zbior_Glosow> glosy(ilosc_wszystkich_glosow, Zbior_Glosow (ILOSC_KOLUMN, vector <bool> (ilosc_kandydatow)));

	// generowanie kart do glosowania

	for(int i = 0; i < ilosc_wszystkich_glosow; i++)
	{
		for(int j = 0; j < ilosc_kandydatow; j++)
		{
			vector <int> indeksy(ILOSC_KOLUMN);

			for(int k = 0; k < ILOSC_KOLUMN; k++)
			{
				indeksy[k] = k;
			}

			random_shuffle(indeksy.begin(), indeksy.end());

			for(int k = 0; k < ILOSC_KOLUMN - 2; k++)
			{
				glosy[i][indeksy[k]][j] = true;
			}
		}
	}

	// dodanie glosu

	for(int i = 0; i < ilosc_wszystkich_glosow; i++)
	{
		int indeks_kandydata = rand(0, ilosc_kandydatow - 1);

		vector <int> indeksy;

		for(int j = 0; j < ILOSC_KOLUMN; j++)
		{
			if(!glosy[i][j][indeks_kandydata])
			{
				indeksy.push_back(j);
			}
		}

		assert((int) indeksy.size() == 2);

		int indeks = rand(0, 1);

		glosy[i][indeksy[indeks]][indeks_kandydata] = true;
	}

	return glosy;
}

int main(int argc, char* argv[])
{
	ios::sync_with_stdio(0);
	cin.tie(0);
	cout.tie(0);

	srand(atoi(argv[1])); // atoi(s) converts an array of chars to int

	int ilosc_kandydatow, ilosc_wszystkich_glosow, ILOSC_KOLUMN;
	cin >> ilosc_kandydatow >> ilosc_wszystkich_glosow >> ILOSC_KOLUMN;

	// generowanie glosow (mozna oddac glos tylko na jednego kandydata)

	vector <Zbior_Glosow> glosy = generowanie_glosow(ilosc_wszystkich_glosow, ilosc_kandydatow, ILOSC_KOLUMN);

	// TODO: potem mozna dodac jeszcze verify + mozna przyjmowac z inputu glosy

	// drukujemy wszystkie glosy

	print_glosow(glosy, ilosc_wszystkich_glosow, ilosc_kandydatow, ILOSC_KOLUMN);

	// rozcinamy glosy i wrzucamy do pudelka

	Zbior_Glosow rozciete_glosy = rozetnij_glosy(glosy, ilosc_wszystkich_glosow, ILOSC_KOLUMN);

	// mozemy dodatkowo je wymieszac

	random_shuffle(rozciete_glosy.begin(), rozciete_glosy.end());

	// zaczynamy wnioskowanie

	vector <vector <int>> odpowiedzi;

	maksymalne_wnioskowanie(rozciete_glosy, odpowiedzi, ilosc_kandydatow, ILOSC_KOLUMN);

	print_odpowiedzi(rozciete_glosy, odpowiedzi, ilosc_wszystkich_glosow, ilosc_kandydatow);

	return 0;
}
