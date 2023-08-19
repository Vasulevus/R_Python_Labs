import pandas
import numpy
import matplotlib


flats = pandas.read_csv("C:/Users/Vasulevus/Documents/Github/R_Python_Labs/Lab1/flats.csv",decimal=",")

flats = pandas.DataFrame(flats)

print(flats.info()) #дивимося структуру
print(flats.head())  #показуємо перші  рядки
print(flats.describe()) #показуємо статистичні показники датасету
flats.columns #назви полів/імена датафрейму

