# ##################################################
#           Distribuição de Frequência
# ##################################################

rm(list = ls()) # limpa as variáveis da área de trabalho

setwd("./data")

## Valores Pontuais

## Exemplo 1.

notes <- c(8.5, 7.5, 9.0, 7.5, 5.5, 9.5, 10, 8.5,
           6.0, 6.0, 6.5, 4.5, 10, 6.5, 9.0, 6.5)

freq <- table(notes)
cumulative_freq <- cumsum(freq) # soma acumulada
relative_freq <- prop.table(freq) # frequência relativa (proporção)
cumulative_relative_freq <- cumsum(relative_freq) # soma acumulada da frequência relativa

result_table <- cbind(freq,
                      cumulative_freq,
                      relative_freq = round(relative_freq * 100, digits = 2),
                      cumulative_relative_freq = round(cumulative_relative_freq * 100, digits = 2))
result_table

## Exemplo 2.

## Lendo do arquivo .csv
# ou no RStudio: Session -> Set Working Directory -> Choose Directory
#                RStudio --> File  Import Dataset From Text(base)

civil_state <- read.csv("EstadoCivil.csv", header = TRUE,
                        sep = ",", dec = ".")

str(civil_state)

# Outra alternativa: Ler da área de transferência do Windows
# rm(list = ls())
# civil_state <- read.table(file = "clipboard", sep = "\t", header = TRUE, dec = ",")

# Outra alternativa: Ler arquivo Excel
rm(list = ls())
# install.packages("readxl")
library("readxl")

civil_state <- read_excel("EstadoCivilExcel.xlsx")

# Mais outra alternativa: Lendo através do input
civil_state <- scan(what = "character")

freq <- table(civil_state)
cumulative_freq <- cumsum(freq)
relative_freq <- prop.table(freq)
cumulative_relative_freq <- cumsum(relative_freq)
result_table <- cbind(freq,
                      cumulative_freq,
                      relative_freq = round(relative_freq * 100, digits = 2),
                      cumulative_relative_freq = round(cumulative_relative_freq * 100, digits = 2))
result_table

bar_pos <- barplot(freq,
                   col = c("Yellow", "Orange", "Green", "Blue"),
                   main = "Distribuição do Estado Civil",
                   xlab = "Estado Civil",
                   ylab = "Quantidade",
                   ylim = c(0, max(freq) + 6))

# Colocando os valores das frequências nas barras do gráfico
text(x = bar_pos,
     y = freq,
     labels = freq,
     pos = 3, # Posição do texto*
     cex = 0.8, # Tamanho do texto
     col = "black") # Cor do texto

# Posições: 1 = abaixo, 2 = esquerda, 3 = acima, 4 = direita

# ------------------
# Gráfico de pizza

# Atribuindo cores ao gráfico de pizza

colors <- rainbow(length(freq)) # de forma automática
colors <- c("Yellow", "Orange", "Green", "Blue") # ou manualmente

pie(freq, col = colors, main = "Gráfico de Pizza - Estado Civil")

# -------------------------------------------
#              Valores Agrupados
# -------------------------------------------

## Exemplo 1 - Bicicletas ---------------------------------------------

rm(list = ls())

setwd("./data")

production <- read.csv("Bicicleta.csv", header = TRUE,
                       sep = ",", dec = ".")
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
classes <- c("230 |- 250", "250 |- 270", "270 |- 290", "290 |- 310",
             "310 |- 330", "330 |- 350", "350 |- 370")

# E por fim calculamos as frequências
# Utilizamos o "table" para contar as frequências
# e o "cut" para agrupar os valores em classes
freq <- table(cut(production$Bike, breaks = classes_limits, right = FALSE,
                  labels = classes))

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
                      cumulative_relative_freq = round(cumulative_relative_freq * 100, digits = 2))
result_table

# Agora, vamos plotar o histograma com as classes
histogram <- hist(production$Bike, breaks = classes_limits,
                  ylab = "Frequências absolutas",
                  xlab = "Bicicletas Produzidas",
                  labels = classes, # Rótulos das classes
                  main = "Histograma", # Título do gráfico
                  col = "orange", # Cor das barras
                  xlim = c(220, 380),
                  ylim = c(0, max(freq) + 5))

# Adicionando as linhas do histograma
lines(c(min(histogram$breaks), histogram$mids, max(histogram$breaks)),
      c(0, histogram$counts, 0), type = "l")

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

## Exemplo 2 - IMC ---------------------------------------------

setwd("./data")

imc <- read.csv("ValoresIMC.csv", header = TRUE, sep = ";", dec = ",")

attach(imc) # Anexa o dataframe ao ambiente de trabalho

