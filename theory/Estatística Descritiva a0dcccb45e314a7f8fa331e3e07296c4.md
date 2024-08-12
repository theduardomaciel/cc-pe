# Estatística Descritiva

É o ramo da estatística que visa sumarizar e descrever qualquer conjunto de dados.

# Tipos de Variáveis

## Variáveis Numéricas (ou quantitativas)

São aquelas que apresentam valores que representam quantidades.

Variáveis numéricas podem ser:

- **Variáveis discretas:** apresentam valores numéricos que surgem a partir de um
processo de contagem.
**Exemplos:** nº de filhos, nº de peças defeituosas
- **Variáveis contínuas:** produzem respostas numéricas que surgem a partir de um
processo de medição.
**Exemplos:** altura (metros), peso (kg), renda (R$)

## Variáveis Categóricas (ou qualitativas)

São aquelas que apresentam valores que podem ser classificados, ou seja, posicionados em categorias.

Variáveis categóricas podem ser:

- **Variáveis nominais:** não existe ordenação dentre as categorias. 
Exemplos: sexo, cor dos olhos, fumante/não fumante, doente/sadio.
- **Variáveis ordinais:** existe uma ordenação entre as categorias. 
Exemplos: escolaridade (1°, 2°, 3° graus), estágio da doença (inicial, intermediário, terminal),
mês de observação (janeiro, fevereiro, ... , dezembro)

# Pirâmide DIK

A Pirâmide DIK é um modelo conceitual que ilustra a hierarquia e a relação entre (1) **dados**, (2) **informação** e (3) **conhecimento**. 

Essa estrutura ajuda a entender como os dados brutos são transformados em informações úteis e, finalmente, em conhecimento aplicável. 

A pirâmide é composta por três níveis, com os dados formando a base, a informação no meio e o conhecimento no topo.

# Séries Estatísticas

Série é uma sucessão de **números** referidos a qualquer variável. 

Podemos classificá-las em:

- **Cronológicas:** relacionadas ao Tempo (fator temporal ou cronológico) – ”época do fenômeno analisado”
**Exemplo:** relação entre Meses x Vendas
- **Geográficas:** relacionadas ao Local (fator espacial ou geográfico) – ”local onde o fenômeno acontece”
**Exemplo:** relação entre Estados x Renda per capita
- **Específicas:** relacionadas ao Fenômeno (espécie do fato ou fator especificativo) – ”o que é descrito”
**Exemplo:** relação entre Linha de Produto x Vendas

# Distribuição em Frequência

Após a realização de uma pesquisa em que os dados foram coletados, é necessário organizá-los e classificá-los. Uma forma eficiente de visualização de dados para determinados estudos é através das **tabelas de distribuição de frequência** e dos **histogramas**.

A distribuição em frequência pode ser realizada para dois tipos de valores:

1. **Valores Pontuais:** utilizada para variáveis qualitativas ou discretas
2. **Valores agrupados em intervalos de classe:** utilizada para variáveis quantitativas

## Valores Pontuais

**Exemplo 1:**  Notas de uma disciplina

| 10 | 10 | 9,5 | 9,0 | 9,0 | 8,5 | 8,5 | 7,5 |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 7,5 | 6,5 | 6,5 | 6,5 | 6,0 | 6,0 | 5,5 | 4,5 |

Fonte: IC - UFAL

