Charlie <- 1:5
Charlie

names(Charlie) <- c("a","b","c","d","e")
Charlie
Charlie["d"]
names(Charlie)

names(Charlie) <- NULL
Charlie

temp.vec <- rep(c("a","b","c"), each=3)
temp.vec

Bravo <- matrix(temp.vec, 3, 3)
Bravo

rownames(Bravo) <- c("How", "are", "you?")
Bravo

colnames(Bravo) <- c("X","Y","Z")
Bravo

Bravo["are","Y"] <- 0
Bravo

rownames(Bravo) <- NULL
Bravo
