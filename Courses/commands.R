y<-c(1.7,2)
y<-c(1.7,"good")
y<-c(T,"good")

x <- 1:6
as.logical(x)

b <- as.logical(x)
d <- list(1,T,"aaa")


m <- matrix(nrow=3,ncol=4)
dim(m)
attributes(m)

m1 <- 1:10
dim(m1) <- c(2,5)
m1

x <- 1:3
y <- 6:8
rbind(x,y)
cbind(x,y)


x <- factor(c("yes","no","yes","yes"))
x

x <- c(1,2,NA,NaN,4,5)
is.nan(x)
is.na(x)

x <- data.frame(foo = 1:4, bar = c(T,T,F,F))
nrow(x)
ncol(x)


x <- c("a","b","c","d","a")
x[2]
x[1:4]



x <- list(foo=1:4,bar=0.6, baz="hello")
x[c(1,3)]



x <- matrix(1:6,2,3)
x[2,]

Y <- x[1,2,drop=FALSE]
Y


x <- c(1,2,NA,4)
bad <- is.na(x)
x[!bad]

x <- c(1,4,7)
x[c(1,2)]


x <- 1:4; y<-6:9
x*y
x/y


y <- matrix(rep(10,4),2,2)
x <- matrix(1:4,2,2)
x * y
x %*% y

x <- c(4, TRUE)
x

x <- list(2, "a", "b", TRUE)
x[[1]]



x <- 1:4
y <- 2 
x+y


mydata <- read.csv('hw1_data.csv')
mydata


mydata[1:2,]


nrow(mydata)


mydata$Ozone[47]


mydata$Ozone[is.na(mydata$Ozone)]
mean(mydata$Ozone[!is.na(mydata$Ozone)])

mydata[[Ozone]]>31

newdata <- subset(mydata, Ozone > 31 & Temp > 90)
 mean(newdata$Solar.R)

newdata1 <- subset(mydata, Month == 6)
mean(newdata1$Temp)


newdata2 <- subset(mydata, Month == 5 $ Ozone ~= NA)
newdata2$Ozone[!is.na(newdata2$Ozone)]
max(newdata2$Ozone[!is.na(newdata2$Ozone)])
