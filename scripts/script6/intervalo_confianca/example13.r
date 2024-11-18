# Intervalo de Confiança para Variância

# Foi observado pacientes de uma determinada clínica para tratamento de sobrepeso.
# A variável aleatória peso do paciente, supõe ter distribuição Normal.
# Pretende-se estudar a variabilidade do peso dos referidos pacientes.
# Para isso, uma amostra, cujos valores em kg são:
# 98, 97, 102, 100, 98, 101, 102, 105, 95, 102, 100.

# Dados do problema
peso <- c(98, 97, 102, 100, 98, 101, 102, 105, 95, 102, 100)
n <- length(peso)
alpha <- 0.05 # nível de significância (1 - 0.95 = 0.05)

# a) Gerar o IC para a Variância com nível de confiança de 95%
# IC = intervalo de confiança

s2 <- var(peso) # Variância amostral

q1 <- qchisq(1 - alpha / 2, df = n - 1) # Quantil da distribuição Qui-Quadrado
q1

q2 <- qchisq(alpha / 2, df = n - 1) # Quantil da distribuição Qui-Quadrado

cat(
    "Intervalo de Confiança para a Variância com 95% de confiança: (",
    (n - 1) * s2 / q1, ",", (n - 1) * s2 / q2, ")\n"
)
