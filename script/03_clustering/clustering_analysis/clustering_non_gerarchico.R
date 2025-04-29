# install.packages("ggplot2")
# install.packages("cluster")

library(ggplot2)
library(cluster)

# Preparazione del dataset (rimuovere eventuali colonne non numeriche)
# data <- data[, sapply(data, is.numeric)]

# Calcolare la somma dei quadrati interni (within-cluster sum of squares) per diversi k
wss <- sapply(1:10, function(k){
  kmeans(cluster[,-1], center = k, iter.max = 10, nstart= 1)$tot.withinss
})

# Creare un plot per l'Elbow Method
plot(1:10, wss, type = "b", 
     xlab = "Numero di Cluster", 
     ylab = "Somma Totale dei Quadrati Interni", 
     main = "Metodo del Gomito per K-Means Clustering")