histogram <- hist(IMCplan) # IMCplan é uma variável do dataframe "imc"
histogram # exibe o histograma

# Para calcular os limites das classes, calculamos:

# A amplitude
amplitude <- diff(range(IMCplan))

# O número de classes
n_classes <- nclass.Sturges(IMCplan)

# A amplitude das classes
classes_amplitude <- round(amplitude / n_classes)
range(IMCplan)

# Por fim, conseguimos calcular os limites das classes
classes_limits <- seq(15.68, 33.68, classes_amplitude)

# E definimos os rótulos das classes
classes <- c("15.68 |- 18.68", "18.68 |- 21.68", "21.68 |- 24.68", "24.68 |- 27.68",
             "27.68 |- 30.68", "30.68 |- 33.68")

freq <- table(cut(IMCplan, breaks = classes_limits, right = FALSE, labels = classes))
cumulative_freq <- cumsum(freq)
relative_freq <- prop.table(freq)
cumulative_relative_freq <- cumsum(relative_freq)

result_table <- cbind(freq,
                      cumulative_freq,
                      relative_freq = round(relative_freq * 100, digits = 2),
                      cumulative_relative_freq = round(cumulative_relative_freq * 100, digits = 2))
result_table

histogram <- hist(IMCplan,
                  breaks = classes_limits,
                  labels = classes,
                  col = "orange",
                  xlim = c(15, 35),
                  ylim = c(0, 10),
                  ylab = "Frequências absolutas",
                  main = "Histograma")

lines(c(min(histogram$breaks), histogram$mids, max(histogram$breaks)),
      c(0, histogram$counts, 0), type = "l")

boxplot(imc, col = "red")

boxplot(imc,  col = "orange", varwidth = TRUE, notch = TRUE)


## ---Exemplo 3. IMC com CLASSES DESIGUAIS ---------------------------

setwd("./data")

imc <- read.table("ValoresIMC.csv", header = TRUE, sep = ";", dec = ",")

classes_limits <- c(14, 18.4, 24.9, 29.9, 40)

classes <- c(" Abaixo [14,0 |-- 18,4)", " Normal [18,4 |-- 24,9)",
             " Acima [24,9 |-- 29,9)", " Obeso [29,9 |-- 40,0)")

freq <- table(cut(imc$IMCplan,
                  breaks = classes_limits,
                  right = FALSE,
                  labels = classes,
                  include.lowest = TRUE))

relative_freq <- prop.table(freq) # frequência relativa (proporção)
cumulative_freq <- cumsum(freq) # soma acumulada
cumulative_relative_freq <- cumsum(relative_freq) # soma acumulada da frequência relativa
classes_diff <- diff(classes_limits) # diferença entre os limites das classes

result_table <- cbind(freq,
                      relative_freq = round(relative_freq * 100, digits = 2),
                      cumulative_freq = round(cumulative_freq, digits = 2),
                      cumulative_relative_freq = round(cumulative_relative_freq * 100, digits = 2),
                      classes_diff,
                      densidade = round(relative_freq / classes_diff, digits = 4))
result_table

hist(imc$IMCplan,
     breaks = classes_limits,
     labels = classes,
     col = "green",
     xlim = c(15, 40),
     ylim = c(0, 0.10),
     xlab = "IMCs",
     main = "Histograma - IMC ")

# --- Exemplo 4 - Usando os QUARTIS como CLASSES  -----------------------

setwd("./data")

imc <- read.table("ValoresIMC.csv", header = TRUE, sep = ";", dec = ",")

# Definimos os limites das classes como os quartis
classes_limits <- quantile(round(imc$IMCplan, digits = 4))

classes <- c(" 0 a 25 % ", " 25 a 50 %)", " 50 a 75 % ", " 75 a 100 %")

# Calculamos as frequências
freq_imc_cut <- table(cut(imc$IMCplan,
                          breaks = classes_limits, # limites das classes
                          right = FALSE,  # intervalo aberto à direita
                          include.lowest = TRUE)) # inclui o menor valor

# Obs.: Utilizamos o "table" para contar as frequências
#       e o "cut" para agrupar os valores em classes

cumulative_freq <- cumsum(freq_imc_cut)
relative_freq <- prop.table(freq_imc_cut)
classes_diff <- diff(classes_limits)
result_table <- cbind(freq_imc_cut,
                      cumulative_freq,
                      relative_freq = round(relative_freq, digits = 2),
                      classes_diff, # diferença entre os quartis
                      densidade = round(relative_freq / classes_diff, digits = 4))
result_table

