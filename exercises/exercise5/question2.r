# De uma população normal com variância 36, tira-se uma amostra aleatória de
# tamanho 20, obtendo-se uma média de 43. Ao nível de significância de 10%, testar
# as hipóteses: 𝐻_0 : u = 45, 𝐻_1 : u ≠ 45.
# (testes de hipótese - unilateral à direita)

# Dados
media_amostra <- 43
media_populacao <- 45
variancia_populacao <- 36
n <- 20
alpha <- 0.10

# Estatística de teste (z)
z <- (media_amostra - media_populacao) / sqrt(variancia_populacao / n)

# P-valor bilateral
p_value <- 2 * pnorm(-abs(z))

# Resultado
c(Estatistica_Z = z, P_Value = p_value)
