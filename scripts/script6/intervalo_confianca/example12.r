# Intervalo de Confiança para Proporção Amostral

# Um assistente social deseja saber o tamanho da amostra (n) necessário para determinar a
# proporção da população atendida por uma Unidade de Saúde, que pertence ao município de Cariacica.
# Não foi feito um levantamento prévio da proporção amostral e, portanto, seu valor é desconhecido.

# Ela quer ter 90% de confiança que o erro máximo de estimativa (E) seja de ± 5% (ou 0,05)

# a) Quantas pessoas necessitam ser entrevistadas?

p <- 0.5
nivel_de_confianca <- 0.90 # 90%

# e_0 = zc
e_0 <- qnorm(1 - (1 - nivel_de_confianca) / 2, mean = 0, sd = 1)

n <- (e_0^2 * p * (1 - p)) / 0.05^2
n <- round(n, 0)

cat("Tamanho da amostra: ", n, "\n")
