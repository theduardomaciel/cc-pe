rm(list = ls()) # Limpa a memória
setwd("./data") # Define o diretório de trabalho

workers <- read.table("TabelaLivro.csv", header = TRUE, sep = ";", dec = ".")

workers
str(workers)

## c) Variável Quantitativa Discreta ================================

## Frequência absoluta
children_freq <- table(workers$Filhos)
workers$Filhos

?plot

# A função "plot" é utilizada para criar gráficos
plot(children_freq,
    col = "green",
    type = "h", # gráfico de barras
    lwd = 25, # largura da linha
    cex.lab = 1.2, # tamanho da fonte dos rótulos
    main = "Frequência Absoluta",
    xlab = "Número de filhos",
    ylab = "Frequência"
)

plot(children_freq,
    type = "S", # gráfico de linha
    col = "red", # cor da linha
    main = "Frequência relativa acumulada",
    lwd = 5
) # largura da linha

# Tabela de frequência
children_freq_table <- get_freq_table(table(workers$Filhos))
children_freq_table

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
