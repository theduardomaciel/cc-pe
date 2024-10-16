# Uma moeda é lançada 6 vezes, encontre a probabilidade de:
#   a. Ocorrer 4 coroas;
#   b. Ocorrer pelo menos 2 coroas;
#   c. Ocorrer no máximo 3 coroas.

# Temos uma: Distribuição Binomial
# A distribuição binomial é uma distribuição de probabilidade discreta que descreve
# o número de sucessos em uma sequência de n tentativas.

# Definindo a distribuição de probabilidades
p <- 0.5
n <- 6

# a. Ocorrer 4 coroas
dbinom(4, size = n, prob = p)

# b. Ocorrer pelo menos 2 coroas
sum(dbinom(2:n, size = n, prob = p))

# c. Ocorrer no máximo 3 coroas
sum(dbinom(0:3, size = n, prob = p))