histogram <- hist(imc$IMCplan,
                  breaks = quantile(imc$IMCplan),
                  col = "orange",
                  main = "Histograma",
                  xlim = c(15, 35),
                  ylim = c(0, 0.14),
                  labels = classes,
                  xlab = "IMC")

# --- Exemplo 4 - usando os QUARTIS como CLASSES -----------------------
# 4.1 Incluindo labels para as classes

setwd("./data")

imc <- read.table("ValoresIMC.csv", header = TRUE, sep = ";", dec = ",")

# Definimos os limites das classes como os quartis
classes_limits <- quantile(imc$IMCplan)

classes <- c(" Até Q1", " Entre (Q1 e Q2)", " Entre (Q2 e Q3)", " Superior a Q3")

# Calculamos as frequências
freq_imc_cut <- table(cut(imc$IMCplan,
                          breaks = classes_limits, right = FALSE,
                          labels = classes,
                          include.lowest = TRUE))

cumulative_freq <- cumsum(freq_imc_cut)
relative_freq <- prop.table(freq_imc_cut)
classes_diff <- diff(classes_limits)
result_table <- cbind(freq_imc_cut, cumulative_freq, 
                      relative_freq = round(relative_freq, digits = 2),
                      classes_diff,
                      densidade = round(relative_freq / classes_diff, digits = 4))
result_table

histogram <- hist(imc$IMCplan,
                  breaks = quantile(imc$IMCplan),
                  labels = classes,
                  col = "orange",
                  main = "Histograma",
                  xlim = c(15, 35),
                  ylim = c(0, 0.14),
                  xlab = "IMC")

# ------------------------------------------------------------
# 4.2 Utilizando o histograma:

height <- c(1.30, 1.33, 1.40, 1.42, 1.45, 1.50, 1.50, 1.52, 1.55,
            1.56, 1.58, 1.60, 1.62, 1.64, 1.65, 1.67, 1.68, 1.68,
            1.70, 1.72, 1.72, 1.74, 1.80, 1.83, 1.85)

# Histograma com valores padrão
histogram <- hist(height, labels = TRUE)

# Histograma com freq = FALSE, portanto, a altura das barras é proporcional à densidade
histogram <- hist(height, freq = FALSE, labels = TRUE)
histogram

# Utilizamos a função "par" para dividir a tela em duas partes
par(mfrow = c(1, 2))

# Histograma com quebras personalizadas
histogram <- hist(height, breaks = c(1.3, 1.5, 1.7, 1.9)) # lado esquerdo
histogram <- hist(height, breaks = c(1.3, 1.5, 1.7, 1.8, 1.9)) # lado direito

# Histograma com cores personalizadas
histogram <- hist(height,
                  breaks = c(1.3, 1.5, 1.7, 1.9),
                  col = c("violet", "yellow", "Orange"),
                  labels = TRUE, ylim = c(0, 20))

hist(height, breaks = c(1.3, 1.5, 1.6, 1.8, 1.9), col = c("violet"))

par(mfrow = c(1, 1))

histogram <- hist(height,
                  main = "Altura dos alunos do Ensino Médio",
                  xlab = "Altura dos alunos",
                  ylab = "Freq. Absoluta",
                  col = c("violet"),
                  border = FALSE,
                  xlim = c(1.2, 2),
                  ylim = c(0, 9),
                  labels = TRUE)

lines(c(min(histogram$breaks), histogram$mids, max(histogram$breaks)),
      c(0, histogram$counts, 0), type = "l")

classes_limits <- seq(1.30, 1.90, 0.1)

classes <- c("1.30 |- 1.40", "1.40 |- 1.50", "1.50 |- 1.60", "1.60 |- 1.70",
             "1,70 |- 1.80", "1.80 |- 1.90")

freq <- table(cut(height, breaks = classes_limits, right = FALSE, labels = classes))
cumulative_freq <- cumsum(freq)
relative_freq <- prop.table(freq)
cumulative_relative_freq <- cumsum(relative_freq)

result_table <- cbind(freq,
                      cumulative_freq,
                      relative_freq = round(relative_freq * 100, digits = 2),
                      cumulative_relative_freq = round(cumulative_relative_freq * 100, digits = 2))
result_table

histogram <- hist(height,
                  main = "Altura dos alunos do 1º ano do Ensino Médio",
                  xlab = "Altura dos alunos",
                  ylab = "Freq. Absoluta",
                  col = c("violet"),
                  border = FALSE,
                  xlim = c(1.3, 1.9),
                  ylim = c(0, 9),
                  labels = TRUE)

lines(c(min(histogram$breaks), histogram$mids, max(histogram$breaks)),
      c(0, histogram$counts, 0),
      type = "l",
      col = ("yellow"))