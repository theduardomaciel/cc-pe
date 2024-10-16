# ---
# O Departamento de Estatística é formado por 35 professores,
# sendo 21 homens e 14 mulheres. Uma comissão de 3 professores será
# constituída sorteando, ao acaso, três membros do departamento.

# Representa o caso onde há 1 homem e 2 mulheres na comissão.
# O número de maneiras de escolher 1 homem do grupo de 21 e 2 mulheres do grupo de 14.
prob_first_case <- choose(21, 1) * choose(14, 2)

# Representa o caso onde não há homens na comissão.
# O número de maneiras de escolher 3 mulheres do grupo de 14.
prob_second_case <- choose(21, 0) * choose(14, 3)

# O número total de maneiras de escolher 3 pessoas do grupo de 35.
total_ways <- choose(35, 3)

# Método 1: A probabilidade de haverem pelo menos 2 mulheres na comissão.
# P(X >= 2) = P(X = 2) + P(X = 3)
prob <- (prob_first_case + prob_second_case) / total_ways
prob

# Método 2: A probabilidade de haverem pelo menos 2 mulheres na comissão
# P(X >= 2) = 1 - P(X = 0) - P(X = 1)

# Probabilidade de 0 mulheres (3 homens)
p_x0 <- choose(21, 3) / choose(35, 3)

# Probabilidade de 1 mulher e 2 homens
p_x1 <- (choose(21, 2) * choose(14, 1)) / choose(35, 3)

# A probabilidade de haver pelo menos 2 mulheres
prob <- 1 - p_x0 - p_x1

# Exibir o resultado
prob
