<picture>
  <source media="(prefers-color-scheme: dark)" srcset="./.github/cover.png">
  <source media="(prefers-color-scheme: light)" srcset="./.github/cover_light.png">
  <img alt="Linguagem R aplicada à Probabilidade e Estatística" src="/.github/cover_light.png">
</picture>

Este repositório contém os conteúdos, scripts e datasets utilizados durante a matéria de Probabilidade e Estatística, cursada no período 2024.1.  
Ele foi organizado para facilitar o acesso e o entendimento do material estudado.

## Estrutura de Pastas

A estrutura de pastas do repositório é a seguinte:

```
├── .vscode
├── data
│   ├── [dados utilizados nos scripts (.csv, .xlsx, .txt)]
├── .lintr
├── README.md
└── [Scripts R (.r)]
```

- **.vscode**: Configurações específicas do Visual Studio Code para o projeto, majoritariamente para Spell Check.
- **data**: Pasta contendo os datasets utilizados nos scripts.
- **.lintr**: Arquivo de configuração para o `lintr`, ferramenta de linting para R.

## Requisitos

Para rodar os scripts deste repositório, você precisará ter o R instalado em sua máquina.  
Para isso, você pode baixar o R a partir do site oficial [https://cran.r-project.org/](https://cran.r-project.org/).

## Uso

1. Clone este repositório para a sua máquina local:

   ```bash
   git clone https://github.com/theduardomaciel/r.git
   ```

2. Navegue até o diretório do repositório:

   ```bash
   cd probabilidade-estatistica
   ```

3. Abra o RStudio ou qualquer outro ambiente de sua preferência e execute os scripts.

> [!TIP]
> Para utilizar o R no Visual Studio Code (VScode), você pode instalar a extensão `R` e configurar o ambiente conforme as instruções disponíveis [aqui](https://code.visualstudio.com/docs/languages/r) e [aqui](https://github.com/REditorSupport/vscode-R/wiki/Installation:-Windows).

## Material Teórico
Para acessar o material teórico, visite o [Notion](https://www.notion.so/theduardomaciel/Probabilidade-e-Estat-stica-c0e84ebbec0944a484f48e335b7d4249?pvs=4)

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para enviar _pull requests_ ou abrir _issues_ para reportar bugs ou sugerir melhorias.

## Licença

Este projeto está licenciado sob a licença MIT. Consulte o arquivo [LICENSE](LICENSE) para obter mais informações.