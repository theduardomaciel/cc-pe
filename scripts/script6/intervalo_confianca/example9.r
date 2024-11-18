# Intervalo de Confiança para Proporção Amostral

# Considere testes de vazamentos identificados em dois municípios A e B.
# No município A foram examinados 500 edifícios e em 100 apresentaram falhas.
# No B foram examinados 1000 edifícios e em 300 apresentaram falhas.

# a) Construir um intervalo com nível confiança de 95% para o município A.

alfa <- 0.05 # 1 - 0.95
n <- 500
p <- 100 / 500

zc <- qnorm(1 - alfa / 2, mean = 0, sd = 1)
zc <- round(zc, 2)
zc

# erro <- "erro padrão"
# fórmula do erro padrão para proporção: $$\sqrt{\frac{p \cdot (1 - p)}{n}}$$
erro <- zc * sqrt(p * (1 - p) / n)
erro <- round(erro, 5)
erro

cat("Intervalo de confiança (A): (", p - erro, ", ", p + erro, ")\n")
prop.test(x = 100, n = 500, conf.level = 0.95)

# b) Construir um intervalo com nível confiança de 95% para o município B.

n <- 1000
p <- 300 / 1000

zc <- qnorm(1 - alfa / 2, mean = 0, sd = 1)
zc <- round(zc, 2)

erro <- zc * sqrt(p * (1 - p) / n)
erro <- round(erro, 5)

cat("Intervalo de confiança (B): (", p - erro, ", ", p + erro, ")\n")
prop.test(x = 300, n = 1000, conf.level = 0.95)
