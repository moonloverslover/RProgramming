library(ElemStatLearn)
library(caret)
data(vowel.train)
data(vowel.test) 

dim(vowel.train)
str(vowel.train)
table(vowel.train$y)
is.factor(vowel.train$y)
vowel.train$y <- as.factor(vowel.train$y)
is.factor(vowel.train$y)
vowel.test$y <- as.factor(vowel.test$y)

set.seed(33833)
modFit <- train(vowel.train$y ~., data=vowel.train,method="rf",importance = TRUE)
Imp <- varImp(modFit, scale = T)
order(Imp$Overall)


# quiz4:Question 1
set.seed(33833)
rfFit <- train(y ~., data=vowel.train,method="rf")
booFit <- train(y ~., data=vowel.train,method="gbm")
rfPred <- predict(rfFit,vowel.test)
booPred <- predict(booFit,vowel.test)

confusionMatrix(rfPred,vowel.test$y)
confusionMatrix(booPred,vowel.test$y)

newdata <- data.frame(rfPred,booPred,y=vowel.test$y)
newMod <- train(y~.,data=newdata,method="glm")