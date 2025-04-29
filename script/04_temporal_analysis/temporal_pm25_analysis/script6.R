# Livello di confidenza
alpha <- 1-0.95

# Calcolo dei valori critici
z_alpha_2 <- qnorm(1 - alpha / 2)

# Calcolo dell'intervallo di confidenza per la differenza delle medie
intervallo_inferiore <- (stimamu_2009 - stimamu_2019) - z_alpha_2 * sqrt(stimasigma2_2009 / n_2009 + stimasigma2_2019 / n_2019)
intervallo_superiore <- (stimamu_2009 - stimamu_2019) + z_alpha_2 * sqrt(stimasigma2_2009 / n_2009 + stimasigma2_2019 / n_2019)

# Stampa dell'intervallo di confidenza
print(paste("Intervallo di confidenza inferiore per la differenza delle medie:", intervallo_inferiore))
print(paste("Intervallo di confidenza superiore per la differenza delle medie:", intervallo_superiore))
