# likelihood function (f) for Bernoulli with n=20 and S=12
p <- seq(0,1,0.01)
S <- 12
n <- 20
f <- (p^S)*((1-p)^(n-S))
plot(p,f)
fmax <- max(f)
index <- match(fmax,f)
p[index]
lines(p,f)
