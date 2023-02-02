setwd("/Users/samuelzun/Documents/repos/R-Programming/R-Advanced-Analytics/lists")
getwd()

util <- read.csv("../data/P3-Machine-Utilization.csv")
head(util,12)
str(util)
summary(util)
# Derive Utilization column
util$Utilization = 1 - util$Percent.Idle
head(util,12)

# Handling Date-Times
?POSIXct
util$PosixTime <- as.POSIXct(util$Timestamp, format="%d/%m/%Y %H:%M")
head(util,12)
# Rearrange Columns
util$Timestamp <- NULL
head(util,12)
util <- util[,c(4,1,2,3)]
head(util,12)

# Lists
summary(util)
RL1 <- util[util$Machine == "RL1",]
summary(RL1)
RL1$Machine <- factor(RL1$Machine)
summary(RL1)

util_stats_rl1 <- c(min(RL1$Utilization, na.rm = T),
                mean(RL1$Utilization, na.rm = T),
                max(RL1$Utilization, na.rm = T))

util_stats_rl1
util_under_90_flag <- length(which(RL1$Utilization < 0.90)) > 0
util_under_90_flag
list_rl1 <- list("RL1", util_stats_rl1, util_under_90_flag)
list_rl1

# Naming
list_rl1
names(list_rl1)
names(list_rl1) <- c("Machine", "Stats", "LowThreshold")
list_rl1

rm(list_rl1)
list_rl1 <- list(Machine="RL1", Stats=util_stats_rl1, LowThreshold=util_under_90_flag)
list_rl1

# Access
list_rl1
list_rl1[1]
list_rl1[[1]]
list_rl1$Machine

list_rl1[2]
typeof(list_rl1[2])
list_rl1[[2]]
typeof(list_rl1[[2]])
list_rl1$Stats
typeof(list_rl1$Stats)

list_rl1
list_rl1[[2]][3]
list_rl1$Stats[3]

# Adding/Deleting components
list_rl1
list_rl1[4] <- "New Information."
list_rl1

list_rl1$UnknownHours <- RL1[is.na(RL1$Utilization), "PosixTime"]
list_rl1

list_rl1[4] <- NULL
list_rl1

list_rl1[4]

# DataFrame
list_rl1$Data <- RL1
list_rl1
summary(list_rl1)
str(list_rl1)

# Subsetting
list_rl1

list_rl1[[4]][1]
list_rl1$UnknownHours[1]

list_rl1[1:3]
list_rl1[c(1,4)]
