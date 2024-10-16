# Um lojista mantém extensos registros das vendas diárias de um certo aparelho.
# O quadro a seguir mostra a distribuição de probabilidades do número de aparelhos vendidos em uma
# semana.

# | x = Número de aparelhos vendidos | 0 | 1 | 2 | 3 | 4 | 5 |
# |----------------------------------|---|---|---|---|---|---|
# | f_X(x)                           | 0.1 | 0.1 | 0.2 | 0.3 | 0.2 | 0.1 |

# Se o lucro por unidade vendida é de R$ (XX * 500).
#   a. Qual o lucro esperado em uma semana?
#   b. Qual é o desvio padrão do lucro?

# a. Qual o lucro esperado em uma semana?

# Definindo a distribuição de probabilidades
x <- 0:5
f_x <- c(0.1, 0.1, 0.2, 0.3, 0.2, 0.1)
lucro <- x * 500

# Calculando o lucro esperado
lucro_esperado <- sum(f_x * lucro)
lucro_esperado

# b. Qual é o desvio padrão do lucro?

# Calculando a variância = E(X^2) - E(X)^2
variancia <- sum(f_x * (lucro^2)) - lucro_esperado^2

# Calculando a variância por outro método: Var(X) = E(x - \mu)^2
variancia2 <- sum(f_x * (x - lucro_esperado)^2)
variancia2

# Calculando o desvio padrão
desvio_padrao <- sqrt(variancia)
desvio_padrao
