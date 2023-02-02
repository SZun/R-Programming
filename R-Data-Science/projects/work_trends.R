getwd()
setwd("/Users/samuelzun/Documents/repos/R-Programming/R-Data-Science/homeworks")

getwd()

data <- read.csv("./data/P2-Section5-Homework-Data.csv")
data
head(data)
tail(data)
str(data)
summary(data)

data$Year
temp <- factor(data$Year)
temp
levels(temp)

data1960 <- data[data$Year==1960,]
data2013 <- data[data$Year==2013,]

nrow(data1960)
nrow(data2013)

add1960 <- data.frame(Country=Country_Code,Life.Exp=Life_Expectancy_At_Birth_1960)
add2013 <- data.frame(Country=Country_Code,Life.Exp=Life_Expectancy_At_Birth_2013)

summary(add1960)
summary(add2013)

merged1960 <- merge(data1960, add1960, by.x="Country.Code", by.y="Code")
merged2013 <- merge(data2013, add2013, by.x="Country.Code", by.y="Code")

str(merged1960)
str(merged2013)

merged1960$Year <- NULL
merged2013$Year <- NULL

library(ggplot2)

qplot(data=merged1960, x=Fertility.Rate, y=Life.Exp, color=Region, size=I(5), aplha=I(0.6),
      main="Life Expectancy vs Fertility Rate (1960)")
qplot(data=merged2013, x=Fertility.Rate, y=Life.Exp, color=Region, size=I(5), aplha=I(0.6),
      main="Life Expectancy vs Fertility Rate (2013)")