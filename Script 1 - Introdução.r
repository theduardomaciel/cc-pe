######################### Introdução ao Software R #########################

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

###   ESTRUTURA DE DADOS - VETORES   ###

vector_x <- c(1, 2, 3, 4, 5, 6, 7)
class(vector_x) # exibe o tipo dos objetos do vetor
vector_x

week_days <- c(
    "domingo", "segunda", "terça", "quarta", "quinta",
    "sexta", "sábado"
)
class(week_days)
week_days

# Junção de vetores
joining_vectors <- c(vector_x, week_days)
joining_vectors
class(joining_vectors)

# A função "length" retorna o comprimento do vetor.
week_expenses <- c(400, 300, 100, 500, 150, 430, 70)
class(week_expenses)
length(week_expenses)

ascending_order <- sort(week_expenses)
ascending_order

total <- sum(week_expenses)
total # nolint
minimal <- min(week_expenses)
minimal # nolint
maximum <- max(week_expenses)
maximum # nolint
average <- mean(week_expenses)
average # nolint

# ----------- Exibindo os resultados na mesma linha -------------

cat("Soma dos gastos =", total, "e Média =", average, "\n")
cat("Mínimo =", minimal, "Máximo =", maximum)

# --------------- Sequências ---------------------

# Para criar intervalos, utilizamos o caractere ":".
interval <- (3:8)
interval

# A função "seq" cria sequências, que podem ser configuradas com os argumentos
# "from", "to" e "by".
sequence_with_step <- seq(2, 42, by = 5) # de 2 a 42, com passo de 5
sequence_with_step

# --------------- Repetição ---------------------

# A função "rep" repete um valor ou vetor, e possui outras 2 variantes:
# rep.int(x, times) e rep_len(x, length.out).

# O argumento "times" define o número de repetições.
# O argumento "each" define o número de repetições de cada elemento.
# O argumento "length.out" define o comprimento do vetor resultante.

repetition <- rep(2, 8) # repete o valor 2, 8 vezes
repetition

# Ao utilizar um vetor, a função "rep" repete os elementos
# de forma correspondente
multiple_repetition <- rep(c(3, 5), c(4, 6)) # repete 3 quatro vezes e 5 seis vezes # nolint
multiple_repetition

# O argumento "each" define o número de repetições de cada elemento.
scheduled_repetition <- rep(3:5, each = 3) # repete cada elemento 3 vezes
scheduled_repetition

# --------------- Uso de vetores ---------------------

vector2 <- c(2, 4, 6, 8, 10, 12)
vector2

vector3 <- c(vector2, 14) # Acrescenta 14 ao vetor
vector3
class(vector3)

vector4 <- c(vector3, "pares")
vector4
class(vector4) # O vetor numérico foi transformado em caracteres

position <- vector2[2]
position # exibe o valor na posição 2

excluded_position <- vector2[-3] # Remove o valor na posição 3
excluded_position # exibe o vetor sem o valor na posição 3 (6)

###    ESTRUTURA DE DADOS - MATRIZES    ###

# Matrizes são vetores bidimensionais, com linhas e colunas.
matrix <- matrix(c(4, 8, 12, 16, 20, 24), nrow = 2, ncol = 3, byrow = TRUE)
print(matrix)

matrix <- matrix(c(4, 8, 12, 16, 20, 24), nrow = 3, ncol = 2, byrow = FALSE)
print(matrix)

matrix[2, 2] # elemento (2, 2)

vector_a <- c(2, 5, 8)
vector_b <- c(3, 6, 9)
matrix2 <- rbind(vector_a, vector_b) # junta os vetores por linha
matrix2

matrix2[2, 1] # elemento (2, 1)

# Ao utilizar um intervalo ao criar uma matriz, os valores são
# dispostos em ordem seguindo o parâmetro "byrow".

matrix3 <- matrix(2:9, ncol = 2, byrow = TRUE)
matrix3

# Além disso, ao não especificar o número de linhas, o R calcula
# automaticamente com base no número de elementos.
# Caso a dimensão da matriz ultrapasse a quantidade de elementos,
# o R repetirá os valores.

dim(matrix3) # dimensão
nrow(matrix3) # número de linhas
ncol(matrix3) # número de colunas

# Podemos nomear linhas e colunas
dimnames(matrix3) <- list(
    c("Linha1", "Linha2", "Linha3", "Linha4"),
    c("Coluna1", "Coluna2")
)
matrix3

