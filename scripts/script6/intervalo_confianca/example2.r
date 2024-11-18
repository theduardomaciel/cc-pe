# Intervalo de confiança (Variância CONHECIDA)

# Uma máquina produz rolamentos que apresentam desvio padrão de 0,042 polegadas em seu diâmetro.
# Desejando-se conhecer o diâmetro médio dos rolamentos produzidos por esta máquina, extraiu-se
# uma amostra de 100 rolamentos, observando-se uma média igual a 0,824 polegadas.
# Obter o intervalo com 0,90 de confiança para o verdadeiro diâmetro médio dos rolamentos.

# A indústria Brasileira, historicamente, produz multímetros com desvio padrão
# igual a 3.0 μV Um lote de 18 multímetros, para verificação de qualidade, resultou em
# medição de 4,7 μV.

# a) Construir um intervalo com nível confiança de 98%.

alfa <- 0.02
desvio <- 3.0
media <- 4.7
n <- 18

# zc = "z critico"
zc <- qnorm(1 - alfa / 2, mean = 0, sd = 1)
zc <- round(zc, 2)
zc

erro <- zc * desvio / sqrt(n)
erro <- round(erro, 2)
erro

cat("Intervalo de confiança: (", media - erro, ", ", media + erro, ")\n")

# b) Construir um intervalo com nível confiança de 90%.

alfa <- 0.10
desvio <- 3.0
media <- 4.7

# zc = "z critico"
zc <- qnorm(1 - alfa / 2, mean = 0, sd = 1)
zc <- round(zc, 2)
zc

erro <- zc * desvio / sqrt(n)
erro <- round(erro, 2)
erro

cat("Intervalo de confiança: (", media - erro, ", ", media + erro, ")\n")
