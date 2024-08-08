rm(list = ls()) # Limpa a memória
setwd("./data") # Define o diretório de trabalho

workers <- read.table("TabelaLivro.csv", header = TRUE, sep = ";", dec = ".")

workers
str(workers)

## d) Variável Quantitativa Contínua =================================

salary <- workers$Salario
sort(salary)

amplitude <- diff(range(salary))
classes_amount <- nclass.Sturges(salary) # quantidade de classes
classes_amplitude <- round(amplitude / classes_amount, digits = 1)
classes_limits <- seq(4, 23.60, classes_amplitude) # limites das classes

classes <- c(
    "04.0 |- 06.8", "06.8 |- 09.6", "09.6 |- 12.4", "12.4 |- 15.2",
    "15.2 |- 18.0", "18.0 |- 20.8", "20.8 |- 23.6"
)

freq <- table(cut(salary,
    breaks = classes_limits,
    right = FALSE,
    include.lowest = TRUE,
    labels = classes
))

result_table <- get_freq_table(freq)
result_table

# Aqui, retiramos os labels e observamos os intervalos
freq <- table(cut(salary,
    breaks = classes_limits,
    right = FALSE
))

result_table <- get_freq_table(freq)
result_table

# Plotamos um histograma com as classes definidas
histogram <- hist(salary,
    breaks = classes_limits,
    ylab = "Frequências absolutas",
    xlab = "Intervalos de Salário",
    labels = classes,
    main = "Histograma",
    xlim = c(4, 25),
    ylim = c(0, 16),
    col = "orange"
)

# Adicionando linhas no histograma
lines(c(min(histogram$breaks), histogram$mids, max(histogram$breaks)),
    c(0, histogram$counts, 0),
    type = "l"
) # tipo de linha

# ==================================================

get_freq_table <- function(freq_table) {
    ## Frequência relativa
    relative_freq <- prop.table(freq_table)

    ## Frequência absoluta e relativa acumulada
    cumulative_freq <- cumsum(freq_table)
    cumulative_relative_freq <- cumsum(relative_freq)

    result_table <- cbind(freq_table,
        cumulative_freq,
        relative_freq = round(relative_freq * 100,
            digits = 2
        ),
        cumulative_relative_freq = round(cumulative_relative_freq * 100,
            digits = 2
        )
    )

    return(result_table)
}
