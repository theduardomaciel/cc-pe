# ##################################################
#           Introdução ao Software R
# ##################################################

# NÃO UTILIZAR palavras reservadas:

# - for, while, repeat, break, next* (estruturas de repetição)
# - if, else, elseif (estruturas condicionais)
# - function, return (funções)
# - TRUE, FALSE, Inf, NA, NaN, NULL (valores especiais)
# - in: operador de pertencimento

# next*: pula para a próxima iteração
# Há diferenciação entre letras maiúsculas e minúsculas.

print("Olá, mundo!")

m <- 4 * 15
print(m) # exibe o valor de m

5 * 15
m <- 5 * 15
m # exibe o valor de m

a <- 2
b <- 4
c <- a * b
d <- a**b # potenciação
e <- b / a
f <- (b - a) * 50

a
b
c
d
e
f # nolint

# TIPOS DE OBJETOS

# numeric: numérico (com ponto flutuante)
# integer: inteiro
# character (string): caracteres
# logical (boolean): lógicos (True e False)
# factor: categorias bem definidas. (Ex.: estado civil - solteiro, casado)

y <- 2
class(y) # exibe o tipo de objeto

y <- as.integer(y) # converte para inteiro
class(y)

x <- 7.5
class(x)
x <- as.integer(x)
class(x)
x

#  Os objetos da classe "character" são representados como texto.

character_object <- "palavra"
class(character_object)

logical_object <- "TRUE"
class(logical_object)

logical_object <- TRUE
class(logical_object)

civil_state <- c("solteiro", "casado", "divorciado")
civil_state
class(civil_state)

# Os objetos da classe "factor" são representados como números inteiros.
# São usados para representar variáveis categóricas.

civil_state <- as.factor(civil_state)
class(civil_state)