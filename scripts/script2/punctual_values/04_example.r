# --- Exemplo 4 - Usando os QUARTIS como CLASSES  -----------------------

setwd("./data")
imc <- read.table("ValoresIMC.csv", header = TRUE, sep = ";", dec = ",")

# Definimos os limites das classes como os quartis
classes_limits <- quantile(round(imc$IMCplan, digits = 4))

classes <- c(" 0 a 25 % ", " 25 a 50 %)", " 50 a 75 % ", " 75 a 100 %")

# Calculamos as frequências
freq_imc_cut <- table(cut(imc$IMCplan,
    breaks = classes_limits, # limites das classes
    right = FALSE, # intervalo aberto à direita
    include.lowest = TRUE
)) # inclui o menor valor

# Obs.: Utilizamos o "table" para contar as frequências
#       e o "cut" para agrupar os valores em classes

cumulative_freq <- cumsum(freq_imc_cut)
relative_freq <- prop.table(freq_imc_cut)
classes_diff <- diff(classes_limits)
result_table <- cbind(freq_imc_cut,
    cumulative_freq,
    relative_freq = round(relative_freq, digits = 2),
    classes_diff, # diferença entre os quartis
    densidade = round(relative_freq / classes_diff, digits = 4)
)
result_table

histogram <- hist(imc$IMCplan,
    breaks = quantile(imc$IMCplan),
    col = "orange",
    main = "Histograma",
    xlim = c(15, 35),
    ylim = c(0, 0.14),
    labels = classes,
    xlab = "IMC"
)

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
    include.lowest = TRUE
))

cumulative_freq <- cumsum(freq_imc_cut)
relative_freq <- prop.table(freq_imc_cut)
classes_diff <- diff(classes_limits)
result_table <- cbind(freq_imc_cut, cumulative_freq,
    relative_freq = round(relative_freq, digits = 2),
    classes_diff,
    densidade = round(relative_freq / classes_diff, digits = 4)
)
result_table

histogram <- hist(imc$IMCplan,
    breaks = quantile(imc$IMCplan),
    labels = classes,
    col = "orange",
    main = "Histograma",
    xlim = c(15, 35),
    ylim = c(0, 0.14),
    xlab = "IMC"
)

# ------------------------------------------------------------
# 4.2 Utilizando o histograma:

height <- c(
    1.30, 1.33, 1.40, 1.42, 1.45, 1.50, 1.50, 1.52, 1.55,
    1.56, 1.58, 1.60, 1.62, 1.64, 1.65, 1.67, 1.68, 1.68,
    1.70, 1.72, 1.72, 1.74, 1.80, 1.83, 1.85
)

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
    labels = TRUE, ylim = c(0, 20)
)

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
    labels = TRUE
)

lines(c(min(histogram$breaks), histogram$mids, max(histogram$breaks)),
    c(0, histogram$counts, 0),
    type = "l"
)

classes_limits <- seq(1.30, 1.90, 0.1)

classes <- c(
    "1.30 |- 1.40", "1.40 |- 1.50", "1.50 |- 1.60", "1.60 |- 1.70",
    "1,70 |- 1.80", "1.80 |- 1.90"
)

freq <- table(cut(height, breaks = classes_limits, right = FALSE, labels = classes))
cumulative_freq <- cumsum(freq)
relative_freq <- prop.table(freq)
cumulative_relative_freq <- cumsum(relative_freq)

result_table <- cbind(freq,
    cumulative_freq,
    relative_freq = round(relative_freq * 100, digits = 2),
    cumulative_relative_freq = round(cumulative_relative_freq * 100, digits = 2)
)
result_table

histogram <- hist(height,
    main = "Altura dos alunos do 1º ano do Ensino Médio",
    xlab = "Altura dos alunos",
    ylab = "Freq. Absoluta",
    col = c("violet"),
    border = FALSE,
    xlim = c(1.3, 1.9),
    ylim = c(0, 9),
    labels = TRUE
)

lines(c(min(histogram$breaks), histogram$mids, max(histogram$breaks)),
    c(0, histogram$counts, 0),
    type = "l",
    col = ("yellow")
)
