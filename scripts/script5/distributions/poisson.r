# Questão 1: ============================================================
# Numa central telefônica chegam 300 telefonemas por hora. Qual a probabilidade de que:
rate_in_minutes <- 300 / 60

# a) Em um minuto, não chegue nenhum telefonema?

dpois(0, lambda = rate_in_minutes)

# b) Em 2 minutos, hajam 2 telefonemas?

# Como a taxa de chegada é de 300 telefonemas por hora (300 / 60 = 5),
# a taxa de chegada em 2 minutos é de 5 * 2 = 10 telefonemas.

dpois(2, lambda = rate_in_minutes)

# c) Qual a probabilidade da capacidade da mesa (central telefônica) ser ultrapassada,
# sabendo que a mesa processa, no máximo, 10 ligações por minuto.

1 - ppois(10, lambda = rate_in_minutes)
ppois(10, lambda = rate_in_minutes, lower.tail = FALSE)

# Questão 2: ============================================================
# Chegam caminhões a um depósito à razão de 2,8 caminhões/hora, segundo uma
# distribuição de Poisson.
# Determine a probabilidade de chegarem dois (2) ou mais caminhões:
rate <- 2.8

# a) Em 0,5 hora.

# Probabilidade de 2 ou mais
1 - (dpois(0, lambda = rate * 0.5) + dpois(1, lambda = rate * 0.5))
1 - ppois(1, lambda = rate * 0.5)
ppois(1, lambda = rate * 0.5, lower.tail = FALSE)

# b) Em 1 hora.

# Probabilidade de 2 ou mais
1 - (dpois(0, lambda = rate) + dpois(1, lambda = rate))
1 - ppois(1, lambda = rate)
ppois(1, lambda = rate, lower.tail = FALSE)

# c) Em 2 horas.

# Probabilidade de 2 ou mais
1 - (dpois(0, lambda = rate * 2) + dpois(1, lambda = rate * 2))
1 - ppois(1, lambda = rate * 2)
ppois(1, lambda = rate * 2, lower.tail = FALSE)

# Questão 3: ============================================================
# A média de alunos aprovados em uma disciplina é 23 alunos.

# X: Números de alunos aprovados em uma disciplina.
# λ: 23 alunos.

# a) Qual a probabilidade de aprovar 17 alunos?

dpois(17, lambda = 23)

# b) Qual a probabilidade de aprovar 25 alunos?

dpois(25, lambda = 23)

plot(0:50,
    dpois(0:50, lambda = 23),
    type = "h",
    lwd = 2,
    col = "blue",
    xlab = "Número de alunos aprovados",
    ylab = "Probabilidade",
    main = "Distribuição de Poisson"
)
abline(h = 0.05, col = "red", lty = 2)
abline(v = 17, col = "green", lty = 2)

# c) Qual a probabilidade de até (ou "no máximo") 19 alunos serem aprovados?

ppois(19, lambda = 23)

# d) Qual a probabilidade de mais de 19 alunos serem aprovados?

ppois(19, lambda = 23, lower.tail = FALSE)
1 - ppois(19, lambda = 23)
ppois(19, lambda = 23) + ppois(19, lambda = 23, lower.tail = FALSE) # tem como resultado: 1

# e) Qual a quantidade de aprovados se a probabilidade acumulada for de 80%?

qpois(0.8, lambda = 23)

# Questão 4: ============================================================
# O número de mortes por afogamento em fins de semana, numa cidade praiana,
# é de 2 para cada 50.000 habitantes. Qual a probabilidade de que em:

rate <- 2 / 50000

# a) 200.000 habitantes, ocorram 5 mortes por afogamento?
# X: Número de afogamentos por habitantes.

# P(X = 5)
dpois(5, lambda = rate * 200000)

# b) 112.500 habitantes, ocorram pelo menos 3 mortes por afogamento?

# P(X >= 3)
rate <- rate * 112500
1 - (dpois(0, lambda = rate) + dpois(1, lambda = rate) + dpois(2, lambda = rate))
1 - ppois(2, lambda = rate)
1 - sum((dpois(0:2, lambda = rate)))
ppois(2, lambda = rate, lower.tail = FALSE)

# Questão 5: ============================================================
# Suponha que 150 erros de impressão são distribuídos aleatoriamente em um livro de 200 páginas.
# Encontre a probabilidade de que em 2 páginas contenham:

rate <- 150 / 200

# a) nenhum erro de impressão.
dpois(0, lambda = rate * 2) # multiplicado por 2, pois são 2 páginas

# b) três erros de impressão.
dpois(3, lambda = rate * 2)

# c) um (1) ou mais erros de impressão.
1 - dpois(0, lambda = rate * 2)
ppois(0, lambda = rate * 2, lower.tail = FALSE)

# Questão 6: ============================================================
# Certa loja recebe, em média, 5 clientes por hora, segundo o modelo Poisson.
# Qual a probabilidade de

rate <- 5 / 60 # 5 clientes por hora

# a) receber dois (2) clientes em 24 minutos?

dpois(2, lambda = rate * 24)

# b) receber pelo menos três (3) clientes em 18 minutos?

rate <- rate * 18

# P(X >= 3) = 1 - P(X < 3) = 1 - P(X <= 2) = 1 - (P(X = 0) + P(X = 1) + P(X = 2))
1 - (dpois(0, lambda = rate) + dpois(1, lambda = rate) + dpois(2, lambda = rate))
1 - sum((dpois(0:2, lambda = rate)))
ppois(2, lambda = rate, lower.tail = FALSE)
1 - ppois(2, lambda = rate)

# Questão 7: ============================================================
# Experiências passadas indicam que o número de ligações recebidas,
# no período noturno, em uma central telefônica segue uma distribuição de Poisson.
# As probabilidades de receber chamadas por hora estão apresentadas na tabela a seguir:

# ------------------------------------------------
# Número de ligações | Probabilidade
# ------------------------------------------------
# 0                  | 0,0111
# 1                  | 0,0500
# 2                  | 0,1125
# 3                  | 0,1687
# 4                  | 0,1898
# 5                  | 0,1708

# a) Qual a probabilidade de receber 3 ou mais chamadas em uma hora?

# P(X >= 3) = P(X = 3) + P(X = 4) + P(X = 5) + ... [soma infinita]
# P(X >= 3) = 1 - P(X < 3) = 1 - P(X <= 2) = 1 - (P(X = 0) + P(X = 1) + P(X = 2))

1 - (0.0111 + 0.0500 + 0.1125)

?dbinom

?dpois
