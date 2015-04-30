# Binomial distribution

x <- seq(0,100,1)
n=100
p=0.5
y <- dbinom(x,n,p)
plot(x,y)
y1000 <- rbinom(1000,n,p)
hist(y1000)
