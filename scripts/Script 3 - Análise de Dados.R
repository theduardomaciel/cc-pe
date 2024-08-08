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
        ylim = c(0, 25))

# GRÁFICO DE PIZZA ------------------------------------

?pie # Abre a documentação da função "pie"

# A função "paste" concatena strings
labs <- paste(c("Casados = ", "Solteiros = "),
              round(x = civil_state_table / length(workers$Est.civil) * 100,
                    digits = 2),
              "%")

pie(civil_state_table,
    labels = labs,
    col = c("green", "blue"),
    main = "Proporção entre casados e solteiros")

# Plotando legenda no canto superior direito
legend("topright",
       pch = 15, # tipo de ponto (quadrado)
       col = c("green", "blue"),
       legend = c("Casados", "Solteiros"),
       cex = 1.0, # tamanho da fonte
       bty = "n") # remove a caixa ao redor da legenda (o padrão é "o")

## b) Variável Qualitativa Ordinal =================================

## Frequência absoluta
workers_instruction <- table(workers$Inst)

## Frequência relativa
prop.table(workers_instruction) # proporcional (valor percentual)

## Gráfico de Barras
barplot(sort(workers_instruction,
             decreasing = FALSE),
        cex.names = 1.15,
        col = c("green", "blue", "red"),
        ylab = "Instrução de Funcionários",
        xlab = "Escolaridade",
        cex.axis = 1.05,
        main = "Escolaridade dos Funcionários",
        cex.lab = 0.85,
        bty = "n",
        ylim = c(0, 20))

barplot(sort(workers_instruction,
             decreasing = TRUE),
        cex.names = 1.15,
        col = c("green", "blue", "red"),
        ylab = "Instrução de Funcionários",
        xlab = "Escolaridade",
        cex.axis = 1.25,
        main = "Escolaridade dos Funcionários",
        cex.lab = 0.85,
        bty = "n",
        ylim = c(0, 20))

## c) Variável Quantitativa Discreta =================================

## Frequência absoluta
children_freq <- table(workers$Filhos)
workers$Filhos

?plot

# A função "plot" é utilizada para criar gráficos
plot(children_freq,
     col = "green",
     type = "h", # gráfico de barras
     lwd = 5, # largura da linha
     cex.lab = 1.2,
     main = "Frequência Absoluta",
     xlab = "Número de filhos",
     ylab = "Quantidade de Filhos")

plot(children_freq,
     type = "S", # gráfico de linha
     col = "red",
     main = "Frequência relativa acumulada",
     lwd = 5)

## Frequência relativa
children_relative_freq <- prop.table(children_freq)

## Frequência absoluta e relativa acumulada
children_cumulative_freq <- cumsum(children_freq)
children_rel_cumulative_freq <- cumsum(children_relative_freq)

table_result <- cbind(children_freq,
                      children_cumulative_freq,
                      children_relative_freq = round(children_relative_freq * 100,
                                                     digits = 2),
                      children_rel_cumulative_freq = round(children_rel_cumulative_freq * 100,
                                                           digits = 2))
table_result

## d) Variável quantitativa Contínua =================================

salary <- workers$Salario
sort(salary)

amplitude <- diff(range(salary))
classes_amount <- nclass.Sturges(salary) # quantidade de classes
classes_amplitude <- round(amplitude / classes_amount, digits = 1)
classes_limits <- seq(4, 23.60, classes_amplitude) # limites das classes

classes <- c("04.0 |- 06.8", "06.8 |- 09.6", "09.6 |- 12.4", "12.4 |- 15.2",
             "15.2 |- 18.0", "18.0 |- 20.8", "20.8 |- 23.6")

freq_table <- table(cut(salary, breaks = classes_limits,
                        right = FALSE,
                        include.lowest = TRUE,
                        labels = classes))

# A função "table" é utilizada para criar tabelas de frequência
# A função "cut" é utilizada para dividir os dados em intervalos

# freq_table = table(cut(salary, breaks = classes_limits, right=FALSE, labels=classes))

cumulative_freq <- cumsum(freq_table)
relative_freq <- prop.table(freq_table)
relative_cumulative_freq <- cumsum(relative_freq)

result_table <- cbind(freq_table,
                      cumulative_freq,
                      relative_freq = round(relative_freq * 100,
                                            digits = 2),
                      relative_cumulative_freq = round(relative_cumulative_freq * 100,
                                                       digits = 2))
result_table

# Retira os labels e observa os intervalos
freq_table <- table(cut(salary, breaks = classes_limits, right = FALSE))

cumulative_freq <- cumsum(freq_table)
relative_freq <- prop.table(freq_table)
relative_cumulative_freq <- cumsum(relative_freq)

result_table <- cbind(freq_table,
                      cumulative_freq,
                      relative_freq = round(relative_freq * 100,
                                            digits = 2),
                      relative_cumulative_freq = round(relative_cumulative_freq * 100,
                                                       digits = 2))

