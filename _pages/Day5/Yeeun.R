#### Installing all the required packages and libraries for this analysis ####
updateR()
if(!require(installr)) install.packages('installr');library(installr)
if(!require(jmv)) install.packages('jmv');library(jmv) # for Jamovi
if(!require(lavaan)) install.packages('lavaan');library(lavaan) # SEM package
if(!require(Hmisc)) install.packages('Hmisc'); library(Hmisc) # for correlations. Also loads ggplot2 and lattice
if(!require(medmod)) install.packages('medmod');library(medmod) # for using the medmod package in Jamovi
if(!require(pequod)) install.packages('pequod');library(pequod) # for simple slopes
#if(!require(ggplot2)) install.packages('ggplot2');library(ggplot2) # for simple slopes
#if(!require(multilevel)) install.packages('multilevel');library(multilevel) # for HLM, includes nlme, for "multi.icc"
#if(!require(semTools)) install.packages('semTools'); library(semTools) # for running monteCarloMed
#if(!require(broom)) install.packages('broom');library(broom) # for exporting lavaan outputs
#if(!require(tidyverse)) install.packages("tidyverse"); library(tidyverse) # installs tidy, ggplot2, dplyr, readr, tibble, stringr, forcats, purrr
#if(!require(semPlot)) install.packages('semPlot'); library(semPlot) # for visualizing lavaan outputs
#if(!require(psych)) install.packages('semTools'); library(semTools) # for alphas
#if(!require(xlsx)) install.packages('xlsx'); library(xlsx) # for xlsx files
#if(!require(devtools)) install.packages('devtools'); library(devtools) # for alphas using scaleReliability
#if(!require(tidyr)) install.packages('tidyr'); library(tidyr) # for alphas using scaleReliability
#if(!require(haven)) install.packages('haven');library(haven) # for reading SPSS data, .sav


#### Load the dataset. ####
this.dir <- dirname(rstudioapi::getActiveDocumentContext()$path)
setwd(this.dir)
dataY = read.csv("3ab for Yeeun.csv", header=TRUE, sep = ",", stringsAsFactors = FALSE)
# Set R to show only 2 decimal places and no scientific notation.
#options(scipen=999)
#options(digits = 3)
attach(dataY)
#detach(dataP)


#### Variable Creation ####
# Burnout (Exhaustion)
psych::alpha(data.frame(OLBI_Dur_1, OLBI_Dur_2, OLBI_Dur_3r, OLBI_Dur_4, OLBI_Dur_5r, OLBI_Dur_6, OLBI_Dur_7r, OLBI_Dur_8r),check.keys=TRUE)
Be <- (OLBI_Dur_1+OLBI_Dur_2+OLBI_Dur_3r+OLBI_Dur_4+OLBI_Dur_5r+OLBI_Dur_6+OLBI_Dur_7r+OLBI_Dur_8r)/8
Be.1 <- scale(Be, center=TRUE, scale=TRUE)

# Burnout (Disengagement) = olbiDIHdur
psych::alpha(data.frame(OLBI_Dur_9r, OLBI_Dur_10, OLBI_Dur_11, OLBI_Dur_12r, OLBI_Dur_13, OLBI_Dur_14, OLBI_Dur_15, OLBI_Dur_16r),check.keys=TRUE)
Bd <- (OLBI_Dur_9r+OLBI_Dur_10+OLBI_Dur_11+OLBI_Dur_12r+OLBI_Dur_13+OLBI_Dur_14+OLBI_Dur_15+OLBI_Dur_16r)/8
Bd.1 <- scale(Bd, center=TRUE, scale=TRUE)

