library(tidyverse)

labour_force_data <- read.csv("dataset/Labour_force.csv")

# Riformatta i dati da un formato ampio a un formato lungo
labour_force_long <- labour_force_data %>% 
  pivot_longer(cols = starts_with("X20"), names_to = "Year", values_to = "Labour_Force") %>%
  mutate(Year = str_replace(Year, "X", ""))

# Filtra i dati per le città in Giappone
labour_force_long_Japan <- labour_force_long %>%
  filter(country == "Japan")

# Crea il grafico a barre impilate con colori manuali per Tokyo e colori automatici per le altre città
ggplot(labour_force_long_Japan, aes(x = Year, y = Labour_Force, fill = city)) +
  geom_bar(stat = "identity") +
  scale_fill_manual(values = c("Tokyo" = "green", "Other Cities" = "gray")) +
  theme_minimal() +
  labs(title = "Forza lavoro in Giappone",
       x = "Year",
       y = "Labour Force",
       subtitle = "Tokyo") +
  
  scale_y_continuous(labels = scales::comma) +
  theme(plot.title = element_text(hjust = 0.5),
        plot.subtitle = element_text(hjust = 0.5))