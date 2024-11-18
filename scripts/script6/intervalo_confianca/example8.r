# Intervalo de Confiança para Proporção Amostral

# Suponha que em n = 400 provas obtemos k = 80 sucessos.

# a) Obter um intervalo de confiança com 90 % de nível de confiança

resultado <- prop.test(x = 80, n = 400, conf.level = 0.90)
resultado

resultado$conf.int
