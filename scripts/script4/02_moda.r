# --------------- Moda------------------------

dfx <- c(2, 7, 8, 9, 5, 10, 22, 14, 14, 12)
freq_dfx <- (table(dfx))
freq_dfx[freq_dfx == max(freq_dfx)]

## ou

dfx <- c(2, 7, 8, 9, 5, 10, 22, 14, 15, 22)
freq_dfx <- (table(dfx))
subset(freq_dfx, freq_dfx == max(freq_dfx))

# -----------Multimodal ----------------------

dfx <- c(2, 7, 8, 9, 8, 10, 2, 14, 14, 12)
freq_dfx <- (table(dfx))
freq_dfx[freq_dfx == max(freq_dfx)]

# ou

dfx <- c(2, 7, 8, 9, 8, 10, 14, 14, 10, 22)
freq_dfx <- (table(dfx))
subset(freq_dfx, freq_dfx == max(freq_dfx))

# ------------ Amodal-----------------------

dfx <- c(2, 7, 8, 9, 5, 10, 22, 14, 15, 12)
freq_dfx <- (table(dfx))
freq_dfx[freq_dfx == max(freq_dfx)]

# ou

dfx <- c(2, 7, 8, 9, 5, 10, 22, 14, 15, 12)
freq_dfx <- (table(dfx))
subset(freq_dfx, freq_dfx == max(freq_dfx))
