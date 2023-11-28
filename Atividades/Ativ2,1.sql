
CREATE DATABASE concessionaria;


USE concessionaria;

CREATE TABLE Marca (
    CodMarca INTEGER PRIMARY KEY,
    Nome VARCHAR(40),
    PaisOrigem VARCHAR(20)
);

CREATE TABLE Modelo (
    CodModelo INTEGER PRIMARY KEY,
    Nome VARCHAR(40),
    Tipo VARCHAR(20),
    Cor VARCHAR(15),
    Cidade VARCHAR(20),
    CodMarca INTEGER,
    FOREIGN KEY (CodMarca) REFERENCES Marca(CodMarca)
);

CREATE TABLE Filial (
    CodFilial INTEGER PRIMARY KEY,
    Nome VARCHAR(40),
    Cidade VARCHAR(30)
);

CREATE TABLE Disponiveis (
    CodModelo INTEGER,
    CodFilial INTEGER,
    Data DATE,
    Quantidade INTEGER,
    PRIMARY KEY (CodModelo, CodFilial, Data),
    FOREIGN KEY (CodModelo) REFERENCES Modelo(CodModelo),
    FOREIGN KEY (CodFilial) REFERENCES Filial(CodFilial)
);

INSERT INTO Marca VALUES (1, 'Vw', 'Brasil');
INSERT INTO Marca VALUES (2, 'gm', 'Brasil');
INSERT INTO Marca VALUES (3, 'Ford', 'Brasil');
INSERT INTO Marca VALUES (4, 'Fiat', 'Brasil');

INSERT INTO Modelo VALUES (1, 'Fox', 'Power', 'Preto', 'Petrolina', 1);
INSERT INTO Modelo VALUES (2, 'Gol', 'Flex', 'Vermelho', 'Petrolina', 4);
INSERT INTO Modelo VALUES (3, 'Palio', 'Flex', 'Prata', 'Petrolina', 3);
INSERT INTO Modelo VALUES (4, 'EcoSport', 'Sport Line', 'Prata', 'Juazeiro', 1);

INSERT INTO Filial VALUES (1, 'Grande Rio', 'Petrolina');
INSERT INTO Filial VALUES (2, 'Multicar', 'Juazeiro');
INSERT INTO Filial VALUES (3, 'Norcavel', 'Salgueiro');

INSERT INTO Disponiveis VALUES (1, 1, '2006-04-02', 6);
INSERT INTO Disponiveis VALUES (3, 2, '2006-04-06', 4);
INSERT INTO Disponiveis VALUES (4, 4, '2006-04-07', 8);


UPDATE Modelo SET Cor = 'Cinza' WHERE CodModelo = 4;
UPDATE Modelo SET Cidade = 'Salgueiro' WHERE CodModelo IN (1, 4);
UPDATE Filial SET Nome = 'Norcavel', Cidade = 'Salgueiro' WHERE CodFilial = 3;
UPDATE Disponiveis SET Data = '2011-05-13' WHERE CodModelo = 1;
UPDATE Disponiveis SET Data = '2012-08-27' WHERE CodModelo = 3;
UPDATE Disponiveis SET Data = '2012-09-20' WHERE CodModelo = 4;

DELETE FROM Marca WHERE CodMarca = 2;
DELETE FROM Disponiveis WHERE CodModelo = 3;
