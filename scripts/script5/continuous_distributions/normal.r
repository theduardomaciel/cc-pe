# Exemplo 1 ================================================================
# Se dissermos que a altura média do homem brasileiro adulto é de
# 1,70m e o desvio padrão é de 5 cm, estaremos dizendo que:

ex_mean <- 1.70
ex_sd <- 0.05

# 1 - 68% da população masculina adulta encontra-se entre 1,65 m e 1,75 m

# Medidas em metros -> 5cm = 0.05m
pnorm(1.75, mean = ex_mean, sd = ex_sd) - pnorm(1.65, mean = ex_mean, sd = ex_sd)

# O z corresponde ao número de desvios padrão que x está da média
# z = (x - μ) / σ

z1 <- (1.65 - ex_mean) / ex_sd
z1
z2 <- (1.75 - ex_mean) / ex_sd
z2

# Média 0 e desvio padrão 1 são os valores padrão
norm1 <- pnorm(z2, mean = 0, sd = 1) - pnorm(z1, mean = 0, sd = 1)

# 2 - 95% da população masculina adulta encontra-se entre 1,60m e 1,80m

pnorm(1.80, mean = ex_mean, sd = ex_sd) - pnorm(1.60, mean = ex_mean, sd = ex_sd)

z1 <- (1.60 - ex_mean) / ex_sd
z1
z2 <- (1.80 - ex_mean) / ex_sd
z2

norm2 <- pnorm(z2, mean = 0, sd = 1) - pnorm(z1, mean = 0, sd = 1)

# 3 - 99,7% da população masculina adulta encontra-se entre 1,55m e 1,85m

pnorm(1.85, mean = ex_mean, sd = ex_sd) - pnorm(1.55, mean = ex_mean, sd = ex_sd)

z1 <- (1.55 - ex_mean) / ex_sd
z1
z2 <- (1.85 - ex_mean) / ex_sd
z2

norm3 <- pnorm(z2, mean = 0, sd = 1) - pnorm(z1, mean = 0, sd = 1)

# Gráficos

# Curva normal padrão

x <- seq(155, 185, 0.01)
y <- dnorm(x, mean = ex_mean * 100, sd = ex_sd * 100)

plot(x, y,
    type = "l",
    lwd = 2,
    col = "black",
    xlab = "Altura (cm)",
    ylab = "Densidade",
    main = "Distribuição Normal"
)

# Área sob a curva entre 1,55m e 1,85m

x <- seq(155, 185, 0.01)
y <- dnorm(x, mean = ex_mean * 100, sd = ex_sd * 100)

polygon(c(155, x, 185), c(0, y, 0), col = "yellow")

# Área sob a curva entre 1,60m e 1,80m

x <- seq(160, 180, 0.01)
y <- dnorm(x, mean = ex_mean * 100, sd = ex_sd * 100)

polygon(c(160, x, 180), c(0, y, 0), col = "green")

# Área sob a curva entre 1,65m e 1,75m

x <- seq(165, 175, 0.01)
y <- dnorm(x, mean = ex_mean * 100, sd = ex_sd * 100)

polygon(c(165, x, 175), c(0, y, 0), col = "red")
# text(170, 0.05, round(norm1, 4), cex = 1)

# Legenda com a área sob a curva de cada intervalo

legend("topright",
    legend = c(
        paste(round(norm1, 4) * 100, "%"),
        paste(round(norm2, 4) * 100, "%"),
        paste(round(norm3, 4) * 100, "%")
    ),
    fill = c("red", "green", "yellow"),
    title = "Intervalos",
    cex = 0.8
)

# Distribuição Normal Padronizada

# Distribuição de X: normal com μ = 170 e σ = 10
# Distribuição de Z: normal padrão
# P(X > 180) = P(Z > 1)
# z = (x - μ) / σ = $$ \frac{180 - 170}{10} = 1 $$

# Para um valor x = μ, corresponde z = 0 na distribuição normal padrão/reduzida
# Para x = μ + σ, tem-se z = 1, e assim por diante

x_default <- seq(140, 200, 0.01)
y_default <- dnorm(x_default, mean = 170, sd = 10)

x_normal <- seq(-3, 3, 0.01)
y_norma <- dnorm(x, mean = 0, sd = 1)

