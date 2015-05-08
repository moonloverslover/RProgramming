library(caret)
library(kernlab)

data(spam)
summary(spam)
str(spam)
# data slicing
inTrain <- createDataPartition(y=spam$type,p=0.75,list=FALSE)
training <- spam[inTrain,]
testing <- spam[-inTrain,]
dim(training)
dim(spam)

# fit
set.seed(32343)
modelFit <- train(type ~., data=training, method="glm")
modelFit$finalModel

# prediction
predictions <- predict(modelFit, newdata=testing)
predictions

confusionMatrix(predictions, testing$type) # like table(predictions,testing$type) 

# K-fold
set.seed(32323)
folds <- createFolds(y=spam$type,k=10,list=TRUE,returnTrain=TRUE)
sapply(folds,length)
folds[[1]][1:10]

set.seed(32323)
folds <- createFolds(y=spam$type,k=10,list=TRUE,returnTrain=FALSE)
sapply(folds,length)
folds[[1]][1:10]

set.seed(32323)
folds <- createResample(y=spam$type,times=10,list=TRUE)
sapply(folds,length)
folds[[1]][1:10]

set.seed(32323)
tme <- 1:1000
folds <- createTimeSlices(y=tme,initialWindow=20,horizon=10)
names(folds)
folds$train[[1]]
folds$test[[1]]

# training options
# continuous outcomes:
  # RMSE = Root mean squared error
  # RSqured = R^2 form regression models
# categorical outcomes:
  # Accuracy = Fraction correct
  # Kappa = A measure of concordance


# preprocess
hist(training$capitalAve,main="",xlab="ave. capital run length")
mean(training$capitalAve)
sd(training$capitalAve)
  
  # standardizing
  trainCapAve <- training$capitalAve
  trainCapAveS <- (trainCapAve-mean(trainCapAve))/sd(trainCapAve)
  mean(trainCapAveS)
  sd(trainCapAveS)

  # standardizing - test set
  testCapAve <- testing$capitalAve
  testCapAveS <- (testCapAve-mean(trainCapAve))/sd(trainCapAve) # training and test must be processed in the same way
  mean(testCapAveS)
  sd(testCapAveS)

  # standardizing - preProcess function
  preObj <- preProcess(training[,-58],method=c("center","scale"))
  trainCapAveS <- predict(preObj,training[,-58])$capitalAve
  mean(trainCapAveS)
  sd(trainCapAveS)

  testCapAveS <- predict(preObj,testing[,-58])$capitalAve
  mean(testCapAveS)
  sd(testCapAveS)

  # preProcess argument
  set.seed(32343)
  modelFit <- train(type ~., data=training,preProcess=c("center","scale"),method="glm")
  modelFit

  # standardizing - Box-Cox transforms
  preObj <- preProcess(training[,-58],method=c("BoxCox"))
  trainCapAveS <- predict(preObj,training[,-58])$capitalAve
  par(mfrow=c(1,2))
  hist(trainCapAveS)
  qqnorm(trainCapAveS)

  # imputing data
  preOjb <- preProcess(training[,-58],method=c("knnImpute"))
  





















