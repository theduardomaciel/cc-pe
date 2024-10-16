# Considere que a vida útil de um equipamento possa ser representada
# por uma VA contínua com a seguinte função:
# f(x) = { 3/2 * (1 - x^2), se 0 < x <= 1}
#        { 0,               caso contrário }

# Qual a probabilidade da vida útil do equipamento ser superior a 6 meses?

# Definindo a função de densidade de probabilidade
f <- function(x) {
    ifelse(0 < x & x <= 1, 3 / 2 * (1 - x^2), 0)
    # Estrutura:
    # - test: 0 < x & x <= 1
    # - yes: 3 / 2 * (1 - x^2)
    # - no: 0
}

# Calculando a probabilidade
# Fazemos isso calculando a integral da função de densidade de probabilidade
# no intervalo [0.5, 1], pois queremos a probabilidade de a vida útil ser
# superior a 6 meses (0.5 anos).

# A fórmula da densidade de probabilidade é: $$ P(a < X < b) = \int_{a}^{b} f(x) dx $$

# A função integrate() calcula a integral de uma função no intervalo [a, b].
1 - integrate(f, 0, 0.5)$value
