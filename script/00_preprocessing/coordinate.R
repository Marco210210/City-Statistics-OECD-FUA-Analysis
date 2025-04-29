library(tidyverse)
library(ggplot2)
library(readr)
library(maps)
library(viridis)
library(ggmap)
library(stringr)

#Ottieni le coordinate tramite chiamata a API Google
get_coordinate <- function(dataset){
  register_google(key = "")
  dataset <- dataset %>% mutate(city_full_name = str_c(dataset$city, dataset$country, sep = ', '))
  data.geo1 <- geocode(dataset$city_full_name)
  #city <- unique(dataset$city_full_name)
  data.geo1$city_full_name <- dataset$city_full_name
  merged_df <- cbind(dataset, data.geo1)
  save_dataset(merged_df, "temporanei/Clean_coord")
  merged_df
}


