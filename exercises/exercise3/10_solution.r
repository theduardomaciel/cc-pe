# A experiência passada indica que um número médio de 6 clientes por hora param
# para colocar gasolina numa bomba.
#   a. Qual é a probabilidade de 3 clientes pararem qualquer hora?
#   b. Qual é a probabilidade de 3 clientes ou menos pararem em qualquer hora?
#   c. Qual é o valor esperado, a média, e o desvio padrão para esta distribuição?

# Temos uma: Distribuição de Poisson
# Poisson é uma distribuição de probabilidade de variáveis aleatórias discretas
# que expressa a probabilidade de uma série de eventos ocorrer num certo período de tempo.

# Definindo a distribuição de probabilidades
lambda <- 6
n <- 3

# a. Qual é a probabilidade de 3 clientes pararem qualquer hora?
dpois(n, lambda)

# b. Qual é a probabilidade de 3 clientes ou menos pararem em qualquer hora?
ppois(n, lambda) # ou sum(dpois(0:n, lambda))
# ppois é a função de distribuição acumulada

# c. Qual é o valor esperado, a média, e o desvio padrão para esta distribuição?
E <- lambda
E

var_1 <- lambda
standard_deviation <- sqrt(var_1)
standard_deviation
