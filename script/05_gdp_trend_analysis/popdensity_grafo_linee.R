# Caricare le librerie necessarie
library(ggplot2)
library(tidyr)
library(dplyr)

# Caricare i dati
gdp_data <- read.csv("dataset/Population_density.csv")

# Filtrare per il paese Turchia
gdp_turk <- gdp_data %>% 
  filter(country == "Türkiye")

# Trasformare i dati da wide a long format
gdp_long_turk <- gdp_turk %>%
  gather(key = "year", value = "density", `X2009`:`X2019`) %>%
  mutate(year = as.numeric(sub("X", "", year)))

# Creare il grafico a linee per le città del paese Turchia
ggplot(gdp_long_turk, aes(x = year, y = density, group = city, color = city)) +
  geom_line(size = 1.2) + 
  scale_x_continuous(breaks = 2009:2019) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5)) + 
  labs(title = "Andamento del densità di popolazione nelle città della Turchia (2009-2019)",
       x = "Anno",
       y = "Densità di popolazione")
