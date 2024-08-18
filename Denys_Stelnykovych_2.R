R - język programowania i środowisko do obliczeń statystycznych 
oraz wizualizacji wyników

Zajęcia 2. Macierze 

# Co to jest macierz
# Macierz jest tablicą dwuwymiarową, w której dane są uporządkowane w wiersze i kolumny
# Macierz może zawierać dane tylko jednego typu (tekst, liczby albo zmienne logiczne)

[,1] [,2] [,3] [,4] [,5]
[1,]    1    9   17   25   33
[2,]    3   11   19   27   35
[3,]    5   13   21   29   37
[4,]    7   15   23   31   39

# Tworzenie macierzy
# Funkcja matrix()pozwala utworzyć macierz z wektora - układa dane kolumnami
wektor = seq(1,40,by=2)
M=matrix(wektor, nrow = 4, ncol = 5)

# Możemy skrócić kod do jednej linijki
M=matrix(seq(1,40,by=2), nrow = 4, ncol = 5)

# Możemy określić tylko liczbę wierszy lub kolumn
matrix(wektor, nrow = 4) 
matrix(wektor, ncol = 5) 

# Dane można ułożyć wierszami
matrix(wektor, nrow = 4, byrow = TRUE)

# Funkcje cbind()i rbind()pozwalają utworzyć macierz z kilku wektorów
# Najpierw utwórzmy kilka wektorów
wiek= c(25,45,18,20,33,65,23,70)
waga=sample(50:100,8)
wzrost=sample(140:190,8)

# Funkcja cbind()pozwala na połączenie kilku wektorów pionowo (kolumnami)
macierz1 = cbind(wiek, waga, wzrost) 


# Funkcja rbind()pozwala na połączenie kilku wektorów poziomo (wierszami)
macierz2 = rbind(wiek, waga, wzrost) 

# Transpozycja macierzy
# Funkcja t()transponuje macierz
t(macierz2)

# Nazywanie wierszy i kolumn
# Dodanie nazw wierszy:

# Metoda 1
rownames(macierz1) = c("Ania","Piotr","Ewa","Paweł","Ala","Michał", "Eliza","Marek")

# Metoda 2. Najpierw utworzyć wektor z tymi nazwami, wtedy możemy go używać w wielu miejscach
imiona=c("Ania","Piotr","Ewa","Pawel","Ala","Michal","Eliza","Marek")
rownames(macierz1) = imiona 

# Odwoływanie się do elementów macierzy, wybór podzbiorów
# Macierz ma dwa wymiary, więc używamy nawiasów kwadratowych [ , ] z przecinkiem  #oddzielającym te wymiary
macierz1[1,2]   # wybór 1 elementu
macierz1[1:5,2:3]   # wybór podzbioru
macierz1[1:5,c(1,3)]   # wybór podzbioru
macierz1[,1] # wybierze całą pierwszą kolumnę
macierz1[1,] # wybierze cały pierwszy wiersz

# Odwoływanie się do elementów macierzy po nazwach
macierz1["Piotr", "waga"]

# Używając kwadratowych nawiasów można też zmienić wartość danego elementu
macierz1[1,2] = 40

# Dodawanie nowych zmiennych do macierzy
# Funkcjami rbind()oraz cbind() możemy dopisywać kolejne wektory do istniejącej macierzy
# Utworzenie wektora ze zmienną płeć
plec=rep(c("0","1"), times=4)

# Dodanie wektora plec jako kolumny do macierz1
macierz1 = cbind(macierz1,plec)

# Dodawanie nowych obserwacji do macierzy
# Najpierw tworzymy nowe wektory z obserwacjami
Monika = c(42,52,170,0) #obserwacje dla Moniki – wiek, waga, wzrost i płeć
Marcin = c(18,90,190,1) #obserwacje dla Marcina – wiek, waga, wzrost i płeć

# Następnie dodajemy nowo utworzone wektory do macierz1 jako wiersze
macierz1 = rbind(macierz1, Monika, Marcin)

# Połączenie dwóch macierzy
# Tworzymy dwie macierze
M1 = matrix(1:12,3,4)
M2 = matrix(-6:5,3,4)

# Łączymy dwie macierze funkcją cbind i rbind
M3 = cbind(M1,M2)
M4 = rbind(M1,M2)

