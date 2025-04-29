# Calcolo di t_alpha
alpha <- 0.05
t_alpha <- qt(alpha, df = n_2009 - 1)
print(t_alpha)

# Grafico della densità di Student con n_2009 - 1 gradi di libertà
curve(dt(x, df = n_2009 - 1), from = -3, to = 3, axes = FALSE, ylim = c(0, 0.5), xlab = "", ylab = "", main = "Densità di Student con n - 1 gradi di libertà")
text(0, 0.05, "0.95")
text(0, 0.2, "Regione di accettazione")
axis(1, c(-3, -1, 0, 1, 3), c("", bquote(.(t_alpha)), 0, "", ""))
vals <- seq(-3, -1, length = 100)
x <- c(-3, vals, -1, -3)
y <- c(0, dt(vals, df = n_2009 - 1), 0, 0)
polygon(x, y, density = 20, angle = 45)
abline(h = 0)
text(-1.5, 0.05, "0.05")
text(-2.3, 0.1, "Regione di rifiuto")
box()
