# ##################################################
#           Distribuição de Frequência
# ##################################################

rm(list = ls()) # limpa as variáveis da área de trabalho

setwd("./data")

## Valores Pontuais

## Exemplo 1.

notes <- c(
    8.5, 7.5, 9.0, 7.5, 5.5, 9.5, 10, 8.5,
    6.0, 6.0, 6.5, 4.5, 10, 6.5, 9.0, 6.5
)

freq <- table(notes)
cumulative_freq <- cumsum(freq) # soma acumulada
relative_freq <- prop.table(freq) # frequência relativa (proporção)
cumulative_relative_freq <- cumsum(relative_freq) # soma acumulada da frequência relativa

result_table <- cbind(freq,
    cumulative_freq,
    relative_freq = round(relative_freq * 100, digits = 2),
    cumulative_relative_freq = round(cumulative_relative_freq * 100, digits = 2)
)
result_table
