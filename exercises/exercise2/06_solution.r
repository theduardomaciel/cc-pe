rm(list = ls())

setwd("./data")

cars <- read.csv("mtcars.csv",
    header = TRUE,
    sep = ";", dec = ","
)

cars

# ==================================================

# Escolher duas variáveis (colunas),
# sendo uma qualitativa e outra quantitativa,
# gerar gráficos de barras e interpretar os resultados.

# Variável qualitativa - pode ser posicionado em categoria:
# motor

barplot(table(cars$motor),
    col = c("lightblue", "lightgreen"),
    main = "Motor",
    xlab = "Tipo de Motor",
    ylab = "Frequência"
)

# Variável quantitativa - representa quantidade:
# cyl (número de cilindros)

barplot(table(cars$cyl),
    col = c("lightblue", "lightgreen"),
    main = "Cilindros",
    xlab = "Quantidade de Cilindros",
    ylab = "Frequência"
)
