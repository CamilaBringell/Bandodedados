
CREATE DATABASE Ativ2;
USE Ativ2;

CREATE TABLE cliente(
cpf CHAR(6) PRIMARY KEY,
nome VARCHAR(100),
numConta CHAR(4),
telefone CHAR(3),
cidade VARCHAR(50)
);

CREATE TABLE carro (
chassi CHAR(3) PRIMARY KEY,
modelo VARCHAR(50),
cor VARCHAR(20),
ano CHAR(4),
valor FLOAT(5)
);

CREATE TABLE aluguel (
cpf CHAR(6),
chassi CHAR(3),
dataEntrada DATE,
dataSaida DATE, 
total FLOAT(30)
);

ALTER TABLE aluguel
ADD CONSTRAINT fk_cliente_aluguel
FOREIGN KEY (cpf)
REFERENCES cliente(cpf);

ALTER TABLE aluguel
ADD CONSTRAINT fk_carro_aluguel
FOREIGN KEY (chassi)
REFERENCES carro(chassi);

INSERT INTO cliente VALUES
('111111', 'Ana', '2317', '019', 'Campinas'),
('222222', 'Fábio', '1123', '019', 'Jundiaí'),
('121111', 'Maria', '3211', '011', 'São Paulo'),
('321222', 'Flávio', '1711', '019', 'Campinas'),
('123111', 'Fernando', '7121', '031', 'Rio de Janeiro'),
('217222', 'Marta', '2211', '021', 'Belo Horizonte');

INSERT INTO carro VALUES
('A21', 'Uno', 'Prata', '2003', 0.0),
('2AC', 'Gol', 'Preto', '2004', 0.0),
('22A', 'Corsa', 'Branco', '2005', 0.0),
('A21', 'Uno', 'Verde', '2001', 0.0),
('Astra', 'Verde', 'Prata', '2005', 0.0),
('Gol', 'Prata', 'Prata', '2005', 0.0);

INSERT INTO aluguel VALUES
('111111', 'A21', '2006-07-21', '2006-08-05', 0.0),
('222222', '2AC', '2006-07-21', '2006-08-06', 0.0),
('222222', '22A', '2006-07-23', '2006-08-06', 0.0),
('222222', 'A21', '2006-07-24', '2006-08-06', 0.0);

INSERT INTO cliente (cpf, nome, numConta, telefone, cidade)
VALUES ('999999', '', '9999', '000', 'Em Branco');

INSERT INTO carro (chassi, modelo, cor, ano, valor)
VALUES ('XYZ', 'NovoModelo', 'Amarelo', '2023', 25000.0);

INSERT INTO aluguel (cpf, chassi, dataEntrada, dataSaida, total)
VALUES
('111111', 'A21', '2006-07-21', '2006-08-05', 0.0),
('222222', '2AC', '2006-07-21', '2006-08-06', 0.0),
('333333', '22A', '2006-07-23', '2006-08-06', 0.0);

UPDATE cliente
SET telefone = '019';

UPDATE cliente
SET nome = 'André'
WHERE cpf = '111111';

UPDATE cliente
SET cidade = 'Brasília'
WHERE numConta > '2000';

UPDATE carro
SET valor = 20000.00;

UPDATE carro
SET cor = 'Azul'
WHERE modelo IN ('Uno', 'Corsa');

UPDATE aluguel
SET total = 50.0
WHERE cpf = '111111' AND chassi = 'A21';

UPDATE aluguel
SET dataSaida = NULL;

DELETE FROM cliente
WHERE cidade = 'Campinas';

DELETE FROM carro
WHERE ano IN ('2003', '2004');
