# Medidas de posição, medidas de dispersão, separatrizes e assimetria

# Medidas Descritivas

As medidas descritivas (ou de tendência central) mostram um **valor representativo** em torno do qual os dados tendem a **agrupar-se** com maior ou menor frequência.

São utilizadas para sintetizar em um único número o conjunto de dados observados. As principais características analisadas incluem:

- A tendência central dos dados;
- A dispersão ou variação em relação a esse centro;
- Os dados que ocupam certas posições;
- Simetria dos dados;
- A forma na qual os dados se agrupam

As principais medidas descritivas ou de tendência central, são:

- Média;

- Moda;

- Mediana;

- Separatrizes (Quartis, Quintis, Decis e Percentis).

## Média Aritmética Simples

$$
\overline{x}=\frac{(x_1+...+x_n)}{n}
$$

```r
média <- sum(x)/lenght(x)
média <- mean(x)
```

### Propriedades da Média

- A soma algébrica de todos os desvios tomados em relação a média (a diferença entre cada elemento de um conjunto de valores e a média aritmética) é nula;
**Exemplo**:
    
    $$
    {8, 10, 12} \rightarrow média=10 \newline
    (8 - 10) + (10 - 10) + (12 –  10) \newline
    -2 + 0 + 2 = 0
    
    $$
    
- Somando-se ou subtraindo-se uma constante (c) de todos os valores uma variável, a média do conjunto fica aumenta ou diminuída dessa constante;
**Exemplo:** $\{8+4, 10+4, 12+4 \} = \{12, 14, 16\} \hspace{0.1cm} \therefore  \hspace{0.1cm}média = 14 \hspace{0.1cm} \rightarrow \hspace{0.1cm} 10 + 4 = 14$
- Multiplicando-se ou dividindo-se todos os valores uma variável, por uma constante (c ),
a média do conjunto fica multiplicada ou dividida por essa constante.
**Exemplo:** $\{8*4, 10*4, 12*4 \} = \{32, 40, 48\} \hspace{0.1cm} \therefore  \hspace{0.1cm}média = 40\hspace{0.1cm} \rightarrow \hspace{0.1cm} 10 * 4 = 40$

## Média Aritmética Ponderada

$$
\overline{x}=\frac{x_1p_1+...+x_np_n}{p_1+...+p_n}
$$

```r
média <- sum(x, w) / sum(w)
média <- weighed.mean(x, w)
```

### Exemplo

O exame de seleção pode ser composto de 3 provas, onde as duas primeiras tem peso 1 e a terceira tem peso 2. 

Um candidato com notas 70, 75 e 90 terá média final: $\overline{x}=\frac{x_1p_1+...+x_np_n}{p_1+...+p_n}=\frac{1.(70)+1.(75)+2.(90)}{1+1+2}=81,25$

## Média Geométrica

É utilizada principalmente para calcular médias de razões, de taxas de variação e de índices econômicos ou quando os dados segue uma tendencia geométrica.

$$
\overline{x}=\sqrt[n]{x_1*x_2*...*x_n}
$$

```r
média <- prod(x) ^ (1 - length(x))
```

### Ponderada

$$
\overline{x}_g = \sqrt[\sum_{j=1}^{k} fj]{x_1^{f^1} \cdot x_2^{f^2} \cdot \dots \cdot x_k^{f^k}}
$$

```r
média <- (prod(x ^ f)) ^ (1 / sum(f)
```

## Média Harmônica

Relacionada ao cálculo matemático das situações envolvendo as grandezas inversamente proporcionais.

Normalmente, é adequado para situações em que a média das taxas é desejada.

$$
Mh = \frac{n}{\frac{n_1}{x_1} + \frac{n_2}{x_2} + \frac{n_3}{x_3} + \dots + \frac{n_n}{x_n}} = \frac{n}{\sum_{i=1}^{n} \frac{n_i}{x_i}}
$$

```r
mh <- length(x) / sum(1/x)
```

- Para dados não agrupados $n=1$.
- Para dados agrupados sem intervalo de classe $Xi$ é o valor da variável.
- Para dados agrupados com intervalo de classe $Xi$ é o ponto médio da classe.

### Exemplo 1

Um investidor compra $ 18.000 de ações de uma empresa a $ 45 a ação, e em seguida compra $18.000 a $ 36 a ação. Qual o preço médio por ação, pago pelo investidor?

$$
\overline{x_h}=\frac{2}{\frac{1}{45}+\frac{1}{36}}=2 \cdot \frac{1620}{81}=2.20=\$ 40
$$

