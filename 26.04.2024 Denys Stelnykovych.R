R - język programowania i środowisko do obliczeń statystycznych 
oraz wizualizacji wyników

Zajęcia 3. Ramki danych 

# Co to jest ramka danych
# Ramka danych (data frame) może zawierać dane różnego typu, jak tekst, liczby i zmienne logiczne,
# ale jedna kolumna może zawierać tylko jeden typ danych
# Ramka danych przechowuje zmienne zbioru danych jako kolumny, a obserwacje jako wiersze
# Na górze wyświetlane są nazwy poszczególnych kolumn, natomiast wiersze są ponumerowane, podobnie jak w Excelu

nazwisko 	typ 	   test1	test2	  wynik 	 ocena	zaliczenie
1	Burdzy 	dzienne    42   	 52	  47.0	  2.0   	FALSE
2	Dyrkacz 	dzienne    85   	 65	  75.0	  4.0   	TRUE
3	Grzeszczak 	zaoczne    49   	 68	  58.5 	  3.0   	TRUE
4	Kowalczyk 	dzienne    76   	 25	  50.5	  3.0   	TRUE
5	Lubicki 	zaoczne    73   	 83	  78.0	  4.0   	TRUE
6	Nowak 	zaoczne    36   	 18	  27.0	  2.0   	FALSE
7	Nowicki 	dzienne    66   	 68	  67.0	  3.5   	TRUE
8	Sachowicz 	zaoczne    91   	 94	  92.5	  5.0   	TRUE
9	Walczak 	zaoczne    55   	 40	  47.5	  2.0   	FALSE
10	Wrotek 	dzienne    89   	 75	  82.0	  4.5   	TRUE
11	Kulig 	dzienne    36   	 68	  52.0	  3.0   	TRUE
12	Wrona 	dzienne    66   	 25	  45.5	  2.0   	FALSE
13	Grzesiuk 	zaoczne    91   	 83	  87.0 	  4.5   	TRUE
14	Kowal 	dzienne    55   	 18	  36.5	  2.0   	FALSE
15	Lubczyk 	zaoczne    89   	 68	  78.5	  4.0   	TRUE
16	Nocul 	zaoczne    42   	 18	  30.0	  2.0   	FALSE
17	Nawrot 	dzienne    85   	 68	  76.5	  4.0   	TRUE
18	Salicki 	zaoczne    49   	 94	  71.5	  4.0   	TRUE
19	Wilk  	zaoczne    76   	 40	  58.0	  3.0   	TRUE
20	Grotek 	dzienne    73   	 75	  74.0	  4.0   	TRUE

# Ramkę danych można utworzyć samodzielnie w R albo importując dane z pliku zewnętrznego
# Do R można importować pliki csv, txt, spss, dta i wiele innych

# Tworzenie ramki danych
# Funkcja data.frame()pozwala utworzyć ramkę danych z istniejących wektorów
# Wektory stają się kolumnami ramki danych, zatem muszą mieć taką samą długość

# Krok 1. Utwórzmy następujące wektory 
nazwisko <- c("Burdzy", "Dyrkacz", "Grzeszczak", "Kowalczyk", "Lubicki", "Nowak", "Nowicki", "Sachowicz", "Walczak", "Wrotek", "Kulig", "Wrona", "Grzesiuk", "Kowal", "Lubczyk", "Nocul", "Nawrot", "Salicki", "Wilk", "Grotek")
typ <- c("dzienne", "dzienne", "zaoczne", "dzienne", "zaoczne", "zaoczne", "dzienne", "zaoczne", "zaoczne", "dzienne", "dzienne", "dzienne", "zaoczne", "dzienne", "zaoczne", "zaoczne", "dzienne", "zaoczne", "zaoczne", "dzienne")
test1 <- c(42, 85, 49, 76, 73, 36, 66, 91, 55, 89, 36, 66, 91, 55, 89, 42, 85, 49, 76, 73)
test2 <- c(52, 65, 68, 25, 83, 18, 68, 94, 40, 75, 68, 25, 83, 18, 68, 18, 68, 94, 40, 75)
wynik <- c(47, 75, 58.5, 50.5, 78, 27, 67, 92.5, 47.5, 82, 52, 45.5, 87, 36.5, 78.5, 30,76.5, 71.5, 58, 74)
ocena <- c(2, 4, 3, 3, 4, 2, 3.5, 5, 2, 4.5, 3, 2, 4.5, 2, 4, 2, 4, 4, 3,4)
zaliczenie <- c(FALSE, TRUE, TRUE, TRUE, TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, TRUE, FALSE, TRUE, FALSE, TRUE, FALSE, TRUE, TRUE, TRUE, TRUE)

