## dowload library and call library
library(tidyverse)
library(ggplot2)

## create basic plot in R
hist(mtcars$mpg)

## analyzing horse power
# histogram one quantitative variable
hist(mtcars$hp)
mean(mtcars$hp)
median(mtcars$hp)


## change column am to factor 0 = auto 1 = manual
mtcars$am <- factor(mtcars$am, levels = c(0, 1), 
                    labels = c("Auto", "Manual"))

## scatter plot
ggplot(mtcars, aes(am, mpg)) +
  geom_histogram()


# bar plot one qualitative variable
head(mtcars)
table(mtcars$am)
barplot(table(mtcars$am))

## Box plot
boxplot(mtcars$hp)
fivenum(mtcars$hp)

min(mtcars$hp)
quantile(mtcars$hp, probs = c(0.25, 0.5, 0.75))
max(mtcars$hp)

## whisker calculation
# first calculate q1 and q3
q1 <- quantile(mtcars$hp, probs = 0.25)
q3 <- quantile(mtcars$hp, probs = 0.75)

iqr_hp <- q3 - q1

## top whisker
q3 + 1.5*iqr_hp
## bottom whisker
q1 - 1.5*iqr_hp

## boxplot.stats function
boxplot.stats(mtcars$hp, coef = 1.5)

## filter outlier
mtcars_no_out <- mtcars %>%
  filter(hp < 335)
boxplot(mtcars_no_out$hp)

## box plot 2 variables
# quanlitative x quantitative
mtcars$am <- factor(mtcars$am, levels = c(0, 1), 
                    labels = c("Auto", "Manual"))
boxplot(mpg ~ am, data = mtcars,
        col = c("magenta", "salmon"))


## create scatter plot
plot(mtcars$hp, mtcars$mpg)

## using argument pch
plot(mtcars$hp, mtcars$mpg, pch = 24, col = "red")
