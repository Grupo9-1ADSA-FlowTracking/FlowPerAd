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

INSERT INTO cadEmpresa VALUES 
('02201', 'JCDecaux', 'Brandão', '96.922.653/0001-05'),
('02202', 'Eletromídia', 'Junior', '95.108.718/0001-02'),
('02203', 'Mídia Metrô', 'Fernanda', '00.552.480/0001-01');

INSERT INTO cadFunc VALUES
(NULL, 'Vicente', 'vicente@flow.com', 'vicentex15', '02201'),
(NULL, 'Cláudio', 'claudio@flow.com', 'cclaudio57', '02201'),
(NULL, 'Evelyn', 'evelyn@flow.com', 'eve1617lyn', '02201'),
(NULL, 'Luiza', 'luiza@flow.com', 'lui2020za1', '02202'),
(NULL, 'Eduarda', 'eduarda@flow.com', '#eduarda1213', '02202'),
(NULL, 'Betina', 'betina@flow.com', 'betina123', '02202'),
(NULL, 'Matheus', 'matheus@flow.com', 'matheus456X#', '02203'),
(NULL, 'Levi', 'levi@flow.com', 'levi2526KL14', '02203'),
(NULL, 'Felipe', 'felipe@flow.com', 'felipe2526xd', '02203');

INSERT INTO Estacao VALUES
(NULL, 'Tatuapé', '3', '02201'),
(NULL, 'Paraíso', '2', '02201'),
(NULL, 'Santa Marina', '6', '02202'),
(NULL, 'Luz', '4', '02202'),
(NULL, 'Vila Prudente', '15', '02203');

INSERT INTO Sensor VALUES
(NULL, 'Catraca-Leste', 1), -- Tatuapé 1
(NULL, 'Catraca-Norte', 1), -- 2
(NULL, 'Catraca-Sul', 1), -- 3
(NULL, 'Catraca-Oeste', 1), -- 4
(NULL, 'Catraca-Leste', 2), -- Paraiso 5
(NULL, 'Catraca-Norte', 2), -- 6
(NULL, 'Catraca-Sul', 2), -- 7
(NULL, 'Catraca-Oeste', 2), -- 8
(NULL, 'Catraca-Leste', 3), -- Santa marina 9
(NULL, 'Catraca-Norte', 3), -- 10
(NULL, 'Catraca-Sul', 3), -- 11
(NULL, 'Catraca-Oeste', 3), -- 12
(NULL, 'Catraca-Leste', 4), -- Luz 13
(NULL, 'Catraca-Norte', 4), -- 14
(NULL, 'Catraca-Sul', 4), -- 15
(NULL, 'Catraca-Oeste', 4), -- 16
(NULL, 'Catraca-Leste', 5), -- Vila Prudente 17
(NULL, 'Catraca-Norte', 5), -- 18
(NULL, 'Catraca-Sul', 5), -- 19
(NULL, 'Catraca-Oeste', 5); -- 20

