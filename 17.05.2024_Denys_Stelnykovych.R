IMPORT DANYCH DO R
Możemy wczytywać dane zewnętrzne z plików zapisanych na dysku w różnych formatach, np. tekstowe (txt), csv (csv), STATA (dta), dBase (dbf), SPSS (sav).
Na ogół dane są w pliku jako tablica, w której wiersze są interpretowane jako obserwacje, a kolumny jako zmienne. Pierwszy wiersz danych może zawierać nagłówki kolumn (nazwy zmiennych).

Sprawdzanie bieżącej ścieżki roboczej katalogu (domyślna ścieżka to ścieżka do pliku * .r.project):
  getwd()
Wygodnie jest zdefiniować sobie własną ścieżkę do katalogu, w którym przechowujemy dane i z którego dane będą domyślnie wczytywane:
  setwd("C:/folder")     #domyślnym katalogiem jest C:\folder
UWAGA!
  W R w specyfikacji ścieżki do pliku używamy znaku / lub podwójnego ukośnika odwrotnego \\ , np.:
  setwd 
getwd()
setwd("/Users/denysstelnykovych/Desktop/17.05")   

Opcje wczytywania pliku i separatory danych

•	nagłówki kolumn w pierwszym wierszu
(header=T)  	#jeśli pierwszy wiersz nie zawiera nagłówka, to piszemy header=F

•	separator zmiennych
sep=(";") - średnik, sep=(",") - przecinek,  sep=("\t") - tabulacja, sep=(" ") – spacja

•	separator miejsc dziesiętnych
dec=(".") - kropka, dec=(",") - przecinek

Wczytanie danych zapisanych w formacie R (* .Rdata, typ pliku R Workspace)

Wczytaj dane z pliku oceny.Rdata
dane1=read.table("oceny.Rdata", header=TRUE) 
dane1

Wczytanie danych zapisanych w formacie txt 

dane2=read.table("ToothGrowth.txt",header=TRUE, sep=",", dec=".")
dane2

Wczytanie danych zapisanych w formacie csv 

dane3=read.table("fastfood.csv",header=TRUE, sep=";", dec=".")
dane3



EXPORT DANYCH Z R


Zapisanie danych w formacie R

write.table(dane1, "dane1.Rdata")


Zapisanie danych w formacie txt

write.table(dane2, "dane2.txt")


Zapisanie danych w formacie csv 

write.csv(dane3, "dane3.csv")  

Ćwiczenie 1. Wczytaj plik wages.csv
wages=read.table("wages.csv",header=TRUE, sep=";", dec=".")

  
•	Wyświetl 5 pierwszych obserwacji z zaimportowanej tabeli „wages”.
head(wages, 5)


•	Wyświetl 2 ostatnie obserwacje z zaimportowanej tabeli „wages”.
tail(wages, 2)
•	Wyświetli nazwy kolumn z zaimportowanej tabeli „wages”.
colnames(wages)
Dostęp do zmiennej

Dostęp do konkretnej zmiennej uzyskujemy używając znaku $. 

dane1$wiek     #wyświetli obserwacje zmiennej „wiek” z tabeli „dane1”

Można od razu zapisać te obserwacje do wektora:
  
  wektor1= dane1$wiek
wektor1

Dostęp do wartości konkretnej obserwacji dla danej zmiennej uzyskujemy podając numer obserwacji w nawiasach kwadratowych. 

dane1$imie[2]     #wyświetli drugą obserwację zmiennej „imie” z tabeli „dane1”


Ćwiczenie 2. 
Wyświetl obserwacje zmiennej „len” z tabeli dane2 i zapisz je do wektora V.


V <- dane2$len

print(V)


Ćwiczenie 3. 
Wyświetl dwunastą obserwację zmiennej AGE z tabeli „wages”.

twelfth_age <- wages$AGE
print(twelfth_age)

Wybieranie podzbioru obserwacji

Można wybrać podzbiór obserwacji na podstawie warunku logicznego nałożonego na zmienne. Można też wyświetlić tylko niektóre zmienne. 

Wyświetl osoby, które nie zaliczyły przedmiotu
nzal=dane1[dane1$zaliczenie==FALSE,]     
nzal


Wyświetl dane tylko dla osób o imieniu Ewa
Ewa=dane1[dane1$imie=="Ewa",]         
Ewa


Wyświetl osoby z 3. roku, które zaliczyły przedmiot
zal_3=dane1[dane1$ocena>2&dane1$rok_studiow==3,]     
zal_3 

Ile jest łącznie takich osób? Użyj funkcji sum() do zliczenia ilości obserwacji spełniających dany warunek:
  sum(dane1$ocena>2&dane1$rok_studiow==3)  


Wyświetli wybrane 3 kolumny zmiennych
dane1[c("imie","wiek","ocena")]    

Ćwiczenie 4.
Z tabeli dane1 wyświetl:
  •	osoby z drugiego roku studiów, które nie zaliczyły przedmiotu; rezultat zapisz do pliku csv
second_year_not_passed <- subset(dane1, rok_studiow == 2 & zaliczenie == FALSE)
write.csv(second_year_not_passed, "second_year_not_passed.csv", row.names = FALSE)
•	osoby w wieku poniżej 30 lat; rezultat zapisz do pliku txt
under_30 <- subset(dane1, wiek < 30)
write.table(under_30, "under_30.txt", sep = "\t", row.names = FALSE, quote = FALSE)

Podstawowe statystyki zmiennych

Funkcja summary() pozwala wyświetlić podstawowe statystyki zmiennych. 
summary(dane2)

Inne przydatne funkcje: 
  mean() - wartość średnia
median() - mediana (wartość́ środkowa)
min() - minimum 
max() - maksimum
table() - informacja o liczebnościach poszczególnych wartości zmiennych

Ćwiczenie 5.
Korzystając z funkcji table() wyświetl informację o liczebnościach poszczególnych wartości zmiennej „ocena” z tabeli dane1. Ile osób otrzymało poszczególne oceny?
  
ocena_counts <- table(dane1$ocena)
print(ocena_counts)

  UWAGA!
  Jako argumentów funkcji czasami można używać samych nazw zmiennych, ale gdy korzystamy z wielu tabel danych, bezpieczniej jest podawać cała specyfikację, np. mean(dane1$wiek). 

