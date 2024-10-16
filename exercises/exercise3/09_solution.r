# Em um município 70% da população são favoráveis a um certo projeto.
# Se uma amostra de 5 pessoas for retirada dessa população,
# qual a probabilidade de exatamente 3 pessoas serem favoráveis a projeto?

# Temos uma: Distribuição Binomial
# A distribuição binomial é uma distribuição de probabilidade discreta que descreve
# o número de sucessos em uma sequência de n tentativas.

# Definindo a distribuição de probabilidades
p <- 0.7
n <- 5

# Qual a probabilidade de exatamente 3 pessoas serem favoráveis a projeto?
dbinom(3, size = n, prob = p)
