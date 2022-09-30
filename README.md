<img src="https://user-images.githubusercontent.com/46379117/189931169-9df7b283-bf43-4af4-8154-b1669862090e.png" width="600px">

_Data Acquisition Arduino API = API Arduino para Aquisição de Dados_

<hr>

# Como usar

1. Certifique-se de que o Arduino está em funcionamento e capturando dados de temperatura, umidade, luminosidade e proximidade utilizando os sensores DHT11, TRC5000, LDR e LM35.

1. Clone este repositório em sua máquina.

1. Acesse o arquivo **main.js** e parametrize:

- Gostaria de efetuar a inserção dos dados capturados no Banco de Dados? **Linha 14 - HABILITAR_OPERACAO_INSERIR;**

- Caso queira inserir, você estará utilizando o ambiente de producao (SQL Server na nuvem Azure, remoto) ou desenvolvimento (MySQL Workbench, local)? **Linha 19 - AMBIENTE**

- Caso esteja utilizando o ambiente de desenvolvimento: adicione as credenciais para inserção em banco local (**Linhas 35 - 38**) e ajuste seu INSERT para que esteja de acordo com a tabela que receberá as medidas (**Linhas 108 e 109**).

- Caso esteja utilizando o ambiente de produção, crie o usuário para inserção no Banco de Dados SQLServer (**Arquivo script-criacao-usuario-sqlserver.sql** ) + adicione as credenciais para inserção em banco remoto (**Linha 89**) e ajuste seu INSERT para que esteja de acordo com a tabela que receberá as medidas (**Linha 84**).

4. Acesse o local deste repositório no terminal (GitBash ou VSCode) e execute os comandos abaixo:

```
npm i
``` 
_O comando acima irá instalar as bibliotecas necessárias para o funcionamento da API. As bibliotecas a serem instaladas estão listadas no arquivo **package.json** então é muito importante que este não seja alterado. Será criada uma nova pasta/diretório chamado **node_modules** quando o comando for finalizado, que é onde as bibliotecas estão localizadas. Não altere a pasta/diretório._

```
npm start
``` 

_O comando acima irá iniciar sua API e efetuar os comandos de acordo com a sua parametrização feita nos passos anteriores._

5. Para "ver" sua API funcionando você pode visualizar os gráficos das capturas sendo exibidos no seu navegador pelo caminho **http://localhost:3300** ou efetuando SELECT no seu Banco de Dados, caso tenha optado por inseri-los.

6. Caso queira parar a API, tecle **CTRL+C** no terminal em que a API está rodando.
