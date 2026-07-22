<img src="https://user-images.githubusercontent.com/46379117/189931169-9df7b283-bf43-4af4-8154-b1669862090e.png" width="1000px">

_Data Acquisition Arduino API = API Arduino para Aquisição de Dados_

<hr>

# Como usar

## 1. Pré-requisitos

Antes de executar a aplicação, certifique-se de possuir:

- Node.js instalado (versão 20 ou superior recomendada);
- Arduino conectado ao computador;
- O Arduino executando o sketch responsável pela leitura dos sensores;
- (Opcional) Um banco de dados MySQL caso deseje armazenar as leituras.

---

## 2. Clone o repositório

```bash
git clone <url-do-repositorio>
```

Entre na pasta do projeto:

```bash
cd arduino-api
```

---

## 3. Configure o arquivo de variáveis de ambiente

O projeto utiliza o carregamento nativo de variáveis de ambiente do Node.js através do parâmetro:

```bash
node --env-file=.env.dev main.js
```

Crie um arquivo chamado **.env.dev** na raiz do projeto com o seguinte conteúdo:

```env
# Comunicação Serial
SERIAL_BAUD_RATE=9600

# API
SERVER_PORT=3300

# Banco de Dados
DB_HOST=localhost
DB_PORT=3306
DB_USER=usuario
DB_PASSWORD=senha
DB_NAME=nome_do_banco
```

> Mesmo que o banco de dados não seja utilizado, as variáveis `SERIAL_BAUD_RATE` e `SERVER_PORT` devem estar configuradas.

---

## 4. Defina se haverá gravação no banco

Abra o arquivo **main.js** e localize a constante:

```javascript
const HABILITAR_OPERACAO_INSERIR = false;
```

Existem duas possibilidades:

### Apenas leitura do Arduino

Mantenha:

```javascript
const HABILITAR_OPERACAO_INSERIR = false;
```

Nesse modo a aplicação apenas disponibiliza os dados pela API.

### Leitura + gravação no banco

Altere para:

```javascript
const HABILITAR_OPERACAO_INSERIR = true;
```

Nesse caso:

- o banco de dados deve estar acessível;
- as credenciais do arquivo `.env` devem estar corretas;
- o comando de inicialização dentro do package.json deve estar chamando o arquivo correto
- a tabela utilizada pelo comando `INSERT` deve existir.

---

## 5. Ajuste o comando INSERT (caso necessário)

Caso seu banco possua uma estrutura diferente do exemplo, altere o comando localizado em **main.js**:

```sql
INSERT INTO medida (sensor_analogico, sensor_digital)
VALUES (?, ?)
```

para corresponder à estrutura da sua tabela.

---

## 6. Instale as dependências

Abra um terminal na pasta do projeto e execute:

```bash
npm install
```

Esse comando instalará todas as dependências listadas no arquivo **package.json**.

Ao final será criada a pasta:

```
node_modules
```

---

## 7. Execute a aplicação

Inicie a API com:

```bash
npm start
```

O comando executado será:

```bash
node --env-file=.env.dev main.js
```

---

## 8. O que acontece ao iniciar

Após a inicialização da aplicação:

- a API será iniciada na porta definida em `SERVER_PORT`;
- a aplicação procurará automaticamente um Arduino conectado pela porta serial;
- a leitura dos sensores será iniciada automaticamente;
- caso `HABILITAR_OPERACAO_INSERIR` seja `true`, os dados também serão gravados no banco de dados.

No terminal deverão aparecer mensagens semelhantes a:

```
API executada com sucesso na porta 3300

A leitura do arduino foi iniciada na porta COM3 utilizando Baud Rate de 9600
```

---

## 9. Consultando os dados

Os dados capturados podem ser consultados através dos endpoints:

### Sensor Analógico

```
http://localhost:3300/sensores/analogico
```

Retorna um vetor contendo todas as leituras analógicas realizadas.

### Sensor Digital

```
http://localhost:3300/sensores/digital
```

Retorna um vetor contendo todas as leituras digitais realizadas.

Caso a gravação no banco esteja habilitada, também é possível consultar as medidas diretamente no banco de dados.

---

## 10. Encerrando a aplicação

Para finalizar a execução da API pressione:

```text
CTRL + C
```

no terminal onde ela está sendo executada.