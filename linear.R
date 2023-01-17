install.packages("MLmetrics")
library(dplyr)
library(stats)
library(MLmetrics)
data <-iris
#inspect base data
View(data)
str(data)

#select numeric data
df<- select(data,c(1:4)) #select(data,c(1,2,3,4))

#inspect data
View(df)

#variable selection
var =cor(df)
var

# splitting data
index = sample(2,nrow(df),replace = TRUE,prob = c(.7,.3))
table(index)

train <- df[index==1,]
test<-df[index==2,]

#Building regression model
rm = lm(Petal.Length~Petal.Width+Sepal.Width,df)

#Evaluating model Efficiency
summary(rm)

#Evaluating model Accuracy
PLen_pred = predict(rm,test)
test$PLen_pred=PLen_pred
View(test)

#mean absolute percentage error(MAPE)
error = MAPE(test$PLen_pred,test$Petal.Length)
error

#Accuracy
acc=1-error
print(paste("Accuracy =",acc))





x <- c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131)
y <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)

# Apply the lm() function.
relation <- lm(y~x)

print(summary(relation))

a<- data.frame(x=170)
pred = predict(relation,a)
print(pred)

plot(y,x,col="blue",main="height & weight",abline(relation),cex=1.3,pch=16,xlab = "weight in kg",ylab="height in cm")
