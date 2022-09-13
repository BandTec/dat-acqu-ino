-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!


/* 

para workbench - local - desenvolvimento 

*/


-- CREATE DATABASE aquatech;

-- USE aquatech;


create table aquario (
/* em nossa regra de negócio, um aquario tem apenas um sensor */
	id INT PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR(300)
);

/*
esta tabela "medida" deve estar de acordo com o comando INSERT
do ambiente de DESENVOLVIMENTO do arquivo "main.js"
*/

create table medida (
	id INT PRIMARY KEY AUTO_INCREMENT,
	dht11_umidade DECIMAL(10,2),
	dht11_temperatura DECIMAL(10,2),
	luminosidade DECIMAL,
	lm35_temperatura DECIMAL(10,2),
	chave TINYINT,
	momento DATETIME,
	fk_aquario INT,
	FOREIGN KEY (fk_aquario) REFERENCES aquario(id)
);


/* 

para sql server - remoto - produção

*/

create table aquario (
/* em nossa regra de negócio, um aquario tem apenas um sensor */
	id INT PRIMARY KEY IDENTITY(1,1),
	descricao VARCHAR(300)
);

/*
esta tabela "medida" deve estar de acordo com o comando INSERT
do ambiente de PRODUCAO do arquivo "main.js"
*/

CREATE TABLE medida (
	id INT PRIMARY KEY IDENTITY(1,1),
	dht11_umidade DECIMAL(10,2),
	dht11_temperatura DECIMAL(10,2),
	luminosidade DECIMAL,
	lm35_temperatura DECIMAL(10,2),
	chave TINYINT,
	momento DATETIME,
	fk_aquario INT FOREIGN KEY REFERENCES aquario(id)
);
