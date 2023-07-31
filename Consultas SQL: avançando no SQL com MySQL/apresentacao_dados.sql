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

-- Aproveitando o exercício do vídeo anterior (maior quantidade vendida) quantos itens de venda existem para o produto '1101035' ?
SELECT MAX(QUANTIDADE) as 'MAIOR QUANTIDADE' FROM itens_notas_fiscais WHERE CODIGO_DO_PRODUTO = '1101035';

SELECT COUNT(*) FROM itens_notas_fiscais WHERE CODIGO_DO_PRODUTO = '1101035' AND QUANTIDADE = 99;

-- HAVING é uma condição (filtro) que se aplica ao resultado de uma agregação

SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS SOMA_LIMITE FROM tabela_de_clientes
    GROUP BY ESTADO
    HAVING SOMA_LIMITE > 900000;
    
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO, MIN(PRECO_DE_LISTA) AS MENOR_PRECO FROM tabela_de_produtos
    GROUP BY EMBALAGEM
    HAVING SUM(PRECO_DE_LISTA) <= 80;
    
-- Quais foram os clientes que fizeram mais de 2000 compras em 2016?
SELECT CPF, COUNT(CPF) AS Qtd_Compra FROM notas_fiscais
    WHERE YEAR(DATA_VENDA) = 2016
    GROUP BY CPF
    HAVING Qtd_Compra > 2000;

-- Classificando resultados
SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA,
    CASE
        WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
        WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
        ELSE 'PRODUTO BARATO'
    END AS STATUS_PRECO
    FROM tabela_de_produtos;
    
SELECT EMBALAGEM,
    CASE
        WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
        WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
        ELSE 'PRODUTO BARATO'
    END AS STATUS_PRECO, AVG(PRECO_DE_LISTA) AS PRECO_MEDIO
    FROM tabela_de_produtos
    GROUP BY EMBALAGEM,
    CASE
        WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
        WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
        ELSE 'PRODUTO BARATO'
    END
    ORDER BY EMBALAGEM;

-- Veja o ano de nascimento dos clientes e classifique-os como: Nascidos antes de 1990 são velhos, nascidos entre 1990 e 1995 são jovens e nascidos depois de 1995 são crianças. Liste o nome do cliente e esta classificação.

SELECT NOME,
	CASE
		WHEN YEAR(DATA_DE_NASCIMENTO) < 1990 THEN 'VELHO'
        WHEN YEAR(DATA_DE_NASCIMENTO) >= 1990 AND YEAR(DATA_DE_NASCIMENTO) < 1995 THEN 'JOVEM'
        ELSE 'CRIANÇA'
	END AS Classificacao
    FROM tabela_de_clientes;

