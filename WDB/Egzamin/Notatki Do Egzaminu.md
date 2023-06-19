# Lista 1

## Zadanie 4

Theorem 1. If the key is chosen uniformly randomly from all keys of a given
length, then the one-time pad is perfectly secret.
Proof. We need to show that P(M = m | C = c) = P(M = m) for each pair
m, c.
Let’s say that there are N keys, each of which has probability 1/N. We
start by showing that each possible ciphertext c also has probability 1/N. If
we have c, we know that it came from some key. The different choices of keys
are disjoint events, so we can add the probabilities for the various choices of the
key:
P(C = c) = X
k
P(C = c ∩ K = k).
We might want to say that the ciphertext and the key are independent, but this
is not the case. For example, if one message m is very likely, then knowing that
C = c makes it likely that K = c ⊕ m. However, the key and the ciphertext are
chosen independently, so we change the above expression in order to use this
fact:
P(C = c ∩ K = k) = P(M = c ⊕ k ∩ K = k)
= P(M = c ⊕ k) P(K = k)
= P(M = c ⊕ k) (1/N).
We know that as k runs through all possible keys, c⊕k runs through all possible
messages. This means that
X
k
P(M = c ⊕ k) = P(M = some possible message) = 1.
Therefore, we can combine the above equations to obtain
P(C = c) = X
k
P(C = c ∩ K = k) = (1/N)
X
k
P(M = c ⊕ k) = 1/N.
2
The definition of conditional probability and the independence of K and M
yield
P(M = m | C = c)P(C = c) = P(C = c ∩ M = m)
= P(K = c ⊕ m ∩ M = m)
= P(K = c ⊕ m) P(M = m).
Since P(C = c) = 1/N = P(K = c ⊕ m), we can multiply by N to obtain
P(M = m | C = c) = P(M = m),
which says that the one-time pad is perfectly secret

# Lista 3

## Czym jest certifcate pinning?

W przeglądarkach Chrome oraz Firefox zaczęto stosować przypinanie certyfikatów (certificate pinning). Ten mechanizm pozwala określić, które urzędy certyfikacji są uprawnione do wystawienia certyfikatu dla danej domeny. Na przykład Google może zdefiniować, że wszystkie certyfikaty dla ich domen muszą zostać podpisane przez urząd certyfikacji Google Internet Authority G2. Gdy ten warunek nie zostanie spełniony, przeglądarka wyświetli ostrzeżenie. Dzięki temu opisany wcześniej przypadek z wystawieniem fałszywego certyfikatu dla domen Google nie powiódłby się.

Mechanizm przypinania certyfikatów nie jest w żadnym wypadku nowym „wynalazkiem”; w Chrome jest stosowany już od 2011 roku. Dotychczas jednak polegał on na tym, że w przeglądarce zdefiniowano listę konkretnych domen oraz przypiętych certyfikatów.

## Dlaczego się go stosuje?

X.509 definiuje infrastrukturę klucza publicznego, umożliwiając tym samym potwierdzenie, czy host, z którym próbujemy się połączyć, jest istotnie tym, za którego się podaje. Potwierdzenie autentyczności hosta odbywa się przy użyciu szeregu certyfikatów. Na samej górze mamy certyfikat główny (root certificate). Ten certyfikat należy do głównego urzędu certyfikującego (root CA) i jest samopodpisany (self-signed). Dzisiejsze systemy operacyjne oraz przeglądarki internetowe zawierają kilkadziesiąt zaufanych certyfikatów głównych.

Główne urzędy certyfikujące mogą uprawniać inne podmioty do działania w ich imieniu poprzez wygenerowanie im certyfikatów pośrednich (intermediate certificate), podpisując je kluczem prywatnym swojego certyfikatu głównego.

Zazwyczaj ścieżka certyfikacji dla stron internetowych składa się z trzech certyfikatów: certyfikatu głównego, jednego certyfikatu pośredniego oraz certyfikatu domeny. Sprawdzenie poprawności łańcucha certyfikatów odbywa się poprzez walidację podpisów cyfrowych każdego z nich. Jeśli walidacja się powiedzie, przeglądarka bądź system operacyjny uznają, że połączenie jest zaufane.

Gdzie tkwi problem w tym modelu? Mianowicie główne oraz pośrednie centra certyfikacji nie mają wyszczególnionych konkretnych domen, do których mogą wystawiać certyfikaty. Oznacza to, że każdy z tych podmiotów może wystawić zaufany certyfikat dla dowolnej domeny. Jak już wspomniano wyżej, głównych urzędów certyfikacji jest kilkadziesiąt, zaś, jak podała organizacja EFF (Electronic Frontier Foundation) w prezentacji z 2010 roku, w sumie wszystkich zaufanych podmiotów było 1482.

Głównym urzędom certyfikacji trudno utrzymać kontrolę nad wszystkimi z nich i czasem zdarzają się nadużycia. Najnowszy głośny przypadek tego typu pochodzi z marca 2015, gdy egipska firma MCS Holdings wystawiła nieautoryzowane certyfikaty dla kilku domen Google. Dzięki temu pracownicy firmy mogli przeprowadzić atak typu MiTM (man in the middle) na część użytkowników usług Google, którzy nie byliby tego świadomi, bowiem przeglądarka internetowa nie wyświetliłaby żadnego ostrzeżenia o błędnym certyfikacie.

## Czym jest Extended validation dla certyfikatów SSL?

