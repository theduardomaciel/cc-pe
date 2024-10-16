# Exemplo 1 ================================================================
# Se dissermos que a altura média do homem brasileiro adulto é de
# 1,70m e o desvio padrão é de 5 cm, estaremos dizendo que:

ex_mean <- 1.70
ex_sd <- 0.05

# 1 - 68% da população masculina adulta encontra-se entre 1,65 m e 1,75 m

# Medidas em metros -> 5cm = 0.05m
pnorm(1.75, mean = ex_mean, sd = ex_sd) - pnorm(1.65, mean = ex_mean, sd = ex_sd)

# O z corresponde ao número de desvios padrão que x está da média
# z = (x - μ) / σ

z1 <- (1.65 - ex_mean) / ex_sd
z1
z2 <- (1.75 - ex_mean) / ex_sd
z2

# Média 0 e desvio padrão 1 são os valores padrão
norm1 <- pnorm(z2, mean = 0, sd = 1) - pnorm(z1, mean = 0, sd = 1)

# 2 - 95% da população masculina adulta encontra-se entre 1,60m e 1,80m

pnorm(1.80, mean = ex_mean, sd = ex_sd) - pnorm(1.60, mean = ex_mean, sd = ex_sd)

z1 <- (1.60 - ex_mean) / ex_sd
z1
z2 <- (1.80 - ex_mean) / ex_sd
z2

norm2 <- pnorm(z2, mean = 0, sd = 1) - pnorm(z1, mean = 0, sd = 1)

# 3 - 99,7% da população masculina adulta encontra-se entre 1,55m e 1,85m

pnorm(1.85, mean = ex_mean, sd = ex_sd) - pnorm(1.55, mean = ex_mean, sd = ex_sd)

z1 <- (1.55 - ex_mean) / ex_sd
z1
z2 <- (1.85 - ex_mean) / ex_sd
z2

norm3 <- pnorm(z2, mean = 0, sd = 1) - pnorm(z1, mean = 0, sd = 1)

# Gráficos

# Curva normal padrão

x <- seq(155, 185, 0.01)
y <- dnorm(x, mean = ex_mean * 100, sd = ex_sd * 100)

plot(x, y,
    type = "l",
    lwd = 2,
    col = "black",
    xlab = "Altura (cm)",
    ylab = "Densidade",
    main = "Distribuição Normal"
)

# Área sob a curva entre 1,55m e 1,85m

x <- seq(155, 185, 0.01)
y <- dnorm(x, mean = ex_mean * 100, sd = ex_sd * 100)

polygon(c(155, x, 185), c(0, y, 0), col = "yellow")

# Área sob a curva entre 1,60m e 1,80m

x <- seq(160, 180, 0.01)
y <- dnorm(x, mean = ex_mean * 100, sd = ex_sd * 100)

polygon(c(160, x, 180), c(0, y, 0), col = "green")

# Área sob a curva entre 1,65m e 1,75m

x <- seq(165, 175, 0.01)
y <- dnorm(x, mean = ex_mean * 100, sd = ex_sd * 100)

polygon(c(165, x, 175), c(0, y, 0), col = "red")
# text(170, 0.05, round(norm1, 4), cex = 1)

# Legenda com a área sob a curva de cada intervalo

legend("topright",
    legend = c(
        paste(round(norm1, 4) * 100, "%"),
        paste(round(norm2, 4) * 100, "%"),
        paste(round(norm3, 4) * 100, "%")
    ),
    fill = c("red", "green", "yellow"),
    title = "Intervalos",
    cex = 0.8
)

# Distribuição Normal Padronizada

# Distribuição de X: normal com μ = 170 e σ = 10
# Distribuição de Z: normal padrão
# P(X > 180) = P(Z > 1)
# z = (x - μ) / σ = $$ \frac{180 - 170}{10} = 1 $$

# Para um valor x = μ, corresponde z = 0 na distribuição normal padrão/reduzida
# Para x = μ + σ, tem-se z = 1, e assim por diante

x_default <- seq(140, 200, 0.01)
y_default <- dnorm(x_default, mean = 170, sd = 10)

x_normal <- seq(-3, 3, 0.01)
y_norma <- dnorm(x, mean = 0, sd = 1)

