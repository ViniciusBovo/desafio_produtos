# 📦 Desafio Produtos - Flutter

Aplicativo desenvolvido em **Flutter** para demonstrar o consumo e desserialização de dados JSON, gerenciamento de estado local com `StatefulWidget`, tratamento de requisições assíncronas com tela de carregamento (*loading*) e apresentação de dados com **Material Design 3**.

---

## 🚀 Funcionalidades

- **Desserialização JSON**: Conversão de dados JSON para objeto Dart utilizando a classe modelo `Produto` e construtor `factory Produto.fromJson`.
- **Requisição Assíncrona Simulada**: Simulação de consumo de API com `Future.delayed` (2 segundos).
- **Indicador de Carregamento**: Feedback visual utilizando `CircularProgressIndicator` enquanto os dados estão sendo processados.
- **Card de Exibição**:
  - Nome do produto com tipografia destacada.
  - Preço formatado em Reais (`R$`).
  - Indicador dinâmico de disponibilidade (`Disponível` em verde ou `Esgotado` em vermelho).
- **Design Moderno**: Interface construída com **Material Design 3** e paleta de cores baseada em tom *Indigo*.

---

## 🛠️ Tecnologias Utilizadas

- [Flutter](https://flutter.dev/) (SDK `>=3.13.0`)
- [Dart](https://dart.dev/)
- [Material Design 3](https://m3.material.io/)

---

## 📂 Estrutura do Projeto

```text
desafio_produtos/
├── lib/
│   └── main.dart          # Ponto de entrada, modelo Produto e interface TelaProduto
├── pubspec.yaml           # Configurações do projeto e dependências
└── README.md              # Documentação do projeto
```

---

## 📋 Modelo de Dados

Exemplo de payload JSON simulado no aplicativo:

```json
{
  "nome": "Notebook Gamer",
  "preco": 4599.90,
  "disponivel": true
}
```

---

## 💻 Como Executar o Projeto

### Pré-requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) instalado e configurado no ambiente.
- Emulador Android/iOS configurado, dispositivo físico conectado ou suporte a Desktop/Web ativado.

### Passo a passo

1. **Clone o repositório:**
   ```bash
   git clone https://github.com/ViniciusBovo/desafio_produtos.git
   ```

2. **Acesse a pasta do projeto:**
   ```bash
   cd desafio_produtos
   ```

3. **Instale as dependências:**
   ```bash
   flutter pub get
   ```

4. **Execute o aplicativo:**
   ```bash
   flutter run
   ```

---

## 👤 Autor

Desenvolvido por **[Vinicius Bovo](https://github.com/ViniciusBovo)**.

