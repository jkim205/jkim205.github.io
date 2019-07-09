---
layout: page
title: Day 4 - Statistics in R
permalink: d4
---

## Basic Statistics

## Descriptive Statistics

> When you have a dataset, the first thing to do is to explore your data. The following functions are useful to see the basic structure of your dataset and the descriptive statistics of your data.


```r
str(iris)           # see the structure of dataframe
length(iris)        # see the sample size of data.
mean(iris)          # see the mean values of data.
sd(iris)            # see the standard deviation of data.

summary(iris)       # or use the summary function.
```

> The functions above did not show the standard error and we need to calculate to find the standard error. But, 'describe' function in a 'psych'package enables us to look at the standard error.  

```r
library(psych)
describe(data)
```

> Histogram is one of great plots to explore your dataset. In addition, if you need to check the normality of dataset, you can use the function qqnorm (constructing qq plot) or shapiro.test (Shapiro-Wilk test)

```r
hist(data, nclass = 15)
qqnorm(data)
shapiro.test(data)
```

## Hypothesis testing - 1. t-test

> If you want to do an one sample t-test with the null hypothesis H0: u = 0, you can use the following code in R.


```r
t.test(data)
t.test(data, mu = -1)
```

> If you want to do two-sampled t-test with the null hypothesis H0: u1 = u2, you can use the following code in R.

```r
t.test(data1, data2, var.equal = TRUE)
```

> If you want to do paired sample t-test with the null hypothesis H0: u1 = u2, you can use the following code in R by adding paired argument.

```r
t.test(data1-data2)
t.test(data1, data2, paired=TRUE, var.equal = TRUE)
```


## Hypothesis testing - 2. Analysis of Variance (ANOVA)

> If you want to compare the mean values among more than three groups, you would like to use ANOVA (Analysis of Variance).

```r
res.aov <- aov(Sepal.Length ~ Species, data = iris)
summary(res.aov)
```

> As a post-hoc test, TukeyHSD is widely used. The code for the TukeyHSD is written below.

```r
TukeyHSD(res.aov)
```

## Hypothesis testing - 3. Correlation

> If you want to compare the mean values among more than three groups, you would like to use ANOVA (Analysis of Variance).

```r
cor.test(x, y)                            # continuous x, continuous y
cor.test(p, q, method = "spearman")       # order p, order q
```

## Hypothesis testing - 4. Linear Regression

> When you want to see the linear regression model, you can use the function lm and summary function.

```r
model <- lm(y ~ x)
summary(model)

plot(x, y)
abline(coef(model))
```
