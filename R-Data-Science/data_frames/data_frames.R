

?read.csv()

stats <- read.csv(file.choose())
stats
getwd()

setwd("/Users/samuelzun/Documents/repos/R-Programming/R-Data-Science/data_frames")
getwd()

stats <- read.csv("./data/P2-Demographic-Data.csv")
stats

nrow(stats)
ncol(stats)
head(stats,n=10)
tail(stats,n=8)
str(stats)
summary(stats)

head(stats)
stats[3,3]
stats[3, "Birth.rate"]
stats$Internet.users
stats$Internet.users[2]
stats[,"Internet.users"]
levels(stats$Income.Group)

stats[1:10,]
stats[3:9,]
stats[c(4,100),]

is.data.frame(stats[1,])
is.data.frame(stats[3:9,])
is.data.frame(stats[,1,drop=F])

head(stats)
stats$Birth.rate * stats$Internet.users
stats$Birth.rate + stats$Internet.users

head(stats)
stats$MyCalc <- stats$Birth.rate * stats$Internet.users

stats$xyz <- 1:5
head(stats, n=12)

head(stats)
stats$MyCalc <- NULL
stats$xyz <- NULL

head(stats)
filter <- stats$Internet.users < 2
stats[filter,]

stats[stats$Birth.rate > 40,]
stats[stats$Birth.rate > 40 & stats$Internet.users < 2,]
stats[stats$Income.Group == "High income"]
levels(stats$Income.Group)

stats[stats$Country.Nam == "Malta",]


library(ggplot2)

qplot(data=stats,x=Internet.users)
qplot(data=stats,x=Income.Group,y=Birth.rate)
qplot(data=stats,x=Income.Group,y=Birth.rate, size=I(3))
qplot(data=stats,x=Income.Group,y=Birth.rate, size=I(3), color=I("blue"))
qplot(data=stats,x=Income.Group,y=Birth.rate, geom="boxplot")


qplot(data=stats, x=Internet.users, y=Birth.rate)
qplot(data=stats, x=Internet.users, y=Birth.rate, size=I(4))
qplot(data=stats, x=Internet.users, y=Birth.rate, size=I(4), color=I("red"))
qplot(data=stats, x=Internet.users, y=Birth.rate, size=I(5), color=Income.Group)

my_df <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset, Regions_2012_Dataset)
#head(my_df)
#colnames("Country", "Code", "Region")
rm(my_df)
my_df <- data.frame(Country=Countries_2012_Dataset, Code=Codes_2012_Dataset, Region=Regions_2012_Dataset)
head(my_df)
tail(my_df)
summary(my_df)

head(stats)
head(my_df)

merged <- merge(stats, my_df, by.x = "Country.Code",by.y = "Code")
head(merged)

merged$Country <- NULL
str(merged)
tail(merged)

qplot(data=merged, x=Internet.users,y=Birth.rate)
qplot(data=merged, x=Internet.users,y=Birth.rate, color=Region)

qplot(data=merged, x=Internet.users,y=Birth.rate, color=Region, size=I(5), shape=I(23))

qplot(data=merged, x=Internet.users,y=Birth.rate, color=Region, size=I(5), shape=I(19), alpha=I(0.6))

qplot(data=merged, x=Internet.users,y=Birth.rate, color=Region, size=I(5), shape=I(19),
      main="Birth Rate vs Internet Users")