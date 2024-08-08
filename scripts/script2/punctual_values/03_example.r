## --- Exemplo 3. IMC com CLASSES DESIGUAIS ---------------------------

setwd("./data")

imc <- read.table("ValoresIMC.csv", header = TRUE, sep = ";", dec = ",")

classes_limits <- c(14, 18.4, 24.9, 29.9, 40)

classes <- c(
    " Abaixo [14,0 |-- 18,4)", " Normal [18,4 |-- 24,9)",
    " Acima [24,9 |-- 29,9)", " Obeso [29,9 |-- 40,0)"
)

freq <- table(cut(imc$IMCplan,
    breaks = classes_limits,
    right = FALSE,
    labels = classes,
    include.lowest = TRUE
))

relative_freq <- prop.table(freq) # frequência relativa (proporção)
cumulative_freq <- cumsum(freq) # soma acumulada
cumulative_relative_freq <- cumsum(relative_freq) # soma acumulada da frequência relativa
classes_diff <- diff(classes_limits) # diferença entre os limites das classes

result_table <- cbind(freq,
    relative_freq = round(relative_freq * 100, digits = 2),
    cumulative_freq = round(cumulative_freq, digits = 2),
    cumulative_relative_freq = round(cumulative_relative_freq * 100, digits = 2),
    classes_diff,
    densidade = round(relative_freq / classes_diff, digits = 4)
)
result_table

hist(imc$IMCplan,
    breaks = classes_limits,
    labels = classes,
    col = "green",
    xlim = c(15, 40),
    ylim = c(0, 0.10),
    xlab = "IMCs",
    main = "Histograma - IMC "
)