# Krok 2. Utwórzmy ramkę danych "egzamin"” z powyższych wektorów
egzamin <-data.frame(nazwisko, typ, test1, test2, wynik, ocena, zaliczenie)
print(egzamin);

# Wybieranie elementów i podzbiorów ramki danych
# Podobnie jak w przypadku wektorów i macierzy, poszczególne element ramki danych wybiera się za pomocą nawiasu kwadratowego. Najpierw wpisujemy numery wierszy, a po przecinku numery kolumn.
egzamin[1,3] # wybierze element z pierwszego wiersza i trzeciej kolumny
egzamin[1:3,2:4]# wybierze wiersze 1, 2, 3 oraz kolumny 2, 3, 4 
egzamin[c(1,2,5,9),4:5] # jeśli nie są kolejne, to łączymy numery c()

egzamin[6,] # wybierze cały szósty wiersz (wszystkie kolumny)
egzamin[,4] # wybierze całą czwartą kolumnę (wszystkie wiersze)
egzamin[1:3,"wynik"] # wybierając element ramki danych można używać nazw kolumn

# Użycie znaku $
# Krótszą metodą na wybranie jednej kolumny jest użycie znaku $ 
egzamin$wynik 

# Wybraną kolumnę można zapisać do nowego wektora
Wyniki_koncowe = egzamin$wynik

# Można też wybrać dowolny element z kolumny „wynik”
egzamin[2, "wynik"]
egzamin$wynik[2]

# jak rozumiem że random

# Operacje na kolumnach
# Dla wybranej kolumny można policzyć podstawowe statystyki
sum(egzamin$wynik) # suma 
mean(egzamin$wynik) # wartość średnia 
median(egzamin$wynik) # mediana 
min(egzamin$wynik) # minimum 
max(egzamin$wynik) # maksimum

# Na wybranej kolumnie można przeprowadzać działania arytmetyczne
egzamin$wynik + 10
egzamin$wynik - 10
egzamin$wynik * 4
egzamin$wynik / 100

# Można również przeprowadzać działania między kolumnami
egzamin$test1 + egzamin$test2

# Dodawanie nowej kolumny do ramki
# Nową kolumnę do ramki dodajemy formułą nazwa_ramki$nazwa_nowej_kolumny
# Dodajmy kolumnę „suma” do ramki „egzamin”
egzamin$suma = egzamin$test1 + egzamin$test2

# Usuwanie kolumny z ramki
egzamin$suma = NULL

# Zmiana nazw kolumn – funkcja colnames()
colnames(egzamin)=c("Nazwisko","Typ_studiow","Test_1","Test_2","Wynik_srednia","Ocena","Zaliczenie")

# Warunki logiczne
# Równość sprawdzamy znakiem „==”, nie mylić z pojedynczym „=”, które służy przypisywaniu wartości
3 == (2 + 1)
"Robot" == "robot"

# Nierówność sprawdzamy znakiem „!=”
TRUE != FALSE

# Warunki mniejszy, większy, mniejszy równy, większy równy. W przypadku zmiennych tekstowych obowiązuje porządek alfabetyczny.
4 > 2
"pies" < "kot"
TRUE >= FALSE
3 <= 2 + 1

# Operator koniunkcji & - spełnianie jednocześnie kilku warunków
x = 10
x>3 & x<15       # zapis 3 < x < 15 nie zadziała
x >=5 & x==8 & x<100

# Operator alternatywy |
x< 5 | x>=10

#Zadanie 1. Utwórz nową kolumnę ramki „egzamin” o nazwie „Wynik_suma”, 
# która będzie zawierać sumę wyników osiągniętych przez studenta z obu testów

egzamin$Wynik_suma = egzamin$test1 + egzamin$test2;
print(egzamin$Wynik_suma)

# Dodawanie nowej kolumny do ramki ze zmienną logiczną

egzamin$zaliczenie 
print
# Dodanie do ramki „egzamin” kolumny o nazwie „Zaliczenie2”, 

egzamin$Zaliczenie2  
print(egzamin$Zaliczenie2)

# która przyjmuje wartość TRUE, jeśli Wynik_suma jest większy niż 120 punktów 
egzamin$Zaliczenie2 = egzamin$Wynik_suma > 120


# Zadanie 2. Dodaj nową kolumnę do ramki „egzamin” o nazwie „Zaliczenie3”, 
  egzamin$Zaliczenie3 = egzamin$Wynik_suma > 50 & egzamin$test1 > 30 & egzamin$test2 > 30

# która będzie zawierać zmienną logiczną przyjmującą wartość TRUE, 
egzamin$zaliczenie
# jeśli średni wynik studenta z obu testów jest większy niż 50 punktów 
# i z żadnego z testów nie otrzymał wyniku gorszego niż 30 punktów

