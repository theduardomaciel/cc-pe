# Intervalo de confiança (Variância DESCONHECIDA)

# Em um processo para obtenção de compostos químicos de tintas,
# obteve-se os seguintes tempos: 90, 92, 92, 95, 98, 99, 100, 100, 100 e 117 segundos.

# a) Construir um intervalo com nível confiança de 95%.

valores <- c(90, 92, 92, 95, 98, 99, 100, 100, 100, 117)
alfa <- 0.05 # 1 - 0.95 = 0.05

n <- length(valores)
media <- mean(valores)
desvio <- sd(valores)

# tc = "t critico"
# qt: retorna o inverso da função de distribuição acumulada (cdf) da distribuição t de Student
# - p: probabilidade
# - df: graus de liberdade/nível de confiança

tc <- qt(p = 1 - alfa / 2, df = n - 1)
tc <- round(tc, 3)
tc

erro <- tc * desvio / sqrt(n)
erro <- round(erro, 3)
erro

cat("Intervalo de confiança: (", media - erro, ", ", media + erro, ")\n")

# Alternativa
# Link útil: https://www.geeksforgeeks.org/a-guide-to-dt-qt-pt-rt-in-r/

alfa_2 <- (5 / 100) / 2

q1 <- qt(p = alfa_2, df = n - 1)
q2 <- qt(p = 1 - alfa_2, df = n - 1)

ic_inf <- media + q1 * desvio / sqrt(n)
ic_sup <- media + q2 * desvio / sqrt(n)

cat("Intervalo de confiança (2): (", ic_inf, ", ", ic_sup, ")\n")
cat("q1: ", q1, ", q2=", q2, "\n")

# b) Calcular o número de elementos para estimar a média com 95% de confiança e
# erro amostral de 0,4 seg

# média amostral
media <- mean(valores)

# variância amostral
desvio <- sd(valores)
variancia <- var(valores)
graus_liberdade <- n - 1

# erro máximo
erro_max <- 0.4

# t crítico
tc <- qt(p = 1 - alfa / 2, df = graus_liberdade)

# tamanho da amostra
n <- (tc * desvio / erro_max)^2

cat("Tamanho da amostra: ", round(n, 0), "\n")

# c) Qual o tamanho da amostra para que o erro máximo seja de 2 segundos?

erro_max <- 2

n <- (tc * desvio / erro_max)^2
n <- round(n, 0)

cat("Tamanho da amostra: ", n, "\n")

# d) Qual o nível de confiança para que o erro máximo seja de 2 segundos?

erro_max <- 2

n <- 10
n <- n - 1

alfa <- 2 * erro_max / (tc * desvio / sqrt(n))
alfa <- round(alfa, 3)

cat("Nível de confiança: ", 1 - alfa, "\n")