INSERT INTO Registro VALUES
-- Tatuapé
(NULL, '2022-04-12 06:40', 1, 1),
(NULL, '2022-04-12 06:41', 1, 1),
(NULL, '2022-04-12 06:42', 1, 1),
(NULL, '2022-04-12 06:43', 1, 1),
(NULL, '2022-04-12 06:44', 1, 2),
(NULL, '2022-04-12 06:45', 1, 2),
(NULL, '2022-04-12 06:46', 1, 3),
(NULL, '2022-04-12 06:47', 1, 3),
(NULL, '2022-04-12 06:50', 1, 4),
(NULL, '2022-04-12 06:51', 1, 4),
(NULL, '2022-04-12 06:52', 1, 4),
(NULL, '2022-04-12 06:53', 1, 4),
(NULL, '2022-04-12 06:54', 1, 4),
(NULL, '2022-04-12 06:55', 1, 4),
(NULL, '2022-04-12 06:56', 1, 4),
-- Paraiso
(NULL, '2022-04-10 18:30', 1, 5),
(NULL, '2022-04-10 18:31', 1, 5),
(NULL, '2022-04-10 18:32', 1, 5),
(NULL, '2022-04-10 18:33', 1, 5),
(NULL, '2022-04-10 18:34', 1, 6),
(NULL, '2022-04-10 18:35', 1, 6),
(NULL, '2022-04-10 18:36', 1, 6),
(NULL, '2022-04-10 18:37', 1, 7),
(NULL, '2022-04-10 18:38', 1, 7),
(NULL, '2022-04-10 18:39', 1, 7),
(NULL, '2022-04-10 18:37', 1, 8),
(NULL, '2022-04-10 18:38', 1, 8),
(NULL, '2022-04-10 18:39', 1, 8),
(NULL, '2022-04-10 18:40', 1, 8),
(NULL, '2022-04-10 18:41', 1, 8),
(NULL, '2022-04-10 18:42', 1, 8),
-- Santa Marina
(NULL, '2022-04-09 06:00', 1, 9),
(NULL, '2022-04-09 06:01', 1, 9),
(NULL, '2022-04-09 06:02', 1, 9),
(NULL, '2022-04-09 06:03', 1, 9),
(NULL, '2022-04-09 06:04', 1, 9),
(NULL, '2022-04-09 06:05', 1, 9),
(NULL, '2022-04-09 06:04', 1, 10),
(NULL, '2022-04-09 06:05', 1, 10),
(NULL, '2022-04-09 06:06', 1, 10),
(NULL, '2022-04-09 06:07', 1, 10),
(NULL, '2022-04-09 06:10', 1, 11),
(NULL, '2022-04-09 06:11', 1, 11),
(NULL, '2022-04-09 06:12', 1, 11),
(NULL, '2022-04-09 06:13', 1, 11),
(NULL, '2022-04-09 06:14', 1, 11),
(NULL, '2022-04-09 06:15', 1, 11),
(NULL, '2022-04-09 06:16', 1, 11),
(NULL, '2022-04-09 06:04', 1, 12),
(NULL, '2022-04-09 06:05', 1, 12),
(NULL, '2022-04-09 06:06', 1, 12),
(NULL, '2022-04-09 06:07', 1, 12),
-- Luz
(NULL, '2022-03-31 06:05', 1, 13),
(NULL, '2022-03-31 06:06', 1, 13),
(NULL, '2022-03-31 06:07', 1, 13),
(NULL, '2022-03-31 06:08', 1, 13),
(NULL, '2022-03-31 06:09', 1, 13),
(NULL, '2022-03-31 06:11', 1, 14),
(NULL, '2022-03-31 06:12', 1, 14),
(NULL, '2022-03-31 06:13', 1, 14),
(NULL, '2022-03-31 06:14', 1, 14),
(NULL, '2022-03-31 06:10', 1, 15),
(NULL, '2022-03-31 06:11', 1, 15),
(NULL, '2022-03-31 06:12', 1, 15),
(NULL, '2022-03-31 06:13', 1, 15),
(NULL, '2022-03-31 06:14', 1, 15),
(NULL, '2022-03-31 06:20', 1, 16),
(NULL, '2022-03-31 06:21', 1, 16),
(NULL, '2022-03-31 06:22', 1, 16),
(NULL, '2022-03-31 06:23', 1, 16),
(NULL, '2022-03-31 06:24', 1, 16),
(NULL, '2022-03-31 06:25', 1, 16),
(NULL, '2022-03-31 06:26', 1, 16),
-- Vila Prudente
(NULL, '2022-04-01 16:25', 1, 17),
(NULL, '2022-04-01 16:26', 1, 17),
(NULL, '2022-04-01 16:27', 1, 17),
(NULL, '2022-04-01 16:28', 1, 17),
(NULL, '2022-04-01 16:29', 1, 17),
(NULL, '2022-04-05 16:30', 1, 17),
(NULL, '2022-04-05 16:15', 1, 18),
(NULL, '2022-04-05 16:16', 1, 18),
(NULL, '2022-04-05 16:17', 1, 18),
(NULL, '2022-04-05 16:18', 1, 18),
(NULL, '2022-04-05 16:19', 1, 18),
(NULL, '2022-04-07 16:23', 1, 19),
(NULL, '2022-04-07 16:24', 1, 19),
(NULL, '2022-04-07 16:25', 1, 19),
(NULL, '2022-04-07 16:26', 1, 19),
(NULL, '2022-04-07 16:27', 1, 19),
(NULL, '2022-04-13 16:28', 1, 19),
(NULL, '2022-04-13 16:29', 1, 19),
(NULL, '2022-04-13 16:30', 1, 19),
(NULL, '2022-04-13 16:31', 1, 19),
(NULL, '2022-04-13 16:32', 1, 19),
(NULL, '2022-03-29 16:33', 1, 19),
(NULL, '2022-03-29 16:31', 1, 20),
(NULL, '2022-03-29 16:32', 1, 20),
(NULL, '2022-03-29 16:33', 1, 20),
(NULL, '2022-03-29 16:34', 1, 20),
(NULL, '2022-03-29 16:35', 1, 20),
(NULL, '2022-03-29 16:36', 1, 20);


SELECT * FROM cadEmpresa;
SELECT * FROM cadFunc;
SELECT * FROM Estacao;
SELECT * FROM Sensor;
SELECT * FROM Registro;

SELECT * FROM cadEmpresa JOIN cadFunc ON cadFunc.fkToken = cadEmpresa.idEmpresa;

