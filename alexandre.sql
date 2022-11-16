CREATE DATABASE loja_tenis;

		CREATE TABLE cliente(
        cpf_cliente int NOT NULL PRIMARY KEY,
        nome_cliente VARCHAR(45) NOT NULL,
        telefone int NOT NULL
        );
        
        CREATE TABLE compra(
        codigo int primary key not null auto_increment,
        valor float not null,
        datas date not null,
        cpf_cliente int not null,
        FOREIGN key (cpf_cliente) references cliente(cpf_cliente) 
        );
        
        CREATE TABLE endereco(
        cep int primary key not null auto_increment,
        bairro varchar(45) not null,
        estado varchar(45) not null,
		rua varchar(45) not null
        );
        
        create table produto(
        modelo_id int primary key auto_increment not null,
        preco float not null,
        marca varchar(45) not null,
        tamanho int(2) not null,
        fornecedor_fornecedor_id int primary key not null
        );
        
        create table fornecedor(
		fornecedor_id int primary key not null auto_increment,
        itens_id int not null,
        cnpj int not null,
        numero_fornecedor int not null
        );
        
        create table carrinho(
        carrinho_codigo int not null,
        FOREIGN key (codigo) references compra(codigo),
        carrinho_cliente_cpf_cliente int not null, 
        produto_modelo_id int not null,
        FOREIGN key (cpf_cliente) references cliente(cpf_cliente),
        FOREIGN key (modelo_id) references produto(modelo_id) 
        );
        
        create table cliente_endereco(
        cliente_cpf_cliente int not null,     
        endereco_cep int not null,       
        numero int not null ,
        complemento varchar(200),
        FOREIGN key (cpf_cliente) references cliente(cpf_cliente),
		FOREIGN key (cep) references endereco(cep)
        );
        
        
        
        
        
        
