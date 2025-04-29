library(dplyr)
library(tidyr)

mean_country <- function(year){
  
  data <- Clean_dataset
  
  # Filtra per l'anno 2009 e seleziona solo le colonne necessarie
  data_year <- data %>% 
    filter(variable %in% c("GDP per capita (USD, constant prices, constant PPP, base year 2015)", 
                           "Unemployment rate (unemployment 15-64 over labour force 15-64)", 
                           "Population density (inhabitants per km²)", 
                           "Mean population exposure to PM2.5 air pollution"))%>% 
    select(country, city, variable, as.character(year))
  
  data_year_wide <- data_year %>%
    pivot_wider(names_from = variable, values_from = as.character(year))
  
  country_means <- data_year_wide %>%
    group_by(country) %>%
    summarise(across(everything(), ~round(mean(., na.rm = TRUE), 2)))
  
  country_means$city <- NULL
  country_means <- na.omit(country_means)
  write.csv(country_means, "dataset/temporanei/Clustering.csv", row.names = FALSE)
  country_means
}
