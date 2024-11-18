# Aluno 1   Aluno 2     Aluno 3     Aluno 4
# 68.5      76.3        70.6        75.4
# 74.0      75.3        75.2        69.9
# 67.2      74.0        70.8        78.6
# 69.9      71.2        74.7        87.5
# 68.0      74.5        72.9        70.4
# 71.5      74.5        73.2        86.5
# 55.0      68 + xx/4   70 + xx/5   74 + xx/6


setwd("./data/prova")

xx <- 16
# alunos <- read.table("AlunosNotas.csv", header = TRUE, sep = ";", dec = ".")

# Dados
aluno1 <- c(68.5, 74.0, 67.2, 69.9, 68.0, 71.5, 55.0)
aluno2 <- c(76.3, 75.3, 74.0, 71.2, 74.5, 74.5, 68 + xx / 4)
aluno3 <- c(70.6, 75.2, 70.8, 74.7, 72.9, 73.2, 70 + xx / 5)
aluno4 <- c(75.4, 69.9, 78.6, 87.5, 70.4, 86.5, 74 + xx / 6)

# a) Ler ou importar o arquivo AlunosNotas.csv com os dados acima
# e elaborar e interpretar o quadro gerado pela Análise de Variância (ANOVA)

alunos <- data.frame(aluno1, aluno2, aluno3, aluno4)
alunos <- stack(alunos)
alunos

result <- aov(values ~ ind, data = alunos)
anova(result)

# b) Verificar se há divergências entre as médias dos alunos,
# gerar o teste de Tukey e interpretar os resultados a 5% e a 1% de significância.

# Verificar se há divergências entre as médias dos alunos
tukey <- TukeyHSD(result)
tukey

# Para os valores de p < α podemos afirmar que as médias diferem ao nível de significância de 5% (α = 0,05).
# Quando p > α não é possível afirmar que as médias diferem.
# Diferenças acentuadas entre a borda e o centro.

# Assim, no nosso caso, as médias dos alunos diferem ao nível de significância de 5% (α = 0,05), visto que
# p-value = 0.0001 = 0.01% é menor que 5%,

# Interpretar os resultados a 5% e a 1% de significância
tukey <- TukeyHSD(result, conf.level = 0.95)
tukey

tukey <- TukeyHSD(result, conf.level = 0.99)
tukey

# Para 5%:
# Assim,

# Para 1#:
# Assim, no nosso caso, as médias dos alunos diferem ao nível de significância de 1% (α = 0,01), visto que
# p-value = 0.0001 = 0.01% é menor que 1%,

# Tukey multiple comparisons of means
# 	95% family-wise confidence level

# Fit: aov(formula = values ~ ind, data = alunos)

# $ind
#                	diff    	lwr   	upr 	p adj
# aluno2-aluno1  6.242857 -0.8387723 13.324487 0.0978129
# aluno3-aluno1  5.214286 -1.8673437 12.295915 0.2047743
# aluno4-aluno1 10.123810  3.0421801 17.205439 0.0031822
# aluno3-aluno2 -1.028571 -8.1102008  6.053058 0.9777273
# aluno4-aluno2  3.880952 -3.2006770 10.962582 0.4463298
# aluno4-aluno3  4.909524 -2.1721056 11.991153 0.2495157

#   Tukey multiple comparisons of means
# 	99% family-wise confidence level

# Fit: aov(formula = values ~ ind, data = alunos)

# $ind
#                	diff   	lwr   	upr 	p adj
# aluno2-aluno1  6.242857 -2.664048 15.149762 0.0978129
# aluno3-aluno1  5.214286 -3.692619 14.121191 0.2047743
# aluno4-aluno1 10.123810  1.216905 19.030715 0.0031822
# aluno3-aluno2 -1.028571 -9.935476  7.878334 0.9777273
# aluno4-aluno2  3.880952 -5.025953 12.787857 0.4463298
# aluno4-aluno3  4.909524 -3.997381 13.816429 0.2495157

# Com base no teste de Tukey para 5%, as médias dos alunos diferem ao nível de significância de 5% (α = 0,05), visto que p-value = 0.0001 = 0.01% é menor que 5%.

# Já para o teste de Tukey para 1%, as médias se diferem ao nível de significância de 1% (α = 0,01), visto que p-value = 0.0001 = 0.01% é menor que 1%.
