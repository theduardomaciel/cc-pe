# Uma nova metodologia de desenvolvimento de software se propõe a
# reduzir o tempo de projeto e desenvolvimento de sistemas de informação.
# Assim, foram considerados 24 projetos, sendo 12 de tecnologia atual e 12 com a nova proposta.
# Os valores, em horas, estão a seguir:

# TecAtual: 300, 280, 344,385, 372, 360, 288, 321, 376, 290, 301, 300 + XX
# TecNova: 274, 220, 308, 336, 198, 300, 315, 258, 318, 310, 273, 275 + XX

# Considere nível de significância de 5 %, as hipóteses:

# a) Testar e interpretar a situação das variâncias das amostras
# e utilizar o resultado para o cálculo do item b) abaixo.

xx <- 16

# Dados
antes <- c(300, 280, 344, 385, 372, 360, 288, 321, 376, 290, 301, 300 + xx)
depois <- c(274, 220, 308, 336, 198, 300, 315, 258, 318, 310, 273, 275 + xx)

# Teste t pareado
resultado <- var.test(antes, depois)
resultado

# Interpretação
# Como p-value = 0.7824 = 78.24% é maior que 5%, não rejeitamos a hipótese nula.
# Ou seja, as variâncias das amostras são homogêneas.

# b) Verificar se a nova tecnologia reduziu o tempo de projeto
# (existe diferenças entre as duas Tecnologias), e justificar
# utilizando as regiões de “Não rejeição” e “Região Crítica” e p-value.

# A nova tecnologia reduziu o tempo de projeto?

# Hipóteses:
# - H0 : 𝜇1 = 𝜇2
# - H1 : 𝜇1 ≠ 𝜇2
