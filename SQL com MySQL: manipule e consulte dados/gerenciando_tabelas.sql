-- Criando a tabela 'Clientes' no banco de dados 'SUCOS'
CREATE TABLE tbCliente(
	CPF VARCHAR(11),
    NOME VARCHAR(100),
    ENDERECO1 VARCHAR(150),
    ENDERECO2 VARCHAR(150),
    BAIRRO VARCHAR(50),
    CIDADE VARCHAR(50),
    ESTADO VARCHAR(50),
    CEP VARCHAR(8),
    IDADE SMALLINT,
    SEXO VARCHAR(1),
    LIMITE_CREDITO FLOAT,
    VOLUME_COMPRA FLOAT,
    PRIMEIRA_COMPRA BIT(1)
); 

-- Criando a tabela 'Vendedores' no banco de dados 'SUCOS'
CREATE TABLE tbVendedores(
	MATRICULA VARCHAR(5),
    NOME VARCHAR(100),
    PERCENTUAL_COMISSAO FLOAT
); 

-- Apagar a tabela tbClientes2
DROP TABLE tbCliente2;

