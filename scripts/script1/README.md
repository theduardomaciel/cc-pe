# 📊 Script 1: Introdução ao Software R

Este repositório contém um script em R que serve como introdução aos conceitos básicos da linguagem. O arquivo principal está dividido em seis partes, cada uma abordando um tópico específico. A seguir, está uma descrição detalhada de cada parte do script.

## 📁 Estrutura do Script

O script de `Introdução` está dividido nas seguintes seções:

```
script1/
│
├── 01_object_type.r
├── 02_vector.r
├── 03_matrix.r
├── 04_list_and_dataframe.r
├── 05_condition.r
├── 06_repetition.r
└── README.md
```

### 📝 Descrição das Partes

#### 01_object_type
Esta seção cobre os tipos básicos de objetos em R, incluindo:

- `numeric`: números com ponto flutuante.
- `integer`: números inteiros.
- `character`: cadeias de caracteres.
- `logical`: valores booleanos (`TRUE` e `FALSE`).
- `factor`: variáveis categóricas.

Exemplos de criação e conversão entre esses tipos são fornecidos.

#### 02_vector
Aqui são apresentados os vetores, que são conjuntos de dados unidimensionais. São abordados tópicos como:

- Criação e manipulação de vetores.
- Funções úteis (`length`, `sort`, `sum`, `min`, `max`, `mean`).
- Combinação de vetores.
- Repetição de elementos (`rep`).

#### 03_matrix
Esta seção aborda as matrizes, que são estruturas bidimensionais de dados. Inclui:

- Criação de matrizes.
- Acesso a elementos específicos.
- Operações com matrizes (adição, subtração, multiplicação).
- Funções de resumo (`colMeans`, `rowMeans`, `colSums`, `rowSums`).

#### 04_list_and_dataframe
Cobertura de listas e data frames:

- Listas: coleção de elementos de diferentes tipos e tamanhos.
- Data frames: tabelas de dados onde cada coluna representa uma variável e cada linha um registro.
- Importação e exportação de data frames de/para arquivos (`read.table`, `read.csv`, `write.csv`).

#### 05_condition
Estruturas condicionais (`if`, `else`, `elseif`):

- Uso de `if` para tomar decisões com base em condições.
- Exemplo de verificação de nota e situação do aluno.

#### 06_repetition
Estruturas de repetição (`for`, `while`, `repeat`):

- Loop `for`: repete um bloco de código um número específico de vezes.
- Loop `while`: executa enquanto a condição for verdadeira.
- Loop `repeat`: executa indefinidamente até que `break` seja chamado.

### Como Executar

Para executar o script, você precisará de um ambiente R instalado. Basta abrir o arquivo `Introdução.r` em seu editor R favorito (como RStudio ou VSCode) e executar as linhas de código conforme desejado.