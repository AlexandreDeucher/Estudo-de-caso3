create database loja_tenis;
use loja_tenis;

CREATE TABLE Cliente (
 cpf_cliente INT NOT NULL,
 nome_cliente VARCHAR(45) NOT NULL,
 telefone INT NOT NULL,
 PRIMARY KEY (cpf_cliente));

CREATE TABLE Endereco (
 cep INT NOT NULL AUTO_INCREMENT,
 bairro VARCHAR(45) NOT NULL,
 estado VARCHAR(45) NOT NULL,
 rua VARCHAR(45) NOT NULL,
 PRIMARY KEY (cep));

CREATE TABLE Cliente_endereco (
 Cliente_cpf_cliente INT NOT NULL,
 Endereco_cep INT NOT NULL,
 numero INT NOT NULL,
 complemento VARCHAR(200) NOT NULL,
 PRIMARY KEY (Cliente_cpf_cliente, Endereco_cep),
   FOREIGN KEY (Cliente_cpf_cliente)
   REFERENCES Cliente (cpf_cliente),
  
   FOREIGN KEY (Endereco_cep)
   REFERENCES Endereco (cep));

CREATE TABLE Compra (
 codigo INT NOT NULL AUTO_INCREMENT,
 valor INT NOT NULL,
 datas DATETime NOT NULL,
 cpf_cliente INT NOT NULL,
 PRIMARY KEY (codigo, cpf_cliente),
   FOREIGN KEY (cpf_cliente)
   REFERENCES Cliente (cpf_cliente));
 

CREATE TABLE Fornecedor (
 fornecedor_id INT NOT NULL AUTO_INCREMENT,
 itens_id INT NOT NULL,
 cnpj INT NOT NULL,
 numero_fornecedor INT NOT NULL,
 PRIMARY KEY (fornecedor_id));

CREATE TABLE Produto (
 modelo_id INT NOT NULL AUTO_INCREMENT,
 preco FLOAT NOT NULL,
 tamanho INT NOT NULL,
 marca VARCHAR(45) NOT NULL,
 Fornecedor_fornecedor_id INT NOT NULL,
 PRIMARY KEY (modelo_id, Fornecedor_fornecedor_id),
   FOREIGN KEY (Fornecedor_fornecedor_id)
   REFERENCES Fornecedor (fornecedor_id)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION);

CREATE TABLE Carrinho (
 Carrinho_codigo INT NOT NULL,
 Carrinho_Cliente_cpf_cliente INT NOT NULL,
 Produto_modelo_id INT NOT NULL,
 PRIMARY KEY (Carrinho_codigo, Carrinho_Cliente_cpf_cliente, Produto_modelo_id),
   FOREIGN KEY (Carrinho_codigo , Carrinho_Cliente_cpf_cliente)
   REFERENCES Compra (codigo , cpf_cliente)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
 CONSTRAINT fk_Carrinho_has_Produto_Produto1
   FOREIGN KEY (Produto_modelo_id)
   REFERENCES Produto (modelo_id)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION);
/* insert */

