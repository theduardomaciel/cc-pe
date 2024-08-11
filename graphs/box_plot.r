## BOX PLOT (ou gráfico de caixa) ================================
# - Fornece uma análise visual da posição, dispersão, simetria,
#   caudas e valores discrepantes (outliers) do conjunto de dados.

# - A distribuição é simétrica, quando a linha da mediana está no
#   segundo quartil, ou seja, na mediana (meio do retângulo).

# - Assimetria positiva (à direita):
#   A distribuição é assimétrica à direita, quando a linha da mediana
#   está mais próxima do primeiro quartil (extremidade inferior do retângulo).

# - Assimetria negativa (à esquerda):
#   A distribuição é assimétrica à esquerda, quando a linha da mediana
#   está mais próxima do terceiro quartil (extremidade superior do retângulo).

# - O boxplot é composto por:
#   * Linha central: mediana (Q2).
#   * Retângulo: intervalo interquartil (IQR = Q3 - Q1).
#   * Linhas verticais: mínimo e máximo (Q1 - 1.5 * IQR e Q3 + 1.5 * IQR).
#   * Pontos: outliers (valores discrepantes).

#   * (outliers) = valores discrepantes
#   │
# ┄Max┄ (Q3 + 1.5 * IQR)
#   │
#  ━┳━
#   ┃
#  Q3 (terceiro quartil)
#   ┃
#   ┃
#  Med (Q2 ou mediana)
#   ┃
#   ┃
#  Q1 (primeiro quartil)
#   ┃
#  ━┻━
#   │
# ┄Min┄ (Q1 - 1.5 * IQR)
#   │
#   * (outliers) = valores discrepantes

# ------------------------------------

age <- c(21, 22, 24, 18, 19, 27, 22, 22, 23, 21, 23, 21)

boxplot(age, main = "Boxplot: Idade", col = "blue")

require(MASS)
data(cats)
boxplot(cats$Bwt ~ cats$Sex,
    main = "Boxplot Comparativo: Peso x Sexo",
    col = c("red", "blue"),
    xlab = "Gênero biológico dos Gatos",
)

# ------------------------------------

x <- c(0, 2, 3, 3, 4, 5, 8, 10, 12, 15, 24)
summary(x)

par(mfrow = c(1, 2))

boxplot(x)
boxplot(x, horizontal = TRUE)

# ------------------------------------

x <- c(25, 23, 22, 21, 21, 17, 15, 7, 5, 4, 2)
summary(x)

par(mfrow = c(1, 2))

boxplot(x)
boxplot(x, horizontal = TRUE)
