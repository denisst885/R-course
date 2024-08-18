# Tworzenie funkcji

# Funkcję definiujemy słowem 'function'. 
# Lista argumentów funkcji podana jest w nawiasach. 
# Składnia całej funkcji zawarta jest w nawiasach klamrowych {}. 
# Polecenie return zwraca wartość funkcji.


# Stwórzmy funkcję fahrenheit_to_celsius, 
# która będzie konwertować temperaturę
# (zgodnie z ogólnodostępnym wzorem)

fahrenheit_to_celsius = function(temp_F) {
  temp_C = (temp_F - 32) * 5 / 9
  return(temp_C)
}

# Definiujemy funkcję fehrenheit_to_celsius (nazwa oraz słowo 'function'). 
# Argumentem jest temperatura wyrażona w stopniach Fahrenheita.
# Wewnątrz funkcji następuje:
# przeliczenie wartości na stopnie Celsjusza, oraz zwrócenie wartości.


# Wywołajmy daną funkcję dla 212 stopni Fahrenheita
fahrenheit_to_celsius(212)


# 212 stopni Fahrenheita to temperatura wrzenia wody, czyli 100 stopni Celsjusza



# W podobnie łatwy sposób można stworzyć funkcję 
# konwertującą stopnie Celsjusza na Kelvina.

celsius_to_kelvin = function(temp_C) {
  temp_K = temp_C + 273.15
  return(temp_K)
}



# Wywołajmy daną funkcję dla 0 stopni Celsjusza
celsius_to_kelvin(173)


# temperatura zamarzania wody to 273,15 stopni Kelvina.




# Używając tych dwóch utworzonych funkcji 
# można je złożyć i przekonwertować stopnie Fahrenheita na stopnie Kelvina

fahrenheit_to_kelvin = function(temp_F) {
  temp_C = fahrenheit_to_celsius(temp_F)
  temp_K = celsius_to_kelvin(temp_C)
  return(temp_K)
}


# Wywołajmy daną funkcję dla 32 stopni Fahrenheita
fahrenheit_to_kelvin(32)


# Zagnieżdżanie funkcji
# zamiast złożenia funkcji w osobną funkcję,
# można też zagnieżdżać funkcje w sobie,
# zatem stopnie Fahrenheita na stopnie Kelvina można przeliczyć tak:
celsius_to_kelvin(fahrenheit_to_celsius(32))



# Funkcja może zawierać więcej niż jeden argument

bmi = function(waga, wzrost) {
  bmi = waga / (wzrost ^ 2)
  return(bmi)
}


# Wywołajmy daną funkcję dla dwóch argumentów (waga i wzrost)
bmi(75, 1.81)



# Argument może mieć z góry przypisaną wartość

netto = function(brutto, podatek = 0.18) {
  netto = brutto * (1-podatek)
  return(netto)
}


# Wywołajmy funkcję
netto(10000)



# Wyrażenia warunkowe
# Wyrażenia warunkowe to narzędzia do sterowania przepływem operacji,
# są podstawą każdego języka programowania.



# W R składnia wygląda następująco:

x = 37
if (x > 100) {
  print("Więcej niż 100")
} else {
  print("Mniej niż 100")
}


x=100
if (x>100) {
  print("ponad 100")
} else {
  print("mniej niż 100")
}


# Wyjaśnienie
#
# Wyrażenie if oczekuje, że warunek jest wektorem logicznym o długości jeden, 
# tj. takim który przyjmuje wartość TRUE lub FALSE. 
# 
# Istnieje szereg sposobów uzyskania wartości TRUE lub FALSE w R, 
# jednym z nich jest zastosowanie porównania wartości.
#
# Test logiczny:
x > 100
#
# Jeżeli test logiczny zwróci wartość TRUE, 
# wtedy program wykona instrukcję zawartą w pierwszych nawiasach.
#
# Jeśli zmienna x jest mniejsza niż 100,
# test logiczny przyjmie wartość FALSE,
# więc program wykona instrukcję zawartą po 'else'.



# Można zawrzeć kilka testów logicznych 
# w jednej instrukcji warunkowej za pomocą operatora else if

x = 100
if (x > 100) {
  print("Więcej niż 100")
} else if (x == 100) {
  print("Dokładnie 100")
} else {
  print("Mniej niż 100")
}