matrix4 <- matrix(2:13,
    nrow = 4, byrow = TRUE,
    dimnames = list(
        c("Linha1", "Linha2", "Linha3", "Linha4"),
        c("Coluna1", "Coluna2", "Coluna3")
    )
)
matrix4

# A função "diag" cria uma matriz diagonal.
diagonal_matrix <- diag(1:4)
diagonal_matrix

# Produto de um número por uma matriz
matrix_scalar_product <- 2 * matrix4
matrix4 # matriz original
matrix_scalar_product # multiplica todos os elementos por 2

# Soma ou subtração de matrizes
matrix5 <- matrix(c(1, 5, 15, 8), nrow = 2, ncol = 2, byrow = TRUE)
matrix5
matrix6 <- matrix(c(2, 4, 6, 10), nrow = 2, ncol = 2, byrow = TRUE)
matrix6

sum <- matrix5 + matrix6 # soma cada elemento correspondente
sum

subtraction <- matrix5 - matrix6 # subtrai cada elemento correspondente
subtraction

# Multiplicação Matricial
produto_matrix <- matrix5 %*% matrix6
produto_matrix

# Média das linhas ou colunas
matrix5 <- matrix(c(1, 5, 15, 8), nrow = 2, ncol = 2, byrow = TRUE)
matrix5

column_average <- colMeans(matrix5)
column_average # média dos elementos das colunas

row_average <- rowMeans(matrix5)
row_average # média dos elementos das linhas

# Soma das linhas ou colunas
soma_linhas <- rowSums(matrix5)
soma_linhas

soma_colunas <- colSums(matrix5)
soma_colunas

# Matriz com caracteres
matrix7 <- matrix(c("domingo", "segunda", "terça", "quarta", "quinta"),
    nrow = 2, ncol = 2, byrow = TRUE
)
matrix7

###    ESTRUTURA DE DADOS - LISTAS E DATA FRAME    ###

# É uma tabela de dados onde:
#   - cada linha representa um registro
#   - as colunas representam os atributos ou variáveis.
# Todos os elementos são vetores e precisam ter o mesmo comprimento.

month_number <- range(1:12)
# ou: month_number <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)

month_name <- c(
    "janeiro", "fevereiro", "março", "abril", "maio", "junho",
    "julho", "agosto", "setembro", "outubro", "novembro",
    "dezembro"
)

year <- rep(2021, 12)
# ou: year <- c(2021, 2021, 2021, 2021, 2021, 2021, 2021, 2021, 2021, 2021, 2021, 2021)

data_frame <- data.frame(month_number, month_name, year)
data_frame
class(data_frame)

# Data Frames pertencentes ao R
cars_df <- mtcars
cars_df

iris_flower_df <- iris
iris_flower_df

nrow(iris_flower_df)
ncol(iris_flower_df)
dim(iris_flower_df)
summary(iris_flower_df)

###   ESTRUTURA DE DADOS - LISTAS   ###
# Coleção de elementos sem restrições quanto à classe, comprimento
# ou estrutura de cada elemento

name <- c("Luciano", "Pedro", "Joyce", "Maria")
age <- c(46, 38, 27, 29)
course <- c("Estatística", "Linguagem R", "Redes Neurais", "Python")

list <- list(name, age, course)
print(list)
class(list)

list <- data.frame(name, age, course)
print(list)
class(list)

list2 <- list(
    name = c("Luciano", "Pedro", "Joyce", "Maria"),
    age = c(46, 38, 27, 29),
    course = c("Estatística", "Linguagem R", "Python")
)

list2 <- data.frame(list2) # Erro (arguments differing number of rows: 4, 3)

###    IMPORTAÇÃO DE DATA FRAMES    ###

# Para importar arquivos, é necessário definir o diretório de trabalho.
setwd("./data") # pasta onde está o arquivo

# Arquivo .txt
data_frame_1 <- read.table("Elementos.txt")
data_frame_1

# Arquivo csv
data_frame_2 <- read.csv("Valores.csv")

# Podemos exportar um data frame para um arquivo csv.
# O argumento "row.names" define se os índices das linhas serão exportados.
write.csv(data_frame_2, file = "df_write.csv", row.names = FALSE)

data_frame_3 <- read.csv("df_write.csv") # lê o arquivo exportado
data_frame_3

# Arquivo excel.xlsx

# Para importar arquivos do Excel, é necessário instalar e carregar o pacote "readxl".
install.packages("readxl")
library(readxl)

excel_data_frame <- read_xlsx("Cadastro.xlsx")
excel_data_frame

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