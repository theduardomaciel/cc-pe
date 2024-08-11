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
freq_table <- table(cars$motor, cars$marcha)
freq_table

# Gráfico de barras - motor x marcha
barplot(table(cars$motor, cars$marcha),
    beside = TRUE,
    col = c("lightblue", "lightgreen"),
    main = "Motor x Marcha",
    xlab = "Motor",
    ylab = "Marcha"
)

# Gráfico de barras - marcha x motor
barplot(table(cars$marcha, cars$motor),
    beside = TRUE,
    col = c("lightblue", "lightgreen"),
    main = "Marcha x Motor",
    xlab = "Marcha",
    ylab = "Motor"
)
