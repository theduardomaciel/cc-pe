# ---------------------- Estatística Descritiva ----------------------

# ------------------- Medidas de Tendência Central -------------------

data_fx <- c(
    100, 120, 110, 90, 150, 145, 149, 165, 150, 144,
    134, 139, 220, 206, 211, 210, 266, 249, 248, 260
)

# Cálculo da média
mean(data_fx)

# Cálculo da mediana
median(data_fx)

# Cálculo da moda
table(data_fx) # exibe a frequência de cada valor
subset(table(data_fx), table(data_fx) == max(table(data_fx))) # exibe o valor com maior frequência

# Cálculo da máximo e mínimo
max(data_fx)
min(data_fx)

# ------------------- Medidas de Dispersão -------------------

# A amplitude é a diferença entre o maior e o menor valor.

# MÉTODO 1
# A função "range" retorna o intervalo dos valores.
# A função "diff" calcula a diferença entre os valores.
range(data_fx)
diff(range(data_fx))

# MÉTODO 2
amplitude <- max(data_fx) - min(data_fx)
amplitude

# A variância é a média dos quadrados das diferenças entre cada valor e a média.
var(data_fx)

# O desvio-padrão (standard deviation) é a raiz quadrada da variância.
sd(data_fx)

# O coeficiente de variação (CV) é a razão entre o desvio-padrão e a média, multiplicado por 100.
cv <- sd(data_fx) / mean(data_fx) * 100
cv

# ------------------- Resumo Estatístico -------------------
statistical_summary <- rbind(
    Média = mean(data_fx),
    Mediana = median(data_fx),
    Máximo = max(data_fx),
    Mínimo = min(data_fx),
    Amplitude = amplitude,
    Variância = var(data_fx),
    "Desvio-padrão" = sd(data_fx),
    "CV(%)" = cv
)

colnames(statistical_summary) <- "Estatísticas"
statistical_summary

# Para formatar pontos flutuantes de uma tabela, utilizamos a função "format"
# com o parâmetros "digits", porém retorna os valores como strings.
statistical_summary <- format(statistical_summary, digits = 2, nsmall = 2)
statistical_summary

# Para converter as strings em números, utilizamos a função "as.data.frame".
statistical_summary <- as.data.frame(statistical_summary)
statistical_summary

# Outras alternativas:
# formatC(c(-0.001), digits = 2, format = "f") ou sprintf(-0.001, fmt = '%#.2f')
