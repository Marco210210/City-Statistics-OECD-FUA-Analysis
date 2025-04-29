# Carica le librerie necessarie
library(dplyr)
library(tidyr)

# Leggi il dataset
dataset <- read.csv("dataset/Clean_dataset.csv")

# Filtra i dati per la variabile GDP
gdp_data <- dataset %>% 
  filter(variable == "GDP (Million USD, constant prices, constant PPP, base year 2015)")

# Trasforma i dati in un formato lungo
gdp_data_long <- pivot_longer(gdp_data, 
                              cols = starts_with("X"), 
                              names_to = "year", 
                              values_to = "gdp_value")

# Converti l'anno in formato numerico (rimuovendo 'X')
gdp_data_long$year <- as.numeric(sub("X", "", gdp_data_long$year))

# Calcola la variazione percentuale annuale del PIL per ogni città
gdp_annual_change <- gdp_data_long %>%
  group_by(country, city) %>%
  arrange(year) %>%
  mutate(pct_change = (gdp_value / lag(gdp_value) - 1) * 100)

# Calcola la variazione percentuale media annuale del PIL per ogni città
mean_annual_change <- gdp_annual_change %>%
  group_by(city) %>%
  summarize(mean_pct_change = mean(pct_change, na.rm = TRUE))

# Visualizza la tabella delle medie annuali
print(mean_annual_change)




