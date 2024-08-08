# -------------------------------------------
#              Valores Agrupados
# -------------------------------------------

## Exemplo 1 - Bicicletas ---------------------------------------------

rm(list = ls())

setwd("./data")

production <- read.csv("Bicicleta.csv",
    header = TRUE,
    sep = ",", dec = "."
)
str(production)

hist(production$Bike) # Histograma

# Visualizando os valores do objeto Histograma
histogram <- hist(production$Bike)
histogram

# Vamos agrupar os valores em Classes

# Para calcular a amplitude, subtraímos o maior valor do menor valor
bikes_range <- range(production$Bike) # menor e maior valor
amplitude <- diff(bikes_range)
# ou: amplitude <- max(production$Bike) - min(production$Bike)

# Aqui, calculamos o número de classes
n_classes <- nclass.Sturges(production$Bike)

# Também calculamos a amplitude das classes
classes_amplitude <- round(amplitude / n_classes)

# E os limites das classes
classes_limits <- seq(230, 370, classes_amplitude) # from, to, by

# Agora, definimos os rótulos das classes
classes <- c(
    "230 |- 250", "250 |- 270", "270 |- 290", "290 |- 310",
    "310 |- 330", "330 |- 350", "350 |- 370"
)

# E por fim calculamos as frequências
# Utilizamos o "table" para contar as frequências
# e o "cut" para agrupar os valores em classes
freq <- table(cut(production$Bike,
    breaks = classes_limits, right = FALSE,
    labels = classes
))

# Legenda da função "cut":
#    - breaks = classes_limits: limites das classes
#    - right = FALSE: intervalo aberto à direita
#    - labels = classes: rótulos das classes

cumulative_freq <- cumsum(freq)
relative_freq <- prop.table(freq)
cumulative_relative_freq <- cumsum(relative_freq)

result_table <- cbind(freq,
    cumulative_freq,
    relative_freq = round(relative_freq * 100, digits = 2),
    cumulative_relative_freq = round(cumulative_relative_freq * 100, digits = 2)
)
result_table

# Agora, vamos plotar o histograma com as classes
histogram <- hist(production$Bike,
    breaks = classes_limits,
    ylab = "Frequências absolutas",
    xlab = "Bicicletas Produzidas",
    labels = classes, # Rótulos das classes
    main = "Histograma", # Título do gráfico
    col = "orange", # Cor das barras
    xlim = c(220, 380),
    ylim = c(0, max(freq) + 5)
)

# Adicionando as linhas do histograma
lines(c(min(histogram$breaks), histogram$mids, max(histogram$breaks)),
    c(0, histogram$counts, 0),
    type = "l"
)

# Na função "lines(x, y, type)" atribuímos:

# x: um vetor com os valores:
# -  min(histogram$breaks): menor valor do histograma
# -  histogram$mids: valores médios das classes
# -  max(histogram$breaks): maior valor do histograma

# y: um vetor com os valores:
# -  0: início do eixo y
# -  histogram$counts: frequências
# -  0: fim do eixo y

# type: tipo de linha (l = linha)

# -------------------------------------------

# Aqui, plotamos um boxplot
boxplot(production, col = "red")

# E aqui, um boxplot com largura variável e intervalo de confiança
boxplot(production, col = "Orange", varwidth = TRUE, notch = TRUE)
# varwidth = TRUE: a largura é proporcional ao número de observações
# notch = TRUE: uma fenda é adicionada ao boxplot, indicando a mediana
