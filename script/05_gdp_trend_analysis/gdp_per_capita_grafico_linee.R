library(ggplot2)
library(tidyr)
library(dplyr)

gdp_data <- read.csv("dataset/GDP_per_capita.csv")

# Filtrare per le città di Cork e Carmen
gdp_filtered <- gdp_data %>% 
  filter(city %in% c("Carmen", "Cork"))

# Trasformare i dati da wide a long format
gdp_long <- gdp_filtered %>%
  gather(key = "year", value = "gdp", `X2009`:`X2019`) %>%
  mutate(year = as.numeric(sub("X", "", year)))

# Creare il grafico a linee
ggplot(gdp_long, aes(x = year, y = gdp, group = city, color = city)) +
  geom_line(size = 1.2) +
  scale_x_continuous(breaks = 2009:2019) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5)) +
  labs(title = "Andamento del PIL pro capite per Cork e Carmen (2009-2019)",
       x = "Anno",
       y = "PIL")
