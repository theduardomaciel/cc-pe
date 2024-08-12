# ------------ Desvio Padrão ---------------

x <- c(10, 12, 14, 16, 18)
var(x) # Variância
sd(x) # Desvio Padrão (standard deviation - raiz quadrada da variância)

# ----------- Coeficiente de Variação ------------

months <- c("Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago", "Set")
hotel_a <- c(760, 690, 380, 280, 320, 300, 710, 270, 360)
hotel_b <- c(420, 450, 510, 460, 470, 440, 480, 430, 410)

hotels <- data.frame(months, hotel_a, hotel_b)

str(hotels)

mean(hotels$hotel_a)
mean(hotels$hotel_b)
var(hotels$hotel_a)
var(hotels$hotel_b)
sd(hotels$hotel_a)
sd(hotels$hotel_b)

sd(hotels$hotel_a) / mean(hotels$hotel_a) * 100
sd(hotels$hotel_b) / mean(hotels$hotel_b) * 100
