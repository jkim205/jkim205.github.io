---
layout: page
title: Day 3 - Data Visualization
permalink: d3
---

## Today's Topic

> Today, the main topic is data visualization, which means making a graph. It is important to create a graph in exploring, understanding, and summarizing data, finally going ahead to the publication. Various forms of graph are used to represent their data. The widely used forms of graphing include a scatter plot, histogram, boxplot, qqplot, and so on. 

> R is often known as their powerfulness in making a graph. The base R program includes graphics package which allows users to create and manipulate their own graph. Also, additional packages such as lattice or ggplot2 are built for the graphic purpose. In this chapter, I will decribe the basic use of graphic package , and I will introduce some examples of ggplot2 package with our experiment in a numerical task.


### Graphics package

> Graphics package is installed when you install the base program of R. The useful functions are listed as follows:

[plot(x, y)](https://www.rdocumentation.org/packages/graphics/versions/3.6.0/topics/plot) : Create a scatter plot with x and y

```r
plot(iris$Sepal.Length, iris$Sepal.Width)

plot(cars,
     main = "CARS DATASET",
     xlab = "SPEED OF CAR",
     ylab = "STOPPING DISTANCE OF CAR")

plot(iris$Sepal.Length, iris$Sepal.Width, pch = as.integer(iris$Species))

plot(pressure, type = 'o')
```



[abline()](https://www.rdocumentation.org/packages/graphics/versions/3.6.0/topics/lines) : Add line to the existing plot

```r
m <- lm(Petal.Length ~ Petal.Width, data=iris)
with(iris, plot(Petal.Width, Petal.Length))
abline(m)
```

[hist()](https://www.rdocumentation.org/packages/graphics/versions/3.6.0/topics/hist): Add histogram
```r
hist(sunspots, prob = T)
```

[boxplot()](https://www.rdocumentation.org/packages/graphics/versions/3.6.0/topics/boxplot): Add boxplot

```r
boxplot(count ~ spray, data = InsectSprays, col = "lightgray")
```

please download the [r script](_pages/Day3/examples_plot.R)

Here are links of references:

[R Graphics CookBook](http://www.cookbook-r.com/Graphs/)

[R Documentation Graphics](https://www.rdocumentation.org/packages/graphics/versions/3.6.0)

### ggplot2 package

Please download the [data csv file](_pages/Day3/sample_data_ggplot.csv) and [R script](_pages/Day3/exercise_ggplot.R)

Here are links of references:

[R Graphics CookBook](http://www.cookbook-r.com/Graphs/)

[ggplot2 tidyverse](https://ggplot2.tidyverse.org/)

[dsbooks ggplot2](https://rafalab.github.io/dsbook/ggplot2.html)

