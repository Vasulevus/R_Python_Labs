library(dplyr)
library(ggplot2) #завантаження бібліотек


setwd("C:/Users/Vasulevus/Documents/Github/R_Python_Labs/Lab1") #встановлюємо робочу локацію

flats <- read.csv("flats.csv", stringsAsFactors=FALSE, dec=",") #читаємо файл csv

flats <- flats %>%
    filter(Місто != "Києво-Святошинський")

str(flats) #дивимося структуру
#print(class(flats)) #перевіряємо тип даних
print(head(flats,15)) #показуємо перші 15 рядків
#print(dim(flats))#показуємо кількість полів
#print(tail(flats,6))
#print(names(flats))#назви полів/імена датафрейму

#print(summary(flats)) #показуємо статистичні показники датасету
#glimpse(flats)
#print(names(flats))
#print(count(flats, Місто))
#print(
#flats %>% #операції з допомогою оператора %>%
#  count(Місто) %>% #рахуємо кількість рядків для кожного міста
#  arrange(n) #сортуємо
#)

#print(
#    flats %>%
#        filter(Місто != "Києво-Святошинський") %>% #фільтруємо значення
#        filter(Кімнат == 3) %>% #залишаємо лише трьохкімнатні
#        count(Місто) %>% #рахуємо рядки в розрізі Міста
#        arrange(desc(n)) #сортуємо в спадаючому порядку
#)

#print(
#    flats %>%
#        filter(Кімнат == 2) %>%
#        filter(Місто != "Києво-Святошинський") %>%
#        count(Місто) %>%
#        arrange(desc(n))
#)

#print(
#    flats %>%
#        filter(Кімнат == 2) %>%
#        filter(Місто != "Києво-Святошинський") %>%
#        summarise(mean(Загальна_площа)) #групуємо для загального середнього значення
#)
#print(
#    flats %>%
#        filter(Кімнат == 2) %>%
#        filter(Місто != "Києво-Святошинський") %>%
#        summarise(count(Місто)) #summarise несумісно з count
#)

#print(
#    flats %>%
#        filter(Кімнат == 1) %>%
#        filter(Місто != "Києво-Святошинський") %>%
#        summarise(mean(Загальна_площа), sd(Загальна_площа), min(Загальна_площа),max(Загальна_площа))
#)

#print(
#    flats %>%
#        filter(Кімнат == 3) %>%
#        filter(Місто != "Києво-Святошинський") %>%
#        group_by(Місто) %>%
#        summarise(means = mean(Загальна_площа))
#)

#print(
#    flats %>%
#    filter(Місто != "Києво-Святошинський") %>%
#    summarise(count = n_distinct(Місто)) #порахувати кількість унікальних значень в полі
#)

#print(
#    flats %>%
#    filter(Місто == "Одеса" & Кімнат == 3) %>%
#    count(Кімнат)
#)


#########################################################
################# Візуалізація даних ####################
#########################################################
#print(
#    ggplot(#функція для графіків
#        flats, #датасет
#        aes(x = Кімнат) #обрана змінна
#    ) +
#    geom_bar( # стовпчиковий графік 
#        fill = "white", #колір стовпчика
#        col = "black" #контур стовпчика
#    ) + ylab('Кількість') #підпис справа
#)

#print(
#    ggplot(
#        flats,
#        aes(x = Загальна_площа)
#    ) +
#    geom_bar(
#        fill = "lightblue",
#        col = "grey"
#    )
#) + ylab('Кількість')

#print(
#    ggplot(flats, aes(x=Загальна_площа)) +
#    geom_histogram( #гісторграма
#        breaks = seq(0,250,50), #як розбивається та послідовність
#        fill = "lightblue", 
#        col = "grey") +
#    ylab('Кількість')
#    )

#print(
#    ggplot(flats, aes(x=Загальна_площа, y = Ціна)) +
#    geom_point() #графік розсіювання
#)

#print(
#    ggplot(
#        flats, aes(
#            x = Ціна,
#            y = Місто
#        )
#    ) +
#    geom_boxplot() + #коробчаста діаграма
#    coord_flip() #перевертаємо координати
#)

#Вправи
# Побудуйте	коробчату	діаграму	для	візулізації	розподілу	цін	в	залежності	від кількості	кімнат


flats$rooms <- as.character(flats$Кімнат) #створюємо додаткове поле як рядки
#print(head(flats))
#print(
#    ggplot(flats,aes(x=Ціна, y=rooms)) + 
#    geom_boxplot()
#    )
#Побудуйте	графік	розсіювання,	який	відображатиме	залежність	ціни	від загальної	площі
#print(
#    ggplot(flats, aes(x=Ціна, y=Загальна_площа)) +
#    geom_point()
#)

# Побудуйте	гістограму	для	оцінки	розподілу	ціни	квартир

#print(
#    ggplot(flats, aes(x = Ціна)) +
#    geom_histogram(breaks = seq(10200, 12250000, 1250000), fill = "lightblue", col = "black")
#)
