library(viridis)
library(ggplot2)
library(dplyr)

population_data <- read.csv("dataset/Total_population.csv")

aggregated_data <- population_data %>%
  group_by(country) %>%
  summarise(Total_Population_2009 = sum(`X2009`, na.rm = TRUE)) %>%
  mutate(country = factor(country, levels = rev(unique(country))))

ggplot(aggregated_data, aes(x = Total_Population_2009, y = country, fill = country)) +
  geom_bar(stat = "identity", show.legend = FALSE) +
  labs(title = "Popolazione Totale per Paese nel 2009",
       x = "Popolazione Totale",
       y = "Paese") +
  scale_fill_viridis(discrete = TRUE) +
  theme_minimal() +
  scale_x_continuous(labels = scales::comma) +
  theme(plot.title = element_text(hjust = 0.5))
