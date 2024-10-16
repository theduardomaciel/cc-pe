# O Corpo de Bombeiros de uma determinada cidade recebe, em média, 3 chamadas por dia.
# Qual a probabilidade de receber:
#   a. 4 chamadas num dia.
#   b. Nenhuma chamada em um dia.
#   c. 20 chamadas em uma semana.

# Temos uma: Distribuição de Poisson
# Poisson é uma distribuição de probabilidade de variáveis aleatórias discretas
# que expressa a probabilidade de uma série de eventos ocorrer num certo período de tempo.

# Definindo a distribuição de probabilidades
lambda <- 3

# a) 4 chamadas num dia.
dpois(4, lambda)

# b) Nenhuma chamada em um dia.
dpois(0, lambda)

# c) 20 chamadas em uma semana.
dpois(20, lambda * 7)
