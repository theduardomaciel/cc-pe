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

## LISTAS --------------------------------------------------------
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

## IMPORTAÇÃO DE DATA FRAMES -------------------------------------

# Para importar arquivos, é necessário definir o diretório de trabalho.
setwd("./data") # pasta onde está o arquivo

# ====> Arquivo .txt
data_frame_1 <- read.table("Elementos.txt")
data_frame_1

# ====> Arquivo .csv
data_frame_2 <- read.csv("Valores.csv")

# Podemos exportar um data frame para um arquivo csv.
# O argumento "row.names" define se os índices das linhas serão exportados.
write.csv(data_frame_2, file = "df_write.csv", row.names = FALSE)

data_frame_3 <- read.csv("df_write.csv") # lê o arquivo exportado
data_frame_3

# ====> Arquivo .xlsx (formato Excel)

# Para importar arquivos do Excel, é necessário instalar e carregar o pacote "readxl".
install.packages("readxl")
library(readxl)

excel_data_frame <- read_xlsx("Cadastro.xlsx")
excel_data_frame