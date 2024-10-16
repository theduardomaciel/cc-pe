# Uma indústria de tintas recebe pedidos de seus vendedores através da internet.
# A taxa média é de 5 pedidos por hora.
#   a. Qual a probabilidade de a indústria receber mais de dois pedidos por hora?
#   b. Em um dia de trabalho (8 horas) qual seria a probabilidade de haver 50 pedidos?

# Temos uma: Distribuição de Poisson
# Poisson é uma distribuição de probabilidade de variáveis aleatórias discretas
# que expressa a probabilidade de uma série de eventos ocorrer num certo período de tempo.

# Definindo a distribuição de probabilidades
lambda <- 5 # pedidos por hora

# a. Qual a probabilidade de a indústria receber mais de dois pedidos por hora?
1 - ppois(2, lambda = lambda)
# ou ppois(2, lambda, lower.tail = FALSE)
# ou: 1 - sum(dpois(0:2, lambda))

# b. Em um dia de trabalho (8 horas) qual seria a probabilidade de haver 50 pedidos?
ppois(50, lambda = lambda * 8, lower.tail = FALSE)
# ou: 1 - sum(dpois(0:50, lambda * 8))