# Gerar dois gráficos, um para X e outro para Z
# Separar curva em setores de linhas verticais no eixo x, para facilitar a visualização
# Preenchimento em X > 180 e Z > 1

par(mfcol = c(1, 2))

plot(x_default, y_default,
    type = "l",
    lwd = 2,
    col = "black",
    xlab = "Altura (cm)",
    ylab = "Densidade",
    main = "Distribuição Normal"
)

polygon(c(180, x_default[x_default > 180], 200), c(0, y_default[x_default > 180], 0), col = "red")

# Linhas verticais separando setores

abline(v = c(170, 180), lty = 2)

plot(x_normal, y_norma,
    type = "l",
    lwd = 2,
    col = "black",
    xlab = "Z",
    ylab = "Densidade",
    main = "Distribuição Normal Padronizada"
)

polygon(c(1, x[x > 1], 3), c(0, y[x > 1], 0), col = "red")

# Linhas verticais separando setores

abline(v = c(0, 1), lty = 2)

# Calculemos o exemplo anterior com a Distribuição Normal Padronizada

pnorm(1) - pnorm(-1) # P(Z > 1) = P(Z ≤ 1) - P(Z ≤ -1)
# equivalente a: pnorm(175, mean = 170, sd = 5) - pnorm(165, mean = 170, sd = 5)

pnorm(2) - pnorm(-2) # P(Z > 2) = P(Z ≤ 2) - P(Z ≤ -2)
# equivalente a: pnorm(180, mean = 170, sd = 5) - pnorm(160, mean = 170, sd = 5)

pnorm(3) - pnorm(-3) # P(Z > 3) = P(Z ≤ 3) - P(Z ≤ -3)
# equivalente a: pnorm(185, mean = 170, sd = 5) - pnorm(155, mean = 170, sd = 5)

# Exemplo 2 ================================================================
# Os resultados do experimento formam uma VA com distribuição normal,
# com média 40 e desvio padrão 10.

# ---- a) Qual a probabilidade de um resultado ser menor ou igual a 50?

# P(X < 50) = P(Z <= 1) = ?
# z = (x - μ) / σ = (50 - 40) / 10 = 1

pnorm(50, mean = 40, sd = 10, lower.tail = TRUE) # equivale a: pnorm(50, 40, 10)
pnorm(1, mean = 0, sd = 1, lower.tail = TRUE) # equivale a: pnorm(1)

# Plotamos a distribuição normal para visualizar a área sob a curva

x <- seq(10, 70, 0.01) # ou: seq(5, 75)
y <- dnorm(x, mean = 40, sd = 10)

par(mfcol = c(1, 1))

plot(x, y,
    type = "l",
    lwd = 2,
    col = "black",
    xlab = "Resultado",
    ylab = "Densidade",
    main = "Distribuição Normal"
)

polygon(c(10, x[x <= 50], 50), c(0, y[x <= 50], 0), col = "red")

# Texto centralizado na área sob a curva
text(40, 0.0175, round(pnorm(50, 40, 10), 4), cex = 1.5)

# ---- b) Qual a probabilidade de um resultado do experimento ser maior ou igual a 35?

# z = (x - μ) / σ = (35 - 40) / 10 = -0.5
# P(Z >= 35) = P(Z > -0.5) = 1 - P(Z <= -0.5)

pnorm(35, mean = 40, sd = 10, lower.tail = FALSE)
# equivale a: pnorm(35, 40, 10, lower.tail = FALSE)

pnorm(-0.5, mean = 0, sd = 1, lower.tail = FALSE)
# equivale a: pnorm(-0.5, lower.tail = FALSE)

1 - pnorm(35, mean = 40, sd = 10) # equivale a: 1 - pnorm(35)
1 - pnorm(-0.5, mean = 0, sd = 1) # equivale a: 1 - pnorm(-0.5)

# ATENÇÃO! Quando o intervalo procurado for
# """maior ou igual""" a X (outra parte da curva) "lower.tail = False".

# Plotamos a distribuição normal para visualizar a área sob a curva

x <- seq(10, 70, 0.01) # ou: seq(5, 75)
y <- dnorm(x, mean = 40, sd = 10)

