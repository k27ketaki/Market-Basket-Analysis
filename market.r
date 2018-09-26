library(arules)
library(arulesViz)
library(RColorBrewer)

data(Groceries)
groceries = Groceries

itemFrequencyPlot(groceries, topN=10, type="absolute", ylab="Frequency",xlab="Items",
                  col=brewer.pal(10,'Spectral'),main="Top 10 Item Frequency Plot")

#1: Minimum support 0.001,minimum confidence 0.7
association_rules = apriori(groceries, parameter=list(support=0.001, confidence=0.8,
                                                      target="rules"))
summary(association_rules)
association_rules = sort(association_rules, by="support", decreasing=TRUE)
# Displaying the first 10 rules
inspect(association_rules[1:10])

plot(association_rules)
plot(association_rules[1:5], method="graph", engine="htmlwidget",shading = "confidence")

#2: Rules of length 3(On LHS)
association_rules = apriori(groceries, parameter=list(support=0.001, confidence=0.7,
                              target="rules", minlen=3, maxlen=3))
summary(association_rules)
association_rules = sort(association_rules, by="support", decreasing=TRUE)
# Displaying the first 10 rules
inspect(association_rules[1:10])

plot(association_rules)
plot(association_rules[1:5], method="graph", engine="htmlwidget",shading = "confidence")

