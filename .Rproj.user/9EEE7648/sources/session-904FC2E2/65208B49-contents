library(dplyr)

data<-mtcars
str(data)
head(data) 

#finding dist. matrix
dist_mtx <- dist(data,method = 'euclidean')
dist_mtx

#fitting hierarchical clustering model
set.seed(240)
hm<- hclust(dist_mtx,method="average")
hm

#plotting dendogram
plot(hm)

#choosing no. of clusters

#cutting tree by height
abline(h=110,col="green")

#cutting tree by no. of clusters
fit<-cutree(hm,k=3)
fit

table(fit)
rect.hclust(hm,k=3,border="blue")
