R - język programowania i środowisko do obliczeń statystycznych 
oraz wizualizacji wyników

Zajęcia 1. Wektory 

# Kilka uwag o programowaniu w R
# Nazwy zmiennych mogą zawierać: litery, cyfry, podkreślnik, kropkę.
# Wielkość liter ma znaczenie. „A” i „a” oznaczają dla R co innego.

# Komentarze w R można wprowadzać po znaku # 
# po tym znaku R ignoruje całą treść – aż do końca linijki

# RStudio to zintegrowane środowisko programistyczne (IDE) dla R. Zawiera konsolę, edytor kodu i
# podświetlania składni, okno do wizualizacji wyników oraz narzędzia do zarządzania obszarem
# roboczym. Najnowsza wersja jest do pobrania: www.rstudio.com/products/rstudio/download/

# Przydatne materiały:
# https://cran.r-project.org/doc/contrib/Komsta-Wprowadzenie.pdf

# R jako kalkulator - podstawowe działania
1+4+8			#dodawanie
187672-11297     	#odejmowanie
10*10    		#mnożenie
12/10    		#dzielenie
12%%10    		#reszta z dzielenia
12%/%10    		#część całkowita z dzielenia
3^3   			#potęgowanie
121^(2/4)     		#pierwiastkowanie

Wbudowane funkcje arytmetyczne
sqrt(16)     		#pierwiastek kwadratowy
abs(-10)     		#moduł z liczby
factorial(8)     		#silnia

# Struktury danych w R
• Wektor - seria danych jednego typu.
• Macierz - seria wektorów jednego typu.
• Ramka danych (data frame) - seria wektorów różnych typów (analogicznie jak tabelka w Excelu).

# Co to jest wektor
# Wektor jest najprostszą, a jednocześnie najważniejszą, strukturą w środowisku R. Może zawierać
# liczby, ciągi znaków (np. podpisy do danych), jak również dane logiczne (prawda lub fałsz). 
# Jeden wektor zawiera dane tylko jednego typu - albo liczby, albo ciągi znaków, albo dane logiczne.

# Tworzenie wektora
# Wektory można tworzyć na wiele sposobów. Najczęściej używa się operatora konkatenacji c().
# Definiowanie wektora 5-elementowego:
wektor1 = c(1,2,3,4,5)
wektor1

# Operator pomocniczy ':' utworzy ten sam wektor co powyżej:
wektor2 = 1:5
wektor2

# Operator sekwencji seq() pozwala utworzyć ciąg liczb w danym zakresie. Parametr ‘by’ określa krok:
wektor3 = seq(1, 100, by=2)
wektor3

# Operator powtórzeń rep()
wektor4=rep(1:4, 2)
wektor4

# Utwórz poniższe wektory i przeanalizuj różnice między nimi.
wektor5=rep(1:4, each = 2)
wektor6=rep(1:4, c(2,2,2,2))
wektor7=rep(1:4, c(2,1,2,1))

# Utwórz poniższe wektory i przeanalizuj sposób ich tworzenia.
wektor8=rep(1:4, each = 2, len = 6)    
wektor9=rep(1:4, each = 2, len = 8)
wektor10=rep(1:4, each = 2, times = 3)

# Na wektorach można wykonywać działania oraz podstawowe funkcje
x = c(2,4,5)
y = c(1,3,2)
x+2
3*y
x+y+2  # Pod warunkiem, że oba wektory są tej samej długości
x*y       # Pod warunkiem, że oba wektory są tej samej długości

# Wybrane funkcje operujące na wektorach
max() 		- maksymalna wartość z wektora
min() 		- minimalna wartość
mean() 		- średnia arytmetyczna
sum() 		- suma elementów wektora
length() 	- liczba elementów w wektorze
median() 	- mediana
prod() 		- iloczyn elementów wektora



# Zadania wektory 1

# Zadanie 1. Utwórz 8-elementowy wektor A, który zawiera cyfry od 1 do 8. 
A <- c(1,2,3,4,5,6,7,8)
A
# Utwórz 8-elementowy wektor B, który zawiera ciąg cyfr od 0 do 1 powtórzony czterokrotnie.
B=rep(0:1, 4)
B

# Zadanie 2. Dodaj do siebie dwa wektory: A i B.

C = A + B
C

# Zadanie 3. Pomnóż wektor B przez liczbę 5.

C1 = 3*B
C1

# Zadanie 4. Odejmij od wektora A liczbę 3.