# Gerar dois gráficos, um para X e outro para Z
# Separar curva em setores de linhas verticais no eixo x, para facilitar a visualização
# Preenchimento em X > 180 e Z > 1

par(mfcol = c(1, 2))

plot(x_default, y_default,
    type = "l",
    lwd = 2,
    col = "black",
    xlab = "Altura (cm)",
    ylab = "Densidade",
    main = "Distribuição Normal"
)

polygon(c(180, x_default[x_default > 180], 200), c(0, y_default[x_default > 180], 0), col = "red")

# Linhas verticais separando setores

abline(v = c(170, 180), lty = 2)

plot(x_normal, y_norma,
    type = "l",
    lwd = 2,
    col = "black",
    xlab = "Z",
    ylab = "Densidade",
    main = "Distribuição Normal Padronizada"
)

polygon(c(1, x[x > 1], 3), c(0, y[x > 1], 0), col = "red")

# Linhas verticais separando setores

abline(v = c(0, 1), lty = 2)

# Calculemos o exemplo anterior com a Distribuição Normal Padronizada

pnorm(1) - pnorm(-1) # P(Z > 1) = P(Z ≤ 1) - P(Z ≤ -1)
# equivalente a: pnorm(175, mean = 170, sd = 5) - pnorm(165, mean = 170, sd = 5)

pnorm(2) - pnorm(-2) # P(Z > 2) = P(Z ≤ 2) - P(Z ≤ -2)
# equivalente a: pnorm(180, mean = 170, sd = 5) - pnorm(160, mean = 170, sd = 5)

pnorm(3) - pnorm(-3) # P(Z > 3) = P(Z ≤ 3) - P(Z ≤ -3)
# equivalente a: pnorm(185, mean = 170, sd = 5) - pnorm(155, mean = 170, sd = 5)

# Exemplo 2 ================================================================
# Os resultados do experimento formam uma VA com distribuição normal,
# com média 40 e desvio padrão 10.

# ==== a) Qual a probabilidade de um resultado ser menor ou igual a 50?

# P(X < 50) = P(Z <= 1) = ?
# z = (x - μ) / σ = (50 - 40) / 10 = 1

pnorm(50, mean = 40, sd = 10, lower.tail = TRUE) # equivale a: pnorm(50, 40, 10)
pnorm(1, mean = 0, sd = 1, lower.tail = TRUE) # equivale a: pnorm(1)

# Plotamos a distribuição normal para visualizar a área sob a curva

x <- seq(10, 70, 0.01) # ou: seq(5, 75)
y <- dnorm(x, mean = 40, sd = 10)

par(mfcol = c(1, 1))

plot(x, y,
    type = "l",
    lwd = 2,
    col = "black",
    xlab = "Resultado",
    ylab = "Densidade",
    main = "Distribuição Normal"
)

polygon(c(10, x[x <= 50], 50), c(0, y[x <= 50], 0), col = "red")

# Texto centralizado na área sob a curva
text(40, 0.0175, round(pnorm(50, 40, 10), 4), cex = 1.5)

# ==== b) Qual a probabilidade de um resultado do experimento ser maior ou igual a 35?

# z = (x - μ) / σ = (35 - 40) / 10 = -0.5
# P(Z >= 35) = P(Z > -0.5) = 1 - P(Z <= -0.5)

pnorm(35, mean = 40, sd = 10, lower.tail = FALSE)
# equivale a: pnorm(35, 40, 10, lower.tail = FALSE)

pnorm(-0.5, mean = 0, sd = 1, lower.tail = FALSE)
# equivale a: pnorm(-0.5, lower.tail = FALSE)

1 - pnorm(35, mean = 40, sd = 10) # equivale a: 1 - pnorm(35)
1 - pnorm(-0.5, mean = 0, sd = 1) # equivale a: 1 - pnorm(-0.5)

# ATENÇÃO! Quando o intervalo procurado for
# maior ou igual a X (outra parte da curva) "lower.tail = False".

# Plotamos a distribuição normal para visualizar a área sob a curva

x <- seq(10, 70, 0.01) # ou: seq(5, 75)
y <- dnorm(x, mean = 40, sd = 10)

