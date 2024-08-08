rm(list = ls()) # Limpa a memória
setwd("./data") # Define o diretório de trabalho

workers <- read.table("TabelaLivro.csv", header = TRUE, sep = ";", dec = ".")

workers
str(workers)

#----------------------------- ANALISE BIVARIADA ----------------------------

# a) Variável Qualitativa e Variável Qualitativa ----------------------------

# Instrução x Estado civil
instruction_x_civil_state <- with(workers, table(Instrução, Est.civil))
instruction_x_civil_state

# A função "with" é utilizada para acessar as variáveis de um data frame
# sem a necessidade de utilizar o operador "$"
# O código acima é correspondente a:
# instruction_x_civil_state <- table(workers$Instrução, workers$Est.civil)
# Uma diferença é que o título da coluna à esquerda não é exibido

# Estado civil x Instrução
civil_state_x_instruction <- with(workers, table(Est.civil, Instrução))
civil_state_x_instruction
addmargins(civil_state_x_instruction)

# A função "addmargins" realiza a soma dos valores de cada linha e coluna

# Proporção (em %) de Estado civil x Instrução
prop.table(civil_state_x_instruction)
addmargins(prop.table(civil_state_x_instruction))

# Proporção (em %) de Instrução x Estado civil
# A função "margin" é utilizada para definir margens para
# a função "prop.table", sendo 1 para linha e 2 para coluna
prop.table(civil_state_x_instruction, margin = 1)
prop.table(civil_state_x_instruction, margin = 2)

# Estado civil x Instrução
bar_pos <- barplot(civil_state_x_instruction,
    main = "Estado Civil x Instrução",
    col = c("green", "blue"),
    beside = TRUE,
    legend = TRUE,
    args.legend = list(
        x = "topright",
        bg = "transparent",
        bty = "y",
        ncol = 1
    )
)

text(
    x = bar_pos,
    y = civil_state_x_instruction + 0.5,
    label = civil_state_x_instruction,
    pos = 3
)

# Instrução X Estado civil

bar_pos <- barplot(instruction_x_civil_state,
    main = "Instrução x Estado civil",
    col = c("green", "blue", "yellow"),
    beside = TRUE,
    ylim = c(0, 15),
    legend = TRUE,
    args.legend = list(
        x = "topright",
        bty = "n",
        ncol = 1
    )
)

text(
    x = bar_pos,
    y = instruction_x_civil_state + 0.5,
    label = instruction_x_civil_state,
    pos = 3
)

# Instrução X Estado civil na horizontal
bar_pos <- barplot(instruction_x_civil_state,
    main = "Instrução x Estado civil",
    col = c("green", "blue", "yellow"),
    beside = TRUE,
    legend = TRUE,
    args.legend = list(
        x = "topright",
        bty = "n",
        ncol = 1,
        bg = "transparent"
    ),
    horiz = TRUE
)

text(
    x = instruction_x_civil_state + 1,
    y = bar_pos,
    label = instruction_x_civil_state,
    pos = 2
)

# Instrução X Estado civil agrupados --> beside = FALSE
# Com a opção "beside = FALSE", os gráficos são empilhados

barplot(instruction_x_civil_state,
    main = "Instrução x Estado civil",
    col = c("green", "blue", "yellow"),
    legend = TRUE,
    beside = FALSE,
    args.legend = list(
        x = "topright",
        bty = "n",
        inset = c(-0.1, 1.60),
        ncol = 3
    ),
    ylim = c(0, 22)
)
