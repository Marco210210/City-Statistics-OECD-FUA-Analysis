# Carica il campione di dati delle medie di PM2.5 per il 2019
campione_2019 <- read.csv("dataset/temporanei/sample_2019_pm25.csv")

# Calcola la media campionaria e la deviazione standard per il 2019
media_campione_2019 <- mean(campione_2019$media_pm25)
dev_std_campione_2019 <- sd(campione_2019$media_pm25)

# Definisci il livello di confidenza per il 2019
alpha_2019 <- 1-0.95
n_2019 <- length(campione_2019$media_pm25)

# Calcola i quantili della distribuzione t di Student per il 2019
t_critico_2019 <- qt(1 - alpha_2019/2, df = n_2019 - 1)

# Calcola l'intervallo di confidenza per il 2019
margine_errore_2019 <- t_critico_2019 * dev_std_campione_2019 / sqrt(n_2019)
intervallo_confidenza_inferiore_2019 <- media_campione_2019 - margine_errore_2019
intervallo_confidenza_superiore_2019 <- media_campione_2019 + margine_errore_2019

# Stampa l'intervallo di confidenza per il 2019
print(paste("Intervallo di confidenza inferiore per il 2019:", intervallo_confidenza_inferiore_2019))
print(paste("Intervallo di confidenza superiore per il 2019:", intervallo_confidenza_superiore_2019))
