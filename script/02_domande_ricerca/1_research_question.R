# Caricare le librerie necessarie
library(tidyverse)

regressione_lineare <- function(year){
  gdp_data <- read.csv('dataset/GDP_per_capita.csv')
  pd_data <- read.csv('dataset/Pollution.csv')
  
  dataset_unito <- merge(select(gdp_data, city, paste("X",year, sep="")),
                         select(pd_data, city, paste("X",year, sep="")),
                         by = 'city')#inner join
  
  colnames(dataset_unito)[c(2, 3)] <- c('gdp', 'pd')
  
  model <- lm(dataset_unito$gdp ~ dataset_unito$pd)
  result <- summary(model)
  
  options(scipen = 999)
  plot(dataset_unito$pd, dataset_unito$gdp ,main =" Retta di regressione ", 
       xlab="Mean exposure to PM2.5", ylab="GDP per capita", col ="red ")
  abline(model, col =" blue")
  
  # Visualizza i risultati
  print(paste("Covarianza:",cov(dataset_unito$pd,dataset_unito$gdp)))
  print(paste("Correlazione:",cor(dataset_unito$pd,dataset_unito$gdp)))
  beta <-(sd(dataset_unito$gdp)/sd(dataset_unito$pd))*cor (dataset_unito$pd,dataset_unito$gdp)
  alpha <-mean(dataset_unito$gdp)-beta* mean(dataset_unito$pd)
  print(paste("Alpha:",alpha))
  print(paste("Beta:",beta))

  result
}

plot_residui <- function(year){
  gdp_data <- read.csv('dataset/GDP_per_capita.csv')
  pd_data <- read.csv('dataset/Pollution.csv')
  
  dataset_unito <- merge(select(gdp_data, city, paste("X",year, sep="")),
                         select(pd_data, city, paste("X",year, sep="")),
                         by = 'city')#inner join
  
  colnames(dataset_unito)[c(2, 3)] <- c('gdp', 'pd')
  
  model <- lm(dataset_unito$gdp ~ dataset_unito$pd)
  result <- summary(model)
  
  options(scipen = 999)
  plot(dataset_unito$pd, dataset_unito$gdp ,main =" Retta di regressione ", 
       xlab="Mean exposure to PM2.5", ylab="GDP per capita", col ="red ")
  abline(model, col =" blue")
  stime <-fitted (model)
  segments (dataset_unito$pd,stime,dataset_unito$pd ,dataset_unito$gdp,
              col =" magenta ")
  
  result
}

plot_diagramma_residui <- function(year){
  gdp_data <- read.csv('dataset/GDP_per_capita.csv')
  pd_data <- read.csv('dataset/Pollution.csv')
  
  dataset_unito <- merge(select(gdp_data, city, paste("X",year, sep="")),
                         select(pd_data, city, paste("X",year, sep="")),
                         by = 'city')#inner join
  
  colnames(dataset_unito)[c(2, 3)] <- c('gdp', 'pd')
  
  model <- lm(dataset_unito$gdp ~ dataset_unito$pd)
  result <- summary(model)
  residui <-resid (model)
  
  options(scipen = 999)
  plot(dataset_unito$pd, residui ,main =" Retta di regressione ", 
       xlab="Mean exposure to PM2.5", ylab="Residui", col ="red ")
  abline (h=0, col =" blue",lty =2)
  
  result
}

