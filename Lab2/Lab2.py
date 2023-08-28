import pandas
import plotnine
import random
import numpy

movie_body_count = pandas.read_csv('filmdeathcounts.csv')
#print(movie_body_count)
movie_body_count.head() #перші п'ять рядків

movie_body_count.info() #структура



movie_body_count["Body_per_min"] = movie_body_count["Body_Count"] / movie_body_count["Length_Minutes"]

plotnine.ggplot(movie_body_count) + plotnine.aes(x = "Body_Count") + plotnine.geom_histogram(bins=20, color = "grey", fill = "lightblue")


movie_body_count.sort_values("Body_Count",ascending=False).head(10) #найбільша кількість тіл

movie_body_count.sort_values("Body_per_min", ascending=False).head(10)


plotnine.ggplot(movie_body_count) + plotnine.aes(x = "IMDB_Rating") + plotnine.geom_histogram(bins=10, color = "grey", fill = "lightblue")

imdb_mean = movie_body_count["IMDB_Rating"].mean()
imdb_sd = movie_body_count["IMDB_Rating"].std()

random.seed(900)

imdb_sim = numpy.random.normal(loc = imdb_mean, scale=imdb_sd, size= len(movie_body_count.index) ) #розрахунок нормального розподілу

movie_body_count["imdb_simulation"] = imdb_sim

plotnine.ggplot(movie_body_count) + plotnine.aes(x="imdb_simulation") + plotnine.geom_histogram(bins=10, color = "grey", fill = "lightblue") #візуалізація статистичного розподілу

plotnine.ggplot(movie_body_count) + plotnine.aes(sample = imdb_sim) + plotnine.stat_qq() #візуалізація нормального розподілу для статистичного нормального розподілу

plotnine.ggplot(movie_body_count) + plotnine.aes(sample = "IMDB_Rating") + plotnine.stat_qq() #візуалізація нормального розподілу для IMDB рейтингу