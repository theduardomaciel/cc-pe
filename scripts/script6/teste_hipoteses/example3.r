# TESTES DE HIPÓTESES para a Média com Variância Desconhecida

# Deseja-se investigar se uma certa moléstia que ataca o rim
# altera o consumo de oxigênio desse órgão.
# Para indivíduos sadios, admite-se que esse consumo tem distribuição Normal com média 12cm3/min.
# Os valores medidos em cinco pacientes com a moléstia foram:
# 14,4; 12,9; 15,0; 13,7 e 13,5.
# Qual seria a conclusão, ao nível de 1% de significância?

# O teste de interesse é:
# - H0 : A moléstia não altera a média de consumo renal de oxigênio;
# - H1 : Indivíduos portadores da moléstia têm média alterada.
# - Hipóteses:
# - H0 : μ = 12
# - H1 : μ ≠ 12

# Na tabela de Student
qt(0.005, df = 4) # -4.604
qt(0.995, df = 4) # 4.604

vp <- c(14.4, 12.9, 15.0, 13.7, 13.5)

# Calculando o t observado
# Fórmula: t = (X̄ - μ) / (S / √n)
# Onde:
# - X̄ é a média amostral;
# - μ é a média populacional;
# - S é o desvio padrão amostral;
# - n é o tamanho da amostra.
t_obs <- (mean(vp) - 12) / (sd(vp) / sqrt(5))
t_obs

# Portanto, como t_obs ∈ RC, decidimos pela rejeição da hipótese nula,
# ou seja, a moléstia tem influência no consumo renal médio de oxigênio ao nível de 1%.

t.test(vp, mu = 12, conf.level = 0.99, alternative = "two.side")

# O intervalo de confiança encontrado não inclui o valor 12,
# que foi a hipótese nula do exemplo.
# Dessa forma, confirmamos que a hipótese nula é rejeitada.
