# Definizione dei parametri
alpha <- 1-0.95
mu0 <- 10

# Calcolo della statistica del test e del p-value
tos <- (media_2009 - mu0) / (dev_std_2009 / sqrt(n_2009))
pvalue <- pt(tos, df = n_2009 - 1, lower.tail = FALSE)

# Stampa dei risultati
print(paste("Valore della statistica del test:", tos))
print(paste("p-value:", pvalue))

