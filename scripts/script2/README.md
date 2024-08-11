## 📊 Script 2: Distribuição de Frequência

Este script tem como objetivo realizar a análise de distribuição de frequência para diferentes tipos de dados. Ele abrange vários exemplos, desde a manipulação de valores pontuais até o agrupamento de dados em classes, usando diversos métodos de visualização como gráficos de barras, gráficos de pizza, histogramas e boxplots.

### 📁 Estrutura do Script

O script está dividido nas seguintes seções:

```
script1/
│
├── grouped_values/
    ├── 01_example.r
    ├── 02_example.r
├── punctual_values/
    ├── 01_example.r
    ├── 02_example.r
    ├── 03_example.r
    ├── 04_example.r
└── README.md
```

#### 📝 01. Valores Pontuais

1. **Exemplo 1: Importação de Notas**:
   - Um vetor de notas é criado, e a frequência de cada nota é calculada usando `table()`.
   - Frequências acumuladas e frequências relativas são calculadas para melhor compreensão dos dados.

2. **Exemplo 2: Leitura de Arquivo .csv**:
   - Demonstra como ler um arquivo CSV contendo informações sobre estado civil.
   - Frequências são calculadas para os dados lidos, com gráficos de barras e de pizza criados para visualização.

3. **Exemplo 3 e 4: IMC (Índice de Massa Corporal)**:
   - Dados de IMC são lidos e analisados.
   - O script realiza cálculos semelhantes aos anteriores, agora com foco em IMC, utilizando diferentes abordagens de agrupamento, incluindo 
        * Exemplo 3: classes desiguais
        * Exemplo 4: classes baseadas em quartis.
   - Histogramas são gerados para visualização, e um boxplot é criado para resumir a distribuição do IMC.

#### 📝 02. Valores Agrupados

1. **Exemplo 1: Produção de Bicicletas**:
   - Dados de produção de bicicletas são lidos de um arquivo CSV.
   - Os dados são agrupados em classes com base em intervalos definidos e são calculadas as frequências, acumuladas e relativas.
   - Gráficos são gerados para visualização, incluindo histogramas e boxplots.

3. **Exemplo 2: IMC**
    - Dados de IMC são lidos e analisados, com foco em classes de IMC.
    - O script calcula as frequências, acumuladas e relativas para as classes de IMC.
    - Histogramas são gerados para visualização, e um boxplot é criado para resumir a distribuição do IMC.

#### Observações Adicionais

- O script inclui múltiplas abordagens para a leitura de arquivos e manipulação de dados, oferecendo flexibilidade na análise de dados de diferentes formatos e contextos.
