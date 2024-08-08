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
excluded_position # exibe o vetor sem o valor na posição 3 (valor = 6)