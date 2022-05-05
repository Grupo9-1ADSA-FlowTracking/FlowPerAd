-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/* para workbench - local - desenvolvimento */
CREATE DATABASE FlowTracking;
USE FlowTracking;

CREATE TABLE cadEmpresa(
    idEmpresa CHAR(5) PRIMARY KEY,
    nomeEmpresa VARCHAR(70),
    responsavel VARCHAR(70),
    CNPJ CHAR(18)
);

CREATE TABLE cadFunc (
    idcadFunc INT AUTO_INCREMENT,
    nome VARCHAR(70),
    email VARCHAR(100),
    senha VARCHAR(50),
    fkToken CHAR(5),
    PRIMARY KEY (idcadFunc, fkToken),
    FOREIGN KEY (fkToken) REFERENCES cadEmpresa (idEmpresa)
);

CREATE TABLE Estacao(
    idEstacao INT PRIMARY KEY AUTO_INCREMENT,
    nomeEstacao VARCHAR(70),
    linha VARCHAR(70),
    fkEmpresa CHAR(5),
    FOREIGN KEY (fkEmpresa) REFERENCES cadEmpresa(idEmpresa)
);

CREATE TABLE Sensor(
    idSensor INT PRIMARY KEY AUTO_INCREMENT,
    localizacao VARCHAR(70),
    fkEstacao INT,
    FOREIGN KEY (fkEstacao) REFERENCES Estacao (idEstacao)
);

CREATE TABLE Registro(
    idRegistro INT AUTO_INCREMENT,
    dataRegistro DATETIME,
    registro CHAR(1),
    fkSensor INT,
    PRIMARY KEY (idRegistro, fkSensor),
    FOREIGN KEY (fkSensor) REFERENCES Sensor (idSensor)
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


