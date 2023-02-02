seq(1,15,2)
V <- c(80,20)
rep(V,10)

w <- c("a","b","c","d","e")

w[-1]
w[-3]
w[c(1,3,5)]
w[c(-2,-5)]
w[-3:-5]


N <- 100
a <- rnorm(N)
b <- rnorm(N)

c <- a * b

d <- rep(NA,N)
for(i in 1:N){
  d[i] <- a[i] * b[i]
}