# Burnout (Overall) = olbiDIHdur
psych::alpha(data.frame(OLBI_Dur_1, OLBI_Dur_2, OLBI_Dur_3r, OLBI_Dur_4, OLBI_Dur_5r, OLBI_Dur_6, OLBI_Dur_7r, OLBI_Dur_8r, OLBI_Dur_9r, OLBI_Dur_10, OLBI_Dur_11, OLBI_Dur_12r, OLBI_Dur_13, OLBI_Dur_14, OLBI_Dur_15, OLBI_Dur_16r),check.keys=TRUE)
Bo <- (OLBI_Dur_1+OLBI_Dur_2+OLBI_Dur_3r+OLBI_Dur_4+OLBI_Dur_5r+OLBI_Dur_6+OLBI_Dur_7r+OLBI_Dur_8r+OLBI_Dur_9r+OLBI_Dur_10+OLBI_Dur_11+OLBI_Dur_12r+OLBI_Dur_13+OLBI_Dur_14+OLBI_Dur_15+OLBI_Dur_16r)/16
Bo.1 <- scale(Bo, center=TRUE, scale=TRUE)

# Autonomy
psych::alpha(data.frame(Aut_Dur_1,Aut_Dur_2r,Aut_Dur_3,Aut_Dur_4r,Aut_Dur_5,Aut_Dur_6,Aut_Dur_7r),check.keys=TRUE)
# Loadings are really bad, so removing reversed items:
psych::alpha(data.frame(Aut_Dur_1,Aut_Dur_3,Aut_Dur_5,Aut_Dur_6),check.keys=TRUE)
A <- (Aut_Dur_1+Aut_Dur_3+Aut_Dur_5+Aut_Dur_6)/4
A.1 <- scale(A, center=TRUE, scale=TRUE)

# Lay Theory (Person)
psych::alpha(data.frame(Lay_Dur_1,Lay_Dur_2,Lay_Dur_3,Lay_Dur_4,Lay_Dur_13r,Lay_Dur_14r,Lay_Dur_15r,Lay_Dur_16r),check.keys=TRUE)
Lp <- (Lay_Dur_1+Lay_Dur_2+Lay_Dur_3+Lay_Dur_4+Lay_Dur_13r+Lay_Dur_14r+Lay_Dur_15r+Lay_Dur_16r)/8
Lp.1 <- scale(Lp, center=TRUE, scale=TRUE)

# Lay Theory (Culture)
psych::alpha(data.frame(Lay_Dur_9,Lay_Dur_10,Lay_Dur_11,Lay_Dur_12,Lay_Dur_21r,Lay_Dur_22r,Lay_Dur_23r,Lay_Dur_24r),check.keys=TRUE)
Lc <- (Lay_Dur_9+Lay_Dur_10+Lay_Dur_11+Lay_Dur_12+Lay_Dur_21r+Lay_Dur_22r+Lay_Dur_23r+Lay_Dur_24r)/8
Lc.1 <- scale(Lc, center=TRUE, scale=TRUE)

# Autonomy x Lay (Person)
ALp <- A*Lp
ALp.1 <- scale(ALp, center=TRUE, scale=TRUE)

# Stress x Lay (Person)
SLp <- S*Lp
SLp.1 <- scale(ALp, center=TRUE, scale=TRUE)

#Stress
psych::alpha(data.frame(Stress_Dur_1,Stress_Dur_2,Stress_Dur_3,Stress_Dur_4,Stress_Dur_5,Stress_Dur_6,Stress_Dur_7,Stress_Dur_8,Stress_Dur_9,Stress_Dur_10,Stress_Dur_11,Stress_Dur_12,Stress_Dur_13),check.keys=TRUE)
S <- (Stress_Dur_1+Stress_Dur_2+Stress_Dur_3+Stress_Dur_4+Stress_Dur_5+Stress_Dur_6+Stress_Dur_7+Stress_Dur_8+Stress_Dur_9+Stress_Dur_10+Stress_Dur_11+Stress_Dur_12+Stress_Dur_13)/13
S.1 <- scale(S, center=TRUE, scale=TRUE)

dataY$Bo <- Bo
dataY$Be <- Be
dataY$Bd <- Bd
dataY$A <- A
dataY$Lp <- Lp
dataY$Lc <- Lc
dataY$S <- S
dataY$ALp <- ALp
dataY$SLp <- SLp

dataY$Bo.1 <- Bo.1
dataY$Be.1 <- Be.1
dataY$Bd.1 <- Bd.1
dataY$A.1 <- A.1
dataY$Lp.1 <- Lp.1
dataY$Lc.1 <- Lc.1
dataY$S.1 <- S.1
dataY$ALp.1 <- ALp.1
dataY$SLp.1 <- SLp.1

