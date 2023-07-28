-- Inserindo um registro na tabela 'Produtos'
INSERT INTO tbProdutos (
	PRODUTO, NOME, EMBALAGEM, TAMANHO, SABOR, PRECO_LISTA
) VALUES (
	"1040107", "Light - 350 ml - Melância", "Lata", "350 ml", "Melância", 4.56
);

-- Inserindo um registro na tabela 'Vendedores'
INSERT INTO tbVendedores VALUES(
	"00233", "João Geraldo da Fonseca", 0.1
);

-- Inserindo mais de um registro com o mesmo comando
INSERT INTO tbVendedores VALUES
("00235", "Márcio Almeida Silva", 0.08),
("00236", "Cláudia Morais", 0.08);

-- Atualizando dados da tabela 'Produtos'
UPDATE tbProdutos SET EMBALAGEM = "Lata", PRECO_LISTA = 2.46
	WHERE PRODUTO = "544931";
	
-- Deletando registro específico de determinada tabela
DELETE FROM tbProdutos WHERE PRODUTO = "1078680";

-- Alterando uma tabela, adicionando uma chave primária
ALTER TABLE tbProdutos ADD PRIMARY KEY (PRODUTO);

-- Adicionando nova coluna em tabela já existente
ALTER TABLE tbCliente ADD COLUMN (DATA_NASCIMENTO DATE);

-- Criando tabela com chave primária e adicionando alguns registros
CREATE TABLE tbVendedores(
	MATRICULA VARCHAR(5) PRIMARY KEY,
    NOME VARCHAR(100),
    PERCENTUAL_COMISSAO FLOAT,
    DATA_ADMISSAO DATE,
    DE_FERIAS BIT(1)
);

INSERT INTO tbVendedores VALUES 
	("00235", "Márcio Almeira Silva", 0.08, "2014-08-15", 0),
    ("00236", "Cláudia Morais", 0.08, "2013-09-17", 1),
    ("00237", "Roberta Martins", 0.11, "2017-03-18", 1),
    ("00238", "Péricles Alves", 0.11, "2016-08-21", 0);
    

