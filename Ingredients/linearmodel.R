library(R.matlab)

mydata=readMat('/Users/Boyi/R/Ingredients/linearmodel_data.mat')
ls()    # list all variables in the workspace

mydata$SI=mydata$TDI/mydata$BW

summary(mydata) # list all attibutes 
summary(mydata$a1) # list the basic interquartile range
hist(mydata$a1,breaks=30)
pairs(mydata)

# useful tools
coefficients(fit) # model coefficients
confint(fit, level=0.95) # CIs for model parameters 
fitted(fit) # predicted values
residuals(fit) # residuals or use fit$resid
anova(fit) # anova table 
vcov(fit) # covariance matrix for model parameters 
influence(fit) # regression diagnostics

# diagnostic plots 
layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page 
plot(fit)

# p1
model_p1_all <- lm(p1~M+CR+CF+basal+SI+BW+TDI,data=mydata)
summary(model_p1_all) # report of the fitting results
step(model_p1_all,direction="backward") # backward stepwise selection
model_p1 <- lm(p1~CF+basal,data=mydata)
summary(model_p1)

coefficients(model_p1)
confint(model_p1,level=0.95)
fitted(model_p1) 
residuals(model_p1) # y-yfitted
plot(mydata$CF,residuals(model_p1))
plot(mydata$basal,residuals(model_p1))
anova(model_p1)  
vcov(model_p1)  
influence(model_p1)  
layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page 
plot(model_p1)

# p2
model_p2_all <- lm(p2~M+CR+CF+basal+SI+BW+TDI,data=mydata)
summary(model_p2_all)
step(model_p2_all,direction="backward")
model_p2 <- lm(p2~SI,data=mydata)
summary(model_p2)


# p6
model_p6_all <- lm(p6~M+CR+CF+basal+SI+BW+TDI,data=mydata)
summary(model_p6_all)
step(model_p6_all,direction="backward")
model_p6 <- lm(p6~M+CR+basal,data=mydata)
summary(model_p6)

# kd
model_kd_all <- lm(kd~M+CR+CF+basal+SI+BW+TDI,data=mydata)
summary(model_kd_all)
step(model_kd_all,direction="backward")
model_kd <- lm(kd~CF,data=mydata)
summary(model_kd)

# a1
model_a1_all <- lm(a1~M+CR+CF+basal+SI,data=mydata)
summary(model_a1_all)
step(model_a1_all,direction="backward")
model_a1 <- lm(a1~CF,data=mydata)
summary(model_a1)
model_a1$resid
