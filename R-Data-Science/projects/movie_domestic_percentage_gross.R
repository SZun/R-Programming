getwd()
setwd("/Users/samuelzun/Documents/repos/R-Programming/R-Data-Science/projects")
getwd()

mov <- read.csv("./data/Section6-Homework-Data.csv")

head(mov)
summary(mov)
str(mov)

library(ggplot2)

ggplot(data=mov, aes=(x=Day.of.Week)) + geom_bar()

filt <- mov$Genre == "action" | mov$Genre == "adventure" | mov$Genre == "animation" | mov$Genre == "comedy" | mov$Genre == "drama"
filt2 <- mov$Studio %in% c("Buena Vista Sutdios", "WB", "Fox", "Universal", "Sony", "Paramount")

filt
filt2

mov2 <- mov[filt & filt2,]
mov2

p <- ggplot(data=mov2, aes(x=Genre,y=Gross...US))
q <- p + 
  geom_jitter(size=Budget...mill.,color=Studio) +
  geom_boxplot(alpha=0.7, outlier.color = NA)

q <- q + 
  xlab("Genre") + 
  ylab("Gross % US") +
  ggtitle("Domestic Gross % by Genre")

q <- q +
  theme(
    axis.title.x = element_text(color="Blue",size=30),
    axis.title.y = element_text(color="Blue",size=30),
    axis.text.x = element_text(size=20),
    axis.text.y = element_text(size=20),
    
    plot.title = element_text(size=40),
    
    legend.title = element_text(size=20),
    legend.text = element_text(size=20),
    
    text = element_text(family="Comic Sans MS")
  )

q$labels$size <- "Budget $M"
q