C2 = A - 3
C2
# Zadanie 5. W wyniku dokonania pomiarów technicznych otrzymujesz następujące 
# wyniki: 4.3, 4, 5, 4.6, 4.1, 3.8, 3, 2.9, 4, 5.1, 4. Zapisz wyniki w wektorze pomiary.

Zad5 = c(4.3, 4, 5, 4.6, 4.1, 3.8, 3, 2.9, 4, 5.1, 4)
Zad5

# Zadanie 6. Podaj liczbę elementów w wektorze pomiary za pomocą odpowiedniej funkcji.

length(Zad5)

# Zadanie 7. Podaj sumę elementów w wektorze pomiary za pomocą odpowiedniej funkcji.

sum(Zad5)

# Zadanie 8. Podaj najmniejszą wartość pomiaru z wektora pomiary za pomocą odpowiedniej funkcji.

min(Zad5)

# Zadanie 9. Podaj największą wartość pomiaru z wektora pomiary za pomocą odpowiedniej funkcji.

max(Zad5)

# Zadanie 10. Oblicz średnią arytmetyczną liczb w wektorze pomiary za pomocą odpowiedniej funkcji

mean(Zad5)





# Odwoływanie się do elementów wektora - indeksowanie wektorów
# Indeksowanie wektorów jest czynnością̨, w której odnosimy się do konkretnych elementów
# wektora, stanowiących podzbiór całości. W wyniku indeksowania otrzymuje się również wektor,
# jednak jest on krótszy, gdyż zawiera elementy wybrane z większego wektora.

# Ważne: elementy wektora numerowane są od liczby 1.

# Dany jest wektor
w=c(8, 8, 1, -24, -15, -6, 79, 4)

w[2]		#wybierz tylko drugi element wektora w
w[-2] 		#wybierz wszystkie oprócz drugiego elementu
w[c(1,3,6)] 	#wybierz pierwszy, trzeci i szósty element
w[c(1,5)] 	#wybierz pierwszy i piąty element
w[c(1:5)]	#wybierz kolejno pięć pierwszych elementów
w[-(5:8)]	#wybierz wszystkie oprócz elementów kolejno od 5 do 8
w[w>0] 	#wybierz elementy większe od zera

# Wbudowane wektory
# Wiele przydatnych wektorów jest wbudowanych w R, np. nazwy miesięcy lub litery alfabetu:
month.name
LETTERS
letters

# Ćwiczenie. Wybierz z wektora LETTERS elementy od 5 do 10.
LETTERS[ 5:10 ]

# Ćwiczenie. Wybierz z wektora LETTERS elementy 1 i 2 oraz od 9 do 14.
LETTERS[ c(1, 2, 9:14) ]

# Ćwiczenie. Korzystając z seq() zbuduj sekwencję liter złożoną z co drugiej litery wektora LETTERS:
LETTERS [seq(from = 1, to = length(LETTERS), by = 2)]

# Alternatywnie – za pomocą zmiennej “co_druga”, w której przechowamy “długie komendy”:
co_druga = seq(from = 1, to = length(LETTERS), by = 2)
LETTERS[ co_druga ] 

# Nazywanie elementów wektora 
# Dodanie nazw elementów wektora:

# Metoda 1. Utwórz wektor, następnie nazwij jego elementy funkcją names()
xyz = c(12, 18, 10) 
names(xyz) = c("first","second","third")
xyz[c("second")] 			# wybierz konkretny element wektora poprzez nazwę

# Metoda 2. Nazwij elementy wektora w momencie jego tworzenia
wartosc = c(przychod = 6100, dochod = 5000, podatek_proc = 22, region = 5, rejon = 9) 

wartosc[c("dochod", "podatek_proc")] 

# Zmiana kolejności elementów w wektorze
# Odwrócenie kolejności elementów w wektorze
wartosc[ 5:1 ]

# Korzystanie z warunków logicznych
# Wybierz wszystkie elementy wektora, które mają wartość mniejszą od 100
wartosc[ wartosc < 100 ]

# Zmiana elementów wektora
# Zmiana wartości czwartego i piątego elementu wektora:
wartosc[ c(4,5) ] = c(11,7) 
wartosc

# Dodawanie nowych elementów do wektora
wartosc = c(wartosc, kod.kraju = 1)
wartosc

# Połączenie dwóch wektorów
# Wektory można połączyć ze sobą za pomocą operatora konkatenacji c()
A=c(1,2)
B=c(3,4)
C=c(A,B)
C

