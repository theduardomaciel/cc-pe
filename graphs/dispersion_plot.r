## GRÁFICO DE DISPERSÃO ================================================
# - É uma ferramenta que indica a existência, ou não,
#   de relações entre variáveis de um processo e sua intensidade.
# - Usado em Correlações e Regressão Linear.

idade <- c(
    23, 24, 25, 24, 30, 28, 31, 29, 30, 28, 33, 27, 31, 34,
    30, 28, 31, 25, 27, 30, 34, 31, 26, 32, 35, 32, 29, 30,
    35, 31, 36, 33, 33, 35, 32
)

salario <- c(
    4.25, 4.56, 5.25, 5.73, 6.26, 6.66, 6.86, 7.29, 7.59,
    7.44, 8.12, 8.46, 8.74, 8.95, 9.13, 9.35, 9.77, 9.80,
    10.53, 10.76, 11.06, 11.59, 12.00, 12.79, 13.23, 13.60, 13.85,
    14.69, 14.71, 15.99, 16.22, 16.61, 17.26, 17.75, 17.80
)

cor(idade, salario) # Calcular a correlação

plot(
    x = idade, y = salario,
    main = " Salário x Idade ",
    xlab = "Idade - variável preditora",
    ylab = "Salário - variável resposta",
    col = "blue", cex.axis = 0.75
)

abline(lsfit(idade, salario), col = "darkred", lwd = 2)
