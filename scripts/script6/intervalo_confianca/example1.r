# Intervalo de confiança (Variância CONHECIDA)

# Uma máquina produz rolamentos que apresentam desvio padrão de 0,042 polegadas em seu diâmetro.
# Desejando-se conhecer o diâmetro médio dos rolamentos produzidos por esta máquina, extraiu-se
# uma amostra de 100 rolamentos, observando-se uma média igual a 0,824 polegadas.
# Obter o intervalo com 0,90 de confiança para o verdadeiro diâmetro médio dos rolamentos.

alfa <- 0.10
desvio <- 0.042
media <- 0.824
n <- 100

# qnorm: distribuição normal padrão
zc <- qnorm(1 - alfa / 2, mean = 0, sd = 1)
zc <- round(zc, 2)
zc

erro <- zc * desvio / sqrt(n)
erro <- round(erro, 5)
erro

cat("Intervalo de confiança: (", media - erro, ", ", media + erro, ")\n")