#### Correlations ####
jmv::corrMatrix(
	data = dataY,
	vars = vars(Bo,A,Lp,S),
	sig = TRUE,
	flag = TRUE)

#### lavaan model ####

model.A1 <- '
Burnout =~ OLBI_Dur_1+OLBI_Dur_2+OLBI_Dur_3r+OLBI_Dur_4+OLBI_Dur_5r+OLBI_Dur_6+OLBI_Dur_7r+OLBI_Dur_8r+OLBI_Dur_9r+OLBI_Dur_10+OLBI_Dur_11+OLBI_Dur_12r+OLBI_Dur_13+OLBI_Dur_14+OLBI_Dur_15+OLBI_Dur_16r
Stress =~ Stress_Dur_1+Stress_Dur_2+Stress_Dur_3+Stress_Dur_4+Stress_Dur_5+Stress_Dur_6+Stress_Dur_7+Stress_Dur_8+Stress_Dur_9+Stress_Dur_10+Stress_Dur_11+Stress_Dur_12+Stress_Dur_13
Autonomy =~ Aut_Dur_1+Aut_Dur_3+Aut_Dur_5+Aut_Dur_6
Lay =~ Lay_Dur_1+Lay_Dur_2+Lay_Dur_3+Lay_Dur_4+Lay_Dur_13r+Lay_Dur_14r+Lay_Dur_15r+Lay_Dur_16r

Stress ~ a1*Autonomy + a2*Lay + ALp
Burnout  ~  b1*Stress + b2*Autonomy + b3*Lay + SLp

IndirectA := a1*b1
IndirectLp := a2*b1
DirectA   := b2
DirectLp   := b3
TotalInd  := IndirectA + IndirectLp
Total    := TotalInd + b2 + b3
'
test.A1 <- sem(model.A1, data=dataY, bootstrap=1000);summary(test.A1, standardized=FALSE, fit.measures=TRUE)


model.A2 <- '
Burnout =~ OLBI_Dur_1+OLBI_Dur_2+OLBI_Dur_3r+OLBI_Dur_4+OLBI_Dur_5r+OLBI_Dur_6+OLBI_Dur_7r+OLBI_Dur_8r+OLBI_Dur_9r+OLBI_Dur_10+OLBI_Dur_11+OLBI_Dur_12r+OLBI_Dur_13+OLBI_Dur_14+OLBI_Dur_15+OLBI_Dur_16r
Stress =~ Stress_Dur_1+Stress_Dur_2+Stress_Dur_3+Stress_Dur_4+Stress_Dur_5+Stress_Dur_6+Stress_Dur_7+Stress_Dur_8+Stress_Dur_9+Stress_Dur_10+Stress_Dur_11+Stress_Dur_12+Stress_Dur_13
Lay =~ Lay_Dur_1+Lay_Dur_2+Lay_Dur_3+Lay_Dur_4+Lay_Dur_13r+Lay_Dur_14r+Lay_Dur_15r+Lay_Dur_16r

Stress ~ a2*Lay + ALp
Burnout  ~  b1*Stress

IndirectLp := a2*b1
'
test.A2 <- sem(model.A2, data=dataY, bootstrap=1000, std.lv = FALSE);summary(test.A2, standardized=FALSE, fit.measures=FALSE)


model.B1 <- '
S ~ a1*A +a2*Lp + ALp
Bo  ~  b1*S + b2*A + b3*Lp

IndirectA := a1*b1
IndirectLp := a2*b1
DirectA   := b2
DirectLp   := b3
TotalInd  := IndirectA + IndirectLp
Total    := TotalInd + b2 + b3
'
test.B1 <- sem(model.B1, data=dataY);summary(test.B1, standardized=FALSE, fit.measures=FALSE)


#### Plots ####
# Data for simple slopes
simpleSlope(lmres(S ~ A*Lp, data=dataY), pred="Lp", mod1="A")
PlotSlope(simpleSlope(lmres(S ~ A*Lp, data=dataY), pred="Lp", mod1="A"))
