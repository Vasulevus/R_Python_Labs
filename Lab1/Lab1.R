library(dplyr)
library(ggplot2) #завантаження бібліотек


setwd("C:/Users/Vasulevus/Documents/Github/R_Python_Labs/Lab1") #встановлюємо робочу локацію

flats <- read.csv("flats.csv", stringsAsFactors=FALSE, dec = ",") #читаємо файл csv

str(flats) #дивимося структуру
print(class(flats)) #перевіряємо тип даних
print(head(flats,15)) #показуємо перші 15 рядків
print(dim(flats))#показуємо кількість полів
print(tail(flats,6))
print(names(flats))#назви полів