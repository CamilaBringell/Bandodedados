CREATE DATABASE ativ1;
USE ativ1;

CREATE TABLE projetos (
	Pcodigo CHAR (6) PRIMARY KEY NOT NULL,
	Pnome VARCHAR (24) NOT NULL, 
	Dcodigo CHAR (3) NOT NULL,
	Resp CHAR (6) NOT NULL,
	Dateini DATE,
	Datafim DATE,
	Psuper CHAR (6),
	FOREIGN KEY (resp) REFERENCES projetos (Pcodigo),
	FOREIGN KEY (Psuper) REFERENCES projetos (Pcodigo)  
	);
	
CREATE TABLE funcionarios (
	 Fmatricula CHAR(6) PRIMARY KEY NOT NULL
	 AUTO_INCREMENT,
	 Fnome VARCHAR (24) 
);

CREATE TABLE departamento (
	Dcodigo CHAR(6) PRIMARY KEY NOT NULL
	AUTO_INCREMENT,
	Fnome VARCHAR (24) NOT NULL
);


