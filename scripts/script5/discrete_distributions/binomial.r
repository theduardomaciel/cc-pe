# Questão 1: ============================================================

# Considere uma prova com 10 questões e com quatro opções de resposta.
# Calcule a probabilidade de alguém, no chute, acertar 4 questões.

# p = 0.25 (probabilidade de sucesso)
# q = 0.75 (probabilidade de fracasso)
# n = 10 (número de tentativas)
# Notação do problema: X ~ B(10, 0.25)

dbinom(4, size = 10, prob = 0.25)

# Questão 2: ============================================================

# A probabilidade de ocorrência de turbulência em um determinado
# percurso a ser feito por uma aeronave é de 0,4 em um circuito diário.

# Seja X o número de voos com turbulência em um total de 7 desses voos
# (ou seja, uma semana de trabalho).

# p = 0.4 (probabilidade de sucesso)
# q = 0.6 (probabilidade de fracasso)
# n = 7 (número de tentativas)

# Notação do problema: X ~ B(7, 0.4)

# Qual a probabilidade de que:

# a) Não ocorra turbulência em nenhum dos voos?
dbinom(7, 7, prob = 0.6)
dbinom(0, 7, prob = 0.4)

# b) Haja turbulência em pelo menos 3 voos?

# P(X >= 3) = 1 - P(X <= 2) = 1 - (P(X = 0) + P(X = 1) + P(X = 2))
1 - (dbinom(0, 7, prob = 0.4) + dbinom(1, 7, prob = 0.4) + dbinom(2, 7, prob = 0.4))

1 - sum(dbinom(0:2, 7, prob = 0.4)) # somamos as probabilidades de 0, 1 e 2 voos com turbulência

1 - pbinom(2, 7, prob = 0.4) # pbinom calcula a probabilidade acumulada

pbinom(7, 7, prob = 0.4) - pbinom(2, 7, prob = 0.4) # pbinom(7, 7, prob = 0.4) é igual a 1

# lower.tail = FALSE calcula a probabilidade acumulada a partir
# do valor informado (excluindo-o), e removendo o que está à esquerda
pbinom(2, 7, prob = 0.4, lower.tail = FALSE)

# Questão 3: ============================================================
# Vasco e Botafogo jogam entre si 6 vezes.

# n = 6 (número de jogos)
# p = 1/3 (probabilidade de sucesso - empate conta como derrota)
# q = 2/3 (probabilidade de fracasso)

# a) Qual a probabilidade do Vasco vencer 4 jogos?
# k = 4 (número de sucessos do Vasco)

dbinom(4, size = 6, prob = 1 / 3)

# b) Qual a probabilidade do Vasco não vencer nenhuma (0) partida?
# k = 0 (número de sucessos do Vasco)

dbinom(0, size = 6, prob = 1 / 3)

# c) Qual a probabilidade do Vasco vencer no máximo duas (2) partidas?

# n = 6
# k = 0, 1, 2

sum(dbinom(0:2, size = 6, prob = 1 / 3))
dbinom(0, size = 6, prob = 1 / 3) +
    dbinom(1, size = 6, prob = 1 / 3) +
    dbinom(2, size = 6, prob = 1 / 3)
pbinom(2, size = 6, prob = 1 / 3)

# d) Qual a probabilidade do Vasco vencer pelo menos 3 partidas?

# n = 6
# k = 3, 4, 5, 6

# P(X >= 3) = 1 - P(X <= 2) = 1 - (P(X = 0) + P(X = 1) + P(X = 2))
1 - (dbinom(0, size = 6, prob = 1 / 3) +
    dbinom(1, size = 6, prob = 1 / 3) +
    dbinom(2, size = 6, prob = 1 / 3))

# P(X >= 3) = P(X = 3) + P(X = 4) + P(X = 5) + P(X = 6)
dbinom(3, size = 6, prob = 1 / 3) +
    dbinom(4, size = 6, prob = 1 / 3) +
    dbinom(5, size = 6, prob = 1 / 3) +
    dbinom(6, size = 6, prob = 1 / 3)

# P(X >= 3) = 1 - P(X <= 2)
pbinom(6, size = 6, prob = 1 / 3) - pbinom(2, size = 6, prob = 1 / 3) # pbinom(6, 6, 1/3) = 1

# P(X >= 3) (lower.tail = FALSE) = 1 - P(X <= 2)
pbinom(2, size = 6, prob = 1 / 3, lower.tail = FALSE)

# e) Mostre todos os resultados, considerando como sucesso o Vasco ganhar.

for (i in 0:6) { # ou 1:7
    cat("P(X =", i, ") =", dbinom(i, size = 6, prob = 1 / 3), "\n")
}

barplot(
    dbinom(0:6,
        size = 6,
        prob = 1 / 3
    ),
    names.arg = 0:6,
    col = "lightblue",
    xlab = "Número de vitórias do Vasco",
    ylab = "Probabilidade",
    main = "Distribuição Binomial"
)

for (i in 0:6) {
    cat("P(X <= ", i, ") =", pbinom(i, size = 6, prob = 1 / 3), "\n")
}

barplot(
    pbinom(0:6,
        size = 6,
        prob = 1 / 3
    ),
    names.arg = 0:6,
    col = "lightblue",
    xlab = "Número de vitórias do Vasco",
    ylab = "Probabilidade",
    main = "Distribuição Binomial Acumulada"
)

# Função dbinom calcula a probabilidade de X = k
dbinom(0:6, size = 6, prob = 1 / 3)

# Função pbinom calcula a probabilidade acumulada de X <= k
pbinom(0:6, size = 6, prob = 1 / 3)

# Questão 4: ============================================================

# Uma moeda é lançada 6 vezes, encontre a probabilidade de

# a) Ocorrer 4 coroas
dbinom(4, size = 6, prob = 0.5)

# b) Ocorrer pelo menos 2 coroas
1 - sum(dbinom(0:1, size = 6, prob = 0.5))
1 - pbinom(1, size = 6, prob = 0.5)
pbinom(1, size = 6, prob = 0.5, lower.tail = FALSE)

# c) Ocorrer no máximo 3 coroas
pbinom(3, size = 6, prob = 0.5)

dbinom(0:6, size = 6, prob = 0.5)
pbinom(0:6, size = 6, prob = 0.5)
