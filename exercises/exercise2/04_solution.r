rm(list = ls())

setwd("./data")

cars <- read.csv("mtcars.csv",
    header = TRUE,
    sep = ";", dec = ","
)

cars

# ==================================================

# Com a coluna hp, gerar um histograma,
# e elaborar uma tabela de frequência usando as classes sugeridas pelo histograma.

# Gere o histograma
histogram <- hist(cars$hp,
    col = "lightblue",
    main = "Histograma de hp"
)

# Cria a tabela de frequência
table <- table(cut(cars$hp,
    breaks = histogram$breaks,
    # Utilizamos as classes sugeridas pelo histograma
    include.lowest = TRUE
    # Como todos os intervalos iniciais são abertos por padrão, precisamos incluir o primeiro
))

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

freq_table <- get_freq_table(table)
freq_table
