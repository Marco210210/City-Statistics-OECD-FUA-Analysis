# Carica il campione di dati delle medie di PM2.5 per il 2019
campione_2019 <- read.csv("dataset/temporanei/sample_2019_pm25.csv")

# Calcola la varianza campionaria per il 2019
varianza_campione_2019 <- var(campione_2019$media_pm25)

# Definisci il livello di confidenza per il 2019
alpha_2019 <- 1-0.95
n_2019 <- length(campione_2019$media_pm25)

# Calcola i valori critici della distribuzione chi-quadrato per il 2019
chi_inferiore_2019 <- qchisq(alpha_2019 / 2, df = n_2019 - 1)
chi_superiore_2019 <- qchisq(1 - alpha_2019 / 2, df = n_2019 - 1)

# Calcola l'intervallo di confidenza per la varianza del 2019
intervallo_confidenza_varianza_inferiore_2019 <- (n_2019 - 1) * varianza_campione_2019 / chi_superiore_2019
intervallo_confidenza_varianza_superiore_2019 <- (n_2019 - 1) * varianza_campione_2019 / chi_inferiore_2019

# Stampa l'intervallo di confidenza per la varianza del 2019
print(paste("Intervallo di confidenza per la varianza inferiore del 2019:", intervallo_confidenza_varianza_inferiore_2019))
print(paste("Intervallo di confidenza per la varianza superiore del 2019:", intervallo_confidenza_varianza_superiore_2019))
