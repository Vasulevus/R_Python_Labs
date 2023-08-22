library(ggplot2)
library(dplyr)

setwd("C:/Users/Vasulevus/Documents/Github/R_Python_Labs/Lab2")
death <- read.csv('filmdeathcounts.csv')
#print(head(death))
#str(death)
death$body_per_min <- death$Body_Count / death$Length_Minutes

#print(head(death))

#print(
#    ggplot(death, aes(x=body_per_min)) + 
#    geom_histogram(bins = 20, color = "grey", fill = "lightblue")
#)

#print(
#death %>%
#    top_n(n = 10,Body_Count) %>%
#    arrange(desc(Body_Count))
#)
#
#print(
#    death %>%
#    top_n(n = 10, body_per_min) %>%
#    arrange(desc(body_per_min))
#)

#print(
#    ggplot(death, aes(x=IMDB_Rating)) + 
#    geom_histogram(bins = 10, color = "darkgrey", fill="lightgreen")
#)

#print(
#    death %>%
#    summarise(mean(IMDB_Rating), sd(IMDB_Rating))
#)
imdb_mean <- mean(death$IMDB_Rating)
imdb_sd <- sd(death$IMDB_Rating)
set.seed(900)
imdb_sim <- rnorm(n=nrow(death), mean = imdb_mean, sd = imdb_sd)

death$imdb_simulation <- imdb_sim

#print(
#    ggplot(death, aes(x=imdb_sim)) +
#    geom_histogram(bin=10, fill = "lightgreen", color = "black")
#)

print(
    ggplot(death, aes(sample = imdb_sim)) + stat_qq() #перевірка нормальності розподілу
)

print(ggplot(death,aes(sample=IMDB_Rating))+ stat_qq())