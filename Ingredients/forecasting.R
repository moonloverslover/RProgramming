library(quantmod)
from.dat <- as.Date("01/01/08",format="%m%d%y")
to.dat <- as.Date("12/31/13",format="%m%d%y")
getSymbols("GOOG",src="google",from=from.dat,to=to.dat)

