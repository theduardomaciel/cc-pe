# Uma moeda é lançada 5 vezes:
#   a. Construa a função de Probabilidade.
#   b. Construa a função Distribuição acumulada.
#   c. Qual a probabilidade de ocorrer três caras?
#   d. Qual a probabilidade de ocorrer pelo menos três caras?

# Temos uma: Distribuição Binomial
# A distribuição binomial é uma distribuição de probabilidade discreta que descreve
# o número de sucessos em uma sequência de n tentativas.

# Definindo a distribuição de probabilidades
p <- 0.5 # cada face tem 50% de chance de sair
n <- 5

# a. Construa a função de Probabilidade.
dbinom(0:n, size = n, prob = p)

# b. Construa a função Distribuição acumulada.
pbinom(0:n, size = n, prob = p)

# c. Qual a probabilidade de ocorrer três caras?
dbinom(3, size = n, prob = p)

# d. Qual a probabilidade de ocorrer pelo menos três caras?
pbinom(3, size = n, prob = p)
