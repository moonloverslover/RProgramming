x <- seq(-4,4,0.01)
hist(x)
y <- dnorm(x,mean=0,sd=1)
hist(y)
rn <- rnorm(1000,mean=0,sd=1)
hist(rn)
plot(density(x=rn,bw="nrd0",kernal="gaussian",n=1000),col=1)
lines(x,y)
for (w in 1:3) {
  lines(density(x=rn,bw=w,kernal="gaussian",n=1000),col=w+1)
}

x <- seq(0.01,10,0.01)
yF <- df(x,5,2)
plot(x,yF)

ydata <- rf(n=10,df1=5,df2=2)
 
plot(density(x=ydata,bw="nrd0",kernal="gaussian",n=10), col=2)
lines(x,yF)

min(ydata)
max(ydata)
