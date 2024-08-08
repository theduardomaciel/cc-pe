rm(list = ls()) # Limpa a memória
setwd("./data") # Define o diretório de trabalho

workers <- read.table("TabelaLivro.csv", header = TRUE, sep = ";", dec = ".")

workers
str(workers)

## a) Variável Qualitativa Nominal =================================

# Frequência absoluta
civil_state_table <- table(workers$Est.civil)
civil_state_table

# Frequência relativa
prop.table(civil_state_table) # proporcional (em %)

# Gráfico de BARRAS ------------------------------------

barplot(civil_state_table)

barplot(civil_state_table,
    cex.names = 1.25,
    col = c("green", "blue"),
    ylab = "Número de Funcionários",
    xlab = "Estado civil",
    cex.axis = 1.25, # tamanho da fonte dos eixos
    main = "Proporção entre casados e solteiros",
    cex.lab = 0.85, # tamanho da fonte dos rótulos
    bty = "n", # remove a caixa ao redor do gráfico
    ylim = c(0, 25)
)

# GRÁFICO DE PIZZA ------------------------------------

?pie # Abre a documentação da função "pie"

# A função "paste" concatena strings
labs <- paste(
    c("Casados = ", "Solteiros = "),
    round(
        x = civil_state_table / length(workers$Est.civil) * 100,
        digits = 2
    ),
    "%"
)

pie(civil_state_table,
    labels = labs,
    col = c("green", "blue"),
    main = "Proporção entre casados e solteiros"
)

# Plotando legenda no canto superior direito
legend("topright",
    pch = 15, # tipo de ponto (quadrado)
    col = c("green", "blue"),
    legend = c("Casados", "Solteiros"),
    cex = 1.0, # tamanho da fonte
    bty = "n" # remove a caixa ao redor da legenda (o padrão é "o")
)
