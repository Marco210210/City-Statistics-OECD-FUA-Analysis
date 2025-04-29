# Carica il campione di dati del 2009
campione_2009 <- read.csv("dataset/temporanei/sample_2009_pm25.csv")

# Calcola la media e la deviazione standard del campione del 2009
media_2009 <- mean(campione_2009$media_pm25_2009)
dev_std_2009 <- sd(campione_2009$media_pm25_2009)

# Definisci i quartili della distribuzione normale in base alla media e deviazione standard del 2009
quartili_2009 <- qnorm(seq(0.2, 0.8, by = 0.2), mean = media_2009, sd = dev_std_2009)

# Determina le frequenze osservate nel 2009
nint_2009 <- numeric(length(quartili_2009) + 1)
nint_2009[1] <- sum(campione_2009$media_pm25_2009 < quartili_2009[1])
for (i in 2:length(quartili_2009)) {
  nint_2009[i] <- sum(campione_2009$media_pm25_2009 >= quartili_2009[i-1] & campione_2009$media_pm25_2009 < quartili_2009[i])
}
nint_2009[length(quartili_2009) + 1] <- sum(campione_2009$media_pm25_2009 >= quartili_2009[length(quartili_2009)])

# Calcola il valore di chi-quadrato per il 2009
chi2_2009 <- sum((nint_2009 - length(campione_2009$media_pm25_2009) * 0.2)^2 / (length(campione_2009$media_pm25_2009) * 0.2))

# Calcola i valori critici e gradi di libertà per il 2009
df_2009 <- length(quartili_2009) - 2
alpha <- 1-0.95
valore_critico_basso_2009 <- qchisq(alpha / 2, df = df_2009)
valore_critico_alto_2009 <- qchisq(1 - alpha / 2, df = df_2009)

# Stampa i risultati per il 2009
print(paste("Valore Chi2 calcolato per il 2009:", chi2_2009))
print(paste("Valore critico basso per il 2009 (", alpha/2, "):", valore_critico_basso_2009))
print(paste("Valore critico alto per il 2009 (", 1-alpha/2, "):", valore_critico_alto_2009))
print(paste("Gradi di libertà per il 2009:", df_2009))

# Valuta l'ipotesi di normalità per il 2009
if(chi2_2009 < valore_critico_alto_2009 && chi2_2009 > valore_critico_basso_2009) {
  print("L'ipotesi di normalità per il 2009 non può essere rifiutata.")
} else {
  print("L'ipotesi di normalità per il 2009 viene rifiutata.")
}

# Crea un Q-Q plot per il 2009
qqnorm(campione_2009$media_pm25_2009, col = "blue", pch = 19)
qqline(campione_2009$media_pm25_2009, col = "red", lwd = 2)
