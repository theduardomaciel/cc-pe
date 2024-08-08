rm(list = ls()) # Limpa a memória
setwd("./data") # Define o diretório de trabalho

workers <- read.table("TabelaLivro.csv", header = TRUE, sep = ";", dec = ".")

workers
str(workers)

## b) Variável Qualitativa Ordinal =================================

## Frequência absoluta
workers_instruction <- table(workers$Inst)

## Frequência relativa
prop.table(workers_instruction) # proporcional (valor percentual)

render_bar_plot <- function(sort = FALSE) {
    barplot(sort(workers_instruction, decreasing = sort),
        cex.names = 1.15,
        col = c("green", "blue", "red"),
        ylab = "Instrução de Funcionários",
        xlab = "Escolaridade",
        cex.axis = 1.05,
        main = "Escolaridade dos Funcionários",
        cex.lab = 0.85,
        bty = "n",
        ylim = c(0, 20)
    )
}

## Gráfico de Barras
render_bar_plot(FALSE)
render_bar_plot(TRUE)
