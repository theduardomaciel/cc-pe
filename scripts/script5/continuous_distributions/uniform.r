# Exemplo 1 ================================================================

# Seja X a corrente medida em um fio de cobre. X é medida em miliamperes.
# A variável assume valores no intervalo [0, 20mA].
# X tem distribuição contínua uniforme f (x) = 0, 05 para 0 ≤ x ≤ 20 .
# Podemos calcular o valor esperado, a variância e o desvio padrão da
# corrente

# Valor esperado
E <- (20 + 0) / 2
E

# Variância
Var <- (20 - 0)^2 / 12
Var

# Desvio padrão
dp <- sqrt(Var)
dp

# Exemplo 2 ================================================================
# Uma máquina envasa detergente líquido de forma que o volume
# tem distribuição Uniforme Contínua com 4900 ≤ y ≤ 5050 ml

# a) Qual a média e variância do volume de detergente?

# Média
E <- (5050 + 4900) / 2
E

# Variância
Var <- (5050 - 4900)^2 / 12
Var

# b) Qual a proporção de embalagens com menos de 5000 ml?

# P(Y < 5000) = P(Y ≤ 5000) = F(5000)
P <- (5000 - 4900) / (5050 - 4900)
P

punif(5000, min = 4900, max = 5050)

# Exemplo 3 ================================================================
# Seja X uma VAC com distribuição uniforme no intervalo [ 5, 10 ].
# Utilizando a FDA da variável, calcule

# a) P(X < 7) = F(7)
punif(7, min = 5, max = 10)

# b) P(X > 8.5) = 1 - P(X ≤ 8.5) = 1 - F(8.5)
1 - punif(8.5, min = 5, max = 10)
punif(8.5, min = 5, max = 10, lower.tail = FALSE)

# c) P(8 < X < 9) = P(X ≤ 9) - P(X ≤ 8) = F(9) - F(8)
punif(9, min = 5, max = 10) - punif(8, min = 5, max = 10)

# Exemplo 4 ================================================================
# Latas de coca-cola são enchidas num processo automático segundo uma
# distribuição uniforme no intervalo (em ml) [345,355]

# a) Qual é a probabilidade de uma lata conter mais de 353 ml?
# P(X > 353) = 1 - P(X ≤ 353) = 1 - F(353)
punif(353, min = 345, max = 355, lower.tail = FALSE)

# b) Qual a probabilidade da lata conter menos de 346 ml?
# P(X < 346) = F(346)
punif(346, min = 345, max = 355)

# c) c) Qualquer lata com volume 4 ml abaixo da média pode gerar
# reclamação do consumidor e com volume 4 ml acima da média pode
# transbordar no momento de abertura, devido à pressão interna.
# Qual é a proporção de latas problemáticas?

# Média: E = (355 + 345) / 2 = 350

# P(346 < X < 354) = P(X < 350 - 4) + P(X > 350 + 4)

punif(346, min = 345, max = 355) + punif(354, min = 345, max = 355, lower.tail = FALSE)
1 - (punif(350 + 4, min = 345, max = 355) - punif(350 - 4, min = 345, max = 355))

# d) Calcule a Esperança Matemática e a Variância do volume de uma lata

# Média
E <- (355 + 345) / 2
E # em ml

# Variância
Var <- (355 - 345)^2 / 12
Var
