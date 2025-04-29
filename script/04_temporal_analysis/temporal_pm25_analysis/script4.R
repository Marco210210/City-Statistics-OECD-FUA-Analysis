# Carica il campione di dati delle medie di PM2.5 per il 2009
campione_2009 <- read.csv("dataset/temporanei/sample_2009_pm25.csv")

# Calcola la media campionaria e la deviazione standard per il 2009
media_campione_2009 <- mean(campione_2009$media_pm25)
dev_std_campione_2009 <- sd(campione_2009$media_pm25)

# Definisci il livello di confidenza per il 2009
alpha_2009 <- 1-0.95
n_2009 <- length(campione_2009$media_pm25)

# Calcola i quantili della distribuzione t di Student per il 2009
t_critico_2009 <- qt(1 - alpha_2009/2, df = n_2009 - 1)

# Calcola l'intervallo di confidenza per il 2009
margine_errore_2009 <- t_critico_2009 * dev_std_campione_2009 / sqrt(n_2009)
intervallo_confidenza_inferiore_2009 <- media_campione_2009 - margine_errore_2009
intervallo_confidenza_superiore_2009 <- media_campione_2009 + margine_errore_2009

# Stampa l'intervallo di confidenza per il 2009
print(paste("Intervallo di confidenza inferiore per il 2009:", intervallo_confidenza_inferiore_2009))
print(paste("Intervallo di confidenza superiore per il 2009:", intervallo_confidenza_superiore_2009))
