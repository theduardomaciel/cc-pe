rm(list = ls())

setwd("./data")

cars <- read.csv("mtcars.csv",
    header = TRUE,
    sep = ";", dec = ","
)

cars

# ==================================================

# Com a coluna "qsec" (tempo de 1/4 de milha)  agrupe os dados em seus respectivos quartis

quantiles <- quantile(cars$qsec)
quantiles

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

# Cria a tabela de frequência
table <- table(cut(cars$qsec,
    breaks = quantiles,
    include.lowest = TRUE
    # Como todos os intervalos iniciais são abertos por padrão, precisamos incluir o primeiro
))
freq_table <- get_freq_table(table)
freq_table

?hist

# Gere o histograma
histogram <- hist(cars$qsec,
    col = "lightblue",
    main = "Histograma de qsec",
    xlab = "Tempo de 1/4 de milha",
    ylab = "Frequência",
    xlim = c(14, 23),
    breaks = quantiles
)
