library(ggplot2)
library(dplyr)

data <- read.csv("dataset/Clean_dataset.csv")

# Elenco delle variabili per cui creare boxplot
variables <- c("GDP (Million USD, constant prices, constant PPP, base year 2015)",   
               "GDP per capita (USD, constant prices, constant PPP, base year 2015)",
               "Labour force (15-64 years old)",                                     
               "Mean population exposure to PM2.5 air pollution",                    
               "Population density (inhabitants per km²)",                           
               "Population, all ages, administrative data",                          
               "Unemployment rate (unemployment 15-64 over labour force 15-64)")

# Anni da considerare
years <- paste0("X", 2009:2019)

# Ciclo per creare un boxplot per ciascuna variabile e per ogni anno
for (var in variables) {
  for (year in years) {
    # Filtrare per la variabile corrente e per l'anno corrente
    filtered_data <- data %>%
      filter(variable == var) %>%
      select(country, city, all_of(year))
    
    # Creare il boxplot
    plot <- ggplot(filtered_data, aes(x = country, y = get(year))) +
      geom_boxplot() +
      scale_y_continuous(labels = scales::comma_format(scale = 1, accuracy = 1)) +
      theme(axis.text.x = element_text(angle = 90, hjust = 1),
            plot.title = element_text(hjust = 0.5)) +
      labs(title = paste("Boxplot of", var, "in", substr(year, 2, 5)),
           x = "Country",
           y = var)
    
    # Creare un nome di file univoco per ciascun boxplot
    file_name <- paste0("plot/boxplot/", gsub("[[:punct:][:space:]]", "_", var), "_", substr(year, 2, 5), "_boxplot.png")
    
    # Salvare il boxplot nella cartella desiderata
    ggsave(file_name, plot, width = 20, height = 8)
  }
}
