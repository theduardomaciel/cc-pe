# Intervalo de confiança (Variância CONHECIDA)

# Para estimar a renda semanal média de garçons de restaurantes em uma grande
# cidade, é colhida uma amostra da renda semanal de 75 garçons.
# A média e o desvio padrão amostrais encontrados são R$ 227,00 e R$ 15,00 respectivamente.

# Determine um intervalo de confiança, com coeficiente de confiança de 90%,
# para a renda média semanal.

alfa <- 0.10 # 1 - 0.90
desvio <- 15.0
media <- 227.0
n <- 75

# zc = "z critico"
# qnorm é a função que retorna o valor de z para uma dada probabilidade
# qnorm(1 - alfa / 2, mean = 0, sd = 1) retorna o valor de z para uma distribuição normal padrão
zc <- qnorm(1 - alfa / 2, mean = 0, sd = 1)

# ic_inf = "intervalo de confiança inferior"
ic_inf <- media - zc * desvio / sqrt(n)

# ic_sup = "intervalo de confiança superior"
ic_sup <- media + zc * desvio / sqrt(n)

cat("Intervalo de confiança: (", ic_inf, ", ", ic_sup, ")\n")

# Alternativa:

# se = "erro padrão"
se <- desvio / sqrt(n)

# Calculamos o intervalo de confiança como a média mais ou menos o erro padrão
cat(
    "Intervalo de confiança: (",
    media + qnorm(alfa / 2, mean = 0, sd = 1) * se, # ic_inf -> 0.05
    ", ",
    media + qnorm(1 - alfa / 2, mean = 0, sd = 1) * se, ")\n" # ic_sup -> 0.95
)


qnorm(0.05) #
qnorm(0.95) #
