---
layout: page
title: Day 5 - Advanced Statistics in R
permalink: d5
---
## Covariance Matrix

> The stats packages in basic r installation includes the function cov to calculate the covariance matrix.

```r
cov(iris[,1:4])
```

## ANCOVA

> ANCOVA Example

```r
input <- mtcars[, c("am", "mpg", "hp")]
res.aov1 <- aov(mpg ~ hp * am, data=input)
res.aov2 <- aov(mpg ~ hp + am, data=input)
anova(res.aov1, res.aov2)
```

> Plot ANCOVA results

```r
plot()
```

## PCA (Principal Component Analysis)

> principal component analysis in r

```r
iris.pca<-princomp(iris[-5])
summary(iris.pca)
iris.pca$loadings
iris.pca$scores
```

> screeplot using principal component analysis

```r
screeplot(iris.pca)
```

## EFA (Exploratory Factor Analysis)

```r
library(psych)
fa.parallel()
```

## SEM (Structural Equation Modeling) Path Analysis

> Basic SEM functions are existed in the lavaan packages. Please install lavaan and semPlot packages before running the following codes.

```r
library(lavaan)
library(semPlot)

```

> Step 1. setting up the model specification

```r
pathModel <- '
M1 =~ M11 + M12 + M13
M2 =~ M21 + M22 + M23
M3 =~ M31 + M32 + M33

M3 ~ M1 + M2'
```

> Step 2. run the sem model to find the fit.

```r
fit1 <- sem(pathModel, data = df)
summary(fit1, fit.measures = TRUE)
parameterEstimates(fit1, standardized = TRUE)
```

> Step 3. Plot the result.

```r
semPaths(fit1, what = "paths", whatLabels = "par", rotation = 2)
```