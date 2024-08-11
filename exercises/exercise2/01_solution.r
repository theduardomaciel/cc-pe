rm(list = ls())

setwd("./data")

cars <- read.csv("mtcars.csv",
    header = TRUE,
    sep = ";", dec = ","
)

cars
# str(cars)

# ======================================================

# Calcular o valor mínimo e máximo da coluna mpg
mpg_min <- min(cars$mpg)
mpg_max <- max(cars$mpg)

# Calcular a média
average <- mean(cars$mpg)

# Calcular a mediana
median <- median(cars$mpg)

# Calcular o desvio padrão
standard_deviation <- sd(cars$mpg)

# Calcular os quartis
quantiles <- quantile(cars$mpg)

cat("Mínimo: ", mpg_min, "\n")
cat("Máximo: ", mpg_max, "\n")
cat("Média: ", average, "\n")
cat("Mediana: ", median, "\n")
cat("Desvio padrão: ", standard_deviation, "\n")
cat("Quartis: ", quantiles, "\n")

?hist

# Construir o histograma e o boxplot
histogram <- hist(cars$mpg,
    col = "lightblue",
    main = "Histograma de milhas/galão",
    xlab = "Milhas por galão",
    ylab = "Frequência"
)

boxplot <- boxplot(cars$mpg,
    col = "lightblue",
    main = "Boxplot de milhas/galão",
    xlab = "Milhas por galão",
    ylab = "Frequência"
)
