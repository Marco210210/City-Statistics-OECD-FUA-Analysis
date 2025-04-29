library(ggplot2)
library(dplyr)
library(tidyr)

groupchart <- function(unemployment_data){
  filtered_data <- unemployment_data %>%
    filter(country %in% c("Spain", "Ireland", "Italy")) %>%
    select(-c(variable, lon, lat))
  
  # Trasformare i dati in formato long
  data_long <- gather(filtered_data, year, unemployment_rate, `2009`:`2019`)
  
  # Calcolare la media per ogni paese e anno
  average_data <- data_long %>%
    group_by(country, year) %>%
    summarize(unemployment_rate = mean(unemployment_rate, na.rm = TRUE))
  
  # Creare il grafico a barre
  ggplot(average_data, aes(x = year, y = unemployment_rate, fill = country)) + 
    geom_bar(stat = "identity", position = position_dodge()) +
    labs(title = "Media Annuale del Tasso di Disoccupazione: Irlanda, Italia e Spagna (2009-2019)",
         x = "Anno",
         y = "Tasso di Occupazione (%)") +
    theme_minimal()
  
}