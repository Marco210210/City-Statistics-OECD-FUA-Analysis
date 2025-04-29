# Carica la libreria necessaria per la manipolazione dei dati
library(dplyr)
library(ggplot2)

# Leggi i dati dal file CSV originale
dataset_2009 <- read.csv("dataset/Clean_dataset.csv")

# Filtra il dataset per l'anno 2009 e per la variabile "Esposizione media della popolazione all'inquinamento dell'aria da PM2.5"
# Quindi raggruppa per paese e calcola la media
sample_2009 <- dataset_2009 %>%
  filter(variable == "Mean population exposure to PM2.5 air pollution") %>%
  select(country, X2009) %>%
  group_by(country) %>%
  summarise(media_pm25_2009 = mean(X2009, na.rm = TRUE)) %>%
  ungroup()

# Scrivi il campione in un file CSV
write.csv(sample_2009, "dataset/temporanei/sample_2009_pm25.csv", row.names = FALSE)

# Calcola la dimensione del campione per il 2009
n_2009 <- nrow(sample_2009)

# Visualizza il campione
print(head(sample_2009))
print(paste("Dimensione del campione per il 2009:", n_2009))
