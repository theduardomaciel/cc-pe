rm(list = ls())

setwd("./data")

cars <- read.csv("mtcars.csv",
    header = TRUE,
    sep = ";", dec = ","
)

cars

# ==================================================

# Com a coluna hp (horsepower):
# - gerar um histograma
# - calcular Assimetria
# - calcular Pearson (AP2) e Assimetria de Fischer (pacote e1071)
# - explicar o tipo de Assimetria e justificar considerando o
#   histograma, média e mediana.

# Gerar um histograma
hist(cars$hp,
    main = "Histograma da Potência",
    xlab = "Potência",
    ylab = "Frequência"
)

# Obs.: Para cálculos de assimetria, instalamos o pacote e1071
# install.packages("e1071")
library(e1071)

# Calcular a Assimetria
cat(
    "Assimetria: ",
    skewness(cars$hp), # o padrão é type = 3
    "\n"
)

# Calcular Pearson (AP2) e Assimetria de Fischer
cat(
    "Pearson (AP2): ",
    skewness(cars$hp, type = 2),
    "\n"
)

cat(
    "Assimetria de Fischer: ",
    skewness(cars$hp, type = 1),
    "\n"
)

# Interessante:
# Ambas as medidas são correções para o viés, mas a AP2 é
# mais amplamente utilizada e considerada como padrão.
