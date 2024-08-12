# ---------------- Assimetria ---------------------

install.packages("e1071")
library(e1071)

grades <- c(3, 4, 5, 5, 6, 6, 6, 6, 6, 6, 6, 7, 7, 8, 9)

histogram <- hist(grades)

asymmetry <- skewness(grades)
asymmetry

left_data <- c(
    2, 6, 7, 8, 8, 17, 18, 16, 11, 11,
    13, 14, 16, 17, 15, 17, 20, 21, 22
)

histogram <- hist(left_data, main = "Histograma Assimétrico à Esquerda")

asymmetry <- skewness(left_data)
asymmetry

mean(left_data)
median(left_data)
pearson <- (mean(left_data) - median(left_data)) / sd(left_data)
pearson

asymmetry <- skewness(left_data)
asymmetry

boxplot(left_data, horizontal = TRUE)

right_data <- c(
    2, 4, 5, 6, 7, 8, 8, 9, 9, 10, 10, 10,
    11, 12, 13, 13, 15, 19, 20, 22
)

histogram <- hist(right_data, main = "Histograma Assimétrico à Direita")

mean(right_data)
median(right_data)

pearson <- (mean(right_data) - median(right_data)) / sd(right_data)
pearson

asymmetry <- skewness(right_data)
asymmetry

boxplot(right_data, horizontal = TRUE)

# Assimetria  ... outros exemplos

set.seed(123)
dados <- c(rnorm(100, mean = 5, sd = 1))
histogram <- hist(dados)

mean(dados)
median(dados)
pearson <- (mean(dados) - median(dados)) / sd(dados)
pearson
asymmetry <- skewness(dados)
asymmetry


dados <- rnorm(1000, mean = 7.5, sd = 2.5)
histogram <- hist(dados)

mean(dados)
median(dados)
pearson <- (mean(dados) - median(dados)) / sd(dados)
pearson
asymmetry <- skewness(dados)
asymmetry


# ------------ Outras Assimetrias ----------------

# Gerar n notas aleatórias

numnotas <- scan()

dados <- runif(numnotas, min = 4, max = 10)

hist(dados)

# Calcular média, mediana e desvio padrão
media <- mean(dados)
mediana <- median(dados)
desvio_padrao <- sd(dados)

# Calcular os quartis
Q1 <- quantile(dados, 0.25)
Q2 <- quantile(dados, 0.50)
Q3 <- quantile(dados, 0.75)

# Coef. Assimetria de Pearson (Primeira Fórmula)
assimetria_pearson1 <- (media - mediana) / desvio_padrao

# Coef. Assimetria de Pearson (Segunda Fórmula)
assimetria_pearson2 <- 3 * (media - mediana) / desvio_padrao

# Coef. Assimetria de Bowley
assimetria_bowley <- (Q3 + Q1 - 2 * Q2) / (Q3 - Q1)

# Coef. Assimetria usando a função skewness() do pacote e1071
assimetria_e1071 <- skewness(dados)

# Exibindo os resultados
print(paste("Coef. Assimetria de Pearson (Primeira Fórmula):", assimetria_pearson1))
print(paste("Coef. Assimetria de Pearson (Segunda Fórmula):", assimetria_pearson2))
print(paste("Coef. Assimetria de Bowley:", assimetria_bowley))
print(paste("Coef. Assimetria calculado pelo pacote e1071:", assimetria_e1071))
