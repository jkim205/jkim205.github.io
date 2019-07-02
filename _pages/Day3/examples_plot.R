# R Visualization
# plot() : usage: plot(x, y)

plot(iris$Sepal.Length, iris$Sepal.Width)

# cars datasets with two columns.
head(cars)
str(cars)

## plot() : usage: plot(dataframe)
plot(cars)

## arguments in plot: main; xlab; ylab
plot(cars,
     main = "CARS DATASET",
     xlab = "SPEED OF CAR",
     ylab = "STOPPING DISTANCE OF CAR")

# Use title function to add main, xlab, and ylab
plot(cars, ann=FALSE)
title(main = "CARS",
      xlab = "X LABEL",
      ylab = "Y LABEL")

# Adding a grid
plot(cars$speed, cars$dist)
grid()

# pch : plotting chracter - pch = 
plot(iris$Sepal.Length, iris$Sepal.Width, pch = as.integer(iris$Species))

with(iris, plot(Sepal.Length, Sepal.Width, pch = as.integer(Species)))

# legend : Adding a legend
legend(7, 4, c("setosa", "versicolor", "virginica"), pch=1:3)

f <- factor(iris$Species)
with(iris, plot(Petal.Length, Petal.Width, pch= as.integer(f)))
legend(1.5, 2.4, as.character(levels(f)), pch=1:length(levels(f)))

# Regression Line
m <- lm(Petal.Length ~ Petal.Width, data=iris)
with(iris, plot(Petal.Width, Petal.Length))
abline(m)

# Plotting All variables
plot(iris[,1:4])

# barplot
heights <- tapply(airquality$Temp, airquality$Month, mean)
barplot(heights)
barplot(heights,
        main = "Mean Temp. by Month",
        names.arg = c("May", "Jun", "Jul", "Aug", "Sep"),
        ylab = "Temp (deg. F)")

# adding confidence intervals
install.packages("gplots")
library(gplots)
attach(airquality)
lower <- tapply(Temp, Month, function(v) t.test(v)$conf.int[1])
upper <- tapply(Temp, Month, function(v) t.test(v)$conf.int[2])

barplot2(heights, plot.ci=TRUE, ci.l=lower, ci.u=upper,
         ylim = c(50, 90), xpd = FALSE,
         main = "Mean Temp. By Month",
         names.arg = c("May", "Jun", "Jul", "Aug", "Sep"),
         ylab = "Temp (deg. F)")

rel.hts <- (heights - min(heights))/ (max(heights)-min(heights))
grays <- rainbow(5)
barplot(heights,
        col=grays,
        ylim=c(50,90), xpd=FALSE,
        main = "Mean Temp. By Month",
        names.arg = c("May", "Jun", "Jul", "Aug", "Sep"),
        ylab = "Temp (deg. F)")


plot(pressure, type = 'l')
plot(pressure, type = 'o')

# Examples of types in plotting line.
plot(pressure, type = 'l', lty = "solid")
plot(pressure, type = 'l', lty = "dashed")
plot(pressure, type = 'l', lty = "dotted")
plot(pressure, type = 'l', lty = "dotdash")
plot(pressure, type = 'l', lty = "longdash")
plot(pressure, type = 'l', lty = "twodash")
plot(pressure, type = 'l', lty = "blank")

# plotting multiple datasets
str(sunspots)
head(sunspots)
(Jan <- 12 * seq(0, 234) + 1)
(Jun <- 12 * seq(0, 234) + 6)
plot(1749:1983, sunspots[Jan], type = 'l', col = 'red')
lines(1749:1983, sunspots[Jun], lty = "dashed")

# Adding Vertical or Horizontal Lines
abline(v=0)     # draw a vertical line
abline(h=0)     # draw a horizontal line


m <- mean(sunspots)
stdevs <- m + c(-2, -1, 1, 2) * sd(sunspots)
plot(sunspots)
abline(h=m)
abline(h=stdevs, lty="dotted")

# Box plots
sunspots_mat <- matrix(sunspots, byrow = TRUE, ncol = 12)
head(sunspots_mat)

sunspots_df <- data.frame(sunspots_mat)
head(sunspots_df)
colnames(sunspots_df) <- c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
boxplot(sunspots_df)

# histogram
table(sunspots)
hist(sunspots, prob = T)

# density function
lines(density(sunspots))

# QQ plot
qqnorm(sunspots)
qqline(sunspots)

# curve function
curve(sin, -3, 3)
curve(dnorm, -3, 3)

# multiple frame
par(mfrow = c(2,2))
Quantile <- seq(from=-1, to=1, length.out=30)
plot(Quantile, dt(Quantile, df=5), type = 'l', main = "t=10")
plot(Quantile, dt(Quantile, df=20), type = 'l', main = "t=10")
plot(Quantile, dt(Quantile, df=30), type = 'l', main = "t=10")
plot(Quantile, dt(Quantile, df=40), type = 'l', main = "t=10")

# png function to save file
png("Test.png")
par(mfrow = c(2,2))
Quantile <- seq(from=-1, to=1, length.out=30)
plot(Quantile, dt(Quantile, df=5), type = 'l', main = "t=10")
plot(Quantile, dt(Quantile, df=20), type = 'l', main = "t=10")
plot(Quantile, dt(Quantile, df=30), type = 'l', main = "t=10")
plot(Quantile, dt(Quantile, df=40), type = 'l', main = "t=10")
dev.off()

# savePlot function