plot(x, y,
    type = "l",
    lwd = 2,
    col = "black",
    xlab = "Resultado",
    ylab = "Densidade",
    main = "Distribuição Normal"
)

# Outra forma de calcular a área sob a curva
i <- x >= 35
polygon(c(35, x[i], 70), c(0, y[i], 0), col = "green")

# Texto centralizado na área sob a curva
p <- pnorm(35, mean = 40, sd = 10, lower.tail = FALSE)
text(42.5, 0.0175, round(p, digits = 4), cex = 1.5)

# ---- c) Qual a probabilidade de um resultado do experimento estar entre 25 e 60?

# P(25 <= 60) = P(25 <= X <= 60) =  P(X <= 60) - P(X <= 25)
#                                   P(2)       - P(-1,5)

# Como o intervalo procurado é menor ou igual a X, não é necessário
# especificar "lower.tail = FALSE"
pnorm(60, mean = 40, sd = 10, lower.trail = TRUE) -
    pnorm(25, mean = 40, sd = 10, lower.trail = TRUE)
# equivale a: pnorm(60, 40, 10) - pnorm(25, 40, 10)

# Plotamos a distribuição normal e a distribuição normal padronizada
# para visualizar a área sob a curva

x_default <- seq(0, 80, 0.01)
y_default <- dnorm(x_default, mean = 40, sd = 10)

x_normal <- seq(-3, 3, 0.01)
y_norma <- dnorm(x_normal, mean = 0, sd = 1)

par(mfcol = c(1, 2))

plot(x_default, y_default,
    type = "l",
    lwd = 2,
    col = "black",
    xlab = "Resultado",
    ylab = "Densidade",
    main = "Distribuição Normal"
)

polygon(c(25, x_default[x_default <= 60], 60), c(0, y_default[x_default <= 60], 0), col = "yellow")

# Texto centralizado na área sob a curva

p <- pnorm(60, mean = 40, sd = 10) - pnorm(25, mean = 40, sd = 10)
text(40, 0.0175, round(p, digits = 4), cex = 1)

plot(x_normal, y_norma,
    type = "l",
    lwd = 2,
    col = "black",
    xlab = "Z",
    ylab = "Densidade",
    main = "Distribuição Normal Padronizada"
)

polygon(c(1.5, x_normal[x_normal <= 2], 2), c(0, y_norma[x_normal <= 2], 0), col = "yellow")

# Texto centralizado na área sob a curva

p <- pnorm(2) - pnorm(1.5)
text(1.75, 0.35, round(p, digits = 4), cex = 1)

# ---- d) Qual a probabilidade de um resultado do experimento ser
# maior ou igual a 55 (>= 55) ou menor ou igual a 30 (<= 30)?

# P(X) = P(X >= 55) + P(X <= 30)

p1 <- pnorm(55, mean = 40, sd = 10, lower.tail = FALSE)
# lower.tail = FALSE é necessário, pois o intervalo procurado é maior ou igual a X

p2 <- pnorm(30, mean = 40, sd = 10, lower.tail = TRUE)
# lower.tail = TRUE é necessário, pois o intervalo procurado é menor ou igual a X

p1 + p2

# Plotamos a distribuição normal para visualizar a área sob a curva

par(mfcol = c(1, 1))

x <- seq(0, 80, 0.01)
y <- dnorm(x, mean = 40, sd = 10)

plot(x, y,
    type = "l",
    lwd = 2,
    col = "black",
    xlab = "Resultado",
    ylab = "Densidade",
    main = "Distribuição Normal"
)

polygon(c(55, x[x >= 55], 80), c(0, y[x >= 55], 0), col = "yellow")
polygon(c(0, x[x <= 30], 30), c(0, y[x <= 30], 0), col = "orange")

# Texto centralizado em cada área sob a curva

p1 <- pnorm(55, mean = 40, sd = 10, lower.tail = FALSE)
p2 <- pnorm(30, mean = 40, sd = 10, lower.tail = TRUE)

text(60, 0.0175, round(p1, digits = 4), cex = 1)
text(20, 0.0175, round(p2, digits = 4), cex = 1)

# Exemplo 3 ================================================================
# Considere uma situação em que se estudou a durabilidade de um certo tipo de pneu.
# Verificou-se que esta durabilidade seguia uma distribuição normal com
# duração média 60.000 km e desvio-padrão 10.000 km.
# X ~ N(60000; 10000)
# Procurou-se, então, responder os seguintes questionamentos:

