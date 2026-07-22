<img src="https://user-images.githubusercontent.com/46379117/189931169-9df7b283-bf43-4af4-8154-b1669862090e.png" width="1000px">

_Data Acquisition Arduino API = API Arduino para Aquisição de Dados_

<hr>

# Como usar

1. Certifique-se de que o Arduino está em funcionamento e capturando dados do sensor, seja ele analógico ou digital.

2. Clone este repositório em sua máquina.

3. Acesse o arquivo **main.js** e realize as configurações necessárias:

- Caso deseje armazenar os dados em um banco de dados, altere a constante **HABILITAR_OPERACAO_INSERIR** para `true`.

- Caso não deseje armazenar os dados no banco, mantenha a constante como `false`. Nesse caso, não é necessário configurar o arquivo `.env`.

4. Caso a inserção no banco esteja habilitada, crie um arquivo chamado **.env** na raiz do projeto contendo as credenciais do banco de dados:

```env
DB_HOST=localhost
DB_PORT=3306
DB_USER=usuario
DB_PASSWORD=senha
DB_NAME=nome_do_banco
```

> O projeto utiliza o carregamento nativo de variáveis de ambiente do Node.js (`process.loadEnvFile()`), portanto não é necessário instalar a biblioteca `dotenv`.

5. Caso utilize um banco de dados diferente do exemplo, ajuste também o comando `INSERT` no arquivo **main.js** para que corresponda à estrutura da tabela que receberá as medidas.

6. Abra um terminal (Git Bash, PowerShell ou Terminal do VS Code) na pasta do projeto e execute:

```bash
npm install
```

O comando acima instalará todas as dependências listadas no arquivo **package.json**. Ao final da instalação será criada a pasta **node_modules**, que contém todas as bibliotecas utilizadas pelo projeto.

7. Inicie a aplicação com:

```bash
npm start
```

Após a inicialização:

- A API ficará disponível na porta **3300**.
- A leitura do Arduino será iniciada automaticamente.
- Se **HABILITAR_OPERACAO_INSERIR** estiver como `true`, as leituras também serão gravadas no banco de dados utilizando as credenciais definidas no arquivo `.env`.

8. Para visualizar os dados capturados, acesse um dos endpoints abaixo:

```
http://localhost:3300/sensores/analogico
```

```
http://localhost:3300/sensores/digital
```

Caso a inserção no banco esteja habilitada, também é possível acompanhar os registros diretamente por meio de consultas SQL.

9. Para encerrar a API, pressione **CTRL + C** no terminal onde ela está sendo executada.