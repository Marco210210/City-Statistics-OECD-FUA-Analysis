library(ggplot2)
library(dplyr)

data <- read.csv("dataset/Clean_dataset.csv")

# Filtra i dati per la variabile 'Population, all ages, administrative data' e per l'anno 2009
population_data <- data %>%
  filter(variable == "Population, all ages, administrative data") %>%
  select(country, X2009) %>%
  group_by(country) %>%
  summarise(TotalPopulation = sum(X2009, na.rm = TRUE)) %>%
  arrange(desc(TotalPopulation))

# Separazione delle prime 11 nazioni e aggregazione delle restanti in "Altro"
top_nations <- head(population_data, 11)
other_nations <- tail(population_data, nrow(population_data) - 11)
other_nations_summary <- summarise(other_nations, country = "Altro", TotalPopulation = sum(TotalPopulation))

# Combina le prime 11 nazioni con la categoria "Altro"
final_data <- rbind(top_nations, other_nations_summary) %>%
  mutate(country = factor(country, levels = c(top_nations$country, "Altro")))

# Lista dei paesi in "Altro" per la legenda
other_countries_label <- paste("Altro:", paste(other_nations$country, collapse = ", "))

# Crea un grafico a torta con le prime 11 nazioni e la categoria "Altro"
ggplot(final_data, aes(x = "", y = TotalPopulation, fill = country)) +
  geom_bar(stat = "identity", width = 1, color = "black") +
  coord_polar(theta = "y") +
  theme_void() +
  theme(axis.line = element_blank(),
        plot.title = element_text(hjust = 0.5),
        legend.title = element_blank(),
        legend.position = "right") +
        scale_fill_manual(values = c(rainbow(11), "grey")) +
        theme(plot.margin = unit(c(1,1,1,1), "lines"),
        panel.border = element_blank(),
        panel.grid = element_blank(),
        axis.ticks = element_blank(),
        plot.background = element_rect(fill = "white", colour = "white")) +
        ggtitle("Distribuzione della popolazione per Nazione nel 2009")
