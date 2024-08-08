rm(list = ls()) # Limpa a memória
setwd("./data") # Define o diretório de trabalho

workers <- read.table("TabelaLivro.csv", header = TRUE, sep = ";", dec = ".")

workers
str(workers)

# Para variáveis numéricas... =================================

# Mediana
median(workers$Salario)

## Média
mean(workers$Salario)

## Quartis
quantile(workers$Salario)

## Amplitude - diferença entre máximo e mínimo
diff(range(workers$Salario))

## Variância
var(workers$Salario)

## Desvio-padrão
sd(workers$Salario)

## Coeficiente de variação
sd(workers$Salario) / mean(workers$Salario)

## Summary() para resumir os dados de uma s? vez
summary(workers$Salario)

# Plotando um boxplot
boxplot(workers$Salario)

# Adicionando cores e largura variável
boxplot(workers$Salario,
    col = "orange",
    varwidth = TRUE, notch = TRUE
)
