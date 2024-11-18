# Foram realizados testes glicêmicos em 25 pacientes após um jejum de 8 horas.
# Os resultados são apresentados na tabela abaixo.

# | Teste Glicêmico (mg/dL) |
# |-------------------------|
# | 80 | 118 | 100 |  90 | 83 |
# | 117 | 95 | 84 | 102 | 80 |
# | 112 | 78 | 102 | 121 | 82 |
# | 77 | 88 | 73 | 104 | 88
# | 132 | 91 | 103 | 140 | 101 |

# a) Encontrar um intervalo de confiança de nível de 95 % para a média μ.

# Cálculo da média e o desvio amostral

alfa <- 0.05 # 1 - 0.95
valores <- c(
    80, 118, 100, 90, 83,
    117, 95, 84, 102, 80,
    112, 78, 102, 121, 82,
    77, 88, 73, 104, 88,
    132, 91, 103, 140, 101
)
n <- length(valores)

tc <- qt(p = 1 - alfa / 2, df = n - 1)
tc <- round(tc, 5)

media <- mean(valores)
desvio <- sd(valores)

erro <- tc * desvio / sqrt(n)
erro <- round(erro, 5)
erro

cat("Intervalo de confiança: (", media - erro, ", ", media + erro, ")\n")

# Teste

# $$e_0 = t.\frac{s}{\sqrt{n}}$$
t.test(valores, conf.level = 0.95)
