rm(list = ls())

setwd("./data")

cars <- read.csv("mtcars.csv",
    header = TRUE,
    sep = ";", dec = ","
)

cars

# ==================================================

# Com as colunas motor e marcha gerar a matriz com  as respectivas frequências,
# gerar os gráficos de barras motor x marcha e marcha x motor e interpretar os resultados.

# Criar a matriz de frequências
freq_matrix <- table(cars$motor, cars$marcha)
freq_matrix

# Gráfico de barras - motor x marcha
# table(cars$motor, cars$marcha)
barplot(freq_matrix,
    beside = TRUE,
    col = c("lightblue", "lightgreen"),
    main = "Motor x Marcha",
    xlab = "Motor",
    ylab = "Frequência",
    legend = rownames(freq_matrix)
)
# Distribuição do tipo de marcha para cada tipo de motor.

# Gráfico de barras - marcha x motor
# t(freq_matrix) ou cars$marcha, cars$motor)
barplot(t(freq_matrix),
    beside = TRUE,
    col = c("lightblue", "lightgreen"),
    main = "Marcha x Motor",
    xlab = "Marcha",
    ylab = "Frequência",
    legend = colnames(freq_matrix)
)
# Distribuição do tipo de motor para cada tipo de marcha.
