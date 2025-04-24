CREATE DATABASE login;

USE login;

CREATE TABLE tipo_usuario (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(50) NOT NULL
);

INSERT INTO tipo_usuario (tipo) VALUES ('Admin'), ('Supervisor'), ('Usuário Comum');

CREATE TABLE usuario (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(15),
    senha VARCHAR(255) NOT NULL,
    tipo_id INT NOT NULL,
    FOREIGN KEY (tipo_id) REFERENCES tipo_usuario(id)
);
