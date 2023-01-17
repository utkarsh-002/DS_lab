library(dplyr)
str(data12)
data12$ILL<- ifelse(data12$ILL=="Yes",1,0)
data12$Sex<-ifelse(data12$Sex=="Male",1,2)
str(data12)
data12$ILL<-as.factor(data12$ILL)
str(data12)
model= glm(data12$ILL~data12$Age+data12$Sex+data12$Temp,data=data12,family = "binomial")

c1<- c(171,172,165,181,185,163,145)
c2<-c(65,69,60,75,78,70,56)
df<- data.frame(c1,c2)
df
 