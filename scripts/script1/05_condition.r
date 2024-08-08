###    ESTRUTURA CONDICIONAL - if e else    ###

# Para obter a entrada do usuário, utilizamos a função "scan".
# O argumento "what" define o tipo de dado a ser lido.

y <- scan(what = "integer") # forneça um inteiro para comparar com 20

if (y < 20) {
    print("y é menor que 20!")
} else if (y == 20) {
    print("y é igual a 20")
} else {
    print("y é maior que 20")
}

nota <- scan() # forneça uma nota para verificar a situação do aluno

if (nota >= 6) {
    print("Aprovado")
} else if (nota >= 5 && nota < 6) {
    print("Recuperação")
} else {
    print("Reprovado")
}