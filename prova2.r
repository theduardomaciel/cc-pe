xx <- 16

indLactose <- round(rnorm(xx, 25, xx^(1 / 3)), digit = 2)

# Um fabricante está correto, para o nível de significância de 5%,
# que o Índice de Lactose é igual a 25?

# H0: mu = 25
# H1: mu != 25


media <- mean(indLactose)
desvio <- sd(indLactose)
nivel <- 0.95 # 1 - 0.05 = 0.95

t.test(indLactose, mu = 25, alternative = "two.sided", conf.level = nivel)

t_calc <- (media - 25) / (desvio / sqrt(xx))
t_calc

# Especificação das regiões (RNR e RC)

# RNR
rnr <- qt(0.025, df = xx - 1) # t_crit = -2.131

# RC
rc <- qt(0.975, df = xx - 1) # t_crit = 2.131

cat(
    "t_calc =",
    t_calc,
    ", t_alfa/2 =",
    rnr / 2,
    "ou t_alfa/2 =",
    rc / 2,
    "\n"
)

cat(
    rnr / 2,
    "<",
    t_calc,
    "<",
    rc / 2,
    "\n"
)

# t_alfa = 2.131 = t_crit
# Como o valor observado t_calc não está na região crítica do teste,
# não rejeitamos H0 (a hipótese nula). Logo, o fabricante está correto.


# b) Considerado agora 1% de nível de significância, refaça os cálculos
# usando a função específica do software R e explique o resultado
# (se o fabricante está correto) através da interpretação do p-value

result <- t.test(indLactose, mu = 25, alternative = "two.sided", conf.level = 0.99)
result

p_value <- result$p.value
p_value # 0.682

# Como o p-value é maior que o nível de significância (0.682 > 0.01),
# não rejeitamos H0 (a hipótese nula). Logo, o fabricante está correto.
