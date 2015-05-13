library(AppliedPredictiveModeling)
data(segmentationOriginal)
library(caret)
library(rattle)

dim(segmentationOriginal)
str(segmentationOriginal)

table(segmentationOriginal$Case)

training <- segmentationOriginal[segmentationOriginal$Case=="Train",]
testing <- segmentationOriginal[segmentationOriginal$Case=="Test",]
str(training)

set.seed(125)
# caret
modFit <- train(Class~., method="rpart", data=training)
modFit$finalModel
plot(modFit$finalModel)
fancyRpartPlot(modFit$finalModel)

predict(modFit,data.frame(AvgIntenCh2 = 23000, FiberWidthCh1 = 10, PerimStatusCh1=2))

# rpart
modFit2 <- rpart(Class~.,data=training)
plot(modFit2)
predict(modFit2,data.frame(AvgIntenCh2 = 23000, FiberWidthCh1 = 10, PerimStatusCh1=2))