/* Cliente */
insert into Cliente (cpf_cliente, nome_cliente, telefone) values (344827, 'Amble Vokins', 299579);
insert into Cliente (cpf_cliente, nome_cliente, telefone) values (353887, 'Valeria Cardew', 795867);
insert into Cliente (cpf_cliente, nome_cliente, telefone) values (404137, 'Consolata Brinkman', 833629);
insert into Cliente (cpf_cliente, nome_cliente, telefone) values (491169, 'Bertha De Gouy', 825803);
insert into Cliente (cpf_cliente, nome_cliente, telefone) values (510014, 'Blakeley Codman', 740250);
insert into Cliente (cpf_cliente, nome_cliente, telefone) values (353817, 'Andrew Molesworth', 722872);
insert into Cliente (cpf_cliente, nome_cliente, telefone) values (353466, 'Zared Drewry', 483747);
insert into Cliente (cpf_cliente, nome_cliente, telefone) values (358566, 'Seymour Shanklin', 395958);
insert into Cliente (cpf_cliente, nome_cliente, telefone) values (564182, 'Alvy Mishaw', 360439);
insert into Cliente (cpf_cliente, nome_cliente, telefone) values (357349, 'Ciel Molyneaux', 228893);
/* Endereco */
insert into Endereco (cep, bairro, estado, rua) values (68084055, 'videira', 'Dingcheng', 'Shopko');
insert into Endereco (cep, bairro, estado, rua) values (59779433, 'solsticio', 'Al Majāridah', 'Nevada');
insert into Endereco (cep, bairro, estado, rua) values (609050000, 'receba', 'Long’an Chengxiangzhen', 'Pepper Wood');
insert into Endereco (cep, bairro, estado, rua) values (16590269, 'pokebola', 'Hưng Yên', 'Blue Bill Park');
insert into Endereco (cep, bairro, estado, rua) values (02687001, 'canarios', 'Liloy', 'Homewood');
insert into Endereco (cep, bairro, estado, rua) values (60565030, 'azuis', 'Santiago', 'Michigan');
insert into Endereco (cep, bairro, estado, rua) values (53174000, 'Aveiro', 'Quintas', 'Brown');
insert into Endereco (cep, bairro, estado, rua) values (11673444, 'Aquitaine', 'Arcachon', 'Grasskamp');
insert into Endereco (cep, bairro, estado, rua) values (21695528, 'ping', 'Pong', 'Chive');
insert into Endereco (cep, bairro, estado, rua) values (68828072, 'toma', 'Palampal', 'New Castle');
/* Cliente_endereco */
insert into Cliente_endereco (Cliente_cpf_cliente, Endereco_cep, numero, complemento) values (344827, 68084055, 59, 'Maroon');
insert into Cliente_endereco (Cliente_cpf_cliente, Endereco_cep, numero, complemento) values (353887, 59779433, 61, 'Fuscia');
insert into Cliente_endereco (Cliente_cpf_cliente, Endereco_cep, numero, complemento) values (404137, 609050000, 05, 'Puce');
insert into Cliente_endereco (Cliente_cpf_cliente, Endereco_cep, numero, complemento) values (491169, 16590269, 34, 'Aquamarine');
insert into Cliente_endereco (Cliente_cpf_cliente, Endereco_cep, numero, complemento) values (510014, 02687001, 47,  'Crimson');
insert into Cliente_endereco (Cliente_cpf_cliente, Endereco_cep, numero, complemento) values (353817, 60565030, 83, 'Teal');
insert into Cliente_endereco (Cliente_cpf_cliente, Endereco_cep, numero, complemento) values (353466, 53174000, 9, 'Fuscia');
insert into Cliente_endereco (Cliente_cpf_cliente, Endereco_cep, numero, complemento) values (358566, 11673444, 54, 'Red');
insert into Cliente_endereco (Cliente_cpf_cliente, Endereco_cep, numero, complemento) values (564182, 21695528, 42, 'Green');
insert into Cliente_endereco (Cliente_cpf_cliente, Endereco_cep, numero, complemento) values (357349, 68828072, 5,'Crimson');
/* Compra */
insert into Compra (codigo, valor, datas, cpf_cliente) values (1, 3.42, '2022-12-7', 344827);
insert into Compra (codigo, valor, datas, cpf_cliente) values (2, 0.76, '2022-11-16', 353887);
insert into Compra (codigo, valor, datas, cpf_cliente) values (3, 9.09, '2022-9-22', 404137);
insert into Compra (codigo, valor, datas, cpf_cliente) values (4, 3.09, '2022-12-14', 491169);
insert into Compra (codigo, valor, datas, cpf_cliente) values (5, 7.99, '2019-3-12', 510014);
insert into Compra (codigo, valor, datas, cpf_cliente) values (6, 6.49, '2018-11-9', 353817);
insert into Compra (codigo, valor, datas, cpf_cliente) values (7, 6.04, '2021-10-4', 353466);
insert into Compra (codigo, valor, datas, cpf_cliente) values (8, 0.99, '2022-5-10', 358566);
insert into Compra (codigo, valor, datas, cpf_cliente) values (9, 3.65, '2022-1-11', 564182);
insert into Compra (codigo, valor, datas, cpf_cliente) values (10, 9.32, '2017-5-6', 357349);
/* Fornecedor */
insert into Fornecedor (fornecedor_id, itens_id, cnpj, numero_fornecedor) values (1, 1, 136300, 514346);
insert into Fornecedor (fornecedor_id, itens_id, cnpj, numero_fornecedor) values (2, 2, 108121, 684479);
insert into Fornecedor (fornecedor_id, itens_id, cnpj, numero_fornecedor) values (3, 3, 415204, 421661);
insert into Fornecedor (fornecedor_id, itens_id, cnpj, numero_fornecedor) values (4, 4, 680840, 803134);
insert into Fornecedor (fornecedor_id, itens_id, cnpj, numero_fornecedor) values (5, 5, 372059, 635229);
insert into Fornecedor (fornecedor_id, itens_id, cnpj, numero_fornecedor) values (6, 6, 110847, 514432);
insert into Fornecedor (fornecedor_id, itens_id, cnpj, numero_fornecedor) values (7, 7, 242084, 922497);
insert into Fornecedor (fornecedor_id, itens_id, cnpj, numero_fornecedor) values (8, 8, 411905, 563409);
insert into Fornecedor (fornecedor_id, itens_id, cnpj, numero_fornecedor) values (9, 9, 017804, 829804);
insert into Fornecedor (fornecedor_id, itens_id, cnpj, numero_fornecedor) values (10, 10, 165932, 898371);
/* Produto */
insert into Produto (modelo_id, preco, tamanho, marca, Fornecedor_fornecedor_id) values (1, 4.24, 1, 'Centimia', 1);
insert into Produto (modelo_id, preco, tamanho, marca, Fornecedor_fornecedor_id) values (2, 6.46, 2, 'Yakidoo', 2);
insert into Produto (modelo_id, preco, tamanho, marca, Fornecedor_fornecedor_id) values (3, 8.81, 3, 'Realbridge', 3);
insert into Produto (modelo_id, preco, tamanho, marca, Fornecedor_fornecedor_id) values (4, 2.09, 4, 'Gigazoom', 4);
insert into Produto (modelo_id, preco, tamanho, marca, Fornecedor_fornecedor_id) values (5, 5.29, 5, 'Roombo', 5);
insert into Produto (modelo_id, preco, tamanho, marca, Fornecedor_fornecedor_id) values (6, 6.34, 6, 'Jaxnation', 6);
insert into Produto (modelo_id, preco, tamanho, marca, Fornecedor_fornecedor_id) values (7, 5.85, 7, 'Skaboo', 7);
insert into Produto (modelo_id, preco, tamanho, marca, Fornecedor_fornecedor_id) values (8, 5.02, 8, 'Topicstorm', 8);
insert into Produto (modelo_id, preco, tamanho, marca, Fornecedor_fornecedor_id) values (9, 9.14, 9, 'Jabbercube', 9);
insert into Produto (modelo_id, preco, tamanho, marca, Fornecedor_fornecedor_id) values (10, 1.93, 10, 'Trunyx', 10);
/* update */
 