result_table

h = hist(salary, breaks=classes_limits,
         ylab="Frequencias absolutas",  labels=classes,main="Histograma", 
         xlim=c(4,25), ylim = c (0,16), col="orange")

lines(c(min(h$breaks), h$mids, max(h$breaks)), 
      c(0,h$counts, 0), type = "l")

## Para variaveis numericas ...

## Mediana
median(workers$Salario)
## Media
mean(workers$Salario)
## Quartis
quantile(workers$Salario)
## amplitude - diferenca entre maximo e minimo
diff(range(workers$Salario))
## Variancia
var(workers$Salario)
## Desvio-padrao
sd(workers$Salario)
## Coeficiente de variacao
sd(workers$Salario)/mean(workers$Salario)
## Quartis
(Salario.qt <- quantile(workers$Salario))
## Summary() para resumir os dados de uma s? vez
summary(workers$Salario)

boxplot(workers$Salario)

boxplot(workers$Salario,  col = "orange", 
        varwidth = TRUE, notch = TRUE)


#----------------------------- ANALISE BIVARIADA ----------------------------

#a) ------ Variavel Qualitativa X Variavel Qualitativa --------------


inst.civ.tb <- with(workers,table(Instrucao, Est.civil))
inst.civ.tb

civ.workers_instruction <- with(workers,table(Est.civil, Instrucao))
addmargins(civ.workers_instruction)

prop.table(civ.workers_instruction)
addmargins(prop.table(civ.workers_instruction))

prop.table(civ.workers_instruction, margin = 1)

prop.table(civ.workers_instruction, margin = 2)

# Estado civil x instrucao 

barplot(civ.workers_instruction, main = "Estado Civil x Instrucao",
        col= c("green","blue"), beside = TRUE,
        legend = TRUE,  args.legend = list(x = "topright",
                        bty = "y",ncol = 1))

#  instrucao X Estado civil

barplot(inst.civ.tb, main = "Instrucao x Estado civil",
        col= c("green","blue", "yellow"),
        beside = TRUE,legend = TRUE, 
        args.legend = list(x = "topright",
                           bty = "n", ncol = 1))

#  instrucao X Estado civil na Horizontal 

barplot(inst.civ.tb, main= "Instrucao x Estado civil",
        col= c("green","blue", "yellow"),
        beside = TRUE,legend = TRUE, 
        args.legend = list(x = "topright", bty = "n",
                           ncol = 1), horiz = TRUE)

#  instrucao X Estado civil Agrupado --> beside = FALSE 

barplot(inst.civ.tb, main = "Instrucao x Estado civil",
        col= c("green","blue", "yellow"),legend = TRUE,
        beside = TRUE, 
        args.legend = list(x = "topright",bty = "n",
        inset=c(-0.1, 1.60), ncol = 3), ylim = c (0,15))


# b) Qualitativa vs quantitativa (variaveis Instrucao e Salario) --------

## Quartis de salario

quantile(workers$Salario)

## Classificacao de acordo com os quartis

salario.cut <- cut(workers$Salario, breaks =  quantile(workers$Salario),      
                   include.lowest = TRUE, right = FALSE)

## Tabela de frequencias absolutas
inst.sal.tb <- table(workers$Instrucao, salario.cut)
inst.sal.tb

barplot(inst.sal.tb, col=c("yellow","red","orange"),
        main= "Salario x Instrucao",
        xlab = "Quantiles", ylab = "Frequencia  Instrucao",
        beside = TRUE, legend = TRUE, 
        args.legend = list(x = "topright",bty = "n",
                           ncol = 1))

boxplot(Salario ~ Instrucao, data = workers, 
        col=c("yellow", "red", "orange"))  

prop.table(inst.sal.tb)

#c) -- Quantitativa vs Quantitativa (considerar as variaveis Salario e Idade)

Anos.cut <- cut(workers$Anos, breaks = quantile(workers$Anos),
                right = FALSE , include.lowest = TRUE)

salario.cut <- cut(workers$Salario, breaks = quantile(workers$Salario),
                   right = FALSE, include.lowest = TRUE)
## Tabela cruzada

Anos.sal.tb <- table(Anos.cut, salario.cut)
Anos.sal.tb

## Calculo da Correlacao

cor (workers$Anos, workers$Salario) # correlacao

plot(workers$Anos, workers$Salario)

plot(x = workers$Anos, y = workers$Salario,
     main = " Salario x Anos",
     xlab = "Anos - Variavel preditora", 
     ylab = "Salario - Variavel resposta",
     col = "blue", cex.axis = 0.75, 
     xlim = c(20, 50), ylim = c(0, 25))

abline(lsfit(workers$Anos, workers$Salario),col="darkred")

