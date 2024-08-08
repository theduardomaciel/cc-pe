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