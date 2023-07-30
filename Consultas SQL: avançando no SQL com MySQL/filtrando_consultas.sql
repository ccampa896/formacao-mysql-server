-- Selecionando o banco de dados para realizar as consultas/manipulações
USE sucos_vendas;

-- Selecionando todos os registros de uma tabela
SELECT * FROM tabela_de_clientes;

-- Consultando apenas os atributos que queremos
SELECT CPF AS 'Cadastro de Pessoa Física', NOME AS 'Nome do Cliente' FROM tabela_de_clientes;

-- Consulta com filtros
SELECT * FROM tabela_de_produtos WHERE CODIGO_DO_PRODUTO = '1000889';

-- Consultas condicionais
SELECT * FROM tabela_de_produtos WHERE SABOR = 'Manga' OR TAMANHO = '470 ml';

SELECT * FROM tabela_de_produtos WHERE SABOR IN ('Laranja', 'Manga');

-- Consulta com cláusula/operador LIKE/%
SELECT * FROM tabela_de_clientes WHERE NOME LIKE '%de%';
