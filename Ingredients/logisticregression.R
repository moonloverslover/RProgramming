# A retrospective sample of males in a heart-disease high-risk region
# of the Western Cape, South Africa. There are roughly two controls per
# case of CHD. Many of the CHD positive men have undergone blood
# pressure reduction treatment and other programs to reduce their risk
# factors after their CHD event. In some cases the measurements were
# made after these treatments. These data are taken from a larger
# dataset, described in  Rousseauw et al, 1983, South African Medical
# Journal. 


library(ElemStatLearn)
str(SAheart)

fit <- glm(chd ~ sbp + tobacco + ldl + adiposity + famhist + typea + obesity + alcohol + age, data=SAheart,family=binomial()) # binomial family for binary response (0,1); possion family for counts (0,1,2...)
summary(fit)
confint(fit)
coef(fit)
plot(fit)
predict(fit) # Beta*X
predict(fit, type="response") # p = exp(Beta*X)/(1+exp(Beta*X)) which is the PROBABILITY of Y = 1; same as fitted(fit)
residuals(fit, type="deviance")