### Exemplo 2

Cálculo matemático de grandezas inversamente proporcionais (por exemplo, velocidade e tempo) Usando os valores de 50 e 60 Km, qual a média harmônica da velocidade? 

Sabemos que a média aritmética = 55 Km.

$$
\overline{x_h}=\frac{2}{\frac{1}{50}+\frac{1}{60}}=2 \cdot \frac{300}{11}=54,54 \mathrm{Km}
$$

## Relação entre as médias

- A média geométrica e a média harmônica são menores, ou no máximo igual, à aritmética.
- A igualdade só ocorre no caso em que todos os valores da amostra são idênticos.
- Quanto maior a variabilidade, maior será a diferença entre as médias harmônica e geométrica e a média aritmética, portanto, $H \le G \le \overline{X}$
- Exemplo: Para a amostra 12, 14 e 16 temos:
$H=13,81<G=13,90< \overline{X}=14,00$

## Mediana

A mediana de um conjunto de valores, dispostos segundo uma ordem (crescente ou decrescente) é o valor situado de tal forma no conjunto que o separa em dois subconjuntos de mesmo número de elementos.

- Se a série dada tiver **número ímpar de termos**, o valor mediano será o termo de ordem dado pela fórmula:
    
    $$
    Md=\frac{n+1}{2}
    $$
    

**Exemplo:**

Na amostra:

$$
32 +36 +42 +42 +58 \newline Md=42
$$

- Se a série dada tiver **número par de termos**, o valor mediano será o termo de ordem dado pela fórmula:
    
    $$
    Md=\frac{[(\frac{n}{2})+(\frac{n}{2}+1)]}{2}
    $$
    

**Exemplo:**

Na amostra:

$$
30+40+42+45+50+80 \newline Md=43,5
$$

### Mediana (Md) para dados agrupados ou tabelados

$$
M_d=l_i+\left[\frac{\left(\frac{n}{2}\right)-f_{a b s \ a n t \ a c}}{f_{a b s}}\right] \cdot \mathrm{C}
$$

Sendo:

- $l_i$: limite inferior da classe Mediana;
- $n$: número total de elementos da série;
- $f_{a b s \ a n t \ a c}$ :  frequência absoluta anterior acumulada a classe Mediana;
- $f_{a b s}$ : frequência absoluta da classe Mediana;
- $c$ : amplitude da classe Mediana.

## Moda “Mo”

É o valor que ocorre com mais frequência, em uma série de valores. Numa amostra, a Moda **pode não existir** ou **ser múltipla**.

Exemplos:

- Na amostra 21 24 27 27 28 28 31 31 31 → Mo = 31 → Unimodal
- Na amostra 45 46 49 52 52 60 60 76 79 → Mo = 52 e 60 → Bimodal
- Na amostra 3 5 8 10 12 13 → Amodal

```r
# ---- Moda ----------------------------------------
dfx <- c(2, 7, 8, 9, 5, 10, 22, 14, 15, 22)
freqdfx <- (table(dfx))
subset (freqdfx, freqdfx == max(freqdfx))

22
2

# ---- Multimodal ---------------------------------
dfx <- c( 2, 7, 8, 9 , 8, 10 , 14, 14, 10, 22)
freqdfx <- (table(dfx))
subset (freqdfx, freqdfx == max(freqdfx))
dfx

8 10 14
2  2  2

# ---- Amodal -----------------------------------
dfx <- c( 2, 7, 8, 9 , 5, 10, 22, 14, 15, 12)
freqdfx <- (table(dfx))
subset (freqdfx, freqdfx == max(freqdfx))
dfx

2 5 7 8 9 10 12 14 15 22
1 1 1 1 1  1  1  1  1  1
```

## Medidas Separatrizes

A principal característica das medidas separatrizes consiste na separação da série ordenada em ordem crescente em partes iguais que apresentam o mesmo número de valores.

São números reais que dividem a sequência ordenada de dados em partes que contêm a mesma quantidade de elementos da série.

É possível ter os seguintes múltiplos.

- **Mediana** - Divide um conjunto em dois grupos com 50% dos dados cada;
- **Quartis (Q)** - Divide o conjunto em quatro partes Iguais;
- **Quintis (K)** - Cada parte fica com 20%;
- **Decis (D)** – Divide em 10 partes iguais o conjunto, onde cada parte fica com 10% dos dados;
- **Percentis** – Divide em 100 partes iguais o conjunto, onde cada uma ficará com 1% dos elementos;

