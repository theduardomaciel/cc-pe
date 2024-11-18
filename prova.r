# QUESTÃO 1 ======================================

## a)

alfa <- 0.02 # 100% - 98% = 2% = 0.02

# DESVIO: $$\sqrt(8 + 2) = \sqrt(10) = 3.16227766016838$$
desvio <- 3.1622776602
media <- 16
n <- 25

# qnorm: distribuição normal padrão
zc <- qnorm(1 - alfa / 2, mean = 0, sd = 1)
zc <- round(zc, 2)
zc

erro <- zc * desvio / sqrt(n)
erro <- round(erro, 5)
erro

cat("Intervalo de confiança: (", media - erro, ", ", media + erro, ")\n")

## b)

alpha <- 0.08 # nível de significância (92% = 1 - 0.92 = 0.08)
# (67 + \sqrt(16) = 67 + 4 = 71)
# (68 + \sqrt^3(16) = 68 + 2.5198420998 = 70.5)
amostra <- c(60, 70, 72.5, 90, 77.5, 65.25, 50, 72.5, 87.25, 68, 70, 67, 71, 70.5)
n <- length(amostra)
desvio <- sd(amostra)

# se = "erro padrão" = "standard error"
se <- desvio / sqrt(n)

# Calculamos o intervalo de confiança
cat(
    "Intervalo de confiança: (",
    mean(amostra) - qt(1 - alpha / 2, n - 1) * se,
    ", ",
    mean(amostra) + qt(1 - alpha / 2, n - 1) * se,
    ")\n"
)
