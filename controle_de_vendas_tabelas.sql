CREATE TABLE cliente (
    cpf character varying(11) NOT NULL,
    nome character varying(60) NOT NULL,
    endereco character varying(200) NOT NULL,
	PRIMARY KEY(cpf)
);

CREATE TABLE produto (	
    codigo character varying(13) NOT NULL,
    descricao character varying(60) NOT NULL,
    preco double precision NOT NULL,
	unidade character varying(25) NOT NULL,
	PRIMARY KEY(codigo)
);

CREATE TABLE venda (
	nota_fiscal character varying(44) NOT NULL,
	cliente_cpf character varying(11) REFERENCES cliente(cpf) ON DELETE CASCADE,
	valor_total double precision NOT NULL,
	desconto double precision NOT NULL,
	pagamento character varying(44) NOT NULL,
	data_da_venda date NOT NULL,
	PRIMARY KEY(nota_fiscal)
);

CREATE TABLE telefone_cliente (
	id serial PRIMARY KEY,
	cliente_cpf character varying(11) REFERENCES cliente(cpf) ON DELETE CASCADE,
	telefone character varying(11) NOT NULL,
	tipo character varying(25) NOT NULL
);

CREATE TABLE produto_venda (
	id serial PRIMARY KEY,
	cod_produto character varying(13) REFERENCES produto(codigo) ON DELETE CASCADE,
	nota_fiscal character varying(44) REFERENCES venda(nota_fiscal) ON DELETE CASCADE,
	quantidade int NOT NULL
);