update Cliente
SET nome_cliente='alexandre'
Where cpf_cliente=344827;
 
update Cliente
SET nome_cliente='vinicius'
Where cpf_cliente=404137;
 
update Cliente
SET nome_cliente='sofia'
Where cpf_cliente=564182;
 
update Cliente
SET nome_cliente='davi'
Where cpf_cliente=353887;
 
update Cliente
SET nome_cliente='bruna'
Where cpf_cliente=353817;
 
 
 
 
 
 
 
 
update Endereco
SET bairro='voadora'
Where cep=68828072;
 
update Endereco
SET bairro='tome'
Where cep=609050000;
 
update Endereco
SET bairro='wwwww'
Where cep=60565030;
 
update Endereco
SET bairro='represass'
Where cep=21695528;
 
update Endereco
SET bairro='queota'
Where cep=16590269;
 
 
 
 
 
 
 
update Compra
SET valor=3.2
Where codigo='3';
 
update Compra
SET valor=3.1
Where codigo='2';
 
update Compra
SET valor=4.9
Where codigo='1';
 
update Compra
SET valor=5.9
Where codigo='4';
 
update Compra
SET valor=4.1
Where codigo='7';
 
 
 
 
 
 
update Fornecedor
SET itens_id=1
Where fornecedor_id=10;
 
