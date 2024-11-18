# TESTES DE HIPÓTESES para a Média com Variância Desconhecida

# Os registros dos últimos anos de um colégio atestam para os calouros
# admitidos uma nota média 115 (teste vocacional).
# Para testar a hipótese de que a média de uma nova turma é a mesma das turmas anteriores,
# retirou–se uma amostra de 20 notas, obtendo–se média 118 e desvio padrão 20.
# Admita um nível de significância de 5% para efetuar o teste.

# Hipóteses:
# - H0 : = 115
# - H1 : 115
# Como se trata de uma amostra pequena, utilizar a distribuição t de Student com
# g.l. = n–1 = 20–1 = 19.

qt(0.025, df = 19) # -2,093
qt(0.975, df = 19) # 2,093

# Como o valor observado não está na região crítica do teste, não rejeitamos H0.
# Ou seja, ao nível de 5% de significância, não há indícios de que a média tenha se alterado.
# Aceitamos H0, ou seja, a média é 115.

# Plot do gráfico

x <- seq(-4, 4, 0.01)
y <- dt(x, df = 19)
plot(x, y, type = "l", col = "blue", lwd = 2, xlab = "t", ylab = "f(t)")

abline(v = -2.093, col = "red", lty = 2)
abline(v = 2.093, col = "red", lty = 2)

# Área de rejeição
x1 <- seq(-4, -2.093, 0.01)
y1 <- dt(x1, df = 19)
polygon(c(-4, x1, -2.093), c(0, y1, 0), col = "gray")

x2 <- seq(2.093, 4, 0.01)
y2 <- dt(x2, df = 19)
polygon(c(2.093, x2, 4), c(0, y2, 0), col = "gray")

# Colocamo os textos indicando a área de 0.025
text(-3.5, 0.1, "0.025", col = "red")
text(3.5, 0.1, "0.025", col = "red")

t_obs <- (118 - 115) / (20 / sqrt(20))
t_obs

abline(v = t_obs, col = "green", lty = 2)
text(t_obs, 0.1, "t_obs", col = "green")
