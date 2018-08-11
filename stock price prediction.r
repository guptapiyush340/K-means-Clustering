setwd("C:/Users/piyush.gupta/Desktop/Machine Learning/Analytics vidhya/Clustering")
library('randomForest')
library('Metrics')

set.seed(101)

data <- read.csv("stock_data.csv",stringsAsFactors =T)
dim(data)
data$Y <- as.factor(data$Y)

train <- data[1:2000,]
test <- data[2001:3000,]
model_rf <- randomForest(Y~.,data=train)
preds <- predict(object = model_rf,test[,-101])
table(preds)
auc(preds,test$Y)

Cluster <- kmeans(data[,-101],5)
data$cluster <- as.factor(Cluster$cluster)
train <- data[1:2000,]
test <- data[2001:3000,]
model_rf <- randomForest(Y~.,data=train)
pred2 <- predict(object = model_rf,test[,-101])
table(pred2)
auc(pred2,test$Y)
