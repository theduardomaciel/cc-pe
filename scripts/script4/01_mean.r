# Media Harmônica e Geométrica

x <- c(45, 36)
harmonic_mean <- length(x) / sum(1 / x)
print(paste("Média Harmônica:", harmonic_mean))

x <- c(50, 60)
harmonic_mean <- length(x) / sum(1 / x)
print(paste("Média Harmônica:", round(harmonic_mean, 4)))


# Média geométrica

x <- c(10, 60, 360)
geometrical_mean <- prod(x)^(1 / length(x))
print(paste("Média Geométrica:", geometrical_mean))

x <- c(1, 3, 9, 27)
f <- c(2, 4, 2, 1)
geometrical_mean <- (prod(x^f))^(1 / sum(f))
print(paste("Média Geométrica:", round(geometrical_mean, 4)))
