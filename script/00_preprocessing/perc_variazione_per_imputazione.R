library(dplyr)
library(tidyr)

dataset <- read.csv("dataset/Clean_dataset_interpolated.csv")

# Definisci una funzione per il calcolo della variazione percentuale
calculate_percent_change <- function(data, variable_name) {
  # Filtra i dati per la variabile specifica
  data_filtered <- data %>% 
    filter(variable == variable_name)
  
  # Trasforma i dati in un formato lungo
  data_long <- pivot_longer(data_filtered, 
                            cols = starts_with("X"), 
                            names_to = "year", 
                            values_to = "value")
  
  # Converti l'anno in formato numerico (rimuovendo 'X')
  data_long$year <- as.numeric(sub("X", "", data_long$year))
  
  # Calcola la variazione percentuale annuale per ogni città
  annual_change <- data_long %>%
    group_by(country, city) %>%
    arrange(year) %>%
    mutate(pct_change = (value / lag(value) - 1) * 100)
  
  # Calcola la percentuale media per ogni città
  city_avg <- annual_change %>%
    group_by(city) %>%
    summarize(avg_change = mean(pct_change, na.rm = TRUE))
  
  # Aggiungi la colonna "variable" per identificare la variabile di origine
  city_avg$variable <- variable_name
  
  return(city_avg)
}

# Lista delle variabili nel tuo dataset
variable_list <- unique(dataset$variable)

# Inizializza un dataframe vuoto per risultati combinati
combined_results <- data.frame()

# Loop attraverso le variabili e calcola la percentuale media per ciascuna solo se ci sono NA
for (variable_name in variable_list) {
  variable_data <- dataset %>%
    filter(variable == variable_name) %>%
    filter(rowSums(is.na(.)) > 0)
  
  if (nrow(variable_data) > 0) {
    variable_results <- calculate_percent_change(variable_data, variable_name)
    combined_results <- bind_rows(combined_results, variable_results)
  }
}

# Scrivi la tabella delle percentuali medie in un nuovo file CSV
write.csv(combined_results, "percentuale_media_per_citta_variabili_con_NA.csv", row.names = FALSE)