plot(x, y,
    type = "l",
    lwd = 2,
    col = "black",
    xlab = "Resultado",
    ylab = "Densidade",
    main = "Distribuição Normal"
)

# Outra forma de calcular a área sob a curva
i <- x >= 35
polygon(c(35, x[i], 70), c(0, y[i], 0), col = "green")

# Texto centralizado na área sob a curva
p <- pnorm(35, mean = 40, sd = 10, lower.tail = FALSE)
text(42.5, 0.0175, round(p, digits = 4), cex = 1.5)

# ==== c) Qual a probabilidade de um resultado do experimento estar entre 25 e 60?

# P(25 <= 60) = P(25 <= X <= 60) =  P(X <= 60) - P(X <= 25)
#                                   P(2)       - P(-1,5)

# Como o intervalo procurado é menor ou igual a X, não é necessário
# especificar "lower.tail = FALSE"
pnorm(60, mean = 40, sd = 10, lower.trail = TRUE) -
    pnorm(25, mean = 40, sd = 10, lower.trail = TRUE)
# equivale a: pnorm(60, 40, 10) - pnorm(25, 40, 10)

# Plotamos a distribuição normal e a distribuição normal padronizada
# para visualizar a área sob a curva

x_default <- seq(0, 80, 0.01)
y_default <- dnorm(x_default, mean = 40, sd = 10)

x_normal <- seq(-3, 3, 0.01)
y_norma <- dnorm(x_normal, mean = 0, sd = 1)

par(mfcol = c(1, 2))

plot(x_default, y_default,
    type = "l",
    lwd = 2,
    col = "black",
    xlab = "Resultado",
    ylab = "Densidade",
    main = "Distribuição Normal"
)

polygon(c(25, x_default[x_default <= 60], 60), c(0, y_default[x_default <= 60], 0), col = "yellow")

# Texto centralizado na área sob a curva

p <- pnorm(60, mean = 40, sd = 10) - pnorm(25, mean = 40, sd = 10)
text(40, 0.0175, round(p, digits = 4), cex = 1)

plot(x_normal, y_norma,
    type = "l",
    lwd = 2,
    col = "black",
    xlab = "Z",
    ylab = "Densidade",
    main = "Distribuição Normal Padronizada"
)

polygon(c(1.5, x_normal[x_normal <= 2], 2), c(0, y_norma[x_normal <= 2], 0), col = "yellow")

# Texto centralizado na área sob a curva

p <- pnorm(2) - pnorm(1.5)
text(1.75, 0.35, round(p, digits = 4), cex = 1)

# ==== d) Qual a probabilidade de um resultado do experimento ser
# maior ou igual a 55 (>= 55) ou menor ou igual a 30 (<= 30)?

# P(X) = P(X >= 55) + P(X <= 30)

p1 <- pnorm(55, mean = 40, sd = 10, lower.tail = FALSE)
# lower.tail = FALSE é necessário, pois o intervalo procurado é maior ou igual a X

p2 <- pnorm(30, mean = 40, sd = 10, lower.tail = TRUE)
# lower.tail = TRUE é necessário, pois o intervalo procurado é menor ou igual a X

p1 + p2

# Plotamos a distribuição normal para visualizar a área sob a curva

par(mfcol = c(1, 1))

x <- seq(0, 80, 0.01)
y <- dnorm(x, mean = 40, sd = 10)

plot(x, y,
    type = "l",
    lwd = 2,
    col = "black",
    xlab = "Resultado",
    ylab = "Densidade",
    main = "Distribuição Normal"
)

polygon(c(55, x[x >= 55], 80), c(0, y[x >= 55], 0), col = "yellow")
polygon(c(0, x[x <= 30], 30), c(0, y[x <= 30], 0), col = "orange")

# Texto centralizado em cada área sob a curva

p1 <- pnorm(55, mean = 40, sd = 10, lower.tail = FALSE)
p2 <- pnorm(30, mean = 40, sd = 10, lower.tail = TRUE)

text(60, 0.0175, round(p1, digits = 4), cex = 1)
text(20, 0.0175, round(p2, digits = 4), cex = 1)
