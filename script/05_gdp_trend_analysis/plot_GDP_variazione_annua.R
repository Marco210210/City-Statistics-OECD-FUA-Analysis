library(ggplot2)
library(dplyr)
library(tidyr)
library(ggrepel)
library(scales)

# Caricamento del dataset
dataset <- read.csv("dataset/Clean_dataset.csv")

# Filtrare il dataset per la variabile GDP
gdp_data <- dataset %>% 
  filter(variable == "GDP (Million USD, constant prices, constant PPP, base year 2015)")

# Riformattare il dataset per analisi di serie temporali utilizzando pivot_longer
# Considerando il formato delle colonne degli anni come X2009, X2010, ecc.
gdp_data_long <- pivot_longer(gdp_data, 
                              cols = X2009:X2019, 
                              names_to = "year", 
                              values_to = "gdp_value")

# Rimuovere il prefisso "X" dagli anni e convertire in formato numerico
gdp_data_long$year <- as.numeric(sub("X", "", gdp_data_long$year))

# Aggregare i valori del PIL per paese per ogni anno
gdp_country_year <- gdp_data_long %>% 
  group_by(country, year) %>% 
  summarize(total_gdp = sum(gdp_value, na.rm = TRUE))

# Preparare i dati per l'etichetta
label_data <- gdp_country_year %>% 
  arrange(country, year) %>% 
  group_by(country) %>% 
  slice(1)

# Grafico dell'evoluzione del PIL per paese
ggplot(gdp_country_year, aes(x = year, y = total_gdp, group = country)) +
  geom_line(aes(color = country), size = 1.2) +
  geom_text_repel(data = label_data,
                  aes(label = country, color = country),
                  nudge_x = -0.5,
                  size = 3.5,
                  segment.color = NA) +
  scale_y_continuous(labels = scales::comma) +
  labs(title = "Evoluzione del PIL per Paese",
       x = "Anno",
       y = "GDP Totale") +
  theme_minimal() +
  theme(legend.position = "none",
        plot.title = element_text(hjust = 0.5))