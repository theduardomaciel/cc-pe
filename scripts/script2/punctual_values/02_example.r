## Exemplo 2.

## Lendo do arquivo .csv
# ou no RStudio: Session -> Set Working Directory -> Choose Directory
#                RStudio --> File  Import Dataset From Text(base)

civil_state <- read.csv("EstadoCivil.csv",
    header = TRUE,
    sep = ",", dec = "."
)

str(civil_state)

# Outra alternativa: Ler da área de transferência do Windows
# rm(list = ls())
# civil_state <- read.table(file = "clipboard", sep = "\t", header = TRUE, dec = ",")

# Outra alternativa: Ler arquivo Excel
rm(list = ls())
# install.packages("readxl")
library("readxl")

civil_state <- read_excel("EstadoCivilExcel.xlsx")

# Mais outra alternativa: Lendo através do input
civil_state <- scan(what = "character")

freq <- table(civil_state)
cumulative_freq <- cumsum(freq)
relative_freq <- prop.table(freq)
cumulative_relative_freq <- cumsum(relative_freq)
result_table <- cbind(freq,
    cumulative_freq,
    relative_freq = round(relative_freq * 100, digits = 2),
    cumulative_relative_freq = round(cumulative_relative_freq * 100, digits = 2)
)
result_table

bar_pos <- barplot(freq,
    col = c("Yellow", "Orange", "Green", "Blue"),
    main = "Distribuição do Estado Civil",
    xlab = "Estado Civil",
    ylab = "Quantidade",
    ylim = c(0, max(freq) + 6)
)

# Colocando os valores das frequências nas barras do gráfico
text(
    x = bar_pos,
    y = freq,
    labels = freq,
    pos = 3, # Posição do texto*
    cex = 0.8, # Tamanho do texto
    col = "black"
) # Cor do texto

# Posições: 1 = abaixo, 2 = esquerda, 3 = acima, 4 = direita

# ------------------
# Gráfico de pizza

# Atribuindo cores ao gráfico de pizza

colors <- rainbow(length(freq)) # de forma automática
colors <- c("Yellow", "Orange", "Green", "Blue") # ou manualmente

pie(freq, col = colors, main = "Gráfico de Pizza - Estado Civil")
