/* 
   Atualizado em 06/05/2024 - 23:35

   Repositório de SQL
   Sintaxe básica.
*/

/* 
   Mostra todos os bancos de dados disponíveis ao usuário 
*/
SHOW DATABASES;

/* 
  Criação de uma nova instancia de banco de dados
  SINTAXE: CREATE DATABASE nomedobancodedados
*/
CREATE DATABASE sistema;

/* 
   Conexão a determinado banco de dados 
   SINTAXE: USE nomedobancodedados
*/
USE sistema;


/*
   Mostra todas as tabelas do Banco de Dados selecionado
*/
SHOW TABLES;

/*
   Lista as características da tabela (Atributos criados)
   SINTAXE: DESCRIBE nomedatabela
*/
DESCRIBE autor;

/*
   Atenção.... Cuidado com este comando
   Caso seu usuário tenha permissão total no banco....
   Irá apagar a tabela selecionada. Com todos os dados...!
*/
DROP TABLE cliente;


/* 
   Exemplo de criação de uma tabela
   Nome da tabela: autor
   Atributos:
	- autor_codigo: Chave primário, Tipo Inteiro
	- autor_nome: Atributo Simples, Tipo Varchar de 255 caracteres, não pode ser nulo, obrigatório inserir dados
	- autor_editora: Atributo Simples, Tipo Varchar  de 255 caracteres, não pode ser nulo, obrigatório inserir dados
*/
CREATE TABLE autor(
	autor_codigo INT PRIMARY KEY,
	autor_nome VARCHAR(255) NOT NULL,
	autor_editora VARCHAR(255) NOT NULL
	);
	
CREATE TABLE cliente(
	cliente_codigo INT(10) PRIMARY KEY,
	cliente_nome VARCHAR(255) NOT NULL,
	cliente_observacao VARCHAR(255) NULL	
);

DESCRIBE cliente;

ALTER TABLE cliente MODIFY cliente_observacao VARCHAR(255) NULL;

ALTER TABLE cliente ADD cliente_profissao VARCHAR(255) NULL;

ALTER TABLE cliente MODIFY cliente_profissao VARCHAR(255) NOT NULL;
	
ALTER TABLE cliente DROP COLUMN cliente_profissao;

DESCRIBE cliente;

CREATE TABLE cliente(
	cliente_id INT(10) PRIMARY KEY,
	cliente_nome VARCHAR(255) NOT NULL,
	cliente_telefone VARCHAR(255) NOT NULL,
	cliente_email VARCHAR(255) NOT NULL UNIQUE,
	cliente_observacao VARCHAR(255) NULL
);

CREATE TABLE equipamento(
	equipamento_id INT(10) PRIMARY KEY,
	equipamento_descricao VARCHAR(255) NOT NULL,
	equipamento_detalhers VARCHAR(255) NOT NULL,
	equipamento_observacao VARCHAR(255) NULL,
	fk_cliente_id INT(10) NOT NULL,
	FOREIGN KEY (fk_cliente_id) REFERENCES cliente(cliente_id)
);

SHOW TABLES;

DROP TABLE equipamento;

DESCRIBE equipamento;

ALTER TABLE equipamento DROP COLUMN fk_cliente_id;

ALTER TABLE equipamento ADD FOREIGN KEY (fk_cliente_id) REFERENCES cliente(cliente_id);

CREATE TABLE marca(
	marca_id INT(10) PRIMARY KEY,
	marca_nome VARCHAR(255) NOT NULL
);

DROP TABLE autor;

SHOW TABLES;

ALTER TABLE equipamento ADD fk_marca_id INT(10) NOT NULL;

ALTER TABLE equipamento ADD FOREIGN KEY (fk_marca_id) REFERENCES marca(marca_id);

DESCRIBE equipamento;

ALTER TABLE equipamento MODIFY fk_marca_id INT(10) NOT NULL;

CREATE TABLE tecnico(
	tecnico_id INT(10) PRIMARY KEY,
	tecnico_nome VARCHAR(255) NOT NULL,
	tecnico_telefone VARCHAR(255) NOT NULL
);

CREATE TABLE item (
	item_id INT(10) PRIMARY KEY,
	item_descricao VARCHAR(255) NOT NULL,
	item_valor DECIMAL(5,2) NOT NULL
);

CREATE TABLE servico(
	servico_id INT(10) PRIMARY KEY,
	servico_descricao VARCHAR(255) NOT NULL,
	servico_
);

/* 
DML - DATA MANIPULATION LANGUAGE
	CRUD
	- INSERT
	- SELECT
	- UPDATE
	- DELETE
*/

INSERT INTO cliente
	(cliente_id,
	cliente_nome,
	cliente_telefone,
	cliente_email) 
VALUES (1,
	"João",
	"(11)8787-8789",
	"Joaozinho@lemail.com");

DESCRIBE cliente;
SHOW TABLES;

SELECT * FROM cliente;

UPDATE cliente
SET cliente_nome = "João Pedro"
WHERE cliente_nome= "João";

UPDATE cliente
SET cliente_observacao = "Primo da Mariazinha"
WHERE cliente_nome= "João Pedro";

SELECT * 
FROM cliente;

INSERT INTO cliente
	(cliente_id,
	cliente_nome,
	cliente_telefone,
	cliente_email,
	cliente_observacao) 
VALUES (2,
	"Ana Clara",
	"(11)8787-6754",
	"Clara_Doces@lemail.com",
	"Confeiteira e Dona da Clara Doces");
	
DELETE 
FROM cliente 
WHERE cliente_id = 0;

INSERT INTO cliente
	(cliente_id,
	cliente_nome,
	cliente_telefone,
	cliente_email,
	cliente_observacao) 
VALUES (3,
	"Ricardo",
	"(11)8787-4309",
	"Ricardao@lemail.com",
	"Pai do Diego");
	
DESCRIBE tecnico;

INSERT 
INTO tecnico (tecnico_id, tecnico_nome, tecnico_telefone)
VALUES (1,"Eduardo","(11)8787-7689"),
	(2,"Maraisa","(11)8787-3389"),
	(3,"Pedro","(11)8787-7669");
	
SELECT *
FROM tecnico;

DESCRIBE cliente;

INSERT INTO cliente
	(cliente_id,
	cliente_nome,
	cliente_telefone,
	cliente_email,
	cliente_observacao) 
VALUES (4,
	"Ricardo",
	"(11)8787-4309",
	"Ricardao@lemail.com",
	"Pai do Diego");

ALTER TABLE cliente MODIFY cliente_email VARCHAR(255) NOT NULL;

ALTER TABLE cliente DROP cliente_email;

DESCRIBE item;

ALTER TABLE item MODIFY item_id INT(10) AUTO_INCREMENT;

INSERT
INTO item (item_descricao, item_valor)
VALUES ("Fone de Ouvido",50.00),
	("Celular",100),
	("Mouse",45.00);
	
SELECT *
FROM item;

DESCRIBE tecnico;

ALTER TABLE tecnico MODIFY tecnico_id INT(255) AUTO_INCREMENT; 

INSERT 
INTO tecnico (tecnico_nome, tecnico_telefone)
VALUES ("Eduarda","(11)8787-0189"),
	("Thiago","(11)8787-3209"),
	("Kieran","(11)8787-4469");
	
SELECT *
FROM tecnico;


/* aula 03/06 */