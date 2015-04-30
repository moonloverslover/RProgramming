# This famous (Fisher's or Anderson's) iris data set gives the measurements in centimeters of the variables sepal length 
# and width and petal length and width, respectively, for 50 flowers from each of 3 species of iris. 
# The species are Iris setosa, versicolor, and virginica.

library(datasets) # iris dataset
library(party) # tree method

str(iris) # compactly display the internal STRucture of an R object, a diagnostic function and an alternative to "summary"
summary(iris)

set.seed(1234)
ind <- sample(2,nrow(iris),replace=TRUE, prob=c(0.7,0.3))
trainData <- iris[ind==1,]
testData <- iris[ind==2,]

myFormula <- Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width
iris_tree <- ctree(myFormula, data=trainData)
table(predict(iris_tree),trainData$Species)

# output
print(iris_tree)
plot(iris_tree)
plot(iris_tree,type="simple")

# prediction
testPred <- predict(iris_tree, newdata = testData)
table(testPred, testData$Species)




