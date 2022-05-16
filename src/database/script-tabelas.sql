-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/* para workbench - local - desenvolvimento */
-- Criação do Banco de Dados
create database FlowTrackingDataBase;

-- Usando o Banco de Dados
use FLowTrackingDataBase;


-- Criando Tabela de Cadastro de Empresa
create table cadEmpresa (
idEmpresa char(5) primary key not null,
nomeEmpresa varchar(70),
Responsavel varchar(70),
CNPJ char(18)
);

-- Criação da Tabela de Cadastro de Funcionário
create table cadFunc (
idFunc int auto_increment,
nome varchar(70),
email varchar(100),
constraint Email_Verification check (email = '%@%'),
senha varchar(50),
fkToken char(5),
constraint Func_FkToken foreign key (fkToken) references cadEmpresa(idEmpresa),
primary key (idFunc, fkToken)
);

-- Criação da Tabela Estação
create table Estacao (
idEstacao int primary key auto_increment,
nomeEstacao varchar(70),
Linha varchar(70),
fkEmpresa char(5),
constraint Estacao_fkEmpresa foreign key (fkEmpresa) references cadEmpresa(idEmpresa)
);

-- Criação da Tabela Anunciante
create table Anunciante (
idAnunciante int primary key auto_increment,
Nome varchar(70),
Ramo varchar(45)
);

-- Criação da Tabela Anúncio
create table Anuncio (
idAnuncio int auto_increment,
Descrição varchar(50),
fkEstacao int,
fkAnunciante int,
constraint Anuncio_fkEstacao foreign key (fkEstacao) references Estacao(idEstacao),
constraint Anuncio_fkAnunciante foreign key (fkAnunciante) references Anunciante(idAnunciante),
primary key (idAnuncio, fkEstacao, fkAnunciante)
);

-- Criação da Tabela Sensor
create table Sensor (
idSensor int primary key auto_increment,
Localizacao varchar(70),
fkEstacao int,
constraint Sensor_fkEstacao foreign key (fkEstacao) references Estacao(idEstacao)
);

-- Criação da Tabela Registro
create table Registro (
idRegistro int,
Registro char(1),
constraint Validacao_Registro check (Registro = '1'),
dtRegistro date,
fkSensor int,
constraint Registro_fkSensor foreign key (fkSensor) references Sensor(idSensor),
primary key (idRegistro,fkSensor)
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

CREATE TABLE medida (
	id INT PRIMARY KEY IDENTITY(1,1),
	temperatura DECIMAL,
	umidade DECIMAL,
	momento DATETIME,
	fk_aquario INT
);


