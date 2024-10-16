# Dois adversários A e B disputam uma série de 8 partidas de um determinado jogo.
# A probabilidade de A ganhar uma partida é 0,6 e não há empate.
# Qual é a probabilidade de A ganhar a série?

# Temos uma: Distribuição Binomial
# A distribuição binomial é uma distribuição de probabilidade discreta que descreve
# o número de sucessos em uma sequência de n tentativas.

# Definindo a distribuição de probabilidades
p <- 0.6 # probabilidade de A ganhar uma partida
n <- 8

# Qual é a probabilidade de A ganhar a série?
pbinom(4, size = n, prob = p, lower.tail = FALSE)
# ou: 1 - pbinom(4, size = n, prob = p)
