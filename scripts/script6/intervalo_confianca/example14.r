# Intervalo de Confiança para Variância

# Se uma amostra de tamanho 20, a média e o desvio padrão são X=1,25 e S = 0,25.

# Dados do problema
n <- 20
x <- 1.25
s <- 0.25

# a) Construir um intervalo de confiança para de 99% para σ^2
alpha <- 0.01 # nível de significância (1 - 0.99 = 0.01)

s2 <- s^2 # Variância amostral

q1 <- qchisq(1 - alpha / 2, df = n - 1) # Quantil da distribuição Qui-Quadrado
q1

q2 <- qchisq(alpha / 2, df = n - 1) # Quantil da distribuição Qui-Quadrado
q2

cat(
    "Intervalo de Confiança para a Variância com 99% de confiança: (",
    (n - 1) * s2 / q1, ",", (n - 1) * s2 / q2, ")\n"
)
