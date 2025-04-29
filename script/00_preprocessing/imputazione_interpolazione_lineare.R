# Installa i pacchetti se non sono già installati
if (!require("tidyverse")) install.packages("tidyverse")
if (!require("zoo")) install.packages("zoo")

# Carica le librerie
library(tidyverse)
library(zoo)
library(dplyr)


dataset <- read.csv("dataset/Clean_dataset_with_NA.csv")

# Elimina le righe con più di 5 valori NA
dati <- dataset %>% filter(rowSums(is.na(.)) <= 5)

# Trasforma i dati in formato long
dati_long <- dati %>% gather(key = "year", value = "value", X2009:X2019) %>% mutate(year = as.numeric(sub("X", "", year))) # Converte l'anno in formato numerico

# Applica l'interpolazione lineare
dati_interpolati <- dati_long %>% group_by(country, city, variable) %>% mutate(value = na.approx(value, na.rm = FALSE))

#Riporta i dati al formato wide
data <- dati_interpolati %>% spread(key = "year", value = "value")

# Identificazione delle righe con NA solo nella colonna 2009 e nessun NA dal 2010 al 2019
rows_with_na_2009 <- which(is.na(data$`2009`) & rowSums(is.na(data[, 5:14])) == 0)

# Calcolo della media dal 2010 al 2019 per queste righe
mean_values <- rowMeans(data[rows_with_na_2009, 5:14], na.rm = TRUE)

# Aggiornamento del dataset originale sostituendo i valori NA in 2009 con la media calcolata
data$`2009`[rows_with_na_2009] <- mean_values

# Identificazione delle righe con NA solo nella colonna 2019 e nessun NA dal 2009 al 2018
rows_with_na_2019 <- which(is.na(data$`2019`) & rowSums(is.na(data[, 4:13])) == 0)

# Calcolo della media dal 2009 al 2018 per queste righe
mean_values <- rowMeans(data[rows_with_na_2019, 4:13], na.rm = TRUE)

# Aggiornamento del dataset originale sostituendo i valori NA in 2019 con la media calcolata
data$`2019`[rows_with_na_2019] <- mean_values

# Salvataggio del dataset aggiornato
write.csv(data, "dataset/Clean_dataset_interpolated.csv", row.names = FALSE)

