library(dplyr)
library(kableExtra)


data <- read.csv("dataset/Clean_dataset.csv")

# Filtrare per la variabile "Employment rate" e per la Romania
filtered_data <- data %>%
  filter(variable == "Population, all ages, administrative data", country == "United States")

# Inizializzare un dataframe per conservare gli outlier
outliers <- data.frame(Year = integer(), City = character(), Value = numeric(), stringsAsFactors = FALSE)

# Calcolare gli outlier per ogni anno
for(year in 2009:2019) {
  year_col <- paste0("X", year)
  
  # Calcolare IQR
  Q1 <- quantile(filtered_data[[year_col]], 0.25, na.rm = TRUE)
  Q3 <- quantile(filtered_data[[year_col]], 0.75, na.rm = TRUE)
  IQR <- Q3 - Q1
  
  # Identificare gli outlier
  outlier_data <- filtered_data %>%
    filter(get(year_col) < (Q1 - 1.5 * IQR) | get(year_col) > (Q3 + 1.5 * IQR)) %>%
    select(city, all_of(year_col))
  
  # Aggiungere gli outlier al dataframe
  if(nrow(outlier_data) > 0) {
    outlier_data$Year <- year
    colnames(outlier_data)[2] <- "Value"
    outliers <- rbind(outliers, outlier_data)
  }
}

# Visualizzare gli outlier
print(outliers)

# Visualizzare gli outlier
if(nrow(outliers) > 0) {
  filename <- paste0("tabelle_outlier/", unique(filtered_data$country), "_", unique(filtered_data$variable), ".png")
  
  # Creare una tabella formattata con kableExtra
  outlier_table <- kable(outliers, format = "html", escape = FALSE) %>%
    kable_styling(bootstrap_options = "striped", full_width = FALSE)
  
  # Salva la tabella come PNG
  save_kable(outlier_table, filename)
}
