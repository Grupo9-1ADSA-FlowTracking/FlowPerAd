create database flowtrackingapi;
use flowtrackingapi;

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
	momento DATETIME default current_timestamp,
	fkArduino int,
	foreign key (fkArduino) references Arduino(idArduino),
	primary key (idRegistro,fkArduino)
);

INSERT INTO cadEmpresa VALUES
("02201", "JCDecaux", "Fernando", "123456789101234567");

INSERT INTO Estacao VALUES
(NULL, "Consolação", "Verde", "02201");

INSERT INTO Arduino VALUES
(NULL, "Norte", 1);

select * from Arduino;
select * from Registro;