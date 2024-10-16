# Em uma rede de computadores, em 60% dos dias ocorre alguma falha.
# Construir a distribuição de probabilidades e calcular a esperança para a variável aleatória
# X = número de dias com falha na rede, considerando o período de observação de 3 dias.
# Suponha que os eventos são independentes.

# Temos uma: Distribuição Binomial
# A distribuição binomial é uma distribuição de probabilidade discreta que descreve
# o número de sucessos em uma sequência de n tentativas.

# Definindo a distribuição de probabilidades
p <- 0.6
n <- 3
x <- 0:n # Falhas em 0, 1, 2 e 3 dias

px <- dbinom(x, n, p)
for (i in seq_along(x)) {
    cat("P(X =", x[i], ") =", px[i], "\n")
}

# Calculando a esperança
E <- sum(x * px)
E
