library(ElemStatLearn)
data(SAheart)
set.seed(8484)
train = sample(1:dim(SAheart)[1],size=dim(SAheart)[1]/2,replace=F)
trainSA = SAheart[train,]
testSA = SAheart[-train,]

str(trainSA)
dim(trainSA)
dim(testSA)

set.seed(13234)
modFit <- glm(chd ~ age+alcohol+obesity+tobacco+typea+ldl,data=trainSA,family=binomial())
modFit
probs <- fitted(modFit)  # probs <- predict(modFit,trainSA,type="response")
n = length(probs)
mis = 0
for (i in 1:n) {
  predV = 0
  prob = probs[i]
  if (prob>0.5) {predV=1}
  if (predV!=trainSA$chd) {mis=mis+1}
}
misp = mis/n

# test
probs <- predict(modFit,testSA,type="response")

n = length(probs)
mis = 0
for (i in 1:n) {
  predV = 0
  prob = probs[i]
  if (prob>0.5) {predV=1}
  if (predV!=testSA$chd) {mis=mis+1}
}
misp = mis/n

