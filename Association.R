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
class(dataset)
inspect(head(dataset,2))

rules<- apriori(dataset,parameter = list(support=.004,confidence=0.2))
inspect(rules)

choco_rule<-apriori(dataset,list(support=0.008,confidence=0.2),list(rhs="chocolate"))
inspect(choco_rule)

rules_increase<-apriori(dataset,parameter = list(support=0.02,confidence=0.2))
inspect(rules_increase)

itemFrequencyPlot(dataset,topN=10)

inspect(sort(rules,by='lift')[1:10])
plot(rules_increase,method="graph",measure="confidence",shading="lift")