<aside>
💡 Os quartis, quintis e decis são múltiplos dos percentis

</aside>

### Quartis $(Q_1, Q_2 \ e \ Q_3)$

São valores de um conjunto de dados ordenados, que os dividem em quatro partes iguais.

- Q1 : deixa 25% dos elementos abaixo dele.
- Q2 : deixa 50% dos elementos abaixo dele e **coincide com a mediana**.
- Q3 : deixa 75% dos elementos

```r
valores <- c(10, 15, 20, 25)
quantile(valores, probs = 0.25)

  25%
13.75

quantile(valores, probs = c(0.10, 0.35, 0.50, 0.75, 0.90))

   10%  35%   50%   75%   90%
11.50 15.25 17.50 21.25 23.50
```

# Medidas de Dispersão

As medidas de dispersão **medem a variabilidade dos dados**. Permitem verificar se o conjunto de dados é homogêneo ou heterogêneo.

São medidas estatísticas que medem a dispersão dos dados, em torno de um valor central.

Considere o valor (em reais) ganho de três grupos de empregados: 

- A: 70, 70, 70, 70, 70

- B: 50, 60, 70, 80, 90

- C: 5, 15, 50, 120, 160

Podemos verificar que, apesar de apresentarem a mesma média (70), os três grupos apresentam
comportamento diferenciado, pois o grupo A é o mais homogêneo, e o grupo C é o que apresenta maior variação de ganho.

<aside>
💡 Quanto maior a variabilidade, maior será a dispersão das observações.

</aside>

As principais medidas de dispersão ou variabilidade, são:

- Amplitude;

- Desvio padrão;

- Variância;

- Coeficiente de variação.

### Amplitude

Amplitude total ou máxima é a diferença entre o maior e o menor valor de um conjunto de dados.

$$
A = ( valor maior) - (valor menor)
$$

Depende apenas dos valores maior e menor, **não é tão útil quanto as outras medidas de variação que usam todos os valores**.

Para dados agrupados ou tabelados:  A = (limite inf. da classe inferior – limite sup. da classe superior)

### Variância

É uma medida de dispersão que **mede a variabilidade de um conjunto de dados**.

A variância é definida como a média das diferenças quadráticas de n valores em relação à sua média aritmética.

**Propriedades da Variância:**

- Para qualquer distribuição a variância é sempre uma quantidade positiva.
- Se os valores das observações são todos iguais então a variância é zero.
- Variância de uma constante é zero.
- Se somarmos ou subtrairmos uma mesma constante de cada elemento de um conjunto de dados, sua variância não se altera.
- Se multiplicarmos ou dividirmos a cada elemento de um conjunto de dados por uma
mesma constante sua variância fica multiplicada ou dividida pelo quadrado da
constante.

### Desvio Padrão

 É raiz quadrada da variância. Possui a mesma unidade das observações.

### Coeficiente de Variação

O Coeficiente de Variação caracteriza a dispersão ou variabilidade dos dados em termos relativos ao valor médio.
É dado pela fórmula: $CV= \frac{deviopadrão}{média} \ . \ 100$

Quanto maior o coeficiente de variação, maior é a variação entre os dados do grupo avaliado.

A variabilidade de um conjunto de dados depende da área de pesquisa. Contudo, alguns
autores apresentam que:

- **CV ≤ 20**% a amostra é **homogênea**;
- **CV > 20%** a amostra é **heterogênea**

```r
x <- c(10, 12, 14, 16, 18)

# Amplitude
max(x) - min(x)

# Variância
var(x)

# Desvio padrão (standard deviation)
sd(X)

# Coeficiente de Variação
sd(x) / (mean(x) * 100
```

## Medidas de Assimetria

A **medida de assimetria** é baseada nas **relações entre a média, mediana e moda**.

A distância entre a média e a moda pode ser usada para medir a assimetria, ou seja, quanto maior é a distância, seja negativa ou positiva, maior é a assimetria da distribuição.

Estas medidas referem-se à forma da curva de uma distribuição de frequência, mais
especificamente do polígono de frequência ou do histograma.

Denomina-se **assimetria** o grau de afastamento de uma distribuição da unidade de assimetria.

<aside>
💡 Em uma distribuição simétrica, tem-se igualdade dos valores da média, mediana e moda.

</aside>

### Assimetria à direita (ou positiva)

Concentração (moda) à esquerda → Assimetria à direita

![direita.png](Medidas%20de%20posic%CC%A7a%CC%83o,%20medidas%20de%20dispersa%CC%83o,%20separ%200f2774699b20431e805b85e85d0295b1/direita.png)