# ---- a) Qual a probabilidade de um pneu aleatoriamente escolhido durar mais de 75.000 km?

# P(X > 75.000) = 1 - P(X <= 75.000)
# z = (x - μ) / σ = (75.000 - 60.000) / 10.000 = 1,5

pnorm(75000, mean = 60000, sd = 10000, lower.tail = FALSE)
1 - pnorm(1.5)

# Plotamos a distribuição normal para visualizar a curva (CRASHA TUDO)

x <- seq(30000, 90000, 10)
y <- dnorm(x, mean = 60000, sd = 10000)

plot(x, y,
    type = "l",
    lwd = 2,
    col = "black",
    xlab = "Durabilidade (km)",
    ylab = "Densidade",
    main = "Distribuição Normal"
)

# ----  b) Qual a probabilidade de um pneu aleatoriamente escolhido durar
#       entre 50.000 e 70.000 km?

# # P(50.000 < X < 70.000)

# z1 = (50.000 - 60.000) / 10.000 = -1
# z2 = (70.000 - 60.000) / 10.000 = 1

# P(50.000 < X < 70.000) = P(X < 70.000) - P(X < 50.000) = P(-1 < Z < 1)

pnorm(70000, mean = 60000, sd = 10000) - pnorm(50000, mean = 60000, sd = 10000)

# ----  C) Qual a probabilidade de um pneu aleatoriamente escolhido durar
#       entre 63.000 e 70.000 km?

# P(63.000 < X < 70.000)

# z1 = (63.000 - 60.000) / 10.000 = 0,3
# z2 = (70.000 - 60.000) / 10.000 = 1

# P(63.000 < X < 70.000) = P(X < 70.000) - P(X < 63.000) = P(0,3 < Z < 1)

pnorm(70000, mean = 60000, sd = 10000) - pnorm(63000, mean = 60000, sd = 10000)

# ----  d) Qual a probabilidade de um pneu aleatoriamente escolhido durar
#       exatamente 70.000 km?

# P(X = 70000)
# z = (70.000 - 60.000) / 10.000 = 1
pnorm(70000, mean = 60000, sd = 10000)
pnorm(1)

# ----  e) O fabricante deseja fixar prazo de garantia, em quilômetros, de tal modo que,
#       se a duração do pneu for inferior a garantia, o pneu seja trocado.
#       De quantos quilômetros deve ser este prazo, para que somente 1% dos pneus sejam trocados?

# P(X < x) = 0,01
# Na tabela, para P(Z < z) = 0,01 -> z = -2,33
# z = (x - μ) / σ ... $$ -2,33 = \frac{x - 60.000}{10.000} = 36.700km $$

# qnorm retorna o valor de x para uma dada probabilidade
qnorm(0.01, mean = 60000, sd = 10000)

# Exemplo 4 ================================================================
# Suponha que as amplitudes de vida de dois aparelhos elétricos, D1 e D2,
# tenham distribuições N(42, 6^2) e N(45, 3^2), respectivamente.
# Se os aparelhos são feitos para ser usados por um período de 45 horas,

# ---- a) Qual aparelho deve ser escolhido?

# X = 45 horas

pnorm(45, mean = 42, sd = 6, lower.tail = FALSE) # Aparelho D1
pnorm(45, mean = 45, sd = 3, lower.tail = FALSE) # Aparelho D2

# Utilizamos lower.tail = FALSE, pois o intervalo procurado é maior ou igual a X

# A probabilidade do segundo aparelho durar mais que 45 horas é maior
# que a do primeiro e, portanto, ele (D2) deve ser o escolhido.

# ---- b) E se for um período de 49 horas?
pnorm(49, mean = 42, sd = 6, lower.tail = FALSE) # Aparelho D1
pnorm(49, mean = 45, sd = 3, lower.tail = FALSE) # Aparelho D2

# Para 49 horas a situação se inverte. O primeiro (D1) deve ser o escolhido

# Exemplo 5 ================================================================
# O diâmetro do eixo principal de um disco rígido segue a distribuição Normal
# com média 25,08 cm e desvio padrão 0,05 cm.
# Se as especificações para esse eixo são 25,00 ± 0,15 cm, determine o
# percentual de unidades produzidas em conformidades com as especificações.

