getwd()
setwd("/Users/samuelzun/Documents/repos/R-Programming/R-Data-Science/ggplot2")
getwd()

movies <- read.csv("./data/P2-Movie-Ratings.csv")
head(movies)
colnames(movies) <- c("Film","Genre","CriticRating","AudienceRating","BudgetMillions","Year")
head(movies)
tail(movies)
str(movies)
summary(movies)

factor(movies$Year)
movies$Year <- factor(movies$Year)

summary(movies)
str(movies)

library(ggplot2)

ggplot(movies, aes(x=CriticRating,y=AudienceRating))
ggplot(movies, aes(x=CriticRating,y=AudienceRating)) +
  geom_point()
ggplot(movies, aes(x=CriticRating,y=AudienceRating,color=Genre, size=BudgetMillions)) +
  geom_point()

p <- ggplot(movies, aes(x=CriticRating,y=AudienceRating,color=Genre, size=BudgetMillions))
p + geom_point()
p + geom_line()
p + geom_point() + geom_line()
p + geom_line() + geom_point()
p + geom_point(aes(size=CriticRating))
p + geom_point(aes(color=BudgetMillions))
p + geom_point(aes(x=BudgetMillions)) +
  xlab("Budget Millions $$$")
p + geom_line(size=1) + geom_point()

r <- ggplot(movies, aes(x=CriticRating,y=AudienceRating))
r + geom_point()
r + geom_point(aes(color=Genre))
r + geom_point(color="DarkGreen")
r + geom_point(aes(size=BudgetMillions))
r + geom_point(size=10)

s <- ggplot(movies,aes(x=BudgetMillions))
s + geom_histogram(binwidth = 10)
s + geom_histogram(binwidth = 10, aes(fill=Genre), color="Black")
s + geom_density(aes(fill = Genre))
s + geom_density(aes(fill = Genre), position = "stack")

t <- ggplot(movies,aes(x=AudienceRating))
t + geom_histogram(binwidth = 10, fill = "White", color = "Blue")

t <- ggplot(movies,aes(x=movies))
t + geom_histogram(binwidth = 10, aes(x=AudienceRating), fill = "White", color = "Blue")
t + geom_histogram(binwidth = 10, aes(x=CriticRating), fill = "White", color = "Blue")
t <- ggplot()

?geom_smooth()
u <- ggplot(movies, aes(x=Genre,y=AudienceRating,color=Genre))

u + geom_boxplot()
u + geom_boxplot(size=1.2)
u + geom_boxplot(size=1.2) + geom_point()
u + geom_boxplot(size=1.2) + geom_jitter()
u + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5)

s + geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black")
s + geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black") +
  facet_grid(Genre~., scales = "free")
w <- ggplot(movies, aes(x=CriticRating,y=BudgetMillions,color=Genre))
w + geom_point(size=3)
w + geom_point(size=3) + facet_grid(Genre~.)
w + geom_point(size=3) + facet_grid(.~Year)
w + geom_point(size=3) + geom_smooth() + facet_grid(Genre~Year)
w + geom_point(aes(size=BudgetMillions)) + geom_smooth() + facet_grid(Genre~Year)

p + geom_point()
p + geom_point() + xlim(50,100) + ylim(50,100)
s + geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black")
s + geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black") + ylim(0,50)
s + geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black") + 
  coord_cartesian(ylim(0,50))
w + geom_point(aes(size=BudgetMillions)) + geom_smooth() + facet_grid(Genre~Year) +
  coord_cartesian(ylim(0,100))

h <- s + geom_histogram(binwidth = 10, aes(fill = Genre), color = "Black")
h + 
  xlab("Money Axis") +
  ylab("Number of Movies") + 
  theme(axis.title.x = element_text(color="Dark Green", size=30),
        axis.title.y = element_text(color="Red", size=30))
h + 
  xlab("Money Axis") +
  ylab("Number of Movies") + 
  theme(axis.title.x = element_text(color="Dark Green", size=30),
        axis.title.y = element_text(color="Red", size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20))
h + 
  xlab("Money Axis") +
  ylab("Number of Movies") + 
  ggtitle("Movie Budget Distribution") +
  theme(axis.title.x = element_text(color="Dark Green", size=30),
        axis.title.y = element_text(color="Red", size=30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20),
        
        legend.title = element_text(size=30),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        
        plot.title = element_text(color="DarkBlue",
                                  size=40,
                                  family="Courier"))