A maioria dos valores se concentra à esquerda da média, com alguns valores extremamente altos puxando a média para a direita, o que pode distorcer a interpretação dos resultados.

Por exemplo, em um estudo sobre salários, uma **assimetria positiva** significaria que **algumas pessoas ganham salários muito elevados, enquanto a maioria ganha salários mais baixos**. 

![image.png](Medidas%20de%20posic%CC%A7a%CC%83o,%20medidas%20de%20dispersa%CC%83o,%20separ%200f2774699b20431e805b85e85d0295b1/image.png)

Isso pode indicar desigualdade salarial na amostra.

Importante considerar a assimetria ao analisar os dados e tirar conclusões.

Podemos indicar que a média não é uma medida adequada para representar o centro da distribuição e que outras medidas, como a mediana, podem ser mais apropriadas.

Investigar a presença de outliers e entender como eles podem estar influenciando os resultados

---

### Assimetria à esquerda (ou negativa)

Concentração (moda) à direita → Assimetria à esquerda

![2.png](Medidas%20de%20posic%CC%A7a%CC%83o,%20medidas%20de%20dispersa%CC%83o,%20separ%200f2774699b20431e805b85e85d0295b1/2.png)

Concentração maior de valores acima da média.

Cauda longa à esquerda da distribuição.

**Pode indicar que há valores extremamente baixos que estão puxando a média para baixo, ou que a distribuição de dados é mais concentrada em valores mais altos**.

Pode influenciar a interpretação dos dados, pois sugere que há uma desproporção na distribuição dos valores.

Pode ajudar a identificar potenciais discrepâncias nos dados e direcionar a análise para investigar as causas desse desequilíbrio na distribuição.

![image.png](Medidas%20de%20posic%CC%A7a%CC%83o,%20medidas%20de%20dispersa%CC%83o,%20separ%200f2774699b20431e805b85e85d0295b1/image%201.png)

![image.png](Medidas%20de%20posic%CC%A7a%CC%83o,%20medidas%20de%20dispersa%CC%83o,%20separ%200f2774699b20431e805b85e85d0295b1/image%202.png)

![image.png](Medidas%20de%20posic%CC%A7a%CC%83o,%20medidas%20de%20dispersa%CC%83o,%20separ%200f2774699b20431e805b85e85d0295b1/image%203.png)

### Coeficiente de Assimetria de Fischer

Também conhecido como skewness de Pearson

- Um valor de 0: distribuição é perfeitamente simétrica. 
Média = Mediana = Moda
- Um **valor positivo** - Assimetria à direita. 
A cauda direita da distribuição é mais longa ou gorda.
Média > Mediana > Moda
- Um **valor negativo** - Assimetria à esquerda. 
A cauda esquerda da distribuição é mais longa ou gorda. 
Média < Mediana < Moda

$$
\text { Assimetria }=\frac{n}{(n-1)(n-2)} \sum_{i=1}^n\left(\frac{x_i-\bar{x}}{s}\right)^3
$$

Onde:

· n é o número de observações.

· Xi é o valor de cada observação.

· x é a média das observações.

· s é o desvio padrão das observações.

<aside>
💡 No R, os pacotes **e1071** e **moments** fornecem função para calcular o coeficiente de assimetria (skewness)
Para instalar basta inserir o seguinte snippet:

```r
install.packages("e1071")
library(e1071)
```

</aside>

## Curtose

É uma medida estatística que descreve a forma da distribuição dos dados em relação à sua concentração em torno da média. 

Descreve a forma das caudas de uma distribuição em comparação com uma distribuição normal.

Em relação à curva normal, uma curva pode ser:

![image.png](Medidas%20de%20posic%CC%A7a%CC%83o,%20medidas%20de%20dispersa%CC%83o,%20separ%200f2774699b20431e805b85e85d0295b1/image%204.png)

- **Mesocúrtica:** É uma curva que apresenta a mesma curtose da curva normal. 
Curtose é igual a 0,263.
Caudas e o pico são semelhantes a distribuição normal.
- **Platicúrtica:** é a curva mais achatada que a distribuição normal, curtose superior à normal. 
Curtose é maior que 0,263. 
Menor presença de valores extremos (outliers) do que a distribuição normal.
- **Leptocúrtica:** é a curva mais alongada que a distribuição normal, curtose inferior à normal. Curtose é menor que 0,263. 
Maior presença de valores extremos (outliers) do que a distribuição normal.