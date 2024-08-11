produtos <- c("A", "B", "C", "D")
vendas <- c(120, 160, 150, 185)

barplot(vendas,
    names.arg = produtos,
    main = "Vendas de Produtos", col = c(2:5),
    xlab = "Vendas (em milhares)",
    ylab = "Quantidade Vendida",
    ylim = c(0, 250)
)

text(
    x = vendas, y = vendas + 10,
    labels = vendas, cex = 1.5,
    col = "black"
) # Adiciona os valores acima das barras

barplot(vendas,
    names.arg = produtos,
    main = "Vendas de Produtos", col = c(2:5),
    xlab = "Vendas (em milhares)",
    ylab = "Quantidade Vendida",
    horiz = TRUE,
    xlim = c(0, 250), # como o gráfico está na horizontal, o eixo x é usado ao invés de ylim
)