ex_mean <- 25.08
ex_sd <- 0.05

# P(24,85 < X < 25,15) = P(X < 25,15) - P(X < 24,85)

pp <- pnorm(25.15, mean = ex_mean, sd = ex_sd) - pnorm(24.85, mean = ex_mean, sd = ex_sd)
cat("Percentual de unidades produzidas em conformidade com as especificações:", pp * 100, "%\n")

# Plotamos a curva indicando a linha da média, do limite esquerdo inferior (LEI) e superior (LES), legendando o desvio padrão

x <- seq(24.85, 25.25, 0.001)
y <- dnorm(x, mean = ex_mean, sd = ex_sd)

plot(x, y,
    type = "l",
    lwd = 2,
    col = "black",
    xlab = "Diâmetro (cm)",
    ylab = "Densidade",
    main = "Distribuição Normal"
)

# Adicionamos o preenchimento entre 24,85 e 25,15

polygon(c(24.85, x[x <= 25.15], 25.15), c(0, y[x <= 25.15], 0), col = "gray")

abline(v = c(25.00 - 0.15, ex_mean, 25.00 + 0.15), lty = 2)

text(ex_mean, 0.5, "Média (μ)", cex = 0.8)
text(25.00 - 0.15, 0.5, "LEI", cex = 0.8)
text(25.00 + 0.15, 0.5, "LES", cex = 0.8)

# Exemplo 6 ================================================================
# Em uma universidade as notas da disciplina de Estatística distribuem-se normalmente
# com média 6,4 e desvio padrão de 0,8.
# Em uma turma com 80 alunos, quantos terão

ex_mean <- 6.4
ex_sd <- 0.8

# ---- a) Nota inferior a 5,0?
p <- pnorm(5, mean = ex_mean, sd = ex_sd) # resultado para 1 aluno
p * 80

# ---- b) Nota entre 5,0 e 7,5?
p <- pnorm(7.5, mean = ex_mean, sd = ex_sd) - pnorm(5, mean = ex_mean, sd = ex_sd)
p * 80

# ---- c) Nota maior que 7,5?
p <- pnorm(7.5, mean = ex_mean, sd = ex_sd, lower.tail = FALSE)
# lower.tail = FALSE é necessário, pois o intervalo procurado é maior ou igual a X
p * 80

# Exemplo 7 ================================================================
# Suponha que a variável aleatória “retornos do contrato futuro
# de soja na bolsa de Chicago” (100 retornos) possui distribuição normal com
# média 0,18 % ao dia e desvio padrão igual a 1,17% ao dia.

# ---- a) Qual a probabilidade de se obter retorno entre 0,18% e 2% ao dia?

# P(0,18 < X < 2) = P(X < 2%) - P(X < 0,18%)

z1 <- (0.18 - 0.18) / 1.17 # z = (x - μ) / σ = 0
z2 <- (2 - 0.18) / 1.17 # z = (x - μ) / σ = 1,56 (1,5564102564)

# P(z1 < Z < z2) = P(0 < Z < 1,56) = P(Z < 1,56) - P(Z < 0)

pnorm(q = 2.00 / 100, mean = 0.18 / 100, sd = 1.17 / 100) -
    pnorm(q = 0.18 / 100, mean = 0.18 / 100, sd = 1.17 / 100)

pnorm(q = z2) - pnorm(q = z1)
# Pela tabela, P(Z < 1,56) = 0,9392 e P(Z < 0) = 0,5

# ---- b) Qual a probabilidade de se obter retorno superior a 2% ao dia?

# P(X > 2%) = P(Z > 1,56) = 1 - P(Z < 1,56)
# Pela tabela, 1 - P(Z < 1,56) = 1 - 0,9406 = 0,0594
pnorm(q = 2.00 / 100, mean = 0.18 / 100, sd = 1.17 / 100, lower.tail = FALSE)
pnorm(q = z2, lower.tail = FALSE) # 0.05990691

# Exemplo 8 ================================================================
# Um pesquisador coletou os dados da estatura de jovens em idade de alistamento militar.
# Sabe-se que a estatura de uma população segue a distribuição normal,
# com média 170cm e variância 36cm^2.

