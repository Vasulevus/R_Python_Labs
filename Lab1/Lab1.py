import pandas
import numpy
import matplotlib.pyplot as mp
import plotnine


flats = pandas.read_csv("C:/Users/Vasulevus/Documents/Github/R_Python_Labs/Lab1/flats.csv",decimal=",")

flats = pandas.DataFrame(flats)

print(flats.info()) #дивимося структуру
print(flats.head())  #показуємо перші  рядки
flats.columns #назви полів/імена датафрейму
print(flats.describe()) #показуємо статистичні показники датасету
flats = flats[flats.columns[0]].value_counts().sort_values(ascending=False).reset_index() #рахуємо рядки відносно поля Місто, сортуємо рядки та перезавантажуємо індекс
flats = flats[flats["Місто"] != "Києво-Святошинський"] #видаляємо києво-святошинський
(flats[flats["Кімнат"] == 3 ])[["Місто"]].value_counts().sort_values(ascending=True).reset_index() #відфільтровано трьохкімнатні квартири, пораховано, відсортовано та перезавантажено індекс
(flats[flats["Кімнат"] == 2])[["Місто"]].value_counts().sort_values(ascending=False).reset_index()
(flats[flats["Кімнат"] == 2]).groupby(["Місто"]).aggregate({"Загальна_площа":"max"}).reset_index()#згруповано по місту
a = (flats[flats["Кімнат"] == 2])
a.aggregate({"Загальна_площа":"min","Загальна_площа":a.std()})
a.groupby(["Місто"])["Загальна_площа"].std().reset_index()
a.groupby(["Місто"]).aggregate({"Загальна_площа":["mean","std"]}).reset_index() #групуємо по місту визначаємо середнє значення та стандартне відхилення
flats = flats[flats["Місто"] == "Львів"] 
(flats[flats["Кімнат"] == 1]).groupby(["Місто"]).aggregate({"Загальна_площа":"median"})
plotnine.ggplot(flats) + plotnine.aes (x="Кімнат") + plotnine.geom_bar(
        fill = "lightblue"
    ) + plotnine.ylab("Кількість") #стовпчикова діаграма
print(flats)
plotnine.ggplot(flats) + plotnine.aes(x="Загальна_площа") + plotnine.geom_histogram(fill = "lightblue", color = "grey", breaks = range(0,250,50)) + plotnine.ylab("Кількість") #гістограма
plotnine.ggplot(flats) + plotnine.aes(x="Загальна_площа",y="Ціна") + plotnine.geom_point(color="black") #діаграма розкиду
lotnine.ggplot(flats) + plotnine.aes(y = "Ціна", x="factor(Місто)") + plotnine.geom_boxplot(width = None) + plotnine.coord_flip() #коробчаста діаграма
