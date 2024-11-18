# Intervalo de Confiança para Proporção Amostral

# Um partido deseja estimar a proporção de eleitores favoráveis a um determinado candidato.
# Uma mostra piloto de 2.500 eleitores revelou 60% dos eleitores são favoráveis a este candidato.

# a) Elaborar um intervalo de confiança de 95% para intenção de voto nesse candidato.
resultado <- prop.test(x = 0.60 * 2500, n = 2500, conf.level = 0.95)
resultado

resultado$conf.int

# b) Estimar o tamanho da amostra

p_inicial <- 0.5 # pois não sabemos a proporção real
nivel_de_confianca <- 0.95

# Margem de erro de 2% para cima e para baixo
erro_max <- 0.02
zc <- qnorm(1 - (1 - nivel_de_confianca) / 2, mean = 0, sd = 1)

n <- (zc^2 * p_inicial * (1 - p_inicial)) / erro_max^2
n <- round(n, 0)

cat("Tamanho da amostra: ", n, "\n")

# Margem de erro de 1% para cima e para baixo
erro_max <- 0.01
zc <- qnorm(1 - (1 - nivel_de_confianca) / 2, mean = 0, sd = 1)

n <- (zc^2 * p_inicial * (1 - p_inicial)) / erro_max^2
n <- round(n, 0)

cat("Tamanho da amostra: ", n, "\n")

# c) Estimar o tamanho da amostra necessária para obter
# um intervalo de confiança de 95% com erro de 0,02.

erro_max <- 0.02
zc <- qnorm(1 - (1 - nivel_de_confianca) / 2, mean = 0, sd = 1)

n <- (zc^2 * p_inicial * (1 - p_inicial)) / erro_max^2
n <- round(n, 0)

cat("Tamanho da amostra: ", n, "\n")
