
CREATE TABLE Livros (
    numero INTEGER PRIMARY KEY,
    Titulo VARCHAR(255),
    genero VARCHAR(50),
    edicao INTEGER,
    ano_publicado INTEGER,
    CPF_funcionario VARCHAR(11),
    codigo_editora INTEGER,
    CPF_usuario VARCHAR(11),
    CPF_usuarioReservar VARCHAR(11)
);

CREATE TABLE Usuários (
    CPF VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(255),
    endereco VARCHAR(255),
    telefone VARCHAR(8)
);

CREATE TABLE Livros_Autores (
    numero_livro INTEGER,
    codigo_autor INTEGER,
    PRIMARY KEY (numero_livro, codigo_autor),
    FOREIGN KEY (numero_livro) REFERENCES Livros(numero),
    FOREIGN KEY (codigo_autor) REFERENCES Autores(codigo)
);

CREATE TABLE Autores (
    codigo INTEGER PRIMARY KEY,
    nome VARCHAR(255),
    nacionalidade VARCHAR(50)
);

CREATE TABLE Funcionário (
    CPF VARCHAR(11) PRIMARY KEY,
    nome VARCHAR(255),
    endereco VARCHAR(255),
    telefone VARCHAR(8),
    salario DECIMAL(10, 2),
    funcao VARCHAR(255)
);

CREATE TABLE Editoras (
    codigo INTEGER PRIMARY KEY,
    nome VARCHAR(255),
    endereco VARCHAR(255),
    contato VARCHAR(8)
);

-- Inserções de dados
INSERT INTO Livros VALUES
    (10277843, 'O Pelicano', 'Romance', 12, 1984, NULL, 2134000, NULL, NULL),
    (32176500, 'Salomão-D Homem...', 'Romance', 2, 2011, NULL, 6655000, '19321122213', NULL),
    (45112239, 'Steve Jobs-a Biografia', 'Biografia', 48, 2011, '61254590871', 2287000, NULL, NULL),
    (67392217, 'Empregabilidade', 'Administração', 22, 1977, NULL, 9898000, NULL, 19321122213),
    (67554421, 'Bagagem', 'Poesia', 5, 1972, '32361298734', 6655000, NULL, NULL),
    (77680012, 'A Duração do Dia', 'Poesia', 1, 2010, NULL, 2134000, NULL, NULL),
    (87659908, 'Tecnologias que Mudam', 'Tecnologia', 2, 2007, NULL, 2134000, NULL, 70964411900);

INSERT INTO Usuários VALUES
    ('10122020232', 'Maria de Lourdes Amaral', NULL, '35440089'),
    ('19321122213', 'José Francisco de Paula', NULL, '27219756'),
    ('22539910976', 'Ivete Medina Chernell', NULL, '48170352'),
    ('45399109881', 'Raquel Santos', NULL, '87603451'),
    ('70964411900', 'Luiza Souza Prado', NULL, '34559087');

INSERT INTO Livros_Autores VALUES
    (32176500, 22564411),
    (45112239, 22564411),
    (10277843, 55490076),
    (67554421, 55490076),
    (77680012, 55490076),
    (67392217, 77548854),
    (87659908, 90984133);

INSERT INTO Autores VALUES
    (22564411, 'Walter Isaacson', 'Americana'),
    (55490076, 'Adélia Prado', 'Brasileira'),
    (77548854, 'Ana Lucia Jankovic Barduchi', 'Brasileira'),
    (85668900, 'Ethevaldo Siqueira', 'Brasileira'),
    (90984133, 'Steven K. Scott', 'Americana');

INSERT INTO Funcionário VALUES
    ('20321295096', 'João Alberto Smith', 'Itatiba', '22447865', 0.00, NULL),
    ('23161197770', 'Ana Salles Azir', 'Salto', '22317865', 0.00, 'Recepcionista'),
    ('30361290876', 'Ademir José Silva', 'Campinas', '22317865', 0.00, 'HULL'),
    ('32361298734', 'Luís Henrique Talles', 'Campinas', '21531785', 0.00, NULL),
    ('45403612087', 'Francisco José Almeida', 'Indaiatuba', '25417761', 0.00, 'HULL'),
    ('61254590871', 'Lucia Vicentim', 'Salto', '21316565', 0.00, 'Bibliotecaria');

INSERT INTO Editoras VALUES
    (2134000, 'Saraiva', 'São Paulo', '8003434'),
    (6655000, 'Eras', 'Brasília', '8002432'),
    (2287000, 'Summer', 'Curitiba', '8002198'),
    (9898000, 'Pontos', 'São Paulo', '8005600'),
    (6655000, 'Mark', 'Rio de Janeiro', '8009000');


UPDATE Funcionário
SET Funcao = 'Auxiliar', Salario = 1800.00
WHERE CPF = '32361298734';


DELETE FROM Usuários WHERE CPF = '45399109881';


DELETE FROM Livros_Autores
WHERE numero_livro = 32176500 AND codigo_autor = 90984133;

UPDATE Livros
SET CPF_usuarioReservar = NULL, CPF_usuarioRetirar = '70964411900'
WHERE numero = 87659908;


INSERT INTO Editoras (codigo, nome, endereco, contato)
VALUES (9900545, 'Elsevier', 'São Paulo', NULL),
       (43234580, 'Campus', 'Rio de Janeiro', '8009988');

UPDATE Funcionário
SET Funcao = 'Analista Contábil'
WHERE CPF IN ('20321295096', '45403612087');

UPDATE Funcionário
SET Salario = 5000.00
WHERE Funcao = 'Analista Contábil';

UPDATE Funcionário
SET Funcao = 'Auxiliar Administrativo', Salario = 2000.00
WHERE Funcao IS NULL;

DELETE FROM Editoras WHERE endereco = 'Salvador';

UPDATE Funcionário
SET Funcao = NULL, Salario = NULL
WHERE Funcao IN ('Analista Contábil', 'Auxiliar Administrativo');

DELETE FROM Editoras WHERE nome IN ('Elsevier', 'Campus');
