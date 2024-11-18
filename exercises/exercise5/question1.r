# No Hospital Unimed, 10 pacientes do sexo feminino que estavam na sala de espera
# foram sorteadas para realizar a medição da pressão sanguínea arterial, obtendo os
# seguintes resultados: (80, 75, 71, 82, 77, 64, 78, 67, 81, 79). Determine o intervalo
# de confiança para a pressão arterial média feminina com coeficiente de confiança
# de 98%

# Dados
pressao <- c(80, 75, 71, 82, 77, 64, 78, 67, 81, 79)

# Intervalo de confiança para média
conf_level <- 0.98
mean_pressao <- mean(pressao)
std_error <- sd(pressao) / sqrt(length(pressao))
error_margin <- qt(conf_level + (1 - conf_level) / 2, df = length(pressao) - 1) * std_error

# Limites do intervalo de confiança
limite_inferior <- mean_pressao - error_margin
limite_superior <- mean_pressao + error_margin
c(Limite_Inferior = limite_inferior, Limite_Superior = limite_superior)
