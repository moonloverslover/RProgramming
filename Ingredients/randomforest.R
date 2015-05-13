# This famous (Fisher's or Anderson's) iris data set gives the measurements in centimeters of the variables sepal length 
# and width and petal length and width, respectively, for 50 flowers from each of 3 species of iris. 
# The species are Iris setosa, versicolor, and virginica.

library(datasets) # iris dataset
library(randomForest) # tree method
library(ggplot2)
library(caret)

str(iris) # compactly display the internal STRucture of an R object, a diagnostic function and an alternative to "summary"
summary(iris)

ind <- sample(2,nrow(iris),replace=TRUE,prob=c(0.7,0.3))
trainData = iris[ind==1,]
testData = iris[ind==2,]

rf <- randomForest(Species ~., data = trainData, ntree=100, proximity=TRUE)
table(predict(rf),trainData$Species)
print(rf)
attributes(rf)
plot(rf)
 
# importance of variables 
importance(rf)
varImpPlot(rf)

# test
irisPred <- predict(rf, newdata=testData)
table(irisPred,testData$Species)
plot(margin(rf,testData$Species))

# caret method
inTrain <- createDataPartition(y=iris$Species,p=0.7,list=FALSE)
training <- iris[inTrain,]
testing <- iris[-inTrain,]
modFit <- train(Species~.,data=training,method="rf",prox=TRUE)
modFit
getTree(modFit$finalModel,k=2)
pred <- predict(modFit,testing)
table(pred,testing$Species)
