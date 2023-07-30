-- Consultas sem/com retorno de registros diferentes
SELECT EMBALAGEM, TAMANHO FROM tabela_de_produtos;

SELECT DISTINCT EMBALAGEM, TAMANHO FROM tabela_de_produtos;

-- Quais são os bairros da cidade do Rio de Janeiro que possuem clientes?
SELECT DISTINCT BAIRRO FROM tabela_de_clientes WHERE CIDADE = 'Rio de Janeiro';

-- Limitar o número de registros exibidos na consulta
SELECT EMBALAGEM, TAMANHO FROM tabela_de_produtos LIMIT 5;

-- Limitar o número de registros por fatias da tabela
SELECT EMBALAGEM, TAMANHO FROM tabela_de_produtos LIMIT 2,3;

-- Queremos obter as 10 primeiras vendas do dia 01/01/2017. Qual seria o comando SQL para obter este resultado?
SELECT * FROM notas_fiscais WHERE DATA_VENDA = '2017-01-01' LIMIT 10;

-- Ordenando a saída da consulta
SELECT * FROM tabela_de_produtos; -- sem ordenação

SELECT * FROM tabela_de_produtos ORDER BY PRECO_DE_LISTA; -- subentendido como ASC

SELECT * FROM tabela_de_produtos ORDER BY PRECO_DE_LISTA DESC;

SELECT * FROM tabela_de_produtos ORDER BY EMBALAGEM, NOME_DO_PRODUTO;

-- Agrupando os resultados
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS 'Limite de Crédito Total' FROM tabela_de_clientes GROUP BY ESTADO;

SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS 'Maior Preço' FROM tabela_de_produtos GROUP BY EMBALAGEM;

SELECT EMBALAGEM, COUNT(*) AS Quantidade FROM tabela_de_produtos GROUP BY EMBALAGEM;

SELECT BAIRRO, SUM(LIMITE_DE_CREDITO) AS LIMITE FROM tabela_de_clientes
    WHERE CIDADE = 'São Paulo' GROUP BY BAIRRO;


