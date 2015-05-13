library(AppliedPredictiveModeling)
library(caret)

data(AlzheimerDisease)
dim(AlzheimerDisease)

# Question 1
adData = data.frame(diagnosis,predictors)
testIndex = createDataPartition(diagnosis, p = 0.50,list=FALSE)
training = adData[-testIndex,]
testing = adData[testIndex,]





# Question 4
set.seed(3433)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]
dim(adData)
str(adData)
dim(training)
dim(predictors)

allnames = NULL
for (i in 1:131) {
  name = substr(names(training)[i],1,2)
  if (name == "IL") allnames = c(allnames,names(training)[i])
}

Xorg = data.frame(training[,allnames])
Xorg_test = data.frame(testing[,allnames])

adPC <- preProcess(Xorg, method="pca", thresh = 0.80)
XPC <- predict(adPC,Xorg)
dim(XPC)

# Question 5

newtraining = data.frame(Xorg,training$diagnosis)
# Non-PCA
modelFit <- train(training$diagnosis ~., method="glm",data=Xorg)
confusionMatrix(testing$diagnosis,predict(modelFit,testing))

#modelFit <- train(training$diagnosis ~ IL_11+IL_13+IL_16+IL_17E+IL_1alpha+IL_3+IL_4+IL_5+IL_6+IL_6_Receptor+IL_7+IL_8, method="glm",data=Xorg)
#confusionMatrix(testing$diagnosis,predict(modelFit,testing))

# PCA
modelFit2 <- train(training$diagnosis ~., method="glm",data=XPC)
testPC <- predict(adPC,Xorg_test)
confusionMatrix(testing$diagnosis,predict(modelFit2,testPC))


# quiz 4: Question 2
library(caret)
library(gbm)
set.seed(3433)
library(AppliedPredictiveModeling)
data(AlzheimerDisease)
adData = data.frame(diagnosis,predictors)
inTrain = createDataPartition(adData$diagnosis, p = 3/4)[[1]]
training = adData[ inTrain,]
testing = adData[-inTrain,]

dim(training)
dim(testing)
str(training)

set.seed(62433)
mod1 <- train(diagnosis ~., data=training,method="rf")
mod2 <- train(diagnosis ~., data=training,method="gbm")
mod3 <- train(diagnosis ~., data=training,method="lda")

pred1 <- predict(mod1,testing)
pred2 <- predict(mod2,testing)
pred3 <- predict(mod3,testing)
pred1

confusionMatrix(pred1,testing$diagnosis)
confusionMatrix(pred2,testing$diagnosis)
confusionMatrix(pred3,testing$diagnosis)

newdata <- data.frame(pred1,pred2,pred3, diagnosis=testing$diagnosis)
head(newdata)
combFit <- train(diagnosis ~., data=newdata,method="rf")
