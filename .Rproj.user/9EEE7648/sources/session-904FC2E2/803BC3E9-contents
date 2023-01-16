library(caTools)
library(ROCR)
library(dplyr)

data<-mtcars
View(data)

str(data)

data$vs<- as.factor(data$vs)
str(data)

split<- sample.split(data,SplitRatio = 0.7)

train = subset(data,split==TRUE)
test <- subset(data,split==FALSE)


model =glm(vs~ wt+ disp,data=train,family="binomial")
summary(model)

pred <- predict(model,test)
pred

pred<- ifelse(pred>0.5,1,0)
pred

#confusion matrix
cm=table(test$vs,pred)
print(cm)

#Accuracy
err=mean(pred!=test$vs)
print(paste("Accuracy = ",1-err))

#ROC_AUC
prob = prediction(pred,test$vs)
per=performance(prob,measure = 'tpr',x.measure = 'fpr')
auc<-performance(prob,measure = 'auc')
auc<-auc@y.values[[1]]
auc

#plotting curve
plot(per)
plot(per,colorize=TRUE,print.cutoffs.at=seq(.1,by=.1),main="ROC curve")
abline(a=0,b=1)
legend(.6,.4,auc,title="AUC",cex=1)
