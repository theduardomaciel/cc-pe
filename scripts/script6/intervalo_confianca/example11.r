# Intervalo de Confiança para Proporção Amostral

# Um empreendedor deseja lançar um novo produto e contrata uma empresa para
# realizar uma pesquisa de mercado com 500 clientes.
# Entre os 500 clientes 157 manifestam interesse em comprar o produto.

# a) Elaborar um intervalo de confiança de 92% para a probabilidade de uma pessoa comprar o produto.

alfa <- 0.08 # 1 - 0.92
n <- 500
p <- 157 / 500

zc <- qnorm(1 - alfa / 2, mean = 0, sd = 1)

erro <- zc * sqrt(p * (1 - p) / n)

cat("Intervalo de confiança: (", p - erro, ", ", p + erro, ")\n")

# Testando

prop.test(x = 157, n = 500, conf.level = 0.92)
