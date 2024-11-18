# Intervalo de confiança (Variância DESCONHECIDA)

#  Como parte de um projeto maior para estudar o comportamento de painéis de revestimento
# tencionado, componente estrutural que está sendo usado extensivamente nos Estados Unidos,
# o artigo "Time-Dependent Bending Properties of Lumber" relatou diversas
# propriedades mecânicas de espécimes de madeira serrada de pinho da Escócia.

# Considere as seguintes observações sobre o módulo de elasticidade
# (MPa) obtido 1 minuto depois da aplicação de carga de:
# 10,49 16,62 17,30 15,48 12,97 17,26 13,40 13,90 13,63 13,26 14,37 11,70 15,47 17,84 14,07 14,76

# a) Obter a média e a variância para variável resposta,
# e um intervalo de 99% de confiança para média.

valores <- c(
    10.49, 16.62, 17.30, 15.48, 12.97, 17.26, 13.40, 13.90,
    13.63, 13.26, 14.37, 11.70, 15.47, 17.84, 14.07, 14.76
)

n <- length(valores)
alfa <- 0.01 # 1 - 0.99

desvio <- sd(valores)
media <- mean(valores)

tc <- qt(p = 1 - alfa / 2, df = n - 1)
tc <- round(tc, 4)
tc

erro <- tc * desvio / sqrt(n)
erro <- round(erro, 4)
erro

cat("Intervalo de confiança: (", media - erro, ", ", media + erro, ")\n")

# Testando

t.test(valores, conf.level = 0.99)

result <- t.test(valores, conf.level = 0.99)
result$conf.int