# Zwróć uwagę, że operator porównania to '==' a operator przypisania to '='


# UWAGA!
#
# Operatory logiczne & i | porównują wszystkie elementy zadanych wektorów 
# i ich wynikiem może być wektor o długości większej niż 1. 
#
# Operatory logiczne & i | są zwektoryzowaną wersją operatorów && i ||.
# 
# Operatory && i || porównują tylko pierwszy element każdego wektora, 
# a w efekcie zawsze zwracają tylko jedną wartość. 
# To one są zazwyczaj używane w wyrażeniach warunkowych.
#


# Przeanalizujmy przykład z wykorzystaniem operatora &&
x = 18
if (x <= 0) {
  print("mniejsze lub równe 0")
} else if (x > 0 && x <= 10) {
  print("między 1 a 10")
} else if (x > 10 && x <= 20) {
  print("między 11 a 20")
} else {
  print("więcej niż 20")
}


# Przeanalizujmy przykład z wykorzystaniem operatora ||
zwierze = "okoń"
if (zwierze == "kot" || zwierze == "pies") {
  print("Ssak")
} else if (zwierze == "okoń" || zwierze == "karp") {
  print("Ryba")
} else if (zwierze == "sokół" || zwierze == "orzeł") {
  print("Ptak")
} else {
  print("Zwierzę nieznane")
}


# Nasze zwierzę to ryba.



# Teraz wykorzystajmy funkcję oraz wyrażenia warunkowe 
# do stworzenia bardzo prostego algorytmu interpretującego wynik BMI
bmi2 = function(waga, wzrost) {
  bmi = waga / (wzrost ^ 2)
  if (bmi < 18.5) {
    tekst = c("Niedowaga", bmi)
  } else if (bmi >= 18.5 && bmi < 25) {
    tekst = c("Optimum", bmi)
  } else if (bmi >= 25 && bmi < 30) {
    tekst = c("Nadwaga", bmi)
  } else if (bmi >= 30) {
    tekst = c("Otyłość", bmi)
  }
  return(tekst)
}


# Wywołajmy funkcję
bmi2(74, 1.81)



############ Zadania FUNKCJE I WYRAŻENIA WARUNKOWE ----

# 1. Stwórz funkcję będącą najprostszą wersją kalkulatora.
# (np. D - dodawanie, O - odejmowanie, M - mnożenie, DZ – dzielenie)

kalkulator <- function(a, b, operacja) {
  if (operacja == "D") {
    wynik <- a + b
  } else if (operacja == "O") {
    wynik <- a - b
  } else if (operacja == "M") {
    wynik <- a * b
  } else if (operacja == "DZ") {
    if (b == 0) {
      wynik <- "Nie można dzielić przez zero"
    } else {
      wynik <- a / b
    }
  } else {
    wynik <- "Nieznana operacja"
  }
  return(wynik)
}


print(kalkulator(10, 5, "D"))
print(kalkulator(5,3, "DZ"))


# 2. Stwórz funkcję obliczającą podatek w zależności od dochodu. 
# Przyjmij następujące założenia:
# a) Jeżeli podatnik rozlicza się liniowo, wtedy niezależnie od kwoty płaci 19% podatku.
# b) Jeżeli podatnik rozlicza się na zasadach ogólnych, wtedy:
# - poniżej kwoty 85528zł płaci 18% podatku minus kwota zmniejszająca, czyli 556zł;
# - powyżej kwoty 85528zł płaci 14839zł + 32% nadwyżki powyżej 85528zł.
# (np. L - liniowy, O – ogólny)


oblicz_podatek <- function(dochod, typ_rozliczenia) {
  if (typ_rozliczenia == "L") {
    # Rozliczenie liniowe
    podatek <- dochod * 0.19
  } else if (typ_rozliczenia == "O") {
    # Rozliczenie na zasadach ogólnych
    if (dochod <= 85528) {
      podatek <- dochod * 0.18 - 556
    } else {
      podatek <- 14839 + (dochod - 85528) * 0.32
    }
  } else {
    podatek <- "Nieznany typ rozliczenia"
  }
  return(podatek)
}


print(oblicz_podatek(50000, "L"))


