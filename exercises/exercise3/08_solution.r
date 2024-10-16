# Em fábrica de tubulações hidráulicas, o setor de qualidade sabe que
# 15% do que é produzido tem algum defeito,
# Para averiguar, tirou-se uma amostra de 10 tubulações.

# Temos uma: Distribuição Binomial
# A distribuição binomial é uma distribuição de probabilidade discreta que descreve
# o número de sucessos em uma sequência de n tentativas.

# Definindo a distribuição de probabilidades
p <- 0.15
n <- 10

# Qual a probabilidade de não mais do uma seja defeituosa?
sum(dbinom(0:1, size = n, prob = p))
