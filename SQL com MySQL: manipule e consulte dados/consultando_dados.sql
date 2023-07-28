-- Selecionando/consultando todos os dados da tabela
SELECT * FROM tbcliente;

-- Selecionando apenas algumas colunas dos dados da tabela
SELECT CPF, NOME, DATA_NASCIMENTO FROM tbcliente;

-- Limitando a quantidade de saída na consulta
SELECT CPF, NOME, DATA_NASCIMENTO FROM tbcliente LIMIT 5;

-- Consulta com alteração de nome das colunas na apresentação
SELECT CPF AS "Cadastro de Pessoa Física", NOME AS "Nome do Cliente" FROM tbcliente;


