CREATE DATABASE reforco3;

USE reforco3;


/* Tabela Usuário*/

CREATE TABLE usuario(
	usuario_codigo INT PRIMARY KEY AUTO_INCREMENT,
	usuario_nome VARCHAR(255) NOT NULL,
	usuario_email  VARCHAR(255) UNIQUE NOT NULL,
	usuario_senha CHAR(12) NOT NULL,
	usuario_nivel INT(2) NOT NULL
);

DESCRIBE usuario;

ALTER TABLE usuario MODIFY usuario_senha CHAR(8) NOT NULL;

ALTER TABLE usuario DROP COLUMN usuario_nivel;

ALTER TABLE usuario ADD usuario_observacao VARCHAR(255);

INSERT INTO usuario (usuario_nome, usuario_email, usuario_senha) 
VALUES ("Marisa Oliveira", "Marisa94@lemail.com", "123456"),
	("João Silva", "Silva.Joao@lemail.com", "654321");

SELECT * FROM usuario;


/* Tabelas Autor e Livro  */

CREATE TABLE autor(
	autor_codigo INT PRIMARY KEY AUTO_INCREMENT,
	autor_nome VARCHAR(255) NOT NULL
);

INSERT INTO autor (autor_nome) 
VALUES ("Jane Austen"),
	("John Boyne");
	
SELECT * FROM autor;
	
CREATE TABLE livro(
	livro_codigo INT PRIMARY KEY AUTO_INCREMENT,
	livro_nome VARCHAR(255) NOT NULL,
	fk_autor INT NOT NULL,
	livro_editora VARCHAR(255) NOT NULL,
	livro_paginas INT,
	FOREIGN KEY (fk_autor) REFERENCES autor(autor_codigo) 
);

DESCRIBE livro;

ALTER TABLE livro 
    CHANGE livro_nome livro_titulo VARCHAR(255) NOT NULL;
    
ALTER TABLE livro
	ADD livro_status TINYINT(1) NOT NULL;
	
INSERT INTO livro (livro_titulo, livro_editora, livro_paginas, livro_status, fk_autor) 
VALUES ("Orgulho e Preconceito", "Record", 250, 1, 1),
	("Menino do Pijama Listrado", "Cia das Letras",	192, 2, 2);
	
SELECT * FROM livro;

/* Tabelas Dono e Carro  */

CREATE TABLE dono(
	dono_codigo INT PRIMARY KEY AUTO_INCREMENT,
	dono_nome VARCHAR(255) NOT NULL
);

DESCRIBE dono;

INSERT INTO dono(dono_nome)
VALUES ("Maria Angelina"),
	("Henrique Cardoso");

SELECT * FROM dono;


CREATE TABLE carro(
	carro_codigo INT PRIMARY KEY AUTO_INCREMENT,
	carro_placa CHAR(7) UNIQUE NOT NULL,
	carro_ano VARCHAR(255) NOT NULL,
	fk_dono INT(10) NOT NULL,
	FOREIGN KEY (fk_dono) REFERENCES dono(dono_codigo) 
);

DESCRIBE carro;

INSERT INTO carro (carro_placa, carro_ano, fk_dono) 
VALUES ("1234567", "10 de outubro de 2024", 01),
	("7654321", "23 de maio de 2024", 02);

SELECT * FROM carro;

/* Tabelas Sala e Disciplina */

CREATE TABLE disciplina(
	disciplina_codigo INT(2) PRIMARY KEY AUTO_INCREMENT,
	disciplina_nome VARCHAR(255) NOT NULL
);

DESCRIBE disciplina;

INSERT INTO disciplina(disciplina_nome)
VALUES ("Matématica Aplicada"),
	("Inglês Avançado");
	
SELECT * FROM disciplina;

CREATE TABLE sala(
	sala_codigo INT PRIMARY KEY,
	sala_nome VARCHAR(255) UNIQUE NOT NULL,
	sala_bloco VARCHAR(255) NOT NULL,
	fk_disciplina INT(2) NOT NULL
	
);

ALTER TABLE sala ADD FOREIGN KEY (fk_disciplina) REFERENCES disciplina(disciplina_codigo);

ALTER TABLE sala 
MODIFY sala_codigo INT AUTO_INCREMENT;

DESCRIBE sala;

INSERT INTO sala (sala_nome, sala_bloco, fk_disciplina) 
VALUES ("Sala 01", "Bloco 01", 01),
	("Sala 02", "Bloco 01", 02);
	
SELECT * FROM sala;


