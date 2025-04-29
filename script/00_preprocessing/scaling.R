library(dplyr)

# Selezionare solo le colonne numeriche per la standardizzazione
numeric_data <- data %>% select_if(is.numeric)

# Applicare la standardizzazione
standardized_data <- scale(numeric_data)

# Creare un dataframe dai dati standardizzati
standardized_df <- as.data.frame(standardized_data)

# Per mantenere anche la colonna 'country', puoi unirla di nuovo
final_data <- cbind(data$country, standardized_df)
colnames(final_data)[1] <- "country"

# Visualizzare i primi record del dataframe standardizzato
save_dataset(final_data, "temporanei/Cluster_standard")
