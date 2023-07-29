-- Selecionando/consultando todos os dados da tabela
SELECT * FROM tbcliente;

-- Selecionando apenas algumas colunas dos dados da tabela
SELECT CPF, NOME, DATA_NASCIMENTO FROM tbcliente;

-- Limitando a quantidade de saída na consulta
SELECT CPF, NOME, DATA_NASCIMENTO FROM tbcliente LIMIT 5;

-- Consulta com alteração de nome das colunas na apresentação
SELECT CPF AS "Cadastro de Pessoa Física", NOME AS "Nome do Cliente" FROM tbcliente;

-- Filtrando as consultas com cláusula WHERE
SELECT * FROM tbprodutos WHERE PRODUTO = "544931";

-- Alterando a tabela com filtro usando cláusula WHERE
UPDATE tbproduto SET SABOR = "Cítricos" WHERE SABOR = "Limão";

-- Consulta com cláusulas WHERE utilizando >, < e <> (DIFERENTE)
SELECT * FROM tbcliente WHERE IDADE > 22; 
SELECT * FROM tbcliente WHERE IDADE < 22;
SELECT * FROM tbcliente WHERE IDADE <> 22;  

SELECT * FROM tbcliente WHERE NOME > 'Fernando Cavalcante';

-- Consulta com valores FLOAT
SELECT * FROM tbproduto WHERE PRECO_LISTA BETWEEN 16.007 AND 16.009;

-- Consulta com WHERE usando funções para datas
SELECT * FROM tbVendedores WHERE YEAR(DATA_ADMISSAO) >= 2016;

SELECT * FROM tbcliente WHERE DATA_NASCIMENTO > "1995-05-13";

-- Consulta com filtros compostos
SELECT * FROM tbproduto WHERE PRECO_LISTA >= 16.007 AND PRECO_LISTA <= 16.009;

SELECT * FROM tbcliente WHERE CIDADE = 'Rio de Janeiro' OR BAIRRO = 'Jardins';
