R - język programowania i środowisko do obliczeń statystycznych 
oraz wizualizacji wyników

Zajęcia 4. Wykresy

# Operatory do generowania sekwencji wartości
# Przypomnijmy operatory seq() i rep()

# sekwencja z krokiem 1:
1:12

# operator seq() tworzy dowolne sekwencje, 'by' określa krok sekwencji
# wygenerowane liczby od 1 do 100 z krokiem 2
seq(1,100,by=2)

# operator rep() powtarza liczby w podanej sekwencji określoną ilość razy, a następnie 
# powtarza tę czynność, aż do osiągnięcia zadanej długości

# wygenerowane liczby od 1 do 4, każda powtórzona dwukrotnie, aż do osiągnięcia przez wektor
# łącznie 10 elementów
rep(1:4, each = 2, len = 10)

# Operatory sample() i rnorm()
# operator sample() utworzy losową permutację wektora podanego jako parametr
sample(1:6) 

# 10-krotne losowanie ze zbioru 1:6 (np. symulacja 10 rzutów kostką)
sample(1:6,10,replace=T)

# operator rnorm() wygeneruje zestaw 30 liczb o średniej 50 i odchyleniu standardowym 5,
# posiadających rozkład normalny
rnorm(30,50,5)

# Wykresy 
# W środowisku R można korzystać z dużej liczby gotowych wykresów. Liczne parametry w funkcjach
# graficznych pozwalają na modyfikację wyglądu i udoskonalanie wizualnej prezentacji danych. 

# najpierw zainstalujmy i załadujmy pakiet ggplot2 odpowiednimi poleceniami
install.packages("ggplot2")
library(ggplot2)



# Wykres punktowy plot(x,y)
# jako argumenty funkcji plot(x, y) podaj dwa wektory - pierwszy oznacza współrzędne x, a drugi y.
# jeśli funkcji plot() damy tylko jeden wektor, drugi ustawi się domyślnie jako kolejne liczby naturalne
# (współrzędne x)

# Przykład 1. Utwórz wektory x i y, a następnie narysuj ich wykres punktowy.
x = c(7.5, 9, 7, 7, 10.5, 8.5, 10, 12.5, 9.5, 10.5)
y = c(65, 70, 66, 68, 66, 64, 71, 67, 72, 75)
plot(x,y)

# Domyślnie plot() jest wykresem punktowym. Zmieniając parametr „type” uzyskasz inne typy:
# "l" - liniowy (mała litera L)
# "b" - punktowo-liniowy
# "c" - liniowy bez punktów
# "o" - punktowo-liniowy (linie przecinają punkty)

# dodaj linie łączące kolejne punkty, dostosowując parametr „type” 
plot(x,y,type="l")

# otrzymany wykres jest bardzo nieczytelny, dlatego posortujemy dane według zmiennej x.
# W tym celu utwórz ramkę danych data, a następnie posortuj dane rosnąco funkcją order():
data = data.frame(x,y)

data = data[order(data[, 1]), ]

# utwórz wykres punktowy – ten wygląda identycznie jak pierwszy wykres punktowy
plot(data)

# utwórz wykres liniowy – ten wykres liniowy jest już czytelny
plot(data, type = "l")

# utwórz wykres punktowo-liniowy
plot(data, type = "b")

# Edycja podstawowych elementów wykresu
# main - tytuł wykresu
# xlab - tytuł osi X
# ylab - tytuł osi Y
# col - kolor wykresu (można ustawić wiele kolorów wpisując pod col wektor lub paletę kolorów)
# col.main - kolor tytułu wykresu
# col.lab - kolor tytułów obu osi
# font - rodzaj czcionki (1 - krój normalny, 2 - pogrubiony, 3 - kursywa, 4 - pogrubiona kursywa)
# lty - rodzaj linii (1 - linia ciągła, 2 - kreskowana, 3 - kropkowana, 4 - kropka-kreska, 5 - długa kreska, 6 - podwójna kreska)
# lwd - grubość linii (standardowo 1).


# Wykres słupkowy barplot()
# Przykład 1. Wykres słupkowy pomiarów maksymalnej temperatury tygodniowej
max.temp = c(22, 27, 26, 24, 23, 26, 28)
barplot(max.temp)

# do wykresu dodano tytuł, tytuły osi, kolory i opisy słupków, wyświetlenie poziome 
barplot(max.temp,
        main = "Maksymalne temp w tygodniu",
        xlab = "St. Celsjusza",
        ylab = "Dzien",
        names.arg = c("Nd", "Pon", "Wt", "Sr", "Czw", "Pt", "Sb"),
        col = "darkred",
        horiz = TRUE)

# Przykład 2. Wykres słupkowy wieku grupki studentów
age = c(21,18,19,21,22,19,22,20,23,22)
barplot(age)

# wektor age zestawiony liczebnościowo
table(age)

# wykres słupkowy wektora age zestawionego liczebnościowo
barplot(table(age))

