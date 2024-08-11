# ----------------------------------------
## Atividade de Distribuição de frequência
#  ---------------------------------------

## Valores Agrupados com classes iguais ---------------------------------------

rm(list = ls())

setwd("./data")

imc <- read.csv("ValoresIMC.csv", header = TRUE, sep = ";", dec = ",")

imcs <- imc$IMCplan

# Calculando o IMC no R
imcs[31] <- round(70 / (1.73 ^ 2), digits = 4)
# Cálculo arbitrário do IMC de um indivíduo: print(55 / (1.78 ^ 2))

str(imcs)

# A amplitude é a diferença entre o maior e o menor valor
amplitude <- diff(range(imcs))
# ou: amplitude <- max(imcs) - min(imcs)

# Número de classes
classes_amount <- nclass.Sturges(imcs)

classes_amplitude <- round(amplitude / classes_amount, digits = 1)
classes_amplitude

range(imcs)

classes_limits <- seq(15.60, 40.60, classes_amplitude)
classes_limits

freq <- table(cut(imcs, breaks = classes_limits, right = FALSE))

# A função "table" retorna a frequência de cada classe
# A função "cut" divide os dados em classes

cumulative_freq <- cumsum(freq)
relative_freq <- prop.table(freq)
cumulative_relative_freq <- cumsum(relative_freq)

result_table <- cbind(freq,
                      cumulative_freq,
                      relative_freq = round(relative_freq * 100, digits = 2),
                      cumulative_relative_freq = round(cumulative_relative_freq * 100, digits = 2))
result_table

h <- hist(imcs,
          breaks = classes_limits,
          labels = TRUE,
          col = "orange",
          xlim = c(15, 35),
          ylim = c(0, 15),
          xlab = "IMCs",
          ylab = "Frequências absolutas",
          main = "Histograma")

boxplot(imcs, col = "red")

boxplot(imcs,  col = "orange", varwidth = TRUE, notch = TRUE)

## Valores Agrupados com classes desiguais ---------------------------------------

setwd("./data")

imc <- read.csv("ValoresIMC.csv", header = TRUE, sep = ";", dec = ",")

imcs <- imc$IMCplan

range(imcs)

classes_limits <- c(14.0, 18.5, 24.9, 29.9, 34.9, 39.9, 44.9)

freq <- table(cut(imcs,
                  breaks = classes_limits,
                  right = TRUE,
                  include.lowest = TRUE))

# A função "table" retorna a frequência de cada classe
# A função "cut" divide os dados em classes

relative_freq <- prop.table(freq) # frequência relativa de cada classe (proporção)
cumulative_freq <- cumsum(freq) # soma acumulada das frequências
cumulative_relative_freq <- cumsum(relative_freq) # soma acumulada das frequências relativas
classes_diff <- diff(classes_limits) # diferença entre os limites das classes

result_table <- cbind(freq,
                      relative_freq = round(relative_freq * 100, digits = 2),
                      cumulative_freq = round(cumulative_freq, digits = 2),
                      cumulative_relative_freq = round(cumulative_relative_freq * 100, digits = 2),
                      classes_diff, densidade = round(relative_freq/classes_diff, digits = 4))
result_table

hist(imcs,
     breaks = classes_limits,
     col = "green",
     xlim = c(15, 40),
     ylim = c(0, 0.10),
     xlab = "IMCs",
     main = "Histograma - IMC ",
     labels = TRUE)

# --------------------------------------- Usando os QUARTIS como CLASSES

setwd("./data")

imc <- read.csv("ValoresIMC.csv", header = TRUE, sep = ";", dec = ",")

imcs <- imc$IMCplan

classes_limits <- quantile(round(imcs, digits = 4))

classes <- c(" Até Q1", " Entre (Q1 e Q2)", " Entre (Q2 e Q3)", " Superior a Q3")
# ou: classes <- c(" 0 a 25 % ", " 25 a 50 %)", " 50 a 75 % ", " 75 a 100 %")

freq_imc_cut <- table(cut(imcs,
                          breaks = classes_limits,
                          labels = classes,
                          right = FALSE,
                          include.lowest = TRUE))

# A função "table" retorna a frequência de cada classe
# A função "cut" divide os dados em classes

cumulative_freq <- cumsum(freq_imc_cut)
relative_freq <- prop.table(freq_imc_cut)
classes_diff <- diff(classes_limits)
result_table <- cbind(freq_imc_cut,
                      cumulative_freq,
                      relative_freq = round(relative_freq, digits = 2),
                      classes_diff,
                      densidade = round(relative_freq / classes_diff, digits = 4))
result_table

hist(imcs,
     breaks = quantile(imcs),
     col = "orange",
     main = "Histograma",
     xlim = c(15, 35),
     ylim = c(0, 0.14),
     labels = classes,
     xlab = "IMC")

# Obs.: A densidade nos dá uma ideia de quantas observações há por unidade
# de comprimento da classe, o que nos permite comparar de forma justa
# classes de diferentes larguras.