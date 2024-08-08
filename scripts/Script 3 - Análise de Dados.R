rm(list = ls()) # Limpa a memória
setwd("./data") # Define o diretório de trabalho

workers <- read.table("TabelaLivro.csv", header = TRUE, sep = ";", dec = ".")

workers
str(workers)

# a) Variável Qualitativa Nominal =================================

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
    bty = "n"
) # remove a caixa ao redor da legenda (o padrão é "o")

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

# Tabela de frequência
children_freq_table <- get_freq_table(table(workers$Filhos))
children_freq_table

## d) Variável quantitativa Contínua =================================

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

## Para variáveis numéricas...

# Mediana
median(workers$Salario)

## Média
mean(workers$Salario)

## Quartis
quantile(workers$Salario)

## Amplitude - diferença entre máximo e mínimo
diff(range(workers$Salario))

## Variância
var(workers$Salario)

## Desvio-padrão
sd(workers$Salario)

## Coeficiente de variação
sd(workers$Salario) / mean(workers$Salario)

## Summary() para resumir os dados de uma s? vez
summary(workers$Salario)

# Plotando um boxplot
boxplot(workers$Salario)

# Adicionando cores e largura variável
boxplot(workers$Salario,
    col = "orange",
    varwidth = TRUE, notch = TRUE
)

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


# b) Qualitativa vs quantitativa (variaveis Instrução e Salario) --------

## Quartis de salario

quantile(workers$Salario)

## Classificação de acordo com os quartis

salary_cut <- cut(workers$Salario,
    breaks = quantile(workers$Salario),
    include.lowest = TRUE, right = FALSE
)

## Tabela de frequências absolutas
instruction_salary_table <- table(workers$Instrução, salary_cut)
instruction_salary_table

barplot(instruction_salary_table,
    col = c("yellow", "red", "orange"),
    main = "Salario x Instrução",
    xlab = "Quartis de Salário",
    ylab = "Frequência de Instrução",
    beside = TRUE, # barras lado a lado
    legend = TRUE,
    args.legend = list(
        x = "topright", bty = "n",
        ncol = 1
    )
)

# O operador "~" estabelece uma relação entre
#   1. variável dependente (resposta) e a
#   2. variável independente (preditora)

# No nosso exemplo, a variável dependente é o Salário e a independente é a Instrução

boxplot(Salario ~ Instrução,
    data = workers,
    col = c("yellow", "red", "orange")
)

prop.table(instruction_salary_table)

# c) -- Quantitativa vs Quantitativa (considerar as variáveis Salario e Idade)

# Classificação de acordo com os quartis
years_cut <- cut(workers$Anos,
    breaks = quantile(workers$Anos),
    right = FALSE, include.lowest = TRUE
)

salary_cut <- cut(workers$Salario,
    breaks = quantile(workers$Salario),
    right = FALSE, include.lowest = TRUE
)

## Tabela cruzada
years_salary_table <- table(years_cut, salary_cut)
years_salary_table

## Calculo da Correlação
cor(workers$Anos, workers$Salario) # correlação de Pearson

plot(workers$Anos, workers$Salario)

plot(
    x = workers$Anos, y = workers$Salario,
    main = " Salario x Anos",
    xlab = "Anos - Variável preditora",
    ylab = "Salário - Variável resposta",
    col = "blue", cex.axis = 0.75,
    xlim = c(20, 50), ylim = c(0, 25)
)

abline(lsfit(workers$Anos, workers$Salario), col = "darkred")
