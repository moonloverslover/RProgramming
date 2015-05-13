library(AppliedPredictiveModeling)
data(concrete)
library(caret)
library(elasticnet)
library(glmnet)
library(MASS)

# Question 2
set.seed(975)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[inTrain,]
testing = mixtures[-inTrain,]
dim(training)
dim(testing)
head(concrete)
str(concrete)
summary(training)

qplot(row(training)[,1],CompressiveStrength,colour=Cement,data=training)
qplot(row(training)[,1],CompressiveStrength,colour=BlastFurnaceSlag,data=training)
qplot(row(training)[,1],CompressiveStrength,colour=FlyAsh,data=training)
qplot(row(training)[,1],CompressiveStrength,colour=Water,data=training)
qplot(row(training)[,1],CompressiveStrength,colour=Superplasticizer,data=training)
qplot(row(training)[,1],CompressiveStrength,colour=CoarseAggregate,data=training)
qplot(row(training)[,1],CompressiveStrength,colour=FineAggregate,data=training)
qplot(row(training)[,1],CompressiveStrength,colour=FlyAsh,data=training)

# Question 3
histogram(training$Superplasticizer)
histogram(log(training$Superplasticizer))
min(training$Superplasticizer)


# quiz 4: Question 3
set.seed(3523)
inTrain = createDataPartition(mixtures$CompressiveStrength, p = 3/4)[[1]]
training = mixtures[inTrain,]
testing = mixtures[-inTrain,]
dim(training)
dim(testing)
head(concrete)
str(concrete)

set.seed(233)

#fit.lasso <- glmnet(training[,-9], training$CompressiveStrength, family="gaussian", alpha=1)
#plot(fit.lasso, xvar="lambda")

modFit <- train(CompressiveStrength ~., data=training,method="lasso")
modFit$finalModel
plot.enet(modFit$finalModel)

# quiz 4: Question 5
set.seed(3523)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4)[[1]]
training = concrete[ inTrain,]
testing = concrete[-inTrain,]
str(training)

set.seed(325)
library(e1071)
modFit <- svm(CompressiveStrength ~., data=training)
pred <- predict(modFit,testing)
sqrt((sum((pred-testing$CompressiveStrength)^2))/length(pred))
