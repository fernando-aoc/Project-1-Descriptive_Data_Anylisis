-- Criando a base de dados

CREATE DATABASE vendas;
USE vendas;
CREATE TABLE vendedores (
Loja VARCHAR (100) NOT NULL, 
Nome VARCHAR(100) NOT NULL,
Sobrenome VARCHAR(100) NOT NULL
)
ENGINE=InnoDB DEFAULT CHARSET = latin1;
USE vendas;
CREATE TABLE vendas_totais (
    SKU CHAR(6) NOT NULL,
    Produto VARCHAR(100) NOT NULL,
    Qtd_vendida INT(10) NOT NULL,
    Preco_Unidade INT(10) NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Sobrenome VARCHAR(100) NOT NULL,
    Sexo CHAR(1)
)  ENGINE=INNODB DEFAULT CHARSET=latin1;

-- Importando a base de dados

LOAD DATA INFILE "C:\\projeto SQL\\SQL_1.csv" INTO TABLE vendedores FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY "\n" IGNORE 1 ROWS;
LOAD DATA INFILE "C:\\projeto SQL\\SQL_2.csv" INTO TABLE vendas_totais FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY "\n" IGNORE 1 ROWS;
USE vendas;
SELECT * FROM vendedores;
SELECT * FROM vendas_totais;