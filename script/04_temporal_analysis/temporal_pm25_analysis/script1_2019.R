# Carica la libreria necessaria per la manipolazione dei dati
library(dplyr)
library(ggplot2)

# Leggi i dati dal file CSV originale
dataset_2019 <- read.csv("dataset/Clean_dataset.csv")

# Filtra il dataset per l'anno 2019 e per la variabile "Esposizione media della popolazione all'inquinamento dell'aria da PM2.5"
# Quindi raggruppa per paese e calcola la media
sample_2019 <- dataset_2019 %>%
  filter(variable == "Mean population exposure to PM2.5 air pollution") %>%
  select(country, X2019) %>%
  group_by(country) %>%
  summarise(media_pm25_2019 = mean(X2019, na.rm = TRUE)) %>%
  ungroup()  # Rimuovi il raggruppamento per poter scrivere un file CSV

# Scrivi il campione in un file CSV
write.csv(sample_2019, "dataset/temporenai/sample_2019_pm25.csv", row.names = FALSE)

# Calcola la dimensione del campione per il 2019
n_2019 <- nrow(sample_2019)

# Visualizza il campione
print(head(sample_2019))
print(paste("Dimensione del campione per il 2019:", n_2019))