Extended Validation (EV) to rodzaj weryfikacji używanej przy wystawianiu certyfikatów SSL. Pod względem procedur stosowanych przy wydaniu tego typu certyfikatu stanowi on najwyższy standard uwierzytelnienia tożsamości w internecie. Przy ubieganiu się o jego wystawienie Urząd Certyfikacji potwierdza tożsamość podmiotu na podstawie szczegółowej weryfikacji dokumentów rejestrowych i wpisów w rządowych bazach danych oraz innych wiarygodnych źródłach (w niektórych przypadkach wymagane jest przedstawienie stosownych dokumentów lub skanów dokumentów). W toku procedury sprawdzane jest także prawo podmiotu do posługiwania się daną domeną (dokumenty wymagane są tylko w sytuacjach wymagających dodatkowych poświadczeń). W celu potwierdzenia złożenia zamówienia przedstawiciel Urzędu Certyfikacji, telefonicznie (tym samym potwierdzając wiarygodność podanego numer telefonu) kontaktuje się z osobą wskazaną we wniosku o certyfikat.

## Kto da się nabrać na taki atak (kontekscie zadania 3)?

## czym są CRL, OCSP?

Certificate Revocation List (CRL) to na bieżąco uaktualniana lista certyfikatów, a dokładniej numerów seryjnych certyfikatów, które zostały unieważnione lub wstrzymane przez ich wystawcę. Przeglądarki internetowe nie potrafią zweryfikować bezpieczeństwa strony internetowej posługującej się odwołanym certyfikatem i przy próbie połączenia się z taką witryną wyświetlają komunikat z ostrzeżeniem.

Online Certificate Status Protocol (OCSP) oznacza protokół, który zapewnia automatyczną weryfikację statusu certyfikatu (pod kątem jego ważności - braku odwołania przez wystawcę). Stosowanie protokołu OCSP jest bardziej bezpieczną formą weryfikacji obowiązywania certyfikatu niż przeszukiwanie list unieważnionych certyfikatów CRL.

## Co się stanie, gdy ktoś pozna klucz tajny serwera www?

Meet In The Middle Attack -> przejęcie sesji

## Co się stanie, gdy ktoś pozna klucz tajny CA, który podpisywał certyfikat serwera www?

Meet In The Middle Attack -> przejęcie sesji

## Co się stanie, gdy ktoś pozna klucz tajny jakiegoś CA?

Meet In The Middle Attack -> przejęcie sesji

## Co się stanie, gdy pewne CA wydaje certyfikaty w oparciu o słabe funkcje haszujące np. MD5?

Meet In The Middle Attack -> przejęcie sesji

## Czym są downgrade attacks na TLS?

Atak typu downgrade (aktualizacja wsteczna) – forma ataku na system komputerowy lub protokół komunikacyjny, w wyniku którego następuje rezygnacja z bezpiecznego, wysokiej jakości trybu pracy (jak np. szyfrowane połączenie) na rzecz starego trybu o niższym poziomie bezpieczeństwa (tekst jawny), który jest dostępny dla zapewnienia kompatybilności wstecznej ze starszymi systemami. Luka ta, znaleziona w OpenSSL, pozwala atakującemu na ustanowienie starszej wersji TLS pomiędzy klientem a serwerem. Jest to jeden z najpowszechniejszych ataków typu downgrade. Tego typu ataki często są wykonywane w ramach ataków z rodziny man in the middle i mogą zostać użyte jako przygotowanie pod atak kryptograficzny, którego przeprowadzenie w inny sposób jest niemożliwe. Ataki typu downgrade były problemem dotyczącym rodziny protokołów SSL/TLS; przykładowym atakiem tego rodzaju jest m.in. „POODLE”. Usunięcie wstecznej kompatybilności jest często jedynym zabezpieczeniem przed atakami downgrade.

## Czym jest HTTP Strict Transport Security (HSTS)?

HTTP Strict Transport Security (HSTS) – mechanizm bezpieczeństwa sieci, który chroni strony przed atakami takimi, jak wymuszone zmniejszenie poziomu protokołu oraz przechwytywanie sesji. Dzięki niemu do serwerów można połączyć się tylko za pomocą przeglądarek, korzystających z bezpiecznych połączeń HTTPS, natomiast nigdy nie dopuszcza on połączeń na bazie niezabezpieczonego protokołu HTTP. HSTS jest uznawany za standardowy protokół przez IETF; został opisany w dokumencie RFC 6797. O stosowaniu polityki HSTS serwer informuje użytkownika za pomocą pola znajdującego się w nagłówku odpowiedzi HTTP o nazwie „Strict-Transport-Security”. Polityka HSTS określa czas, w którym użytkownik może być połączony z serwerem tylko poprzez bezpieczne połączenie.


# Lista 4

## Czym jest protokół SSH?

protokół komunikacyjny wykorzystywany w sieciach TCP/IP, umożliwiający zdalne połączenie z serwerem. Wszystkie dane transferowane drogą SSH są szyfrowane, a uwierzytelnianie użytkowników zachodzi na wielu poziomach

## Czym jest protokół PGP?

Pretty Good Privacy (PGP) – narzędzie służące do szyfrowania, odszyfrowywania i uwierzytelniania między innymi poczty elektronicznej, plików, katalogów oraz partycji dyskowych.

## Co daje powiązanie kluczy ssh z kontem?



## Jakie wektory ataków są eliminowane przez 2FA? Jakie wektory ataku są eliminowane przez klucze PGP, ale nie przez klucze SSH/2FA?



## Czym są Application Specific Passwords? (tu: jak ich nie implementować https://niebezpiecznik.pl/post/wpadka-google-jak-mozna-bylo-ominac-dwuskladnikowe-uwierzytelnienie/)

