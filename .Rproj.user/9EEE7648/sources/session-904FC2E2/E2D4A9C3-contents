install.packages("arules")
install.packages("arulesViz")
library(dplyr)
library(arules)
library(arulesViz)
df<- Market_Basket_Optimisation
#data<- read.transactions('Titanic.csv',sep = ',',rm.duplicates = TRUE)
setwd("C:/Users/Dell/Desktop/ds lab")
dataset = read.transactions('Market_Basket_Optimisation.csv', sep = ',', rm.duplicates = TRUE)
View(dataset)
str(dataset)

rules<- apriori(dataset,parameter = list(support=.004,confidence=0.2))
inspect(rules)

itemFrequencyPlot(dataset,topN=10)

inspect(sort(rules,by='lift')[1:10])
plot(rules,method="graph",measure="confidence",shading="lift")