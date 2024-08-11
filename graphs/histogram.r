## HISTOGRAMA (ou distribuição de frequências) ==========================
# - É um gráfico de frequência que ilustra como uma determinada amostra
#   ou população de dados está distribuída.

# - É a representação gráfica em colunas ou em barras (retângulos) de um
#   conjunto de dados previamente tabulado e dividido em classes.

# - A base de cada retângulo representa uma classe.

# - A altura de cada retângulo representa a quantidade ou:
#   * Para classes uniformes: a frequência absoluta com que o valor da
#                             classe ocorre no conjunto de dados.
#   * Para classes NÃO uniformes: a densidade de frequência.

x <- c(
    1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 7,
    7, 7, 7, 7, 7, 7, 8, 8, 8, 8, 8, 8, 8, 8, 9, 9, 9, 9, 9, 9, 9, 9,
    9, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10
)
hist(x, col = "lightblue", main = "Histograma", xlab = "Valores", ylab = "Frequência", breaks = 10)

# ---------------------------------------------

install.packages("e1071")
library(e1071)

par(mfrow = c(1, 1))

right_asymmetric <- c(
    2, 4, 5, 6, 7, 8, 8, 9, 9, 10, 10, 10,
    11, 12, 13, 13, 15, 19, 20, 22
)

h <- hist(right_asymmetric, main = "Histograma Assimétrico à Direita")

assimetria <- skewness(right_asymmetric)
assimetria

mean(right_asymmetric)
median(right_asymmetric)

pearson_asymmetry <- (mean(right_asymmetric) - median(right_asymmetric)) / sd(right_asymmetric)
pearson_asymmetry
