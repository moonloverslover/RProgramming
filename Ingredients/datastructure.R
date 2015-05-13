# create data manually
newdata <- data.frame(waiting=c(80,90,100),duration=c(4,6,10))

x = matrix(ceiling(9*runif(20)), nrow=5)   
colnames(x) = c("col1", "col2", "col3", "col4")
df = data.frame(x)      # create a small data frame

df[1,]                  # get the first row
df[3,]                  # get the third row
df[nrow(df),]           # get the last row

lf = as.list(df)        

lf[[1]]                 # get first row
lf[[3]]                 # get third row

newdata=data.frame(ozone=1:155)

# subsetting
Wage <- subset(Wage,select=-c(logwage))


# seq
vec = seq(1,50,2)


# sample
x <- 1:10
sample(x)
sample(10)
x>8
x[x>8]
sample(x[x>8])
sample(x[x>9])

sample(x, size = 5)

coin <- c("Heads", "Tails")
sample(coin, size = 1)

sample(coin, size = 100)

sample(coin, size = 100, replace = TRUE)

sample(vec,10)
sample(vec,10,replace=TRUE)

# matrix
m = matrix(seq(1,9,1),nrow=3,ncol=3)
nrow(m)
