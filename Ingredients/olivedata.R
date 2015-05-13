library(pgmm)
library(rpart)
data(olive)
olive = olive[,-1]


str(olive)
table(olive$Area)

fit <- rpart(Area~.,data=olive)
plot(fit)
text(fit,use.n=T)

newdata = as.data.frame(t(colMeans(olive)))
predict(fit,newdata)
