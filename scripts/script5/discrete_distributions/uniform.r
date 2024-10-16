# Questão 1: ============================================================
# Uma máquina pode apresentar 5 tipos diferentes de defeitos,
# que ocorrem aproximadamente na mesma frequência.
# Dependendo do tipo de defeito, o técnico leva 1, 2, 3, 4 ou 5 horas
# para consertar a máquina.

# O modelo probabilístico apropriado para representar a duração
# do tempo de reparo da máquina, é dado por

# ---------------------------------------------------------------
# | Tempo de reparo (t = horas) | 1 | 2 | 3 | 4 | 5 |
# ---------------------------------------------------------------
# | Probabilidade (P(T = t))    | 1/5 | 1/5 | 1/5 | 1/5 | 1/5 |

# a) Qual é o tempo médio de reparo da máquina?

# Definindo a distribuição de probabilidades
p <- 1 / 5
n <- 5
t <- 1:n

# Calculando a esperança

E <- sum(t * p)
E
E_2 <- (5 + 1) / 2
E_2

# b) Qual o desvio padrão do tempo médio de reparo da máquina?

# Calculando a variância
var_1 <- sum((t - E)^2 * p) # Fórmula: Var(X) = p.q
var_1

standard_deviation <- sqrt(var_1)
standard_deviation

# c) São 15 horas e acaba de ser entregue uma máquina para reparo.
# A jornada normal de trabalho do técnico termina às 17 horas.
# Qual é aprobabilidade de que o técnico não precise fazer hora extra
# para terminar o conserto desta máquina?

# Seja NE o evento “técnico não vai ter que fazer hora extra".
# P(NE) = P(T <= 2) = P(T = 1) + P(T = 2)

p_ne <- 1 / 5 + 1 / 5
p_ne
