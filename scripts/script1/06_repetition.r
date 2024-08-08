###    ESTRUTURA de REPETIÇÃO : for, while e repeat    ###

# O loop "for" é utilizado para repetir um bloco de código um número específico de vezes.
for (i in 1:10) {
    print(i)
}

# Navega por cada elemento do vetor
lista <- c(1, 2, 3, 4, 10)
for (numero in lista) {
    print(numero * 2)
}

# O loop "while" será executado enquanto a condição for verdadeira.
c <- 1
while (c <= 10) {
    print(c + 10)
    c <- c + 1
}

# O loop "repeat" é executado indefinidamente até que a instrução "break" seja chamada.
y <- 2
repeat {
    print(y) # só imprime até 9, pois o break interrompe a execução antes do print(10)
    y <- y + 1
    if (y >= 10) break()
}