# ---- a) Qual a probabilidade de encontrar um jovem com mais de 1,79m de altura?

# z = (x - μ) / σ = (179 - 170) / 6 = 1,5
# P(X > 179) = P(Z > 1,5) = 1 - P(Z < 1,5)
# Pela tabela, P(Z < 1,5) = 0,9332, logo P(Z > 1,5) = 1 - 0,9332 = 0,0668

# Como temos as medidas em cm e a pergunta em m, convertemos tudo para cm
# Como temos a variância, a convertemos para o desvio padrão (raiz quadrada da variância)
pnorm(q = 179, mean = 170, sd = sqrt(36), lower.tail = FALSE)
1 - pnorm(q = 179, mean = 170, sd = sqrt(36))
1 - pnorm(q = 1.5, 0, 1)

# Plotando o gráfico

x <- seq(140, 200)
y <- dnorm(x, mean = 170, sd = sqrt(36))

plot <- plot(x, y,
    type = "l",
    lwd = 2,
    col = "black",
    xlab = "Altura (cm)",
    ylab = "Densidade",
    main = "Distribuição Normal"
)

i <- x >= 179
polygon(c(179, x[i], 200), c(0, y[i], 0), col = "green")

p <- pnorm(q = 179, mean = 170, sd = sqrt(36), lower.tail = FALSE)
text(185, 0.0115, round(p, digits = 4), cex = 1)

# ----  b) Qual a altura em que a probabilidade de encontrarmos
#       valores menores que ela seja de 80%?

# Procurando o valor de z na tabela completa cuja probabilidade seja a mais próxima de 80% (0.8).
# Encontramos o valor mais aproximado como 0.79995, cujo z = 0,84

# z = (x - μ) / σ =
# 0,84 = (x - 170) / 6
# 0,84 * 6 = x - 170
# 5,04 = x - 170
# x = 175,04

# Encontra-se o valor de x para a probabilidade de 80% (0,8)
qnorm(p = 80 / 100, mean = 170, sd = sqrt(36)) # 175.04

# Encontra-se a probabilidade para a altura de 175,04cm
pnorm(q = 175.04, mean = 170, sd = sqrt(36)) # 0.7995

# --- c) Qual é altura que divide as alturas em 95% mais baixo dos 5% mais altos?

# z = (x - μ) / σ
# z = 1,64 (tabela) -> 0,9495 ou z = 1,65 (tabela) -> x = 0,9505

# 1,64 = (x - 170) / 6
# 1,64 * 6 = x - 170
# 9,84 = x - 170
# x = 179,84

qnorm(p = 95 / 100, mean = 170, sd = sqrt(36))

# Exemplo 9 ================================================================
# O tempo gasto no exame vestibular de uma universidade
# tem distribuição Normal, com média = 120 min e desvio padrão = 15 min.

# ----  a) Sorteando-se um aluno ao acaso, qual a probabilidade dele
#       terminar o exame antes de 100 minutos?

# P(T < 100) = P(Z < (100 - 120) / 15) = P(Z < -1,33)
# Pela tabela, P(-1,33) = 0,0918

pnorm(q = 100, mean = 120, sd = 15)

# Plotando o gráfico

x <- seq(60, 180)
y <- dnorm(x, 120, 15)

plot <- plot(x, y,
    type = "l",
    lwd = 2,
    col = "black",
    xlab = "Tempo (min)",
    ylab = "Densidade",
    main = "Distribuição Normal"
)

i <- x <= 100
polygon(c(60, x[i], 100), c(0, y[i], 0), col = "red")

p <- pnorm(q = 100, mean = 120, sd = 15)
text(80, 0.02, round(p, digits = 4), cex = 1)

# ----  b) Qual deve ser o tempo de prova, de modo a permitir que
#       95% dos vestibulandos terminem no prazo estipulado?
#       T: tempo gasto no exame vestibular

# P(T < t) = 0,95 = P(Z < (t - 120) / 15) = 0,95

qnorm(p = 95 / 100, mean = 120, sd = 15)

# Tendo P(z) = 0,95, pela tabela, z = 1,64, portanto, (t - 120) / 15 = 1,64 -> t = 144,6
