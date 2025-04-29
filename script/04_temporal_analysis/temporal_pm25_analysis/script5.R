# Carica il campione di dati delle medie di PM2.5 per il 2009
campione_2009 <- read.csv("dataset/temporanei/sample_2009_pm25.csv")

# Calcola la varianza campionaria per il 2009
varianza_campione_2009 <- var(campione_2009$media_pm25)

# Definisci il livello di confidenza per il 2009
alpha_2009 <- 1-0.95
n_2009 <- length(campione_2009$media_pm25)

# Calcola i valori critici della distribuzione chi-quadrato per il 2009
chi_inferiore_2009 <- qchisq(alpha_2009 / 2, df = n_2009 - 1)
chi_superiore_2009 <- qchisq(1 - alpha_2009 / 2, df = n_2009 - 1)

# Calcola l'intervallo di confidenza per la varianza del 2009
intervallo_confidenza_varianza_inferiore_2009 <- (n_2009 - 1) * varianza_campione_2009 / chi_superiore_2009
intervallo_confidenza_varianza_superiore_2009 <- (n_2009 - 1) * varianza_campione_2009 / chi_inferiore_2009

# Stampa l'intervallo di confidenza per la varianza del 2009
print(paste("Intervallo di confidenza per la varianza inferiore del 2009:", intervallo_confidenza_varianza_inferiore_2009))
print(paste("Intervallo di confidenza per la varianza superiore del 2009:", intervallo_confidenza_varianza_superiore_2009))
