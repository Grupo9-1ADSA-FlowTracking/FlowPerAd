-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!
/* para workbench - local - desenvolvimento */
CREATE DATABASE acquatec;

USE acquatec;

CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50)
);

CREATE TABLE aviso (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100),
	descricao VARCHAR(150),
	fk_usuario INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
);

create table aquario (
/* em nossa regra de negócio, um aquario tem apenas um sensor */
	id INT PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR(300)
);

/* altere esta tabela de acordo com o que está em INSERT de sua API do arduino */

create table medida (
	id INT PRIMARY KEY AUTO_INCREMENT,
	dht11_umidade DECIMAL,
	dht11_temperatura DECIMAL,
	luminosidade DECIMAL,
	lm35_temperatura DECIMAL,
	chave TINYINT,
	momento DATETIME,
	fk_aquario INT,
	FOREIGN KEY (fk_aquario) REFERENCES aquario(id)
);


/* para sql server - remoto - produção */
CREATE TABLE usuario (
	id INT PRIMARY KEY IDENTITY(1,1),
	nome VARCHAR(50),
	email VARCHAR(50),
	senha VARCHAR(50),
);

CREATE TABLE aviso (
	id INT PRIMARY KEY IDENTITY(1,1),
	titulo VARCHAR(100),
	descricao VARCHAR(150),
	fk_usuario INT FOREIGN KEY REFERENCES usuario(id)
);

create table aquario (
/* em nossa regra de negócio, um aquario tem apenas um sensor */
	id INT PRIMARY KEY IDENTITY(1,1),
	descricao VARCHAR(300)
);

/* altere esta tabela de acordo com o que está em INSERT de sua API do arduino */

CREATE TABLE medida (
	id INT PRIMARY KEY IDENTITY(1,1),
	dht11_umidade DECIMAL,
	dht11_temperatura DECIMAL,
	luminosidade DECIMAL,
	lm35_temperatura DECIMAL,
	chave TINYINT,
	momento DATETIME,
	fk_aquario INT FOREIGN KEY REFERENCES aquario(id)
);

--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
-- SCRIPT FLOW TRACKING:


-- SCRIPT PARA O DATABASE LOCAL
create table cadEmpresa (
idEmpresa char(5) primary key,
nomeEmpresa varchar(70),
Responsavel varchar(70),
CNPJ char(18)
);

create table cadFunc (
idFunc int auto_increment,
nome varchar(70),
email varchar(100),
senha varchar(50),
fkToken char(5),
foreign key (fkToken) references cadEmpresa(idEmpresa),
primary key (idFunc, fkToken)
);

create table Estacao (
idEstacao int primary key auto_increment,
nomeEstacao varchar(70),
Linha varchar(70),
fkEmpresa char(5),
foreign key (fkEmpresa) references cadEmpresa(idEmpresa)
);

create table Anunciante (
idAnunciante int primary key auto_increment,
Nome varchar(70),
Ramo varchar(45)
);

create table Anuncio (
idAnuncio int auto_increment,
Descrição varchar(50),
fkEstacao int,
fkAnunciante int,
foreign key (fkEstacao) references Estacao(idEstacao),
foreign key (fkAnunciante) references Anunciante(idAnunciante),
primary key (idAnuncio, fkEstacao, fkAnunciante)
);

create table Arduino (
idArduino int primary key auto_increment,
Localizacao varchar(70),
fkEstacao int,
foreign key (fkEstacao) references Estacao(idEstacao)
);

CREATE TABLE Registro (
	idRegistro INT auto_increment,
	dht11_umidade DECIMAL,
	dht11_temperatura DECIMAL,
	luminosidade DECIMAL,
	lm35_temperatura DECIMAL,
	chave TINYINT,
	momento DATETIME,
	fkArduino int,
	foreign key (fkArduino) references Arduino(idArduino),
	primary key (idRegistro,fkArduino)
);


-- SCRIPT PARA O DATABASE DA AZURE

create table cadEmpresa (
idEmpresa char(5) primary key,
nomeEmpresa varchar(70),
Responsavel varchar(70),
CNPJ char(18)
);

create table cadFunc (
idFunc int identity(1,1),
nome varchar(70),
email varchar(100),
senha varchar(50),
fkToken char(5),
foreign key (fkToken) references cadEmpresa(idEmpresa),
primary key (idFunc, fkToken)
);

create table Estacao (
idEstacao int primary key identity(1,1),
nomeEstacao varchar(70),
Linha varchar(70),
fkEmpresa char(5),
foreign key (fkEmpresa) references cadEmpresa(idEmpresa)
);

create table Anunciante (
idAnunciante int primary key identity(1,1),
Nome varchar(70),
Ramo varchar(45)
);

create table Anuncio (
idAnuncio int identity(1,1),
Descrição varchar(50),
fkEstacao int,
fkAnunciante int,
foreign key (fkEstacao) references Estacao(idEstacao),
foreign key (fkAnunciante) references Anunciante(idAnunciante),
primary key (idAnuncio, fkEstacao, fkAnunciante)
);

create table Arduino (
idArduino int primary key identity(1,1),
Localizacao varchar(70),
fkEstacao int,
foreign key (fkEstacao) references Estacao(idEstacao)
);

CREATE TABLE Registro (
	idRegistro INT IDENTITY(1,1),
	dht11_umidade DECIMAL,
	dht11_temperatura DECIMAL,
	luminosidade DECIMAL,
	lm35_temperatura DECIMAL,
	chave TINYINT,
	momento DATETIME,
	fkArduino int,
	foreign key (fkArduino) references Arduino(idArduino),
	primary key (idRegistro,fkArduino)
);