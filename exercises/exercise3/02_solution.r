# Em uma fabricação artesanal de componentes cerâmicos 12% apresentam defeitos.
# Utilizando distribuição Binomial, calcular a probabilidade de, em um lote de quarenta
# componentes, encontrar:
#   a) Entre 3 e 5 componentes estejam defeituosos, inclusive.
#   b) Pelo menos dois componentes defeituosos.
#   c) No máximo 3 componentes defeituosos.
#   d) Pelo menos 39 componentes de qualidade.
#   e) No máximo 39 componentes de qualidade.

# Temos uma: Distribuição Binomial
# A distribuição binomial é uma distribuição de probabilidade discreta que descreve
# o número de sucessos em uma sequência de n tentativas.

# Definindo a distribuição de probabilidades
p <- 0.12
n <- 40

# a) Entre 3 e 5 componentes estejam defeituosos, inclusive.
sum(dbinom(3:5, size = n, prob = p))

# b) Pelo menos dois componentes defeituosos.
sum(dbinom(2:n, size = n, prob = p))

# c) No máximo 3 componentes defeituosos.
sum(dbinom(0:3, size = n, prob = p))

# d) Pelo menos 39 componentes de qualidade.
sum(dbinom(39:n, size = n, prob = 1 - p))

# e) No máximo 39 componentes de qualidade.
sum(dbinom(0:39, size = n, prob = 1 - p))
