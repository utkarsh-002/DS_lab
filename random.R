library("dplyr")
library("randomForest")
library("ggplot2")
library("caTools")

data<-iris
str(data)
#index = sample(2,nrow(data),replace=TRUE,prob=c(0.7,0.3))
#train=data[index==1,]
#test=data[index==2,]
split<- sample.split(data,SplitRatio=0.7)
split

train <-subset(data,split==TRUE)
test <-subset(data,split==FALSE)

set.seed(200)

#rf_model = randomForest(Species~.,data=train)
rf_model = randomForest(train[-5],train$Species,ntree=500)

rf_model

pred = predict(rf_model,newdata = test[-5])
#test$pred=pred
#View(test)

conf_mtx = table(test[,5],pred)
#conf_mtx= table(test$Species,test$pred)
conf_mtx

pred_acc = sum(diag(conf_mtx))/sum(conf_mtx)
pred_acc

plot(conf_mtx)

importance(rf_model)

varImpPlot(rf_model)