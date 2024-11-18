# TESTES DE HIPÓTESES para a Média com Variância Desconhecida

# Foram coletados dados na Universidade Federal, em que buscou constatar se a tensão
# fornecida pela rede corresponderia a tensão de 127 V em tomadas da Universidade.
# Foram analisadas no total 15 tomadas, as quais compuseram a amostra:
# 125; 124; 125; 125; 125; 125; 124; 123; 122; 123; 123; 123; 123; 124; 124.
# (calculando: desvio padrão = 0,99 e média = 123,87).
# Nível de confiança de 95%

# Hipóteses:
# - H0 : 𝜇 = 127
# - H1 : 𝜇 ≠ 127

x <- c(125, 124, 125, 125, 125, 125, 124, 123, 122, 123, 123, 123, 123, 124, 124)
media <- mean(x)
desvio <- sd(x)
n <- length(x)

tc <- (media - 127) / (desvio / sqrt(n))
tc # t_calc = -12.2526

# Na tabela t de Student:
qt(0.025, df = n - 1) # t_crit = -2,145
qt(0.975, df = n - 1) # t_crit = 2,145

# Como t_calc < t_alfa/2, rejeitamos H0 (a hipótese nula)
# e conclui-se que a tensão é diferente (≠) de 127 V.

t.test(x, mu = 127, conf.level = 0.95)

# ====================================================================

# Hipóteses:
# - H0 : 𝜇 = 127
# - H1 : 𝜇 < 127

t.test(x, mu = 127, alternative = "less", conf.level = 0.95)

# Como t_calc(=-12.2526) < t_alfa(=-1.7613), rejeitamos H0 (a hipótese nula)
# e conclui-se que a tensão é menor (<) de 127 V.
