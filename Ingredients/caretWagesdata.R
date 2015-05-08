# Plotting predictors

library(ISLR)
library(ggplot2)
library(caret)
library(Hmiscpackage)
data(Wage)
summary(Wage)

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
