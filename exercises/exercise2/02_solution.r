rm(list = ls())

setwd("./data")

cars <- read.csv("mtcars.csv",
    header = TRUE,
    sep = ";", dec = ","
)

cars
# str(cars)

# ====================================================

?boxplot

# Gerar um gráfico boxplot com as colunas "disp" (displacement) e "hp" (horse power)

par(mfrow = c(1, 1))

boxplot(cars$disp, cars$hp,
    names = c("disp", "hp"),
    main = "Boxplot das colunas disp e hp",
    ylab = "Valores"
)

# --------------------------------------------------

boxplot(
    cars$disp,
    col = "lightblue",
    xlab = "",
    ylab = "Frequência"
)

par(mfrow = c(1, 2))

boxplot(
    cars$hp,
    col = "lightblue",
    xlab = "",
    ylab = "Frequência"
)
