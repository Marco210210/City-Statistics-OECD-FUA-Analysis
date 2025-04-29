# Carica il campione di dati delle medie di PM2.5 per il 2009
campione_2009 <- read.csv("dataset/temporanei/sample_2009_pm25.csv")

# Calcola la media campionaria (stimatore di mu) per il 2009 con il metodo dei momenti
stimamu_2009 <- mean(campione_2009$media_pm25)

# Calcola lo stimatore della varianza (stimatore di sigma^2) per il 2009 con il metodo dei momenti
n_2009 <- length(campione_2009$media_pm25)
stimasigma2_2009 <- ((n_2009 - 1) * var(campione_2009$media_pm25)) / n_2009

# Stampa gli stimatori per il 2009
print(paste("Stimatore di mu per il 2009:", stimamu_2009))
print(paste("Stimatore di sigma^2 per il 2009:", stimasigma2_2009))
