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
classes <- c(
    "15.68 |- 18.68", "18.68 |- 21.68", "21.68 |- 24.68", "24.68 |- 27.68",
    "27.68 |- 30.68", "30.68 |- 33.68"
)

freq <- table(cut(IMCplan, breaks = classes_limits, right = FALSE, labels = classes))
cumulative_freq <- cumsum(freq)
relative_freq <- prop.table(freq)
cumulative_relative_freq <- cumsum(relative_freq)

result_table <- cbind(freq,
    cumulative_freq,
    relative_freq = round(relative_freq * 100, digits = 2),
    cumulative_relative_freq = round(cumulative_relative_freq * 100, digits = 2)
)
result_table

histogram <- hist(IMCplan,
    breaks = classes_limits,
    labels = classes,
    col = "orange",
    xlim = c(15, 35),
    ylim = c(0, 10),
    ylab = "Frequências absolutas",
    main = "Histograma"
)

lines(c(min(histogram$breaks), histogram$mids, max(histogram$breaks)),
    c(0, histogram$counts, 0),
    type = "l"
)

boxplot(imc, col = "red")

boxplot(imc, col = "orange", varwidth = TRUE, notch = TRUE)
