library(tidyverse)

pm_data <- read.csv("dataset/Pollution.csv")

# Filtra solo le città con i paesi desiderati
selected_countries <- c("Australia")
pm_filtered <- pm_data %>%
  filter(country %in% selected_countries) %>%
  pivot_longer(cols = starts_with("X20"), names_to = "Year", values_to = "PM2.5") %>%
  mutate(Year = gsub("X", "", Year))

ggplot(pm_filtered, aes(x = Year, y = city, fill = `PM2.5`)) +
  geom_tile() +
  scale_fill_gradient(low = "yellow", high = "red") +
  theme_minimal() +
  labs(title = "Inquinamento in Italia",
       x = "Year",
       y = "City") +
  theme(plot.title = element_text(hjust = 0.5))