update Fornecedor
SET itens_id=15
Where fornecedor_id=9;
 
update Fornecedor
SET itens_id=16
Where fornecedor_id=2;
 
update Fornecedor
SET itens_id=12
Where fornecedor_id=3;
 
update Fornecedor
SET itens_id=11
Where fornecedor_id=1;
 
 
 
 
 
update Produto
SET tamanho=1
Where modelo_id=10;
 
update Produto
SET tamanho=2
Where modelo_id=4;
 
update Produto
SET tamanho=15
Where modelo_id=5;
 
update Produto
SET tamanho=33
Where modelo_id=3;
 
update Produto
SET tamanho=12
Where modelo_id=1;
 
 
/*DELETES*/
 
 
 
Delete from Cliente
Where nome_cliente='alexandre';

Delete from Cliente
Where nome_cliente='vinicius';
 
Delete from Cliente
Where nome_cliente='sofia';
 
Delete from Cliente
Where nome_cliente='davi';
 
Delete from Cliente
Where nome_cliente='bruna';
 
 
 
 
 
Delete from Endereco
Where bairro='voadora';
 
Delete from Endereco
Where bairro='tome';
 
Delete from Endereco
Where bairro='wwwww';
 
Delete from Endereco
Where bairro='represass';
 
Delete from Endereco
Where bairro='queota';
 
 
 
 
 
 
Delete from Compra
Where codigo='LPVZ';
 
Delete from Compra
Where codigo='ZZZZ';
 
Delete from Compra
Where codigo='TTTT';
 
Delete from Compra
Where codigo='BOLA';
 
Delete from Compra
Where codigo='POMB';
 
 
 
 
 
 
 
 
Delete from Fornecedor
Where fornecedor_id=1;
 
Delete from Fornecedor
Where fornecedor_id=10;
 
Delete from Fornecedor
Where fornecedor_id=3;
 
Delete from Fornecedor
Where fornecedor_id=5;
 
Delete from Fornecedor
Where fornecedor_id=9;
 
 
 
 
 
 
Delete from Produto
Where modelo_id=1;
 
Delete from Produto
Where modelo_id=10;
 
Delete from Produto
Where modelo_id=3;
 
Delete from Produto
Where modelo_id=5;
 
Delete from Produto
Where modelo_id=9;
 
 
 
 
/*SELECTS*/
 
 

Select * from Cliente order by cliente_cpf desc;
 
Select * from Endereco order by cep desc;
 
Select * from Compra order by codigo desc;
 
Select * from Fornecedor order by fornecedor_id desc;
 
Select * from Produto order by modelo_id desc;
 
Select * from Cliente Where cpf_cliente like 353466;
 
Select * from Endereco Where cep like 11673444;
 
Select * from Compra Where codigo like 2;
 
Select * from Fornecedor Where fornecedor_id like 3;
 
Select * from Produto Where modelo_id like 1;
 
 
 
 
 
 
/*Select com join*/

Select Compra.codigo,cliente.cpf_cliente from Compra inner JOIN Cliente on Compra.codigo=Cliente.cpf_cliente;




/*drop database loja_tenis;*/



 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

