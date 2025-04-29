library(ggplot2)
library(tidyr)
library(dplyr)

gdp_data <- read.csv("dataset/GDP.csv")

# Filtrare per le città di Cork e Carmen
gdp_filtered <- gdp_data %>% 
  filter(city %in% c("Athina"))

# Trasformare i dati da wide a long format
gdp_long <- gdp_filtered %>%
  gather(key = "year", value = "gdp", `X2009`:`X2019`) %>%
  mutate(year = as.numeric(sub("X", "", year)))

# Creare il grafico a linee
ggplot(gdp_long, aes(x = year, y = gdp, group = city, color = city)) +
  geom_line(linewidth = 1.2) +
  scale_x_continuous(breaks = 2009:2019) +
  scale_y_continuous(labels = scales::comma_format(scale = 1, accuracy = 1)) +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5)) +
  labs(title = "Andamento del PIL per Atene (2009-2019)",
       x = "Anno",
       y = "PIL")
