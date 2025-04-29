# Carica il campione di dati delle medie di PM2.5 per il 2019
campione_2019 <- read.csv("dataset/temporanei/sample_2019_pm25.csv")

# Calcola la media campionaria (stimatore di mu) per il 2019 con il metodo dei momenti
stimamu_2019 <- mean(campione_2019$media_pm25)

# Calcola lo stimatore della varianza (stimatore di sigma^2) per il 2019 con il metodo dei momenti
n_2019 <- length(campione_2019$media_pm25)
stimasigma2_2019 <- ((n_2019 - 1) * var(campione_2019$media_pm25)) / n_2019

# Stampa gli stimatori per il 2019
print(paste("Stimatore di mu per il 2019:", stimamu_2019))
print(paste("Stimatore di sigma^2 per il 2019:", stimasigma2_2019))
