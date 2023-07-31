-- Junção de tabelas com chave primária e estrangeira

SELECT * FROM tabela_de_vendedores;
SELECT * FROM notas_fiscais;

SELECT * FROM tabela_de_vendedores V
	INNER JOIN notas_fiscais N
    ON V.MATRICULA = N.MATRICULA;
  
SELECT A.MATRICULA, A.NOME, COUNT(*)
	FROM tabela_de_vendedores A
    INNER JOIN notas_fiscais B
    ON A.MATRICULA = B.MATRICULA
    GROUP BY A.MATRICULA;
    
-- Obtenha o faturamento anual da empresa. Leve em consideração que o valor financeiro das vendas consiste em multiplicar a quantidade pelo preço.
SELECT YEAR(DATA_VENDA), SUM(QUANTIDADE * PRECO) AS FATURAMENTO
    FROM notas_fiscais NF INNER JOIN itens_notas_fiscais INF 
    ON NF.NUMERO = INF.NUMERO
    GROUP BY YEAR(DATA_VENDA)

-- Consulta com LEFT JOIN para saber qual cliente nunca realizou uma compra
SELECT COUNT(*) FROM tabela_de_clientes;

SELECT CPF, COUNT(*) FROM notas_fiscais GROUP BY CPF;

SELECT TC.CPF, COUNT(NF.CPF)
	FROM tabela_de_clientes TC
    LEFT JOIN notas_fiscais NF
    ON TC.CPF = NF.CPF
    GROUP BY TC.CPF;

-- Vendedor com escritório em bairro onde não tem cliente
SELECT tabela_de_vendedores.BAIRRO, tabela_de_vendedores.NOME,
	DE_FERIAS, tabela_de_clientes.BAIRRO, tabela_de_clientes.NOME
		FROM tabela_de_vendedores
		INNER JOIN tabela_de_clientes
		ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;
        
SELECT tabela_de_vendedores.BAIRRO, tabela_de_vendedores.NOME,
	DE_FERIAS, tabela_de_clientes.BAIRRO, tabela_de_clientes.NOME
		FROM tabela_de_vendedores
		LEFT JOIN tabela_de_clientes
		ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;
		
-- Clientes que moram em bairros sem escritórios de vendedores
        
SELECT tabela_de_vendedores.BAIRRO, tabela_de_vendedores.NOME,
	DE_FERIAS, tabela_de_clientes.BAIRRO, tabela_de_clientes.NOME
		FROM tabela_de_vendedores
		RIGHT JOIN tabela_de_clientes
		ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;
		
-- MySQL não suporta FULL JOIN: o comando a seguir dá erro
SELECT tabela_de_vendedores.BAIRRO, tabela_de_vendedores.NOME,
	DE_FERIAS, tabela_de_clientes.BAIRRO, tabela_de_clientes.NOME
		FROM tabela_de_vendedores
		FULL JOIN tabela_de_clientes
		ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;
		
-- CROSS JOIN: análise combinatório entre todos os campos das tabelas
SELECT tabela_de_vendedores.BAIRRO, tabela_de_vendedores.NOME,
	DE_FERIAS, tabela_de_clientes.BAIRRO, tabela_de_clientes.NOME
		FROM tabela_de_vendedores, tabela_de_clientes;

-- Consultas de bairros de vendedores e clientes
SELECT DISTINCT BAIRRO FROM tabela_de_clientes;

SELECT DISTINCT BAIRRO FROM tabela_de_vendedores;

-- Unindo as duas consultas, comando 'DISTINCT' subentendido
-- As tabelas precisam ter o mesmo número de colunas e os mesmos tipos de dados nessas colunas
SELECT DISTINCT BAIRRO FROM tabela_de_clientes
UNION
SELECT DISTINCT BAIRRO FROM tabela_de_vendedores;

-- Unindo as duas consultas sem o comando 'DISTINCT'
SELECT DISTINCT BAIRRO FROM tabela_de_clientes
UNION ALL
SELECT DISTINCT BAIRRO FROM tabela_de_vendedores;

-- FULL JOIN no MySQL: LEFT JOIN + UNION + RIGHT JOIN
SELECT tabela_de_vendedores.BAIRRO, tabela_de_vendedores.NOME,
	DE_FERIAS, tabela_de_clientes.BAIRRO, tabela_de_clientes.NOME
		FROM tabela_de_vendedores
		LEFT JOIN tabela_de_clientes
		ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO
UNION
SELECT tabela_de_vendedores.BAIRRO, tabela_de_vendedores.NOME,
	DE_FERIAS, tabela_de_clientes.BAIRRO, tabela_de_clientes.NOME
		FROM tabela_de_vendedores
		RIGHT JOIN tabela_de_clientes
		ON tabela_de_vendedores.BAIRRO = tabela_de_clientes.BAIRRO;

-- Subconsultas:
-- consultar os clientes que estão em bairros onde possuem escritórios de vendedores
SELECT * FROM tabela_de_clientes WHERE BAIRRO IN (SELECT DISTINCT BAIRRO FROM tabela_de_vendedores);

-- Quais são as embalagens com o preço máximo maior que 10?
SELECT X.EMBALAGEM, X.PRECO_MAXIMO FROM
	(SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS PRECO_MAXIMO FROM tabela_de_produtos
		GROUP BY EMBALAGEM) X
	WHERE X.PRECO_MAXIMO > 10;
	
/*
Criar uma VIEW

CREATE 
VIEW `VW_MAIORES_EMBALAGENS` AS
    SELECT 
        `tabela_de_produtos`.`EMBALAGEM` AS `EMBALAGEM`,
        MAX(`tabela_de_produtos`.`PRECO_DE_LISTA`) AS `MAIOR_PRECO`
    FROM
        `tabela_de_produtos`
    GROUP BY `tabela_de_produtos`.`EMBALAGEM`
*/

-- Consulta utilizando uma VIEW como se fosse uma outra coluna qualquer
SELECT A.NOME_DO_PRODUTO, A.EMBALAGEM, A.PRECO_DE_LISTA, X.MAIOR_PRECO
	FROM tabela_de_produtos A INNER JOIN VW_MAIORES_EMBALAGENS X
    ON A.EMBALAGEM = X.EMBALAGEM;
    

