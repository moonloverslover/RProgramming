library(lubridate)  # For year() function below
library(forecast)
dat = read.csv("/Users/Boyi/R/Ingredients/gaData.csv")
training = dat[year(dat$date) < 2012,]
testing = dat[(year(dat$date)) > 2011,]
tstrain = ts(training$visitsTumblr,frequency=6)
plot(decompose(tstrain))
bats(tstrain)
