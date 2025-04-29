legame_singolo <- function(data, dis){
  countries <- data$country
  print(countries)
  hls <- hclust(dis, method = "single")
  plot(hls, labels = countries, hang = -1, xlab= "Metodo gerarchico agglomerativo", sub="del lagame singolo")
  rect.hclust(hls, k=2, border="red")
  rect.hclust(hls, k=3, border="yellow")
  rect.hclust(hls, k=4, border="orange")
  rect.hclust(hls, k=5, border="blue")
  rect.hclust(hls, k=6, border="green")
  rect.hclust(hls, k=7, border="violet")
  rect.hclust(hls, k=8, border="cyan")
  rect.hclust(hls, k=9, border="brown")
  rect.hclust(hls, k=10, border="purple")
}

legame_completo <- function(data, dis){
  countries <- data$country
  print(countries)
  hls <- hclust(dis, method = "complete")
  plot(hls, labels = countries, hang = -1, xlab= "Metodo gerarchico agglomerativo", sub="del lagame singolo")
  rect.hclust(hls, k=2, border="red")
  rect.hclust(hls, k=3, border="yellow")
  rect.hclust(hls, k=4, border="orange")
  rect.hclust(hls, k=5, border="blue")
  rect.hclust(hls, k=6, border="green")
  rect.hclust(hls, k=7, border="violet")
  rect.hclust(hls, k=8, border="cyan")
  rect.hclust(hls, k=9, border="brown")
  rect.hclust(hls, k=10, border="purple")
}

legame_completo <- function(data, dis){
  countries <- data$country
  print(countries)
  hls <- hclust(dis, method = "complete")
  plot(hls, labels = countries, hang = -1, xlab= "Metodo gerarchico agglomerativo", sub="del lagame completo")
  rect.hclust(hls, k=2, border="red")
  rect.hclust(hls, k=3, border="yellow")
  rect.hclust(hls, k=4, border="orange")
  rect.hclust(hls, k=5, border="blue")
  rect.hclust(hls, k=6, border="green")
  rect.hclust(hls, k=7, border="violet")
  rect.hclust(hls, k=8, border="cyan")
  rect.hclust(hls, k=9, border="brown")
  rect.hclust(hls, k=10, border="purple")
}

legame_medio <- function(data, dis){
  countries <- data$country
  print(countries)
  hls <- hclust(dis, method = "average")
  plot(hls, labels = countries, hang = -1, xlab= "Metodo gerarchico agglomerativo", sub="del lagame medio")
  rect.hclust(hls, k=2, border="red")
  rect.hclust(hls, k=3, border="yellow")
  rect.hclust(hls, k=4, border="orange")
  rect.hclust(hls, k=5, border="blue")
  rect.hclust(hls, k=6, border="green")
  rect.hclust(hls, k=7, border="violet")
  rect.hclust(hls, k=8, border="cyan")
  rect.hclust(hls, k=9, border="brown")
  rect.hclust(hls, k=10, border="purple")
}

centroide <- function(data, dis){
  countries <- data$country
  print(countries)
  hls <- hclust(dis^2, method = "centroid")
  plot(hls, labels = countries, hang = -1, xlab= "Metodo gerarchico agglomerativo", sub="del centroide")
  rect.hclust(hls, k=2, border="red")
  rect.hclust(hls, k=3, border="yellow")
  rect.hclust(hls, k=4, border="orange")
  rect.hclust(hls, k=5, border="blue")
  rect.hclust(hls, k=6, border="green")
  rect.hclust(hls, k=7, border="violet")
  rect.hclust(hls, k=8, border="cyan")
  rect.hclust(hls, k=9, border="brown")
  rect.hclust(hls, k=10, border="purple")
}

mediana <- function(data, dis){
  countries <- data$country
  print(countries)
  hls <- hclust(dis^2, method = "median")
  plot(hls, labels = countries, hang = -1, xlab= "Metodo gerarchico agglomerativo", sub="della mediana")
  rect.hclust(hls, k=2, border="red")
  rect.hclust(hls, k=3, border="yellow")
  rect.hclust(hls, k=4, border="orange")
  rect.hclust(hls, k=5, border="blue")
  rect.hclust(hls, k=6, border="green")
  rect.hclust(hls, k=7, border="violet")
  rect.hclust(hls, k=8, border="cyan")
  rect.hclust(hls, k=9, border="brown")
  rect.hclust(hls, k=10, border="purple")
}

ward <- function(data, dis){
  countries <- data$country
  hls <- hclust(dis, method = "ward.D2")
  plot(hls, labels = countries, hang = -1, xlab= "Metodo gerarchico agglomerativo", sub="di Ward")
  rect.hclust(hls, k=2, border="red")
  rect.hclust(hls, k=3, border="yellow")
  rect.hclust(hls, k=4, border="orange")
  rect.hclust(hls, k=5, border="blue")
  rect.hclust(hls, k=6, border="green")
  rect.hclust(hls, k=7, border="violet")
  rect.hclust(hls, k=8, border="cyan")
  rect.hclust(hls, k=9, border="brown")
  rect.hclust(hls, k=10, border="purple")
}

scree_plot <- function(dis){
  hlc <- hclust(dis, method = "average")
  plot(c(0, hlc$height ),seq (34,1) ,type="b",
       main=" Screeplot ",xlab=" Distanza di aggregazione",
       ylab="Numero di cluster ", col ="red ")
}

verifica_omog <- function(data, k){
  dis <- dist(data[,-1], method = "euclidean", diag=FALSE, upper= FALSE)
  hlc <- hclust(dis, method = "average")
  taglio <-cutree (hlc , k=k, h = NULL)
  print(taglio)
  num <-table ( taglio )
  tagliolist <-list( taglio )
  agvar <- aggregate (data[,-1], tagliolist , var)[, -1]
  total_withinss <- numeric(k)
  for (i in 1:k) {
      total_withinss[i] <- (num[[i]] - 1) * sum(agvar[i, ])
  }
  total_sum <- sum(total_withinss, na.rm = TRUE)
  total_sum
}