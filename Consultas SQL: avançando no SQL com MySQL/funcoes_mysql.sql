-- Retira os espaços em branco a esquerda do começo da string
SELECT LTRIM('     Olá!') AS RESULTADO;

-- Retira os espaços em branco a direita do final da string
SELECT RTRIM('Olá!     ') AS RESULTADO;

-- Retira os espaços em branco a esquerda e a direita começo da string
SELECT TRIM('     Olá!     ') AS RESULTADO;

-- Concatenação de strings
SELECT CONCAT('Olá,', ' ', 'bem-vindo ', 'ao curso de MySQL!') AS BEM_VINDO;

-- Retorna string em CAIXA ALTA
SELECT UPPER('olá, tudo bem?') AS BEM_VINDO;

-- Retorna partes, 'substrings' da string passada como parâmetro
SELECT SUBSTRING('OLÁ, TUDO BEM?', 6) AS RESULTADO;

SELECT SUBSTRING('OLÁ, TUDO BEM?', 6, 4) AS RESULTADO;

-- Utilização prática em um banco de dados
SELECT CONCAT(NOME, ' (', CPF, ')') AS RESULTADO FROM tabela_de_clientes;

-- Faça uma consulta listando o nome do cliente e o endereço completo (Com rua, bairro, cidade e estado).
SELECT NOME, CONCAT(ENDERECO_1, ', ', BAIRRO, ', ', CIDADE, ', ', ESTADO) AS ENDERECO_COMPLETO FROM tabela_de_clientes;

-- Retorna da data do dia atual no formato ano-mês-dia
SELECT CURDATE();

-- Retorna a hora atual do sistema
SELECT CURRENT_TIME();

-- Retorna a data e hora atual
SELECT CURRENT_TIMESTAMP();

-- Retorna o ano
SELECT YEAR(CURRENT_TIMESTAMP());

-- Retorna o mês
SELECT MONTH(CURRENT_TIMESTAMP());

-- Retorna o dia
SELECT DAY(CURRENT_TIMESTAMP());

-- Retorna qual dia da semana é
SELECT DAYNAME(CURRENT_TIMESTAMP());

-- Diferença entre datas
SELECT DATEDIFF(CURRENT_TIMESTAMP(), '2023-01-01') AS DIAS_ANO_ATUAL;

-- Subtração de tempos específicos
SELECT DATE_SUB(CURRENT_TIMESTAMP(), INTERVAL 10 DAY) AS RESULTADO;

-- Crie uma consulta que mostre o nome e a idade atual dos clientes
SELECT NOME, ROUND(DATEDIFF(CURDATE(), DATA_DE_NASCIMENTO) / 365, 0) AS IDADE_1, TIMESTAMPDIFF(YEAR, DATA_DE_NASCIMENTO, CURDATE()) AS IDADE_2 FROM tabela_de_clientes;

-- MySQL como calculadora
SELECT(23+((25-2)/2)*45) AS RESULTADO;

-- Arredondar para o próximo inteiro acima
SELECT CEILING(12.3333333) AS RESULTADO;

-- Arredondar de acordo com as casas decimais solicitadas
SELECT ROUND(12.3333333, 2) AS RESULTADO;

-- Arredondar para o próximo inteiro abaixo
SELECT FLOOR(12.7777777) AS RESULTADO;

-- Número aleatório entre 0 e 1
SELECT RAND() AS RESULTADO;

-- Na tabela de notas fiscais temos o valor do imposto. Já na tabela de itens temos a quantidade e o faturamento. Calcule o valor do imposto pago no ano de 2016 arredondando para o menor inteiro.
SELECT YEAR(DATA_VENDA), FLOOR(SUM(IMPOSTO * (QUANTIDADE * PRECO))) 
FROM notas_fiscais NF
INNER JOIN itens_notas_fiscais INF ON NF.NUMERO = INF.NUMERO
WHERE YEAR(DATA_VENDA) = 2016
GROUP BY YEAR(DATA_VENDA);

SELECT CURRENT_TIMESTAMP() AS RESULTADO;

-- Conversão implítica de data para string
SELECT CONCAT('A hora agora é ', CURRENT_TIMESTAMP()) AS RESULTADO;

-- Utilizando o DATE_FORMAT e seus parâmetros
SELECT CONCAT('O dia de hoje é ',
	DATE_FORMAT(CURRENT_TIMESTAMP(), '%W, %d/%m/%y - %U semana do ano')) AS RESULTADO;
	
-- Conversão de tipos de dados
SELECT CONVERT(23.3, CHAR) AS RESULTADO;

/*
Queremos construir um SQL cujo resultado seja, para cada cliente:

“O cliente João da Silva faturou 120000 no ano de 2016”.

Somente para o ano de 2016.
*/
SELECT CONCAT('O cliente ', AUX.NOME_CLIENTE, ' faturou ', AUX.FATURAMENTO, ' no ano de ', AUX.ANO) FROM
	(SELECT TC.NOME AS NOME_CLIENTE, ROUND(SUM(INF.QUANTIDADE * INF.PRECO)) AS FATURAMENTO, YEAR(NF.DATA_VENDA) AS ANO 
		FROM itens_notas_fiscais INF
		INNER JOIN notas_fiscais NF
		ON INF.NUMERO = NF.NUMERO
		INNER JOIN tabela_de_clientes TC
		ON TC.CPF = NF.CPF
		WHERE YEAR(NF.DATA_VENDA) = 2016
		GROUP BY TC.NOME, YEAR(NF.DATA_VENDA)) AS AUX;

