training <- NULL
for (i in 1:100) {
  sales <-sample(c(0:20),size=13,replace=T)
  idsales = c(i,sales)
  training = rbind(training,idsales)  
}

write.csv(training, "/Users/Boyi/R/Ingredients/cftraining.csv",row.names=F,col.names=F)
