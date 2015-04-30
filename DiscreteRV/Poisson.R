# Poisson distribution

x <- seq(0,25,1)
y <- dpois(x,10)
plot(x,y)

y5 <- dpois(x,5)
y10 <- dpois(x,10)
y15 <- dpois(x,15)
plot(x,y5,col=1)
lines(x,y10)
lines(x,y15)
