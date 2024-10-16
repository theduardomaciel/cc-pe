# Questão 1: ============================================================

# Uma urna tem 30 bolas brancas e 20 verdes. Retira-se uma bola dessa urna
# Seja X o número de bolas verdes. Calcule:

# a) P(X)

# Definindo a distribuição de probabilidades
p <- 20 / 50
n <- 1
x <- 0:n

px <- dbinom(x, n, p)
for (i in seq_along(x)) {
    cat("P(X =", x[i], ") =", px[i], "\n")
}

# b) E(X)

# Calculando a esperança
E <- sum(x * px)
E

# c) Var(X)

# Calculando a variância
var_1 <- sum((x - E)^2 * px) # Fórmula: Var(X) = p.q
var_1
var_2 <- p * (1 - p)
var_2
