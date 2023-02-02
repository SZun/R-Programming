# Importing Data
setwd("/Users/samuelzun/Documents/repos/R-Programming/R-Advanced-Analytics/data_preparation")
getwd()

# Basic: fin <- read.csv("../data/P3-Future-500-The-Dataset.csv")
fin <- read.csv("../data/P3-Future-500-The-Dataset.csv", na.strings = c(""))
fin
head(fin,20)
tail(fin,10)
str(fin)
summary(fin)

#Factor
fin$ID <- factor(fin$ID)
summary(fin)
str(fin)

fin$Inception <- factor(fin$Inception)
summary(fin)
str(fin)

## Factor Variable Trap
### For Characters:
a <- c("12","13","14","12","12")
a
typeof(a)
b <- as.numeric(a)
b
typeof(b)
### Factor to Numeric
z <- c("12","13","14","12","12")
z
typeof(z)
# Wrong
y <- as.numeric(z)
y
typeof(y)

x <- as.numeric(as.character(z))
x
typeof(x)


## FVT Example
head(fin)
str(fin)
#fin$Profit <- factor(fin$Profit)

head(fin)
str(fin)

summary(fin)

# Wrong
#fin$Profit <- as.numeric(fin$Profit)

#sub() & gsub()
#?sub
fin$Expenses <- gsub(" Dollars", "", fin$Expenses)
fin$Expenses <- gsub(",", "", fin$Expenses)
head(fin)
str(fin)

fin$Revenue <- gsub("\\$", "", fin$Revenue)
fin$Revenue <- gsub(",", "", fin$Revenue)
head(fin)
str(fin)

fin$Growth <- gsub("%", "", fin$Growth)
head(fin)
str(fin)

fin$Expenses <- as.numeric(fin$Expenses)
fin$Revenue <- as.numeric(fin$Revenue)
fin$Growth <- as.numeric(fin$Growth)
str(fin)
summary(fin)

# Locating Missing Data
### Updated import to: fin <- read.csv("../data/P3-Future-500-The-Dataset.csv", na.strings = c(""))
head(fin,24)
fin[!complete.cases(fin),]
str(fin)

# Filtering
## which()
?which
head(fin)
fin[fin$Revenue == 9746272,]
fin[which(fin$Revenue == 9746272),]

head(fin)
fin[fin$Employees ==45,]
fin[which(fin$Employees == 45),]

## is.na()
head(fin,24)

fin$Expenses == NA
fin[fin$Expenses == NA,]

#is.na()

a <- c(1,23,543,NA,76,45,NA)
#is.na(a)

#is.na(fin$Expenses)
fin[is.na(fin$Expenses),]

# Removing records with missing data
fin_backup <- fin
fin <- fin_backup

fin[!complete.cases(fin),]
fin[is.na(fin$Industry),]
fin[!is.na(fin$Industry),]
fin <- fin[!is.na(fin$Industry),]
fin

fin[!complete.cases(fin),]

# Resetting Index
fin
rownames(fin) <- 1:nrow(fin)
fin

fin
rownames(fin) <- NULL
fin

# Replacing Missing Data
## Factual Analysis
fin[!complete.cases(fin),]

fin[is.na(fin$State),]
fin[is.na(fin$State) & fin$City == "New York",]
fin[is.na(fin$State) & fin$City == "New York","State"] <- "NY"
fin[c(11,377),]

fin[!complete.cases(fin),]

fin[is.na(fin$State) & fin$City == "San Francisco","State"] <- "CA"
fin[c(82,265),]
fin[!complete.cases(fin),]
## Median Imputation
### Part 1
fin[!complete.cases(fin),]

med_epl_retail <- median(fin[fin$Industry == "Retail","Employees"], na.rm=TRUE)
med_epl_retail

fin[is.na(fin$Employees) & fin$Industry == "Retail","Employees"] <- med_epl_retail
fin[3,]

med_epl_fin_serv <- median(fin[fin$Industry == "Financial Services","Employees"], na.rm=TRUE)
med_epl_fin_serv

fin[is.na(fin$Employees) & fin$Industry == "Financial Services","Employees"] <- med_epl_fin_serv
fin[330,]
### Part 2
fin[!complete.cases(fin),]

med_growth_constr <- median(fin[fin$Industry == "Construction","Growth"], na.rm=TRUE)
med_growth_constr

fin[is.na(fin$Growth) & fin$Industry == "Construction","Growth"] <- med_growth_constr
fin[8,]

fin[!complete.cases(fin),]
### Part 3
fin[is.na(fin$Revenue) & fin$Industry == "Construction","Revenue"] <- median(fin[fin$Industry == "Construction","Revenue"], na.rm=TRUE)
fin[is.na(fin$Expenses) & fin$Industry == "Construction" & is.na(fin$Profit),"Expenses"] <- median(fin[fin$Industry == "Construction","Expenses"], na.rm=TRUE)
fin[!complete.cases(fin),]

# Deriving Values
fin[is.na(fin$Profit),"Profit"] <- fin[is.na(fin$Profit),"Revenue"] - fin[is.na(fin$Profit),"Expenses"]
fin[c(8,42),]

fin[!complete.cases(fin),]
fin[is.na(fin$Expenses),"Expenses"] <- fin[is.na(fin$Expenses),"Revenue"] - fin[is.na(fin$Expenses),"Profit"]
fin[15,]

fin[!complete.cases(fin),]

# Visualization
library(ggplot2)

p <- ggplot(data = fin)
p
p + geom_point(aes(x=Revenue,y=Expenses,color=Industry,size=Profit))

d <- ggplot(data=fin, aes(x=Revenue,y=Expenses,color=Industry))
d + geom_point() +
  geom_smooth(fill=NA,size=1.2)

f <- ggplot(fin, aes(x=Industry,y=Growth,color=Industry))
f + geom_boxplot(size=1)

f + geom_jitter() +
  geom_boxplot(size=1,alpha=0.5,outlier.color=NA)