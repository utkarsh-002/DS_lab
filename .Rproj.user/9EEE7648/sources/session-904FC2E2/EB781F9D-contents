install.packages("dplyr")
library("dplyr")
library("ggplot2")
library("ggfortify")
library("stats")
View(iris)
data<- select(iris,c(1:4))

wssplot<- function(data,nc=15,seed=1234){
  wss<- (nrow(data)-1)*sum(apply(data,2,var))
  for(i in 2:nc){
    set.seed(seed)
    wss[i]<- sum(kmeans(data,centers = i)$withinss)
  }
  plot(1:nc,wss,type="b",xlabel="Number of clusters",ylabel="within group sum of sqaures")
  wss
}
wssplot(data)

KM <- kmeans(data,centers = 2)
autoplot(KM,data,frame=TRUE)
KM$centers

Km <- kmeans(data,centers = 3)
autoplot(Km,data,frame=TRUE)
Km$centers