SELECT * FROM cadEmpresa JOIN Estacao ON Estacao.fkEmpresa = cadEmpresa.idEmpresa;

SELECT * FROM Estacao JOIN Sensor ON Sensor.fkEstacao = Estacao.idEstacao;

SELECT * FROM Sensor JOIN Registro ON Registro.fkSensor = Sensor.idSensor;

-- Tatuapé
SELECT * FROM Estacao JOIN Sensor ON Sensor.fkEstacao = Estacao.idEstacao JOIN Registro ON Registro.fkSensor = Sensor.idSensor WHERE idSensor = 1;
SELECT * FROM Estacao JOIN Sensor ON Sensor.fkEstacao = Estacao.idEstacao JOIN Registro ON Registro.fkSensor = Sensor.idSensor WHERE idSensor = 2;
SELECT * FROM Estacao JOIN Sensor ON Sensor.fkEstacao = Estacao.idEstacao JOIN Registro ON Registro.fkSensor = Sensor.idSensor WHERE idSensor = 3;
SELECT * FROM Estacao JOIN Sensor ON Sensor.fkEstacao = Estacao.idEstacao JOIN Registro ON Registro.fkSensor = Sensor.idSensor WHERE idSensor = 4;

-- Paraiso
SELECT * FROM Estacao JOIN Sensor ON Sensor.fkEstacao = Estacao.idEstacao JOIN Registro ON Registro.fkSensor = Sensor.idSensor WHERE idSensor = 5;
SELECT * FROM Estacao JOIN Sensor ON Sensor.fkEstacao = Estacao.idEstacao JOIN Registro ON Registro.fkSensor = Sensor.idSensor WHERE idSensor = 6;
SELECT * FROM Estacao JOIN Sensor ON Sensor.fkEstacao = Estacao.idEstacao JOIN Registro ON Registro.fkSensor = Sensor.idSensor WHERE idSensor = 7;
SELECT * FROM Estacao JOIN Sensor ON Sensor.fkEstacao = Estacao.idEstacao JOIN Registro ON Registro.fkSensor = Sensor.idSensor WHERE idSensor = 8;

-- Santa Marina
SELECT * FROM Estacao JOIN Sensor ON Sensor.fkEstacao = Estacao.idEstacao JOIN Registro ON Registro.fkSensor = Sensor.idSensor WHERE idSensor = 9;
SELECT * FROM Estacao JOIN Sensor ON Sensor.fkEstacao = Estacao.idEstacao JOIN Registro ON Registro.fkSensor = Sensor.idSensor WHERE idSensor = 10;
SELECT * FROM Estacao JOIN Sensor ON Sensor.fkEstacao = Estacao.idEstacao JOIN Registro ON Registro.fkSensor = Sensor.idSensor WHERE idSensor = 11;
SELECT * FROM Estacao JOIN Sensor ON Sensor.fkEstacao = Estacao.idEstacao JOIN Registro ON Registro.fkSensor = Sensor.idSensor WHERE idSensor = 12;

-- Luz
SELECT * FROM Estacao JOIN Sensor ON Sensor.fkEstacao = Estacao.idEstacao JOIN Registro ON Registro.fkSensor = Sensor.idSensor WHERE idSensor = 13;
SELECT * FROM Estacao JOIN Sensor ON Sensor.fkEstacao = Estacao.idEstacao JOIN Registro ON Registro.fkSensor = Sensor.idSensor WHERE idSensor = 14;
SELECT * FROM Estacao JOIN Sensor ON Sensor.fkEstacao = Estacao.idEstacao JOIN Registro ON Registro.fkSensor = Sensor.idSensor WHERE idSensor = 15;
SELECT * FROM Estacao JOIN Sensor ON Sensor.fkEstacao = Estacao.idEstacao JOIN Registro ON Registro.fkSensor = Sensor.idSensor WHERE idSensor = 16;

-- Vila Prudente
SELECT * FROM Estacao JOIN Sensor ON Sensor.fkEstacao = Estacao.idEstacao JOIN Registro ON Registro.fkSensor = Sensor.idSensor WHERE idSensor = 17;
SELECT * FROM Estacao JOIN Sensor ON Sensor.fkEstacao = Estacao.idEstacao JOIN Registro ON Registro.fkSensor = Sensor.idSensor WHERE idSensor = 18;
SELECT * FROM Estacao JOIN Sensor ON Sensor.fkEstacao = Estacao.idEstacao JOIN Registro ON Registro.fkSensor = Sensor.idSensor WHERE idSensor = 19;
SELECT * FROM Estacao JOIN Sensor ON Sensor.fkEstacao = Estacao.idEstacao JOIN Registro ON Registro.fkSensor = Sensor.idSensor WHERE idSensor = 20;


