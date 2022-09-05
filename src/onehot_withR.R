##ONE HOT ENCODING WITH R
  
set.seed(555)
data <- data.frame(ID = seq(1,100,by=1),
                   Colour = sample(c("Red","Green","Blue"), 100, replace = TRUE),
                   Quality = sample(c("Poor","Average","Good"), 100, replace = TRUE)
)
#-* methode 1
library(mltools)
library(data.table)
newdata <- one_hot(as.data.table(data))
#-* methode 2
library(caret)
dummy <- dummyVars(" ~ .", data=data)
newdata <- data.frame(predict(dummy, newdata = data))
#-* methode 3
library(reshape2)
newdata <- dcast(data = melt(data, id.vars = "ID"), ID ~ variable + value, length)