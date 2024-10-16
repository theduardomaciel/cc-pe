# Considere a função:
# f(x) =    { cx^2, se 0 <= x <= 1 }
#           { c,    se 1 <= x <= 2 }

# a) Qual o valor de c tal que f seja uma Função Densidade de Probabilidade?

# Para que f seja uma Função Densidade de Probabilidade,
# a integral de f no intervalo de -infinito a +infinito deve ser igual a 1.
# Assim, temos:
# $$\int_{-\infty}^{+\infty} f(x) dx = \int_{0}^{1} cx^2 dx + \int_{1}^{2} c dx = 1$$

# Calculando a integral de f no intervalo de 0 a 1:
# $$ \int_{0}^{1} cx^2 dx = c \int_{0}^{1} x^2 dx = c \left[ \frac{x^3}{3} \right]_{0}^{1} = c \left[ \frac{1}{3} - \frac{0}{3} \right] = \frac{c}{3} $$

# Integral de cx^2 no intervalo de 0 a 1
integral_1 <- function(c) {
    c * (1^3 / 3 - 0^3 / 3) # Resultado da integral cx^2 no intervalo [0,1]
}

# Calculando a integral de f no intervalo de 1 a 2:
# $$ \int_{1}^{2} c dx = c \int_{1}^{2} dx = c \left[ x \right]_{1}^{2} = c \left[ 2 - 1 \right] = c $$

# Integral de c no intervalo de 1 a 2
integral_2 <- function(c) {
    c * (2 - 1) # Resultado da integral de c no intervalo [1,2]
}

# Assim, temos:
# $$ \int_{-\infty}^{+\infty} f(x) dx = \frac{c}{3} + c = 1 $$

# A soma das integrais deve ser 1 para que seja uma função densidade de probabilidade
# Resolvendo a equação para c
solve_for_c <- function() {
    # Equação: integral_1(c) + integral_2(c) = 1
    c_value <- 1 / (integral_1(1) + integral_2(1)) # Proporção para garantir que a soma seja 1
    return(c_value)
}

# Simplificando a expressão:
# $$ \frac{c}{3} + c = 1 $$

# Multiplicando toda a expressão por 3:
# c + 3c = 3

# Somando os termos semelhantes:
# 4c = 3

# Dividindo toda a expressão por 4:
c <- 3 / 4
c

# Resposta: c = 0.75
c_value <- solve_for_c()
c_value
