rm(list = ls())

setwd("./data")

cars <- read.csv("mtcars.csv",
    header = TRUE,
    sep = ";", dec = ","
)

cars

# ==================================================

# Escolher duas variáveis (colunas) quantitativas,
# calcular o coeficiente de correlação,
# gerar gráfico de dispersão,
# agrupar usando os quartis e interpretar os resultados.

# As variáveis quantitativas foram:
# mpg (milhas por galão) e wt (peso)

# Calcular o coeficiente de correlação
cat(
    "Coeficiente de correlação entre mpg e wt: ",
    cor(cars$mpg, cars$wt),
    "\n"
)

# Gerar gráfico de dispersão
plot(cars$mpg, cars$wt,
    main = "Milhas por Galão x Peso",
    xlab = "Milhas por Galão",
    ylab = "Peso"
)

# Agrupar usando os quartis
# mpg
cars$mpg_quartis <- cut(cars$mpg,
    breaks = quantile(cars$mpg, probs = seq(0, 1, 0.25)),
    include.lowest = TRUE
)

# wt
cars$wt_quartis <- cut(cars$wt,
    breaks = quantile(cars$wt,
        probs = seq(0, 1, 0.25)
        # Usamos o mesmo intervalo para as duas variáveis
        # De 0 a 1, com intervalos de 0.25
    ),
    include.lowest = TRUE
)

# Tabela de frequência
table(cars$mpg_quartis, cars$wt_quartis)

# Gráfico de dispersão com agrupamento
plot(cars$mpg, cars$wt,
    col = as.numeric(cars$mpg_quartis),
    main = "Milhas por Galão x Peso",
    xlab = "Milhas por Galão",
    ylab = "Peso"
)
