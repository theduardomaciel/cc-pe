# A média da altura de uma amostra foi de 165,952 cm,
# enquanto que a média de altura da população é de 160 cm.

# A questão é, a média da altura foi maior, mas será que
# essa diferença de altura é estatisticamente significativa?

# Um teste estatístico pretende tentar responder essa questão.

# Rejeitar H_0 se P-value <= alpha
# Aceitar H_0 se P-value > alpha

altura <- c(
    152.0, 153.1, 154.6, 157.8,
    158.8, 159.6, 161.1, 161.6,
    162.7, 163.7, 164.1, 165.5,
    165.8, 168.4, 168.4, 169.1,
    169.1, 170.2, 172.4, 172.9,
    173.1, 173.3, 175.6, 176.9,
    179.0
)

t.test(altura, mu = 160)

# O nível de significância é a probabilidade máxima permitida de cometer um erro tipo I.
# Ele é representado por alpha e é um valor entre 0 e 1.

# No nosso exemplo, vamos considerar um nível de significância de 5% (0.05).

# p-value: 0.000543 -> Rejeitamos a hipótese nula (H_0), ou seja, existe diferença entre as alturas

# =================================================

# Dados
altura <- c(
    152.0, 153.1, 154.6, 157.8,
    158.8, 159.6, 161.1, 161.6,
    162.7, 163.7, 164.1, 165.5,
    165.8, 168.4, 169.1,
    169.1, 170.2, 172.4, 172.9,
    173.1, 173.3, 175.6, 176.9, 179.0
)

# Teste t
resultado <- t.test(altura, mu = 160)

# Visualização do gráfico
alpha <- 0.05 # Nível de significância
t_critico <- qt(1 - alpha / 2, df = resultado$parameter) # Valor crítico t para 95% de confiança
t_valor <- resultado$statistic # Valor t calculado

x <- seq(-4, 4, length = 200) # Valores para o eixo x
y <- dt(x, df = resultado$parameter) # Densidade t-distribuição

# Criando o gráfico
plot(x, y,
    type = "l", lwd = 2, col = "blue",
    xlab = "t", ylab = "Densidade",
    main = "Distribuição t com áreas de rejeição para H0"
)
abline(h = 0, col = "gray") # Linha na base do gráfico

# Destacando as regiões de rejeição
polygon(c(-4, seq(-4, -t_critico, length = 100), -t_critico),
    c(0, dt(seq(-4, -t_critico, length = 100), df = resultado$parameter), 0),
    col = "red", border = NA
)
polygon(c(t_critico, seq(t_critico, 4, length = 100), 4),
    c(0, dt(seq(t_critico, 4, length = 100), df = resultado$parameter), 0),
    col = "red", border = NA
)

# Linha indicando o valor t calculado
abline(v = t_valor, col = "darkgreen", lwd = 2, lty = 2)

# Adicionando legendas
legend("topright",
    legend = c("Valor t calculado", "Áreas de rejeição H0"),
    col = c("darkgreen", "red"), lty = c(2, 1), lwd = c(2, 10), box.lwd = 0
)

# Resultados
cat("Média amostral:", mean(altura), "\n")
cat("Valor-p:", resultado$p.value, "\n")
