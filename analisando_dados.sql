USE vendas;
SELECT * FROM vendas_totais;
SELECT * FROM vendedores;
-- Concatenando as colunas Nome e Sobrenome 
SET SQL_SAFE_UPDATES = 0;
UPDATE vendedores SET Nome = CONCAT(Nome, " ", Sobrenome);
UPDATE vendas_totais SET Nome = CONCAT(Nome, " ", Sobrenome);
ALTER TABLE vendedores DROP COLUMN Sobrenome;
ALTER TABLE vendas_totais DROP COLUMN Sobrenome;
UPDATE vendedores SET Nome = LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(REPLACE(Nome, CHAR(10), ''), CHAR(13), ''), CHAR(9), ''), CHAR(160), '')));

-- ANÁLISE DOS DADOS 
 
SELECT Loja FROM vendedores GROUP BY Loja;
SELECT COUNT(Nome) FROM vendedores;
SELECT Loja, COUNT(Nome) FROM vendedores GROUP BY Loja;

-- #1: No sistema temos o total de 9999 vendedores distribuídos em 12 cidades, sendo São Paulo a cidade com mais vendedores: 1733. 

SELECT SUM(Qtd_vendida * Preco_Unidade) AS total FROM vendas_totais;

-- #2: O valor de todas as vendas somadas foi de R$ 99.319.500,00.

SELECT Produto, SUM(Qtd_vendida) FROM vendas_totais GROUP BY Produto;

-- 3#: O produto mais vendido foi O Iphone com 7190 unidades vendidas.

SELECT Loja, SUM(Qtd_vendida * Preco_Unidade) AS 'Total das Vendas' FROM vendedores INNER JOIN vendas_totais ON vendas_totais.Nome = vendedores.Nome 
GROUP BY Loja ORDER BY SUM(Qtd_vendida * Preco_Unidade) DESC;

-- 4#:A cidade que teve mais vendas foi São Paulo (R$ 28.053.400,00), seguida por Belo Horizonte (R$ 24.743.300,00) e depois por Goiânia (R$ 16.115.700,00).

SELECT COUNT(Nome) AS 'Total de Mulheres' FROM vendas_totais WHERE Sexo = 'F';
SELECT (COUNT(Nome)/9999)*100 AS 'Total de Mulheres(%)' FROM vendas_totais WHERE Sexo = 'F';
SELECT COUNT(Nome) AS 'Total de Homens' FROM vendas_totais WHERE Sexo = 'M';
SELECT (COUNT(Nome)/9999)*100 AS 'Total de Homens(%)' FROM vendas_totais WHERE Sexo = 'M';

-- 5#: O total de vendedores do sexo feminino é de 4501(45%) e do sexo masculino é de 5498(54.98%). 
