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
[lines(), abline()](https://www.rdocumentation.org/packages/graphics/versions/3.6.0/topics/lines) : Add line to the existing plot
[curve()](https://www.rdocumentation.org/packages/graphics/versions/3.6.0/topics/curve) : Add curve for a function
[par(mfrow = c(N,M))](https://www.rdocumentation.org/packages/graphics/versions/3.6.0/topics/par): Setting parameters for the plot, especially mfrow is for the frame numbers
[hist()](https://www.rdocumentation.org/packages/graphics/versions/3.6.0/topics/hist): Add histogram
[]

'''r
plot(iris$Sepal.Length, iris$Sepal.Width)
'''

please download the [r script](https://raw.githubusercontent.com/jkim205/jkim205.github.io/master/_pages/Day3/examples_plot.r)

Here are links of references:
[R Graphics CookBook](http://www.cookbook-r.com/Graphs/)
[R Documentation Graphics](https://www.rdocumentation.org/packages/graphics/versions/3.6.0)

### ggplot2 package

Please download the [data csv file](https://raw.githubusercontent.com/jkim205/jkim205.github.io/master/_pages/Day3/sample_data_ggplot.csv?raw=true) and [R script](https://raw.githubusercontent.com/jkim205/jkim205.github.io/master/_pages/Day3/exercise_ggplot.r?raw=true)

<img src="" alt="1-6_help.png" width="70%">
Here are links of references:
[R Graphics CookBook](http://www.cookbook-r.com/Graphs/)
[ggplot2 tidyverse](https://ggplot2.tidyverse.org/)
[dsbooks ggplot2](https://rafalab.github.io/dsbook/ggplot2.html)

