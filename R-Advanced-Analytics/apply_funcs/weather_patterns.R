getwd()
setwd("./")

Chicago <- read.csv("../data/Weather-Data/Chicago-F.csv", row.names=1)
NewYork <- read.csv("../data/Weather-Data/NewYork-F.csv", row.names=1)
Houston <- read.csv("../data/Weather-Data/Houston-F.csv", row.names=1)
SanFrancisco <- read.csv("../data/Weather-Data/SanFrancisco-F.csv", row.names=1)

Chicago
NewYork
Houston
SanFrancisco

is.data.frame(Chicago)

Chicago <- as.matrix(Chicago)
NewYork <- as.matrix(NewYork)
Houston <- as.matrix(Houston)
SanFrancisco <- as.matrix(SanFrancisco)

Weather <- list(Chicago=Chicago, NewYork=NewYork, Houston=Houston, SanFrancisco=SanFrancisco)
Weather

Weather[3]
Weather[[3]]
Weather$Houston

# apply
?apply
Chicago
apply(Chicago, 1, mean)
mean(Chicago["DaysWithPrecip",])

Chicago
apply(Chicago, 1, max)
apply(Chicago, 1, min)
apply(Chicago, 2, max)
apply(Chicago, 2, min)

apply(Chicago, 1, mean)
apply(NewYork, 1, mean)
apply(Houston, 1, mean)
apply(SanFrancisco, 1, mean)

# Recreating apply
##1.
Chicago

output <- NULL
for(i in 1:5){
  output[i] <- mean(Chicago[i,])
}
output
names(output) <- rownames(Chicago)
output
##2.
apply(Chicago,1,mean)

#lapply
?lapply
Chicago
t(Chicago)
Weather

lapply(Weather,t)
mynewlist <- lapply(Weather,t)
mynewlist

Chicago
rbind(Chicago, NewRow=1:12)
lappy(Weather,rbind,NewRow=1:12)

?rowMeans
rowMeans(Chicago)
lapply(Weather,rowMeans)
## with []
Weather
Weather[[1]][1,1]
Weather$Chicago[1,1]
lapply(Weather, "[",1,1)
Weather
lapply(Weather, "[",1,)
lapply(Weather, "[",,3)

# Custom Functions
lapply(Weather,rowMeans)
lapply(Weather, function(x) x[1,])
lapply(Weather, function(x) x[5,])
lapply(Weather, function(x) x[,12])
Weather
lapply(Weather, function(z) z[1,]-z[2,])
lapply(Weather, function(z) round((z[1,]-z[2,]/z[2,]),2))

# sapply()
?sapply
lapply(Weather,"[",1,7)
sapply(Weather,"[",1,7)

lapply(Weather,"[",1,10:12)
sapply(Weather,"[",1,10:12)

lapply(Weather,rowMeans)
sapply(Weather,rowMeans)
round(sapply(Weather,rowMeans),2)

lapply(Weather, function(z) round((z[1,]-z[2,]/z[2,]),2))
sapply(Weather, function(z) round((z[1,]-z[2,]/z[2,]),2))
sapply(Weather,rowMeans, simplify=F)

# Nesting
Weather
lapply(Weather, rowMeans)
?rowMeans
Chicago
apply(Chicago,1,max)
lapply(Weather,apply,1,max)
lapply(Weather, function(x) apply(x,1,max))
sapply(Weather,apply,1,min)
sapply(Weather,apply,1,max)

# which.min()/which.max()
?which.max
which.max(Chicago[1,])
names(which.max(Chicago[1,]))

apply(Chicago, 1, function(x) names(which.max(x)))
lapply(Weather, function(y) apply(y,1, function(x) names(which.max(x))))      
       