# Filtrowanie wierszy ramki danych – zmienne logiczne
# Do filtrowania danych używamy nawiasów kwadratowych, nakładając warunek na wiersze
# Możemy wybrać wszystkie kolumny, ale tylko dla studentów z pozytywnym wynikiem 
egzamin[egzamin$Zaliczenie==TRUE,]

# Możemy też wybrać studentów z negatywnym wynikiem 
egzamin[egzamin$Zaliczenie==FALSE,] 

# Filtrowanie wierszy ramki danych – zmienne liczbowe i tekstowe
# Wyświetl dane tylko dla osoby o nazwisku Nowak
egzamin[egzamin$Nazwisko=="Nowak",] 

# Wyświetl dane dla osób, które średnio z obu testów zdobyły więcej niż 80 pkt
egzamin[egzamin$Wynik_srednia > 80,] 

# Ramkę przefiltrowaną wg dowolnego kryterium możemy zapisać do nowej ramki
egzamin[egzamin$Typ_studiow=="dzienne",] 

# Zadanie 3. Wyświetl dane tylko dla osób ze studiów dziennych

egzamin[egzamin$Typ_studiow=="dzienne",] 


# Zadanie 4. Wyświetl dane dla osób, które z testu 1 zdobyły więcej niż 50 pkt, ale nie więcej niż 60

egzamin[egzamin$test1 > 50 & egzamin$test1 < 60,]


# Zadanie 5. Wyświetl dane dla osób, które chociaż z jednego testu zdobyły co najmniej 50 pkt

egzamin[egzamin$test1 > 50 | egzamin$test2 > 50,] 



# Zadanie 6. Wyświetl dane dla osób o nazwisku Burdzy i Lubicki

egzamin[egzamin$nazwisko %in% c("Burdzy", "Lubicki"), ]

# Filtrowanie jednocześnie wierszy i kolumn ramki danych
# Używamy nadal nawiasów kwadratowych – przed przecinkiem dajemy warunek na wiersze, 
# a po przecinku dajemy numery kolumn lub ich nazwy
# Możemy wybrać tylko kolumnę z nazwiskami studentów z pozytywnym wynikiem 
egzamin[egzamin$Zaliczenie==TRUE, 1]
egzamin[egzamin$Zaliczenie==TRUE, "Nazwisko"]

# Wybór dwóch kolumn dla studentów z pozytywnym wynikiem 
egzamin[egzamin$Zaliczenie==T, c("Nazwisko", "Wynik_suma")]

# Zadanie 7. Wyświetl średni wynik z testów tylko dla osoby o nazwisku Wrotek

mean(egzamin$wynik[egzamin$nazwisko == "Wrotek"])

# Zadanie 8. Wyświetl wyniki z obu testów tylko dla osoby o nazwisku Nowak

egzamin[egzamin$nazwisko == "Nowak", c("test1", "test2")]
# Zadanie 9. Wyświetl nazwiska i wyniki z obu testów dla wszystkich osób poza Nowakiem

egzamin[egzamin$nazwisko != "Nowak", c("nazwisko", "test1", "test2")]

# Sortowanie ramki danych
# Funkcja order() podaje pozycję każdego elementu wektora
a = c(100, 10, 1000, 1)
order(a)
[1] 4 2 1 3
# czyli najpierw bierzemy element czwarty, potem drugi, potem pierwszy, potem trzeci

b = c("a", "c", "e", "b", "d")
order(b)
[1] 1 4 2 5 3
# na literach też zadziała i ułoży je alfabetycznie

# Możemy użyć wynik funkcji order() do posortowania tego wektora
a[order(a)]

# Użyjmy funkcji order() do posortowania naszej ramki danych egzamin 
# Uporządkujmy egzamin rosnąco wg średniej liczby punktów uzyskanych z testów
egzamin[order(egzamin$Wynik_srednia),]

# Uwaga – to tylko sortuje na podglądzie, bez zachowania zmian 
# Jeśli potrzebujemy możemy nadpisać zmiany na naszą ramkę
egzamin = egzamin[order(egzamin$Wynik_srednia),]

# Uporządkujmy egzamin malejąco wg sumy punktów uzyskanych na testach
egzamin[order(egzamin$Wynik_suma, decreasing=T),]

# Zadanie 10. Posortuj ramkę „egzamin” wg wyniku z testu 1 rosnąco
egzamin[order(egzamin$test1), ]
print(egzamin)


# Zadanie 11. Posortuj ramkę „egzamin” wg wyniku z testu 2 malejąco

egzamin[order(-egzamin$test2), ]
print(egzamin)