# Operacje na macierzach
M1 + 5   # dodanie liczby do każdego elementu macierzy 
M1 - 5   # odjęcie liczby od każdego elementu macierzy 
M1 * 5   # mnożenie każdego elementu macierzy przez liczbę
M1 / 5   # dzielenie każdego elementu macierzy przez liczbę
M1 ^ 5   # potęgowanie każdego elementu macierzy 

M1 + M2   # dodanie dwóch macierzy do siebie, poszczególnych elementów
M1 - M2   # odjęcie dwóch macierzy do siebie, poszczególnych elementów
M1 / M2   # podzielenie dwóch macierzy 
M1 * M2   # mnożenie poszczególnych elementów macierzy (to nie jest klasyczne mnożenie!!)
M1 %*% t(M2)   # klasyczne mnożenie macierzy 

# Operacje na kolumnach i wierszach
rowSums(M1) # sumuje wiersze i daje nowy wektor z wynikami
colSums(M1)  # sumuje kolumny i daje nowy wektor z wynikami




# Dane do zadań (przekopiuj do RStudio i uruchom cały kod)

Lata <- c("2008","2009","2010","2011","2012","2013","2014","2015","2016","2017")

Pracownicy <- c("EwaNowacka","PiotrKruk","JakubKrzysztofik","DanielNiegowski","AnnaIwaniuk","ElizaPietrzak","KamilBors","IzaSadowska","DariuszSidor","MarcinJaniak")

# AUDI – sprzedaż Audi w sztukach w latach 2008-2017
EwaNowacka_A <- c(2,5,7,1,2,4,2,3,1,3)
PiotrKruk_A <- c(3,5,1,4,6,2,5,2,7,6)
JakubKrzysztofik_A <- c(5,7,4,8,4,5,3,2,1,6)
DanielNiegowski_A <- c(3,4,2,6,5,7,5,6,4,6)
AnnaIwaniuk_A <- c(4,2,8,8,7,6,9,7,6,5)
ElizaPietrzak_A <- c(6,7,5,6,6,7,3,8,5,6)
KamilBors_A <- c(5,6,7,4,3,8,7,5,5,6)
IzaSadowska_A <- c(5,5,3,5,0,6,4,8,7,6)
DariuszSidor_A <- c(4,6,4,8,7,6,5,7,5,6)
MarcinJaniak_A <- c(7,3,5,4,6,4,8,7,7,7)

# Macierz AUDI
AUDI_SZT <- rbind(EwaNowacka_A, PiotrKruk_A, JakubKrzysztofik_A, DanielNiegowski_A, AnnaIwaniuk_A, ElizaPietrzak_A, KamilBors_A, IzaSadowska_A, DariuszSidor_A, MarcinJaniak_A)
rm(EwaNowacka_A, PiotrKruk_A, JakubKrzysztofik_A, DanielNiegowski_A, AnnaIwaniuk_A, ElizaPietrzak_A, KamilBors_A, IzaSadowska_A, DariuszSidor_A, MarcinJaniak_A)
colnames(AUDI_SZT) <- Lata
rownames(AUDI_SZT) <- Pracownicy

#SKODA – sprzedaż Skody w sztukach w latach 2008-2017
EwaNowacka_S <- c(8,7,2,2,3,3,5,7,5,6)
PiotrKruk_S <- c(2,5,2,7,6,4,5,4,6,6)
JakubKrzysztofik_S <- c(7,8,5,1,6,7,9,5,4,7)
DanielNiegowski_S <- c(8,5,7,6,6,4,8,6,7,5)
AnnaIwaniuk_S <- c(2,8,8,7,5,8,6,4,2,3)
ElizaPietrzak_S <- c(7,6,6,7,0,6,7,3,6,4)
KamilBors_S <- c(7,4,8,7,5,4,6,4,8,7)
IzaSadowska_S <- c(3,5,0,4,8,7,3,4,7,6)
DariuszSidor_S <- c(4,6,4,8,7,7,4,8,7,5)
MarcinJaniak_S <- c(7,3,5,7,7,3,5,5,4,8)

