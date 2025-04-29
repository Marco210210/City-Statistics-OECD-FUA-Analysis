# Carica il campione di dati del 2019
campione_2019 <- read.csv("dataset/temporanei/sample_2019_pm25.csv")

# Calcola la media e la deviazione standard del campione del 2019
media_2019 <- mean(campione_2019$media_pm25)
dev_std_2019 <- sd(campione_2019$media_pm25)

# Definisci i quartili della distribuzione normale in base alla media e deviazione standard del 2019
quartili_2019 <- qnorm(seq(0.2, 0.8, by = 0.2), mean = media_2019, sd = dev_std_2019)

# Determina le frequenze osservate nel 2019
nint_2019 <- numeric(length(quartili_2019) + 1)
nint_2019[1] <- sum(campione_2019$media_pm25 < quartili_2019[1])
for (i in 2:length(quartili_2019)) {
  nint_2019[i] <- sum(campione_2019$media_pm25 >= quartili_2019[i-1] & campione_2019$media_pm25 < quartili_2019[i])
}
nint_2019[length(quartili_2019) + 1] <- sum(campione_2019$media_pm25 >= quartili_2019[length(quartili_2019)])

# Calcola il valore di chi-quadrato per il 2019
chi2_2019 <- sum((nint_2019 - length(campione_2019$media_pm25) * 0.2)^2 / (length(campione_2019$media_pm25) * 0.2))

# Calcola i valori critici e gradi di libertà per il 2019
df_2019 <- length(quartili_2019) - 2
alpha <- 1-0.95
valore_critico_basso_2019 <- qchisq(alpha / 2, df = df_2019)
valore_critico_alto_2019 <- qchisq(1 - alpha / 2, df = df_2019)

# Stampa i risultati per il 2019
print(paste("Valore Chi2 calcolato per il 2019:", chi2_2019))
print(paste("Valore critico basso per il 2019 (", alpha/2, "):", valore_critico_basso_2019))
print(paste("Valore critico alto per il 2019 (", 1-alpha/2, "):", valore_critico_alto_2019))
print(paste("Gradi di libertà per il 2019:", df_2019))

# Valuta l'ipotesi di normalità per il 2019
if(chi2_2019 < valore_critico_alto_2019 && chi2_2019 > valore_critico_basso_2019) {
  print("L'ipotesi di normalità per il 2019 non può essere rifiutata.")
} else {
  print("L'ipotesi di normalità per il 2019 viene rifiutata.")
}

# Crea un Q-Q plot per il 2019
qqnorm(campione_2019$media_pm25, col = "blue", pch = 19)
qqline(campione_2019$media_pm25, col = "red", lwd = 2)
