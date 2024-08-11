## GRÁFICO EM SETORES (ou gráfico de pizza) ==============================
# Usado para apresentação de dados Qualitativos.

categorias <- c("Eletrônicos", "Moda", "Livros", "Esportes")
vendas <- c(2500, 1800, 1200, 900)

labs <- paste(" ", round(vendas / sum(vendas), 4), "%")

pie(vendas,
    labels = labs,
    main = "Distribuição de Vendas por Categoria",
    col = c("green", "palegreen", "yellow", "orange")
)

legend("topright",
    legend = categorias,
    fill = c("green", "palegreen", "yellow", "orange"),
    cex = 0.9, bty = "y"
)
