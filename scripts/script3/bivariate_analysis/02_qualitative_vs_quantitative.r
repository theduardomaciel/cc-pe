rm(list = ls()) # Limpa a memória
setwd("./data") # Define o diretório de trabalho

workers <- read.table("TabelaLivro.csv", header = TRUE, sep = ";", dec = ".")

workers
str(workers)

#----------------------------- ANALISE BIVARIADA ----------------------------

# b) Qualitativa vs quantitativa (Variáveis Instrução e Salário) ------------

## Quartis de Salário
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
