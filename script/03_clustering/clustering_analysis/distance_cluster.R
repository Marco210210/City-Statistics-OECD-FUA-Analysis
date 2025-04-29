library(readr)
library(dplyr)

dis <- function(data){
  data_numeric <- select(data, -country)
  # Calcolare la distanza euclidea
  distances <- dist(data_numeric, method = "euclidean")
  distances
}

distanza_euc <- function(data){
# Rimuovere la colonna 'country'
  data_numeric <- select(data, -country)
  countries <- data$country
  # Calcolare la distanza euclidea
  distances <- dist(data_numeric, method = "euclidean", diag=FALSE, upper= FALSE)
  
  # Convertire in una matrice 
  distance_matrix <- as.matrix(distances)
  rownames(distance_matrix) <- countries
  colnames(distance_matrix) <- countries
  # Visualizzare la matrice delle distanze

  write.table(distance_matrix, "misurazioni/matrix_distance.txt")
  distance_matrix
}

non_omog_interna <- function(data){
  n <- nrow(data)
  tr <- 0
  if (n>1){
    data_numeric <- select(data, -country)
    countries <- data$country
    # Calcolare la distanza euclidea
    d <- dist(data_numeric, method = "euclidean", diag=FALSE, upper= FALSE)
    tr <-sum (d^2) /n
  }
  tr
  
}