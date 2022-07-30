DROP DATABASE IF EXISTS Leilao_de_carros;

CREATE DATABASE  IF NOT EXISTS  Leilao_de_carros;

CREATE SCHEMA IF NOT EXISTS Leilao_de_carros;

USE Leilao_de_carros;

CREATE TABLE IF NOT EXISTS LOJA(
    loja_id SERIAL,
    loja_CNPJ VARCHAR(14) PRIMARY KEY,
    loja_email VARCHAR(256) NOT NULL,
    loja_senha VARCHAR(50) NOT NULL,
    loja_nome VARCHAR(256) NOT NULL,
    loja_descricao VARCHAR(256) NOT NULL
);

CREATE TABLE IF NOT EXISTS USUARIO(
    `user_id` SERIAL,
    user_CPF VARCHAR(11) PRIMARY KEY,
    user_senha VARCHAR(256) NOT NULL,
    user_email VARCHAR(256) NOT NULL,
    user_nome VARCHAR(256) NOT NULL,
    user_telefone VARCHAR(11) NOT NULL,
    user_sexo CHAR NOT NULL,
    user_data_nasc DATE NOT NULL,
    user_tipo VARCHAR(10) NOT NULL,
    CONSTRAINT `check_sexo` CHECK (user_sexo = 'M' OR user_sexo = 'F')
);

CREATE TABLE IF NOT EXISTS VEICULO(
    veic_id SERIAL,
    veic_placa VARCHAR(7) PRIMARY KEY,
    veic_loja_CNPJ VARCHAR(14),
    veic_modelo VARCHAR(256) NOT NULL,
    veic_chassi VARCHAR(256) NOT NULL,
    veic_ano INT NOT NULL,
    veic_quilometragem FLOAT NOT NULL,
    veic_descricao VARCHAR(256) NOT NULL,
    veic_valor FLOAT NOT NULL,
    veic_fotos VARCHAR(256) NOT NULL,
    FOREIGN KEY (veic_loja_CNPJ) REFERENCES LOJA(loja_CNPJ)
);


CREATE TABLE IF NOT EXISTS PROPOSTA(
    prop_id SERIAL,
    prop_user_CPF VARCHAR(11),
    prop_veic_placa VARCHAR(7),
    prop_data DATE NOT NULL,
    prop_valor FLOAT NOT NULL,
    prop_status VARCHAR(256) NOT NULL,
    prop_loja_CNPJ VARCHAR(14),
    CONSTRAINT PK_COMPOSTA PRIMARY KEY (prop_id, prop_user_CPF,
    prop_veic_placa, prop_loja_CNPJ, prop_data),
    FOREIGN KEY (prop_user_CPF) REFERENCES USUARIO(user_CPF),
    FOREIGN KEY (prop_veic_placa) REFERENCES VEICULO(veic_placa),
    FOREIGN KEY (prop_loja_CNPJ) REFERENCES LOJA(loja_CNPJ)
);

INSERT INTO USUARIO(user_CPF, user_senha, user_email,
user_nome, user_telefone, user_sexo, user_data_nasc, user_tipo) 
VALUES ('12345678901','admin','admin@admin.com',
'Admin','16970707070','F','2000-12-05','ADMIN');