# Data
x <- c(1, 2, 3, 4, 5, 6)
y <- c(200, 300, 600, 700, 500, 250)

y2 <- c(100, 200, 0, 300, 400, 500)
y3 <- c(50, 100, 150, 700, 150, 333)

# Vectors
plot(x, y,
    type = "l", col = "blue",
    xlab = "", ylab = "Valor do PIB", xlim = c(1, 5),
    ylim = c(0, 800),
    main = "Gráfico de Linha com Três Variáveis"
)
# Data frame
# plot(data.frame(x, y), type = "l") # Equivalent

# Formula
# plot(y ~ x, type = "l") # Equivalent

lines(x, y2, col = "red")

lines(x, y3, col = "darkgreen")

# Adicionar legenda
legend("topright", c("PIB do País 1", "PIB do País 2", "PIB do País 3"),
    col = c("blue", "red", "darkgreen"),
    horiz = TRUE,
    inset = c(0, 1.4), # Posição da legenda
    xpd = TRUE, # Permite que a legenda fique fora do gráfico
    lty = 10 # Remove a linha da legenda
)
