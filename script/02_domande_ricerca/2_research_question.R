# Caricare le librerie necessarie
library(tidyverse)

covcor <- function(year){
  gdp_data <- read.csv('dataset/GDP_per_capita.csv')
  lf_data <- read.csv('dataset/Labour_force.csv')
  er_data <- read.csv('dataset/Unemployment_rate.csv')
  pd_data <- read.csv('dataset/Total_population.csv')
  
  dataset_unito <- merge(select(gdp_data, city, paste("X",year, sep="")),
                         select(lf_data, city, paste("X",year, sep="")),
                         by = 'city')#inner join
  dataset_unito <- merge(dataset_unito,
                         select(er_data, city, paste("X",year, sep="")),
                         by = 'city')#inner join
  dataset_unito <- merge(dataset_unito,
                         select(pd_data, city, paste("X",year, sep="")),
                         by = 'city')#inner join

  colnames(dataset_unito)[2:5] <- c('gdp', 'lf', 'er', 'pd')
  print(paste(round(cov(dataset_unito[,-1]), 2), round(cor(dataset_unito[,-1]),2), sep=" / "))
  dataset_unito 
}

regressione_multipla <- function(year){
  gdp_data <- read.csv('dataset/GDP_per_capita.csv')
  lf_data <- read.csv('dataset/Labour_force.csv')
  er_data <- read.csv('dataset/Unemployment_rate.csv')
  pd_data <- read.csv('dataset/Total_population.csv')
  
  dataset_unito <- merge(select(gdp_data, city, paste("X",year, sep="")),
                         select(lf_data, city, paste("X",year, sep="")),
                         by = 'city')#inner join
  dataset_unito <- merge(dataset_unito,
                         select(er_data, city, paste("X",year, sep="")),
                         by = 'city')#inner join
  dataset_unito <- merge(dataset_unito,
                         select(pd_data, city, paste("X",year, sep="")),
                         by = 'city')#inner join
  
  colnames(dataset_unito)[2:5] <- c('gdp', 'lf', 'er', 'pd')
  
  model <- lm(dataset_unito$gdp ~ dataset_unito$pd + dataset_unito$er + dataset_unito$lf)
  model
}

plot_residui_stand <- function(year){
  gdp_data <- read.csv('dataset/GDP_per_capita.csv')
  lf_data <- read.csv('dataset/Labour_force.csv')
  er_data <- read.csv('dataset/Unemployment_rate.csv')
  pd_data <- read.csv('dataset/Total_population.csv')
  
  dataset_unito <- merge(select(gdp_data, city, paste("X",year, sep="")),
                         select(lf_data, city, paste("X",year, sep="")),
                         by = 'city')#inner join
  dataset_unito <- merge(dataset_unito,
                         select(er_data, city, paste("X",year, sep="")),
                         by = 'city')#inner join
  dataset_unito <- merge(dataset_unito,
                         select(pd_data, city, paste("X",year, sep="")),
                         by = 'city')#inner join
  
  colnames(dataset_unito)[2:5] <- c('gdp', 'lf', 'er', 'pd')
  
  model <- lm(dataset_unito$gdp ~ dataset_unito$pd + dataset_unito$er + dataset_unito$lf)
  stime <-fitted (model)
  residui <-resid (model)
  residuistandard <- residui /sd( residui )
  plot(stime , residuistandard , main=" Residui standard rispetto ai valori stimati ",
         xlab=" Valori stimati ",ylab=" Residui standard ", col ="red ")
  abline (h=0, col =" blue",lty =2)
}

coeff_determinazione <- function(year){
  gdp_data <- read.csv('dataset/GDP_per_capita.csv')
  lf_data <- read.csv('dataset/Labour_force.csv')
  er_data <- read.csv('dataset/Unemployment_rate.csv')
  pd_data <- read.csv('dataset/Total_population.csv')
  
  dataset_unito <- merge(select(gdp_data, city, paste("X",year, sep="")),
                         select(lf_data, city, paste("X",year, sep="")),
                         by = 'city')#inner join
  dataset_unito <- merge(dataset_unito,
                         select(er_data, city, paste("X",year, sep="")),
                         by = 'city')#inner join
  dataset_unito <- merge(dataset_unito,
                         select(pd_data, city, paste("X",year, sep="")),
                         by = 'city')#inner join
  
  colnames(dataset_unito)[2:5] <- c('gdp', 'lf', 'er', 'pd')
  model <- lm(dataset_unito$gdp ~ dataset_unito$pd + dataset_unito$er + dataset_unito$lf)
  print(summary(model)$r.square)
}

