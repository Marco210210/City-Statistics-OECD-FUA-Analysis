library(ggplot2)
library(readr)

data <- read_csv("dataset/Pollution.csv")

# Filtraggio dei dati per le città specificate
selected_cities <- data[data$city %in% c("Siirt", "Rybnik", "Osorno"), ]

# Riformattazione dei dati per ggplot
data_long <- reshape2::melt(selected_cities, id.vars = c("country", "city", "variable", "lon", "lat"), 
                            variable.name = "Year", value.name = "PM2.5")

# Creazione del grafico a linee
ggplot(data_long, aes(x = Year, y = PM2.5, group = city, color = city)) +
  geom_line(size = 1.2) + 
  labs(title = "Mean Population Exposure to PM2.5 (2009-2019)", 
       x = "Year", y = "PM2.5 Exposure", color = "City") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))
