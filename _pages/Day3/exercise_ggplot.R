library(readr)
library(dplyr)
library(ggplot2)

# Monolingual Addition Task.
df <- data.frame(read_csv("sample_data_ggplot.csv"))

# See the structure of Accuracy
head(df, n = 21)
str(df)

# SubjID: Subject ID
# Block: [1-12] Block number - 12 blocks
# Num: [1-20] Stimulus order in a block, each block has 20 stimulus

# EventCode

# EventCode shows the types of stimuli
# 1-60: Single Digit Addition
# 61-120: Double Digit Addition
# 121-180: Single Digit Addition (121st is a reverse of 1st) for example, 7 + 2 and 2 + 7
# 181-240: Double Digit Addition (181st is a reverse of 61st) for example, 31 + 21 and 21 + 31 

# 1-30, 121-150 : Answer < 10
# 31-60, 151-180 : Answer > 10
# 61-90, 181-210 : No carry over operation
# 91-120, 211-240 : Requires Carry over operation

# Response: Response from a subject
# Answer: Correct Answer
# Correct: Check the answer is correct

# Objective: Scatter plot of (EventCode, and average correct rate)

# Check the length of factors

str(df)

# Project Eventcode larger than 120 into 1-120
df$EventCode <- ifelse(df$EventCode > 120, df$EventCode - 120, df$EventCode) 

# Add column for a stimulus type
df <- df %>% mutate(Type = case_when(EventCode %in% seq(1,30) ~ "Single_NoCarry",
                                      EventCode %in% seq(31,60) ~ "Single_Carry",
                                      EventCode %in% seq(61,90) ~ "Double_NoCarry",
                                      EventCode %in% seq(91,120) ~ "Double_Carry"))

# Select essential columns
df <- df %>% dplyr::select(SubjID, EventCode, Correct, Type)

# Summarize mean correctness by EventCode
tbl <- df %>% group_by(EventCode) %>% summarize(Correct = mean(Correct))

# quick plot in ggplot2 
qplot(EventCode, Correct, data = tbl)

# Add a categorical column
tbl <- tbl %>% mutate(Type = case_when(EventCode %in% seq(1,30) ~ "Single_NoCarry",
                                     EventCode %in% seq(31,60) ~ "Single_Carry",
                                     EventCode %in% seq(61,90) ~ "Double_NoCarry",
                                     EventCode %in% seq(91,120) ~ "Double_Carry"))

# add color
qplot(EventCode, Correct, dat = tbl, col = Type)

# add smooth
qplot(EventCode, Correct, dat = tbl, col = Type,
      geom = c("point", "smooth"))

# add regression line
qplot(EventCode, Correct, dat = tbl, col = Type,
      geom = c("point", "smooth"), method = "lm")

# Add labels
qplot(EventCode, Correct, dat = tbl, col = Type, 
      geom = c("point", "smooth"), method = "lm",
      main = "Accuracy by Stimulus Type",
      xlab = "Stimulus Type", ylab = "Accuracy")

# Error rate
qplot(EventCode, 1 - Correct, dat = tbl, col = Type, 
      geom = c("point", "smooth"), method = "lm",
      main = "Error rate by Stimulus Type",
      xlab = "Stimulus Type", ylab = "Error rate")

###### ggplot without qplot

# using ggplot function 
ggplot(tbl, aes(EventCode, Correct)) 

# using ggplot function 
ggplot(tbl, aes(EventCode, Correct)) + geom_point()

# using ggplot function 
p <- ggplot(tbl, aes(EventCode, Correct)) 
summary(p)

# Add color
ggplot(tbl, aes(EventCode, Correct, col = Type)) + geom_point()

# Add regression line
ggplot(tbl, aes(EventCode, Correct, col = Type)) + geom_point() + geom_smooth(method = "lm")

# Add title
ggplot(tbl, aes(EventCode, 1 - Correct, col = Type)) + geom_point() + geom_smooth(method = "lm") +
  xlab("Event Code") + ylab("Error Rate") + ggtitle("Error Rate by Event Code")

# Add Theme
ggplot(tbl, aes(EventCode, 1 - Correct, col = Type)) + geom_point() + geom_smooth(method = "lm") +
  xlab("Event Code") + ylab("Error Rate") + ggtitle("Error Rate by Event Code") + 
  theme_bw(base_family = "Times")