# do wykresu dodano tytuł, tytuły osi, kolory i obramowanie słupków 
barplot(table(age),
        main="Wiek 10 studentów - liczebnosc",
        xlab="Wiek",
        ylab="Liczebnosc",
        border="red",
        col="blue",
        density=10)

# Przykład 3. Wykres słupkowy tygodniowej sprzedaży różnych rodzajów samochodów
cars = c(1, 3, 6, 4, 9)
trucks = c(2, 5, 4, 5, 12)
suvs = c(4, 4, 6, 6, 16)

# utwórz ramkę danych autos_data
autos_data = data.frame(cars, trucks, suvs)

# utwórz wykres słupkowy zmiennej Suvs z podpisami osi i pomarańczowym obramowaniem słupków
barplot(autos_data$suvs, main="Sprzedaz Suvs", xlab="Dni",  
        ylab="Total", names.arg=c("Pon", "Wt", "Sr", "Czw", "Pt"), 
        border="orange")

# utwórz wykres słupkowy zmiennej Cars z podpisami osi, niebieskim obramowaniem, prążkowane barplot(autos_data$cars, main="Sprzedaz Cars", xlab="Dni",  
ylab="Total", names.arg=c("Pon", "Wt", "Sr", "Czw", "Pt"), 
border="blue", density=c(10,20,30,40,50))

# utwórz wykres słupkowy wszystkich zmiennych z podpisami osi i kolorowym obramowaniem
barplot(as.matrix(autos_data), main="Auta", ylab= "Total", beside=TRUE, col=rainbow(5))

# Wykres kołowy pie()
# Uważane są za mniej wydajne niż wykresy słupkowe, gdyż wykresy kołowe wymagają tylko jednej
# serii wartości (nie umożliwiają porównywania różnych serii danych w podziałach na podgrupy)

# Przykład 1. Wykres kołowy wieku grupki studentów
age = c(21,18,19,21,22,19,22,20,23,22)
pie(age)

# wykres kołowy wektora age zestawionego liczebnościowo
pie(table(age))

# do wykresu dodano skalę szarości
pie(table(age), col=grey(0:4/4))

# Przykład 2. Wykres kołowy tygodniowej sprzedaży samochodów
cars <- c(1, 3, 6, 4, 9)
pie(cars)

# do wykresu dodano tytuł, tytuły osi, kolory i etykiety
pie(cars, main="Sprzedaz Cars", col=rainbow(length(cars)),labels=c("Pon", "Wt", "Sr", "Czw", "Pt"))

# oblicz wartość procentową sprzedaży każdego dnia, zaokrągloną do jednego miejsca dziesiętnego
car_labels <- round(cars/sum(cars) * 100, 1)

# dołącz znak % po każdej wartości
car_labels <- paste(car_labels, "%", sep="")

# do wykresu dodano tytuł, tytuły osi, kolory i procentowe etykiety
pie(cars, main="Sprzedaz Cars", col=rainbow(length(cars)), labels=car_labels, cex=0.8)

# do wykresu dodaj legendę po prawej stronie   
legend(1.5, 0.5, c("Pon", "Wt", "Sr", "Czw", "Pt"), cex=0.8, fill=rainbow(length(cars)))

# Przykład 3. Wykres kołowy rozkładu partii politycznych w sejmie
partie = data.frame(Partia = c("PO", "PSL", "PiS", "TR", "SLD", "SP", "niezrz."), Osoby=c(190, 53, 190, 56, 86, 37, 28))
pie(partie[, 2], labels = partie[, 1], col = rainbow(length(partie[, 1])), main = "Rozklad partii w sejmie")

# Wykres liniowy funkcji w zadanym przedziale curve()
# Przykład 1. Wykres funkcji log10(x) , w przedziale od 0.1 do 10:
curve(log10(x), 0.1, 10)

# umieszczenie wykresu kolejnej funkcji w tym samym okienku co pierwsza umożliwia parametr add
curve(sin(x), 0, 10, add=TRUE)

# domyślnie linia jest koloru czarnego, zmień kolory linii na czerwony i niebieski
curve(log10(x), 0.1, 10, col="red")
curve (sin(x), 0, 10, col="blue", add=T)

# Przykład 2. Wykres gęstości rozkładów chi^2 dla różnej liczby stopni swobody
x = seq(from=0, to =10, by=0.1)
curve(dchisq(x,1), xlim=c(0,10), ylim=c(0,0.6))		#1 stopień swobody
curve(dchisq(x,4), add=T)					# 4 stopnie swobody

# do wykresu dodano tytuł, kolory linii i grubości
curve(dchisq(x,1), xlim=c(0,10), ylim=c(0,0.6), col="red", lwd=3, main="Rozklady Chi^2", xlab="", ylab="")

curve(dchisq(x,4), add=T, col="green", lwd=3)

# do wykresu dodano legendę z odpowiednimi kolorami
curve(dchisq(x,1), xlim=c(0,10), ylim=c(0,0.6), col="red", lwd=3, main="Rozklady Chi^2", xlab="", ylab="", legend("topright",c("1 stopien swobody","4 stopnie swobody"),fill=c("red","green")))

