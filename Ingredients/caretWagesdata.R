library(ISLR)
library(ggplot2)
library(caret)
library(Hmiscpackage)
library(splines)
library(gbm)
data(Wage)
str(Wage)
summary(Wage)
head(Wage)

inTrain <- createDataPartition(y=Wage$wage, p=0.7, list=FALSE)
training <- Wage[inTrain,]
testing <- Wage[-inTrain,]
dim(training)
dim(testing)
dim(Wage)

featurePlot(x=training[,c("age","education","jobclass")],y=training$wage,plot="pairs")
qplot(age,wage,data=training) # like plot(training$age,training$wage)
qplot(age,wage,colour=jobclass,data=training)

qq <- qplot(age,wage,colour=education,data=training)
qq + geom_smooth(method='lm',fomula=y~x)

cutWage <- cut2(training$wage,g=3)
table(cutWage)

# tables
prop.table(t1,1)

# density plots
qplot(wage,colour=education,data=training,geom="density")


# covariate creation
  # level 1 - Raw data -> covariates
    # Google "feature extraction for [data type]"
  # level 2 - Tidy covariates -> new covariates
    # Should be done only on the training set.
    # New covariates should be added to data frames.
 
  table(training$jobclass)
  
  # add dummy variables
  dummies <- dummyVars(wage ~ jobclass,data=training)
  head(predict(dummies,newdata=training))
  
  # removing zero covariates
  nsv <- nearZeroVar(training,saveMetric=TRUE)
  nsv
  
  # spline basis
  bsBasis <- bs(training$age,df=3)
  bsBasis
  lm1 <- lm(wage ~ bsBasis,data=training)
  plot(training$age,training$wage,pch=19,cex=0.5)
  points(training$age,predict(lm1,newdata=training),col="red",pch=19,cex=0.5)
  
  # splines on the test set
  predict(bsBasis,age=testing$age)

# boosting
Wage <- subset(Wage,select=-c(logwage))
dim(Wage)

inTrain <- createDataPartition(y=Wage$wage, p=0.7, list=FALSE)
training <- Wage[inTrain,]
testing <- Wage[-inTrain,]

modFit <- train(wage~.,method="gbm",data=training,verbose=FALSE)
print(modFit)


# model stacking
Wage <- subset(Wage,select=-c(logwage))
inBuild <- createDataPartition(y=Wage$wage, p=0.7, list=FALSE)
buildData <- Wage[inBuild,]
validation <-Wage[-inBuild,];
inTrain <- createDataPartition(y=buildData$wage, p=0.7, list=FALSE)
training <- buildData[inTrain,]
testing <- buildData[-inTrain,]

mod1 <- train(wage~.,method="glm",data=training)
mod2 <- train(wage~.,method="rf",data=training,trControl=trainControl(method="cv"),number=3)

pred1 <- predict(mod1,testing)
pred2 <- predict(mod2,testing)
qplot(pred1,pred2,colour=wage,data=testing)

predDF <- data.frame(pred1,pred2,wage=testing$wage)
combModFit <- train(wage~.,method="gam",data=predDF)
combPred <- predict(combModFit,predDF)

sqrt(sum((pred1-testing$wage)^2))
sqrt(sum((pred2-testing$wage)^2))
sqrt(sum((combPred-testing$wage)^2))

pred1V <- predict(mod1,validation)
pred2V <- predict(mod2,validation)
predVDF <- data.frame(pred1=pred1V,pred2=pred2V)
comPredV <- predict(combModFit,predVDF)

sqrt(sum((pred1V-validation$wage)^2))
sqrt(sum((pred2V-validation$wage)^2))
sqrt(sum((comPredV-validation$wage)^2))



