# Um processo de produção produz 10 itens defeituosos por hora.
# Encontre a probabilidade que 4 ou menos itens
# sejam defeituosos numa retirada aleatória por hora.

# Temos uma: Distribuição de Poisson
# Poisson é uma distribuição de probabilidade de variáveis aleatórias discretas
# que expressa a probabilidade de uma série de eventos ocorrer num certo período de tempo.

# Definindo a distribuição de probabilidades
lambda <- 10
n <- 4

# Qual é a probabilidade de 4 ou menos itens serem defeituosos numa retirada aleatória por hora?
ppois(n, lambda) # ou sum(dpois(0:n, lambda))
# ppois é a função de distribuição acumulada
