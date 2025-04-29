# Caricare i pacchetti necessari
library(ggplot2)
library(dplyr)

# Selezionare solo le colonne numeriche per il boxplot
numeric_data <- data %>% select_if(is.numeric)

# Creare il boxplot
ggplot(gather(numeric_data), aes(x=key, y=value)) + 
  geom_boxplot() +
  labs(title = "Boxplot per ogni variabile numerica", x = "Variabili", y = "Valori") +
  theme_bw()