curve(dchisq(x,4), add=T, col="green", lwd=3)

# Histogram hist()
# Przykład 1. Histogram i rozkład normalny
# określ próbę: 200 liczb
proba = rnorm(200)

# rysuj histogram
hist(proba,20,probability=T, col="yellow")

# dodaj do wykresu krzywą rozkładu normalnego
curve(dnorm(x), lwd=3, col="red", add=T)

# Inne wykresy
# boxplot() – wykres pudełkowy
# stars – wykres radarowy
# mosaicplot – wykres mozaikowy
# pairs() – zestaw wykresów rozrzutu

# Zadania

# Zadanie 1. Utwórz wektor auta z wartościami 3, 5, 8, 6, 9.
auto = c(3, 5, 8, 6, 9)
y = seq(1:5)

# tytuł wykresu “Auta” napisany na czerwono czcionką pogrubioną kursywą.


plot(auto,y,type= "b", col = "blue", main = expression(italic("Auta")), font.main = 2 , col.main = "red")



# Zadanie 2. Utwórz wektor w zawierający liczby od 4 do 13.
wektor = seq(4, 13)
# Następnie utwórz wykres słupkowy wektora w z następującymi parametrami:
#•       wpisz tytuł wykresu „Wykres”,
#•       wpisz „argumenty” jako tytuł osi x,
#•       wpisz „wartosci” jako tytuł osi y,
#•       ustaw kolor słupków na czerwony.

barplot(wektor, 
        main = "Wykres", 
        xlab = "argumenty", 
        ylab = "wartości", 
        col = "red")

# Zadanie 3. Utwórz wektor wx z elementami od 1 do 4 powtórzonymi ośmiokrotnie. 
wx = rep(1:4, each = 8)
pie(wx)

# Następnie dla wx wygeneruj wykres kołowy (zwykły oraz wykres kołowy wektora wx zestawionego
# liczebnościowo). Do kolorowania wycinków koła użyj parametru rainbow(). 
pie(table(wx), col=rainbow(length(wx)))
# Wykres zapisz w formacie .PNG
png("wykres_kolowy.png", width = 800, height = 400)



# Zadanie 4. Narysuj wykres funkcji y =cos(x) w przedziale (−2π, 2π) niebieską linią.

# Następnie na tym samym wykresie dodaj wykres funkcji y = sin(x) narysowany czerwoną linią.
# Dodaj tytuł wykresu i tytuły osi X i Y.

# Tworzenie danych
x <- seq(-2*pi, 2*pi, length.out = 1000)
y1 <- cos(x)
y2 <- sin(x)
df <- data.frame(x, y1, y2)

# Tworzenie wykresu
wykres <- ggplot(df, aes(x = x)) +
  geom_line(aes(y = y1), color = "blue") +
  geom_line(aes(y = y2), color = "red") +
  labs(title = "Wykres funkcji cos(x) i sin(x)",
       x = "x",
       y = "y")

# Wyświetlenie wykresu
print(wykres)


Podpowiedź: xlim - przedział osi x, zatem przedział (−2π, 2π) zapisujemy jako xlim=c(-2*pi,2*pi).


# Zadanie 5. Utwórz wektor M jako zestaw 400 liczb posiadających rozkład normalny. 
# Następnie dla wektora M wykonaj histogram z następującymi parametrami:
#•       wpisz tytuł wykresu „Histogram”,
#•       wpisz „Dane x” jako tytuł osi x,
#•       wpisz „Dane y” jako tytuł osi y,
#•       ustaw kolor na jasny niebieski (lightblue).

# Utworzenie wektora M o rozkładzie normalnym
M <- rnorm(400)


hist(M, col = "lightblue", xlab = "Dane x", ylab = "Dane y", main = "Histogram")

curve(dnorm(x, mean = mean(M), sd = sd(M)), add = TRUE, col = "red", lwd = 4)

png("histogram.png")
hist(M, col = "lightblue", xlab = "Dane x", ylab = "Dane y", main = "Histogram")
curve(dnorm(x, mean = mean(M), sd = sd(M)), add = TRUE, col = "red", lwd = 4)
dev.off()

# Dodaj do wykresu krzywą rozkładu normalnego o grubości 4 i kolorze czerwonym.
# Wykres zapisz w formacie .PNG 


# Zadanie 6. Utwórz wektor N jako wygenerowany zestaw 40 liczb o średniej 25 i odchyleniu standardowym 5, posiadających rozkład normalny. 
# Następnie dla wektora N wykonaj histogram z następującymi parametrami:
#•       wpisz tytuł wykresu „Histogram”,
#•       wpisz „Dane x” jako tytuł osi x,
#•       wpisz „Dane y” jako tytuł osi y,
#•       ustaw kolor na zielony.


set.seed(123)  
N <- rnorm(40, mean = 25, sd = 5)

# Histogram
hist(N, 
     main = "Histogram", 
     xlab = "Dane x", 
     ylab = "Dane y",
     col = "green")