#Macierz SKODA
SKODA_SZT <- rbind(EwaNowacka_S, PiotrKruk_S, JakubKrzysztofik_S, DanielNiegowski_S, AnnaIwaniuk_S, ElizaPietrzak_S, KamilBors_S, IzaSadowska_S, DariuszSidor_S, MarcinJaniak_S)
rm(EwaNowacka_S, PiotrKruk_S, JakubKrzysztofik_S, DanielNiegowski_S, AnnaIwaniuk_S, ElizaPietrzak_S, KamilBors_S, IzaSadowska_S, DariuszSidor_S, MarcinJaniak_S)


# Zadania

# Zadanie 1. Nadaj nazwy kolumnom macierzy SKODA_SZT używając wektora Lata



colnames(SKODA_SZT) <- Lata



# Zadanie 2. Zmień nazwy wierszy macierzy SKODA_SZT używając wektora Pracownicy


rownames(SKODA_SZT) <- Pracownicy



# Zadanie 3. Według zaktualizowanych danych, Eliza Pietrzak sprzedała w 2012 r. trzy sztuki Skody, 
# a Iza Sadowska sprzedała w 2010 r. dwie sztuki Skody. Nanieś poprawki do macierzy SKODA_SZT

SKODA_SZT["Eliza Pietrzak", "2012"] <- 3
SKODA_SZT["Iza Sadowska", "2010"] <- 2




# Zadanie 4. Wyświetl sprzedaż Audi przez poszczególnych pracowników w trzech ostatnich latach

AUDI_last_3_years <- AUDI_SZT[, (length(Lata)-2):length(Lata)]
print(AUDI_last_3_years)


# Zadanie 5. Wyświetl sprzedaż Audi przez trzech pierwszych pracowników z listy w latach 2010-2014

AUDI_selected <- AUDI_SZT[1:3, which(Lata %in% c("2010", "2011", "2012", "2013", "2014"))]
print(AUDI_selected)

# Zadanie 6. Wyświetl sprzedaż Skody przez poszczególnych pracowników w roku 2008 i 2017

SKODA_selected_years <- SKODA_SZT[, c("2008", "2017")]
print(SKODA_selected_years)


# Zadanie 7. Oblicz wartość sprzedaży Skody przez poszczególnych pracowników 
# w kolejnych latach, jeśli cena jednego samochodu wynosi 60.000 zł. 
SKODA_PLN <- SKODA_SZT * 60000

# Wyniki zapisz w macierzy SKODA_PLN


# Zadanie 8. Oblicz wartość sprzedaży Audi przez poszczególnych pracowników 
AUDI_PLN <- AUDI_SZT * 110000

# w kolejnych latach, jeśli cena jednego samochodu wynosi 110.000 zł. 
# Wyniki zapisz w macierzy AUDI_PLN

# Zadanie 9. Oblicz wartość sprzedaży obu marek samochodów przez poszczególnych 
# pracowników w kolejnych latach. Wyniki zapisz w macierzy SPRZEDAŻ
SPRZEDAŻ <- AUDI_PLN + SKODA_PLN


# Zadanie 10. Oblicz wartość sprzedaży obu marek samochodów przez poszczególnych 
# pracowników łącznie w całym okresie. Wynik zapisz w wektorze Pracownicy_PLN
Pracownicy_PLN <- rowSums(SPRZEDAŻ)


# Zadanie 11. Oblicz wartość sprzedaży obu marek samochodów w poszczególnych latach – 
# łącznie przez wszystkich pracowników. Wynik zapisz w wektorze Lata_PLN

Lata_PLN <- colSums(SPRZEDAŻ)
print(Lata_PLN)

# Zadanie 12. Oblicz pensje pracowników w poszczególnych latach, jeśli każdy pracownik
# - otrzymywał 2000 podstawy miesięcznie,
# - otrzymywał prowizję w wysokości 3% wartości sprzedaży Skody,
# - otrzymywał prowizję od każdego sprzedanego Audi w wysokości 2500 zł.
# Wynik zapisz w macierzy Pracownicy_pensje

base_salary <- 2000 * 12 # annual base salary
commission_SKODA <- 0.03 # 3% commission on Skoda sales
commission_AUDI <- 2500 # 2500 commission per Audi sold


SKODA_commission <- SKODA_PLN * commission_SKODA

AUDI_commission <- AUDI_SZT * commission_AUDI

Pracownicy_pensje <- base_salary + SKODA_commission + AUDI_commission


