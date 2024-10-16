# Exemplo 1 ================================================================
# Suponha que a duração de um telefonema, em minutos, em uma cabine telefônica,
# seja uma variável aleatória exponencial com parâmetro = 1/5.
# Se alguém chega logo na sua frente em uma cabine telefônica, determine:

# ---- a) A probabilidade de que você tenha que esperar exatamente 5 minutos
dexp(5, rate = 1 / 5)

# ---- b) A probabilidade de que você tenha que esperar mais de 10 minutos
# P(X >= 10) = 1 - F(10)

1 - pexp(10, rate = 1 / 5)
pexp(10, rate = 1 / 5, lower.tail = FALSE)

# Exemplo 2 ================================================================
# Suponha que o tempo de espera para realizar um exame qualquer em uma
# determinada clinica tenha distribuição exponencial, com média de três dias.

# ---- a) Qual a probabilidade de alguém esperar mais de 2 dias?
# E(X) = 3, portanto, λ = 1/3
# P(X > 2) = 1 - F(2)

1 - pexp(2, rate = 1 / 3)
pexp(2, rate = 1 / 3, lower.tail = FALSE)

# ---- b) Qual a probabilidade de alguém esperar entre 2 e 4 dias?
# F(2 < X < 4) = F(4) - F(2)

pexp(4, rate = 1 / 3) - pexp(2, rate = 1 / 3)

# Exemplo 3 ================================================================
# Suponha que X tenha uma distribuição exponencial, com λ=2. Determine:

# ---- a) P(X <= 0)
pexp(0, rate = 2)

# ---- b) P(X <= 1)
pexp(1, rate = 2)

# Plotando a distribuição exponencial

x <- seq(0, 10, by = 0.1)
y <- dexp(x, rate = 2)

plot(x, y,
    type = "l",
    lwd = 2,
    col = "black",
    xlab = "Tempo (dias)",
    ylab = "Densidade",
    main = "Tempo entre exames"
)

# ---- c) P(x ≥ 2)
# P(X >= 2) = 1 - F(2)
1 - pexp(2, rate = 2)
pexp(2, rate = 2, lower.tail = FALSE)

# ---- d) P(1 < X < 2)
# P(1 < X < 2) = F(2) - F(1)
pexp(2, rate = 2) - pexp(1, rate = 2)

# ---- e) Encontre o valor de x tal que a P(X < x) = 0.05
qexp(0.05, rate = 2)

# Exemplo 4 ================================================================
# Uma companhia fabrica lâmpadas especiais com uma
# duração média de 100 horas e com distribuição exponencial.

# ---- a) Qual deve ser a garantia do fabricante para repor apenas 5% da produção?
# P(X < x) = 0.05
# x = 100 horas
qexp(0.05, rate = 1 / 100)

# ---- b) Qual a probabilidade de uma lâmpada durar de 163 a 185 horas
# P(163 < X < 185) = F(185) - F(163)
pexp(185, rate = 1 / 100) - pexp(163, rate = 1 / 100)

# Exemplo 5 ================================================================
# O tempo médio de vida de um transistor ́é de 500 horas,
# seguindo uma distribuição exponencial

# ---- a) Calcule a probabilidade do transistor durar mais que 500 horas.
# P(T > 500) = 1 - F(500)
1 - pexp(500, rate = 1 / 500)
pexp(500, rate = 1 / 500, lower.tail = FALSE)

# ---- b) Calcule a probabilidade do transistor durar entre 300 e 1000 horas.
# P(300 < T < 1000) = F(1000) - F(300)
pexp(1000, rate = 1 / 500) - pexp(300, rate = 1 / 500)

# Exemplo 6
# Uma fábrica tem uma média de 3 falhas por dia em suas máquinas.
# Supondo que as falhas sigam uma distribuição de Poisson:

# λ = 3 -> média de falhas por dia

# ---- a) Qual a probabilidade de que ocorram mais de 4 falhas em um dia?
ppois(4, lambda = 3, lower.tail = FALSE)

# ----  b)  Qual a probabilidade de que o tempo entre as falhas seja
#       superior a 8 horas?

# P(X > 8) = 1 - F(8)
# Como nossa taxa está por dia, precisamos converter 8 horas para dias (8/24)
pexp(8 / 24, rate = 3, lower.tail = FALSE)
1 - pexp(8 / 24, rate = 3)

# Exemplo 7 ================================================================
# Um call center recebe, em média, 15 chamadas por hora.
# Assumindo que as chamadas seguem uma distribuição de Poisson, calcular:

# λ = 15 chamadas por HORA

# ---- a) A probabilidade de que cheguem exatamente 10 chamadas em 40 minutos
# λ = 15 chamadas por hora
# 40 minutos em horas = 40/60 = 2/3 horas
dpois(10, lambda = 15 * 40 / 60)

# ----  b) A probabilidade de que o tempo até a próxima chamada seja superior a
#       5 minutos?

# P(X > 5) = 1 - F(5)
# Convertendo 5 minutos para horas (5/60), cisto que a taxa está em chamadas por hora
pexp(5 / 60, rate = 15, lower.tail = FALSE)

# Exemplo 8 ================================================================
# Suponha uma empresa está acompanhando o tempo útil das lâmpadas e
# que tem distribuição exponencial, com média = 100 horas e deseja calcular

# ---- a) Qual a probabilidade de uma lâmpada queimar no intervalo P( 0 < t ≤ 10 )?
# Média = 100 horas, portanto, λ = 1/100
# P(0 < X ≤ 10) = F(10) - F(0)
pexp(10, rate = 1 / 100)

# ---- b) Qual a probabilidade de uma lâmpada queimar no intervalo P( 100 < t ≤ 110 )?
# P(100 < X ≤ 110) = F(110) - F(100)
pexp(110, rate = 1 / 100) - pexp(100, rate = 1 / 100)

# ----  c) Qual a probabilidade de uma lâmpada queimar no intervalo entre 100 e 110 horas,
#       sabendo que já durou 100 horas?

# P(A | B) = P(A ∩ B) / P(B)

# P(A) = P(100 < X ≤ 110) = F(110) - F(100)
pexp(110, rate = 1 / 100) - pexp(100, rate = 1 / 100)

# P(B) = P(X > 100) = 1 - F(100)
pexp(100, rate = 1 / 100, lower.tail = FALSE)
# ou: 1 - pexp(100, rate = 1 / 100)

# P(A ∩ B) = P(100 < X ≤ 110) = F(110) - F(100)
# já calculado

# P(A | B) = P(A ∩ B) / P(B)
(pexp(110, rate = 1 / 100) - pexp(100, rate = 1 / 100)) / (1 - pexp(100, rate = 1 / 100))
