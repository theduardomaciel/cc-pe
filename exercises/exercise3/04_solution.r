# Tem-se uma carteira com 15 ações.
# No pregão de ontem 75% das ações na bolsa de valores caíram de preço.
# Supondo que as ações que perderam valor têm distribuição binomial, calcule:
#   a. Quantas ações da carteira se espera que tenham caído de preço?
#   b. Qual o desvio padrão das ações da carteira?
#   c. Qual a probabilidade que as 15 ações da carteira tenham caído?
#   d. Qual a probabilidade que tenham caído de preço exatamente 10 ações?
#   e. Qual a probabilidade que 13 ou mais ações da carteira tenham caído de preço?

# Temos uma: Distribuição Binomial
# A distribuição binomial é uma distribuição de probabilidade discreta que descreve
# o número de sucessos em uma sequência de n tentativas.

# Definindo a distribuição de probabilidades
p <- 0.75
n <- 15

# a. Quantas ações da carteira se espera que tenham caído de preço?
# Calculamos a esperança da distribuição binomial (E(X) = n * p)
E <- n * p
E

# b. Qual o desvio padrão das ações da carteira?
var_1 <- n * p * (1 - p)
standard_deviation <- sqrt(var_1)
standard_deviation

# c. Qual a probabilidade que as 15 ações da carteira tenham caído?
dbinom(n, size = n, prob = p)

# d. Qual a probabilidade que tenham caído de preço exatamente 10 ações?
dbinom(10, size = n, prob = p)

# e. Qual a probabilidade que 13 ou mais ações da carteira tenham caído de preço?
sum(dbinom(13:n, size = n, prob = p))