polaczony = c(xyz, wartosc)

# Wektory znakowe
# Wektor może zawierać ciągi znaków i najczęściej w analizie będą to etykiety danych. 
serial = c("Westworld", "Black mirror", "Stranger things", "Suits", "House of Cards", "The Strain")

# Wybierz element drugi wektora serial
serial[2]

# Wybierz elementy od trzeciego do piątego wektora serial
serial[3:5]

# Wybierz elementy od pierwszego do trzeciego oraz element szósty wektora serial
serial[c(1:3, 6)]

# Dodaj nowy element do wektora serial
serial[7]= "Game of Thrones"

# Zmień wartość elementu piątego wektora serial
serial[5]= "House M.D." 


# Zadania wektory 2

# Zadanie 1. Stwórz wektor o nazwie "wyprzedaz" z 4 elementami, które są następującymi
# wartościami liczbowymi: 1, 5, 8, 10.

wyprzedaz <- c(1, 5, 8, 10)

# Zadanie 2. Nazwij kolejne elementy wektora "wyprzedaz": uszczelki, nakretki, sprezyny, gwozdzie.

names(wyprzedaz) <- c("uszczelki", "nakretki", "sprezyny", "gwozdzie")



# Zadanie 3. Stwórz wektor "inwentaryzacja", który wybiera pierwszy i trzeci element wektora
# "wyprzedaz" poprzez odwołanie do ich nazw.

inwentaryzacja <- wyprzedaz[c("uszczelki", "sprezyny")]


# Zadanie 4. Twoje czasy dojazdu do pracy przez ostatnie dwa tygodnie (10 dni roboczych) w min. to:
# 17 16 20 24 22 15 21 15 17 22. Jaki był najdłuższy, średni i minimalny czasy dojazdu?

# Dane o czasach dojazdu
czasy_dojazdu <- c(17, 16, 20, 24, 22, 15, 21, 15, 17, 22)

# Najdłuższy czas dojazdu
najdluzszy <- max(czasy_dojazdu)

# Średni czas dojazdu
sredni <- mean(czasy_dojazdu)

# Minimalny czas dojazdu
minimalny <- min(czasy_dojazdu)

# Wyświetlenie wyników
najdluzszy
sredni
minimalny


# Zadanie 5. Utwórz 10-elementowy wektor C, który zawiera cyfry 4 i 5 (każda powtórzona
# pięciokrotnie). Utwórz 6-elementowy wektor D, który zawiera ciąg cyfr od 1 do 6.
# Połącz wektor C i D w jeden wektorCD za pomocą operatora konkatenacji c(). 

C <- rep(c(4, 5), each = 5)
D <- 1:6
CD <- c(C, D)
CD

# Zadanie 6. Wybierz (wyświetl w konsoli):
# a) 10-ty element wektora wektorCD 

CD[10]

# b) 16-ty element wektora wektorCD 	
CD[16]

# Zadanie 7. Wybierz (wyświetl w konsoli):
# a) elementy 1, 2, 3, 4, 5, 6, 7 wektora wektorCD	
CD[1:7]
# b) elementy 2, 6 i 11 wektora wektorCD		
CD[c(2,6,11)]

# Zadanie 8. Stwórz wektor waga zawierający pomiary wagi pacjentów 60,72,57,90,95 oraz wektor
# wzrost zawierający pomiary wzrostu pacjentów 1.72 , 1.80 , 1.65 , 1.90 , 1.74.
waga <- c(60,72,57,90,95)
wzrost <- c(1.72 , 1.80 , 1.65 , 1.90 , 1.74)

waga
wzrost
# a)	Oblicz wskaźnik BMI pacjentów. BMI = waga / (wzrost)2
BMI = waga / (wzrost)^2

BMI
# b)	Zsumuj elementy wektora waga i podziel przez liczbę elementów tego wektora.

średnia_waga = sum(waga) / length(waga)
średnia_waga

#	Wynik przypisz do wektora srednia_waga.
# c)	Oblicz średnią wektora waga za pomocą funkcji mean().

 mean(waga)
 

# Zadanie 9. Utwórz wektor znakowy FILMY z trzema dowolnymi tytułami filmów.
 
 FILMY <- c("aaa", "bbb", "ccc")
 FILMY
# a) Wybierz z wektora FILMY elementy 1 i 3.	
 FILMY[c(1,3)]
# b) Dodaj do wektora FILMY czwarty tytuł filmu. 
 
 FILMY[4] <- "ddd"
FILMY



