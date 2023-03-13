-- Criando a base de dados

CREATE DATABASE vendas;
USE vendas;
CREATE TABLE vendedores (
ID INT AUTO_INCREMENT,
Loja VARCHAR (100) NOT NULL, 
Nome VARCHAR(100) NOT NULL,
Sobrenome VARCHAR(100) NOT NULL,
PRIMARY KEY(ID)
)
ENGINE=InnoDB DEFAULT CHARSET = latin1;
CREATE TABLE vendas_totais (
	ID INT AUTO_INCREMENT,
	SKU CHAR(6) NOT NULL,
    Produto VARCHAR(100) NOT NULL,
    Qtd_vendida INT(10) NOT NULL,
    Preco_Unidade FLOAT NOT NULL,
    Nome VARCHAR(100) NOT NULL,
    Sobrenome VARCHAR(100) NOT NULL,
    Sexo CHAR(1),
    PRIMARY KEY(ID)
)  
ENGINE=INNODB DEFAULT CHARSET=latin1;

-- Importando a base de dados

LOAD DATA INFILE "C:\\projeto SQL\\SQL_1.csv" INTO TABLE vendedores FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY "\n"  IGNORE 1 ROWS 
(Loja, Nome, Sobrenome);
LOAD DATA INFILE "C:\\projeto SQL\\SQL_2.csv" INTO TABLE vendas_totais FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"' LINES TERMINATED BY "\n" IGNORE 1 ROWS
(SKU, Produto, Qtd_vendida, Preco_Unidade, Nome, Sobrenome, Sexo);

SELECT * FROM vendedores;
SELECT * FROM vendas_totais;