- **Frequência absoluta ($fa_i$):** corresponde ao número de observações que temos em
uma determinada classe ou em um determinado atributo de uma variável qualitativa.
- F**requência relativa ($fr_i$):** corresponde à proporção do número de observações em
uma determinada classe em relação ao total de observações que temos.
- **Frequência Acumulada (($fac_i$) , ($frac_i$):** corresponde à soma da frequência daquela classe às frequências de todas as classes abaixo dela.

| (x)i | f(a)i | f(r)i | % | f(ac)i | f(ac)i | % |
| --- | --- | --- | --- | --- | --- | --- |
| 4,50 | 1 | 6,25 | 6,25 | 1 | 6,25 | 6,25 |
| 5,50 | 1 | 6,25 | 6,25 | 2 | 12,50 | 12,5 |
| 6,00 | 2 | 12,5 | 12,5 | 4 | 25,0 | 25,0 |
| 6,50 | 3 | 18,75 | 18,75 | 7 | 43,75 | 43,75 |
| 7,50 | 2 | 12,50 | 12,50 | 9 | 56,25 | 56,25 |
| 8,50 | 2 | 12,50 | 12,50 | 11 | 68,75 | 68,75 |
| 9,00 | 2 | 12,50 | 12,50 | 13 | 81,25 | 81,25 |
| 9,50 | 1 | 6,25 | 6,25 | 14 | 87,50 | 87,50 |
| 10,0 | 2 | 12,5 | 12,5 | 16 | 100 | 100 |

<aside>
💡 As frequências podem ser expressas em termos porcentuais. Para isto, basta **multiplicar a frequência relativa obtida, por 100**.

</aside>

```r
freq <- table(cut(salary,
    breaks = classes_limits,
    right = FALSE
))

## Frequência relativa
relative_freq <- prop.table(freq_table)

## Frequência absoluta e relativa acumulada
cumulative_freq <- cumsum(freq_table)
cumulative_relative_freq <- cumsum(relative_freq)

result_table <- cbind(freq_table,
    cumulative_freq,
    relative_freq = round(relative_freq * 100,
        digits = 2
    ),
    cumulative_relative_freq = round(cumulative_relative_freq * 100,
        digits = 2
    )
)
```

## Elementos da Distribuição em Frequência

- **Amplitude (A):** é igual a:
    
    $$
    maiorValor-menorValor
    $$
    
- **Classe (K):** é cada um dos grupos de valores (ou categorias) em que se subdivide os dados observados.
- **Limite de classe:** são os valores que definem a classe. São conhecidos como limite superior e inferior de classe.
- **Amplitude do intervalo de classe:** é o comprimento da classe, ou seja, a diferença entre os seus limites superior e inferior.
- **Ponto médio de classe:** é o valor que representa a classe para efeito de cálculo de certas medidas. É obtido através da média aritmética entre os limites superior e inferior de classe.

As classes são um artifício para condensar o número de elementos diferentes de uma amostra.

Alguns dos principais pré-requisitos para definir a quantidade de classes e quais serão seus intervalos incluem:

- As classes devem abranger todas as observações;
- O extremo superior de uma classe é o extremo inferior da classe subsequente;
- Cada valor observado deve enquadrar-se em apenas uma classe;
- As unidades das classes devem ser as mesmas dos dados;
- Uma amostra não deve ter mais de 25 classes;

Para calcular o número de classes, utilizamos a Fórmula de Sturges:

$$
K=1+3,322.log(n)
$$

O pesquisador, a seu critério, poderá modificar o número de classes. Quando o resultado não for exato deve-se arredondar.

Para determinar a amplitude de cada classe, utilizamos:

$$
h=A/K
$$

Ao determinar os limites superior e inferior, utilizamos a seguinte simbologia:

- ├ ─ ─     intervalo fechado à esquerda e aberto à direita;
- ─ ─ ─ |   intervalo fechado à direita e aberto à esquerda.

## Histograma

É formado por um conjunto de retângulos justapostos, cujas bases se localizam sobre o eixo horizontal, de tal modo que seus pontos médios coincidem com os pontos médios dos intervalos de classe.

- As **larguras** dos retângulos são **iguais às amplitudes dos intervalos de classe**.
- As **alturas** dos retângulos devem ser **proporcionais às freqüências das classes**, sendo igual a amplitude dos intervalos.

# Análise Explanatória de Dados

- Análise Descritiva: O que aconteceu

- Análise Preditiva: O que pode acontecer

- Análise Diagnóstica: Porque aconteceu

- Análise Prescritiva: O que fazer

## Análise Univariada

Tem como objetivo analisar cada variável individualmente. Primeiro, torna-se necessário classificar a variável quanto a seu tipo:

- qualitativa (nominal ou ordinal)
- ou quantitativa (discreta ou contínua).

Em seguida, obter tabelas, gráficos e/ou medidas que resumam a variável, pois a partir destes resultados pode-se montar um resumo geral dos dados.

| Variável | Classificação |
| --- | --- |
| Funcionários | Quantitativa discreta |
| Estado Civil | Qualitativa nominal |
| Instrução | Qualitativa ordinal |
| Filhos | Quantitativa discreta |
| Salário | Quantitativa contínua |
| Anos | Quantitativa contínua |
| Meses | Quantitativa contínua |
| Região | Qualitativa nominal |

### Variáveis Qualitativas

Com elas, é possível obter uma tabela de frequências (absolutas e/ou relativas).

- **Nominal**: 
Um exemplo de variável qualitativa nominal é o **Estado civil**.
Um dos gráficos que pode ser utilizado com esta variável é o gráfico de setores (pizza).
- **Ordinal**: 
Um exemplo de variável qualitativa ordinal é o **Nível de Instrução Acadêmica**.
Um dos gráficos que pode ser utilizado com esta variável é o gráfico de barras.

### Variáveis Quantitativas

Com elas, também podemos obter uma tabela de frequências, após alguns cálculos adicionais ao levar classes em consideração.

- **Discreta**: 
Um exemplo de variável quantitativa discreta é a **Quantidade de filhos**.
Um dos gráficos que pode ser utilizado com esta variável é o gráfico de barras.
- **Contínua**: 
Um exemplo de variável quantitativa contínua é o **Salário**.
Um dos gráficos que pode ser utilizado com esta variável é o histograma.

<aside>
💡 Para se fazer uma tabela de frequências de uma **variável contínua**, é preciso primeiro agrupar os dados em classes. Portanto, se **verifica inicialmente os valores máximo e mínimo dos dados**, depois **usamos o critério de Sturges** para definir o número de classes.
Em seguida, **usa-se a função cut()** para agrupar os dados em classes e obter as frequências absolutas e relativas.

</aside>

## Visualização dos dados

### Exemplo: Boxplot comparativo

Com o boxplot comparativo podemos concluir, por exemplo, que o peso corporal dos gatos do sexo masculino apresentam maior variabilidade que o peso corporal dos gatos do sexo feminino.

![image.png](Estati%CC%81stica%20Descritiva%20a0dcccb45e314a7f8fa331e3e07296c4/image.png)

## Análise Bivariada

Na análise bivariada procuramos identificar relações entre duas variáveis. Assim como na análise univariada, estas relações podem ser resumidas por gráficos, tabelas e/ou medidas estatísticas. 

O tipo de resumo vai depender dos tipos das variáveis envolvidas. Vamos considerar três possibilidades:

- Qualitativa *vs* qualitativa
- Qualitativa *vs* quantitativa
- Quantitativa *vs* quantitativa

> Observação: ao utilizar mais de uma variável, usamos a função with()
> 

### Qualitativa *vs* qualitativa

Vamos considerar as variáveis `Est.civil` (estado civil), e `Inst` (grau de instrução). 

A tabela envolvendo duas variáveis é chamada **tabela de cruzamento** ou **tabela de contingência**, e pode ser apresentada de várias formas. A forma mais adequada de apresentação vai depender dos objetivos da análise e da interpretação desejada para os dados. 

Iniciamente obtemos a tabela de frequências absolutas para o cruzamento das duas variávies, usando a função `table()`. 

A tabela extendida incluindo os totais marginais pode ser obtida com a função `addmargins()`.

Código:

```r
*## Tabela de frequências absolutas*
civ.inst.tb <- with(milsa, table(Est.civil, Inst))
```

Resultado:

```
		             Instrução
	Est.civil      1o Grau   2o Grau   Superior
  casado               5        12          3
  solteiro             7         6          3
```

Ao rodar o comando `addmargins(civ.inst.tb)` , obtemos:

```
           Inst
Est.civil  1o Grau 2o Grau Superior Sum
  casado         5      12        3  20
  solteiro       7       6        3  16
  Sum           12      18        6  36
```

Tabelas de frequências relativas são obtidas com `prop.table()`, mas aqui existem três possibilidades para as proporções em cada casela:

- Em relação ao total geral
- Em relação aos totais por linha (`margin = 1`)
- Em relação aos totais por coluna (`margin = 2`)

Frequência relativa global

`prop.table(civ.inst.tb)`

```
          Inst
Est.civil     1o Grau    2o Grau   Superior
  casado   0.13888889 0.33333333 0.08333333
  solteiro 0.19444444 0.16666667 0.08333333
```

Frequência relativa por linha

`prop.table(civ.inst.tb, margin = 1)`

```
          Inst
Est.civil  1o Grau 2o Grau Superior
  casado    0.2500  0.6000   0.1500
  solteiro  0.4375  0.3750   0.1875
```

Frequência relativa por coluna

`prop.table(civ.inst.tb, margin = 2)`

```
          Inst
Est.civil    1o Grau   2o Grau  Superior
  casado   0.4166667 0.6666667 0.5000000
  solteiro 0.5833333 0.3333333 0.5000000
```

### → Exemplos

Abaixo são representados quatro tipos de gráficos de barras que podem ser usados para representar o **cruzamento das variáveis**. 

- A transposição da tabela com `t()` permite alterar a variável que define os grupos no eixo horizontal.
- O uso de `prop.table()` permite o obtenção de gráficos com frequências relativas.

```r
barplot(civ.inst.tb, legend = TRUE)
barplot(t(civ.inst.tb), legend = TRUE)
barplot(civ.inst.tb, beside = TRUE, legend = TRUE)
barplot(t(prop.table(civ.inst.tb)), beside = TRUE, legend = TRUE)
```

![image.png](Estati%CC%81stica%20Descritiva%20a0dcccb45e314a7f8fa331e3e07296c4/image%201.png)

### Qualitativa *vs* quantitativa

Para exemplificar este caso vamos considerar as variáveis `Inst` e `Salario`.

Para se obter uma tabela de frequências é necessário agrupar a variável quantitativa em classes. 

No exemplo a seguir vamos agrupar a variável salário em 4 classes definidas pelos quartis usando a função `cut()`. 

<aside>
💡 Lembre-se que as classes são definidas por intervalos abertos à esquerda, então usamos o argumento `include.lowest = TRUE` para garantir que todos os dados, incluve o menor (mínimo) seja incluído na primeira classe.

</aside>

Após agrupar esta variável, obtemos a(s) **tabela(s) de cruzamento** como mostrado no caso anterior.

Quartis de salário

`quantile(milsa$Salario)`

```
     0%     25%     50%     75%    100%
 4.0000  7.5525 10.1650 14.0600 23.3000
```

Código:

```r
*## Classificação de acordo com os quartis*
salario.cut <- cut(milsa$Salario, breaks = quantile(milsa$Salario),
										include.lowest = TRUE)
*## Tabela de frequências absolutas*
inst.sal.tb <- table(milsa$Inst, salario.cut)
```

Resultado:

```
           salario.cut
           [4,7.55] (7.55,10.2] (10.2,14.1] (14.1,23.3]
  1o Grau         7           3           2           0
  2o Grau         2           6           5           5
  Superior        0           0           2           4
```

`prop.table(inst.sal.tb, margin = 1)`

```
          salario.cut
            [4,7.55] (7.55,10.2] (10.2,14.1] (14.1,23.3]
  1o Grau  0.5833333   0.2500000   0.1666667   0.0000000
  2o Grau  0.1111111   0.3333333   0.2777778   0.2777778
  Superior 0.0000000   0.0000000   0.3333333   0.6666667
```

No gráfico vamos considerar que neste exemplo a instrução deve ser a variável explicativa e portanto colocada no eixo X, e o salário é a variável resposta, e portanto deve ser colocada no eixo Y. Isto é, consideramos que **a instrução deve explicar**, ainda que parcialmente, **o salário** (e não o contrário!).

Vamos então obter um *boxplot* dos salários para cada nível de instrução. 

Note que na função abaixo, usamos a notação de **fórmula** do R, com `Salario ~ Inst` indicando que a variável `Salario` é explicada, ou descrita, (∼) pela variável `Inst`.

`boxplot(Salario ~ Inst, data = milsa)`

![image.png](Estati%CC%81stica%20Descritiva%20a0dcccb45e314a7f8fa331e3e07296c4/image%202.png)

Poderíamos ainda fazer gráficos com a variável `Salario` agrupada em classes, e neste caso os gráficos seriam como no caso anterior com duas variáveis qualitativas.

Para as medidas descritivas, o usual é obter um resumo da variável quantitativa como mostrado na análise univariada, porém agora informando este resumo para cada nível do fator qualitativo de interesse.

A seguir estão alguns exemplos de como obter a **média**, **desvio padrão** e o **resumo** de cinco números do salário para cada nível de instrução.

`with(milsa, tapply(Salario, Inst, mean))`

```
  1o Grau   2o Grau  Superior
 7.836667 11.528333 16.475000
```

`with(milsa, tapply(Salario, Inst, sd))`

```
 1o Grau  2o Grau Superior
2.956464 3.715144 4.502438
```

`with(milsa, tapply(Salario, Inst, quantile))`

```
$`1o Grau`
     0%     25%     50%     75%    100%
 4.0000  6.0075  7.1250  9.1625 13.8500

$`2o Grau`
     0%     25%     50%     75%    100%
 5.7300  8.8375 10.9100 14.4175 19.4000

$Superior
     0%     25%     50%     75%    100%
10.5300 13.6475 16.7400 18.3775 23.3000
```

> Observação: Aqui usamos a função tapply()
> 

### Quantitativa *vs* Quantitativa

Para ilustrar este caso vamos considerar as variáveis `Salario` e `Idade`. 

Para se obter uma tabela é necessário agrupar as variáveis em classes conforme fizemos no caso anterior.

Nos comandos abaixo, agrupamos as duas variáveis em classes definidas pelos respectivos quartis, gerando portanto uma tabela de cruzamento 4 × 4.

```r
*## Classes de Idade*
idade.cut <- with(milsa, cut(Idade, breaks = quantile(Idade), include.lowest = TRUE))
table(idade.cut)
```

```
idade.cut
[20.8,30.7] (30.7,34.9] (34.9,40.5] (40.5,48.9]
          9           9           9           9
```

```r
*## Classes de salario*
salario.cut <- with(milsa, cut(Salario, breaks = quantile(Salario),
                               include.lowest = TRUE))
table(salario.cut)
```

```
salario.cut
   [4,7.55] (7.55,10.2] (10.2,14.1] (14.1,23.3]
          9           9           9           9
```

Tabela cruzada

`table(idade.cut, salario.cut)`

```
             salario.cut
idade.cut     [4,7.55] (7.55,10.2] (10.2,14.1] (14.1,23.3]
  [20.8,30.7]        4           2           2           1
  (30.7,34.9]        1           3           3           2
  (34.9,40.5]        1           3           2           3
  (40.5,48.9]        3           1           2           3
```

`prop.table(table(idade.cut, salario.cut), margin = 1)`

```
             salario.cut
idade.cut      [4,7.55] (7.55,10.2] (10.2,14.1] (14.1,23.3]
  [20.8,30.7] 0.4444444   0.2222222   0.2222222   0.1111111
  (30.7,34.9] 0.1111111   0.3333333   0.3333333   0.2222222
  (34.9,40.5] 0.1111111   0.3333333   0.2222222   0.3333333
  (40.5,48.9] 0.3333333   0.1111111   0.2222222   0.3333333
```

Caso queiramos definir um número menor de classes podemos fazer como no exemplo a seguir onde cada variável é dividida em 3 classes e gerando um tabela de cruzamento 3 × 3.

```r
idade.cut2 <- with(milsa, cut(Idade,
                              breaks = quantile(Idade, seq(0, 1, length = 4)),
                              include.lowest = TRUE))
salario.cut2 <- with(milsa, cut(Salario,
                                breaks = quantile(Salario, seq(0, 1, length = 4)),
                                include.lowest = TRUE))
table(idade.cut2, salario.cut2)
```

```
             salario.cut2
idade.cut2    [4,8.65] (8.65,12.9] (12.9,23.3]
  [20.8,32.1]        5           5           2
  (32.1,37.8]        4           3           5
  (37.8,48.9]        3           4           5
```

`prop.table(table(idade.cut2, salario.cut2), margin = 1)`

```
             salario.cut2
idade.cut2     [4,8.65] (8.65,12.9] (12.9,23.3]
  [20.8,32.1] 0.4166667   0.4166667   0.1666667
  (32.1,37.8] 0.3333333   0.2500000   0.4166667
  (37.8,48.9] 0.2500000   0.3333333   0.4166667
```

<aside>
💡 O gráfico adequado para representar **duas variáveis quantitativas** é um **diagrama de dispersão.**

</aside>

**O gráfico adequado para representar duas variáveis quantitativas é um diagrama de dispersão.** 

Note que se as variáveis envolvidas puderem ser classificadas como “explicativa” e “resposta” devemos colocar a primeira no eixo X e a segunda no eixo Y. 

Neste exemplo é razoável admitir que a idade deve explicar, ao menos parcialmente, o salário e portanto fazemos o gráfico com idade no eixo X. 

Note que na função `plot()`, podemos usar tanto os argumentos `x` e `y`, quanto o formato de fórmula (como visto anteriormente).

`plot(x = milsa$Idade, y = milsa$Salario)` ou  `plot(Salario ~ Idade, data = milsa)`

![image.png](Estati%CC%81stica%20Descritiva%20a0dcccb45e314a7f8fa331e3e07296c4/image%203.png)

Para quantificar a associação entre variáveis deste tipo, usamos o **coeficiente de correlação**. 

A função `cor()` possui opção para três coeficientes de correlação, tendo como *default* o coeficiente de correlação linear de Pearson.

`with(milsa, cor(Idade, Salario))`

```
[1] 0.3651397
```

`with(milsa, cor(Idade, Salario, method = "kendall"))`

```
[1] 0.214456
```

`with(milsa, cor(Idade, Salario, method = "spearman"))`

```
[1] 0.2895939
```