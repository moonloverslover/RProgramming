library(R.matlab)

mydata=readMat('/Users/Boyi/R/Ingredients/CGM.mat')
ls()    # list all variables in the workspace

summary(mydata)
str(mydata)

CGM <- mydata$CGM
steps <- 1:nrow(mydata$CGM)

plot(steps,CGM)
lines(steps,CGM)

ind <- 12:length(steps)

CGMh <- CGM[1:100]
fit <- arima(CGMh, order = c(15,0,0))
predict(fit,25)
