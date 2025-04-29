library(readr)
library(dplyr)

# Carica il dataset
file_path <- "dataset/Clean_dataset.csv"
data <- read_csv(file_path)

# Aggiungi una colonna per il conteggio dei valori NA per riga e filtra le righe con almeno un valore NA
# Ordina poi le righe in base al numero di NA (in ordine decrescente)
rows_with_na <- data %>%
  mutate(na_count = rowSums(is.na(.))) %>%
  filter(na_count > 0) %>%
  arrange(desc(na_count))

# Visualizza le righe con valori NA
print(rows_with_na)
