CREATE database loja_tenis;
use loja_tenis;

CREATE TABLE Cliente (
 cpf_cliente INT NOT NULL,
 nome_cliente VARCHAR(45) NOT NULL,
 telefone INT NOT NULL,
 PRIMARY KEY (cpf_cliente);

CREATE TABLE Endereco (
 cep INT NOT NULL AUTO_INCREMENT,
 bairro VARCHAR(45) NOT NULL,
 estado VARCHAR(45) NOT NULL,
 rua VARCHAR(45) NOT NULL,
 PRIMARY KEY (cep);

CREATE TABLE Cliente_endereco (
 Cliente_cpf_cliente INT NOT NULL,
 Endereco_cep INT NOT NULL,
 numero INT NOT NULL,
 complemento VARCHAR(200) NOT NULL,
 PRIMARY KEY (Cliente_cpf_cliente, Endereco_cep),
   FOREIGN KEY (Cliente_cpf_cliente)
   REFERENCES Cliente (cpf_cliente)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
   FOREIGN KEY (Endereco_cep)
   REFERENCES Endereco (cep)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION);

CREATE TABLE Compra (
 codigo INT NOT NULL AUTO_INCREMENT,
 valor INT NOT NULL,
 datas DATE NOT NULL,
 cpf_cliente INT NOT NULL,
 PRIMARY KEY (codigo, cpf_cliente),
   FOREIGN KEY (cpf_cliente)
   REFERENCES Cliente (cpf_cliente)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION);

CREATE TABLE Fornecedor (
 fornecedor_id INT NOT NULL AUTO_INCREMENT,
 itens_id INT NOT NULL,
 cnpj INT NOT NULL,
 numero_fornecedor INT NOT NULL,
 PRIMARY KEY (fornecedor_id);

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
insert into Cliente (cpf_cliente, nome_cliente, telefone) values ('344827213666887', 'Amble Vokins', '299_579_7147');
insert into Cliente (cpf_cliente, nome_cliente, telefone) values ('3538878428458248', 'Valeria Cardew', '795_867_1618');
insert into Cliente (cpf_cliente, nome_cliente, telefone) values ('4041371535630733', 'Consolata Brinkman', '833_629_3507');
insert into Cliente (cpf_cliente, nome_cliente, telefone) values ('4911693408744854', 'Bertha De Gouy', '825_803_1966');
insert into Cliente (cpf_cliente, nome_cliente, telefone) values ('5100140586825707', 'Blakeley Codman', '740_250_7210');
insert into Cliente (cpf_cliente, nome_cliente, telefone) values ('3538178192996659', 'Andrew Molesworth', '722_872_5269');
insert into Cliente (cpf_cliente, nome_cliente, telefone) values ('3534668292679100', 'Zared Drewry', '483_747_3342');
insert into Cliente (cpf_cliente, nome_cliente, telefone) values ('3585664491379376', 'Seymour Shanklin', '395_958_6841');
insert into Cliente (cpf_cliente, nome_cliente, telefone) values ('5641820946277857', 'Alvy Mishaw', '360_439_8790');
insert into Cliente (cpf_cliente, nome_cliente, telefone) values ('3573490519306660', 'Ciel Molyneaux', '228_893_6851');
/* Endereco */
insert into Endereco (cep, bairro, estado, rua) values ('68084_055', null, 'Dingcheng', 'Shopko');
insert into Endereco (cep, bairro, estado, rua) values ('59779_433', null, 'Al Majāridah', 'Nevada');
insert into Endereco (cep, bairro, estado, rua) values ('60905_0000', null, 'Long’an Chengxiangzhen', 'Pepper Wood');
insert into Endereco (cep, bairro, estado, rua) values ('16590_269', null, 'Hưng Yên', 'Blue Bill Park');
insert into Endereco (cep, bairro, estado, rua) values ('0268_7001', null, 'Liloy', 'Homewood');
insert into Endereco (cep, bairro, estado, rua) values ('60565_030', null, 'Santiago', 'Michigan');
insert into Endereco (cep, bairro, estado, rua) values ('53174_000', 'Aveiro', 'Quintas', 'Brown');
insert into Endereco (cep, bairro, estado, rua) values ('11673_444', 'Aquitaine', 'Arcachon', 'Grasskamp');
insert into Endereco (cep, bairro, estado, rua) values ('21695_528', null, 'Pong', 'Chive');
insert into Endereco (cep, bairro, estado, rua) values ('68828_072', null, 'Palampal', 'New Castle');
/* Cliente_endereco */
insert into Cliente_endereco (numero, complemento) values ('59244', 'Maroon');
insert into Cliente_endereco (numero, complemento) values ('61', 'Fuscia');
insert into Cliente_endereco (numero, complemento) values ('054', 'Puce');
insert into Cliente_endereco (numero, complemento) values ('34515', 'Aquamarine');
insert into Cliente_endereco (numero, complemento) values ('47068', 'Crimson');
insert into Cliente_endereco (numero, complemento) values ('83269', 'Teal');
insert into Cliente_endereco (numero, complemento) values ('9', 'Fuscia');
insert into Cliente_endereco (numero, complemento) values ('54960', 'Red');
insert into Cliente_endereco (numero, complemento) values ('42705', 'Green');
insert into Cliente_endereco (numero, complemento) values ('5', 'Crimson');
/* Compra */
insert into Compra (codigo, valor, datas) values ('OAZI', '$3.42', '7/11/2022');
insert into Compra (codigo, valor, datas) values ('VNBL', '$0.76', '11/16/2022');
insert into Compra (codigo, valor, datas) values ('SBEG', '$9.09', '9/22/2022');
insert into Compra (codigo, valor, datas) values ('KDXR', '$3.09', '12/16/2021');
insert into Compra (codigo, valor, datas) values ('KBVY', '$7.99', '3/25/2022');
insert into Compra (codigo, valor, datas) values ('CYXQ', '$6.49', '11/1/2022');
insert into Compra (codigo, valor, datas) values ('BIVO', '$6.04', '2/16/2022');
insert into Compra (codigo, valor, datas) values ('SNVB', '$0.99', '4/23/2022');
insert into Compra (codigo, valor, datas) values ('ZGHC', '$3.65', '5/5/2022');
insert into Compra (codigo, valor, datas) values ('LPVZ', '$9.32', '11/5/2022');
/* Fornecedor */
insert into Fornecedor (fornecedor_id, itens_id, cnpj, numero_fornecedor) values (1, 1, '13630_0028', '514_346_9664');
insert into Fornecedor (fornecedor_id, itens_id, cnpj, numero_fornecedor) values (2, 2, '10812_101', '684_479_7102');
insert into Fornecedor (fornecedor_id, itens_id, cnpj, numero_fornecedor) values (3, 3, '41520_419', '421_661_6452');
insert into Fornecedor (fornecedor_id, itens_id, cnpj, numero_fornecedor) values (4, 4, '68084_079', '803_134_5903');
insert into Fornecedor (fornecedor_id, itens_id, cnpj, numero_fornecedor) values (5, 5, '37205_959', '635_229_0926');
insert into Fornecedor (fornecedor_id, itens_id, cnpj, numero_fornecedor) values (6, 6, '11084_701', '514_432_4939');
insert into Fornecedor (fornecedor_id, itens_id, cnpj, numero_fornecedor) values (7, 7, '24208_463', '922_497_6506');
insert into Fornecedor (fornecedor_id, itens_id, cnpj, numero_fornecedor) values (8, 8, '41190_544', '563_409_9440');
insert into Fornecedor (fornecedor_id, itens_id, cnpj, numero_fornecedor) values (9, 9, '0178_0490', '829_804_4018');
insert into Fornecedor (fornecedor_id, itens_id, cnpj, numero_fornecedor) values (10, 10, '16590_177', '898_371_8164');
/* Produto */
insert into Produto (modelo_id, preco, tamanho, marca) values (1, '$4.24', 1, 'Centimia');
insert into Produto (modelo_id, preco, tamanho, marca) values (2, '$6.46', 2, 'Yakidoo');
insert into Produto (modelo_id, preco, tamanho, marca) values (3, '$8.81', 3, 'Realbridge');
insert into Produto (modelo_id, preco, tamanho, marca) values (4, '$2.09', 4, 'Gigazoom');
insert into Produto (modelo_id, preco, tamanho, marca) values (5, '$5.29', 5, 'Roombo');
insert into Produto (modelo_id, preco, tamanho, marca) values (6, '$6.34', 6, 'Jaxnation');
insert into Produto (modelo_id, preco, tamanho, marca) values (7, '$5.85', 7, 'Skaboo');
insert into Produto (modelo_id, preco, tamanho, marca) values (8, '$5.02', 8, 'Topicstorm');
insert into Produto (modelo_id, preco, tamanho, marca) values (9, '$9.14', 9, 'Jabbercube');
insert into Produto (modelo_id, preco, tamanho, marca) values (10, '$1.93', 10, 'Trunyx');
/* update */
 
update Cliente
SET cpf_cliente='3573490519306660'
Where cpf_cliente like '344827213666887';
 
update Cliente
SET cpf_cliente='3573490213306660'
Where cpf_cliente like '4041371535630733';
 
update Cliente
SET cpf_cliente='3573490111106660'
Where cpf_cliente like '5641820946277857';
 
update Cliente
SET cpf_cliente='3573491111116660'
Where cpf_cliente like '3538878428458248';
 
update Cliente
SET cpf_cliente='3573490519311110'
Where cpf_cliente like '3538178192996659';
 
 
 
 
 
 
 
 
update Endereco
SET cep='68084_055'
Where cep like '68828_072';
 
update Endereco
SET cep='68084_033'
Where cep like '60905_0000';
 
update Endereco
SET cep='68084_022'
Where cep like '60565_030';
 
update Endereco
SET cep='68084_111'
Where cep like '21695_528';
 
update Endereco
SET cep='68084_222'
Where cep like '16590_269';
 
 
 
 
 
 
 
update Compra
SET codigo='LPVZ'
Where codigo like 'OAZI';
 
update Compra
SET codigo='ZZZZ'
Where codigo like 'SNVB';
 
update Compra
SET codigo='TTTT'
Where codigo like 'BIVO';
 
update Compra
SET codigo='BOLA'
Where codigo like 'ZGHC';
 
update Compra
SET codigo='POMB'
Where codigo like 'KBVY';
 
 
 
 
 
 
update Fornecedor
SET fornecedor_id=1
Where fornecedor_id like 10;
 
update Fornecedor
SET fornecedor_id=15
Where fornecedor_id like 9;
 
update Fornecedor
SET fornecedor_id=3
Where fornecedor_id like 2;
 
update Fornecedor
SET fornecedor_id=4
Where fornecedor_id like 3;
 
update Fornecedor
SET fornecedor_id=10
Where fornecedor_id like 1;
 
 
 
 
 
update Produto
SET modelo_id=1
Where modelo_id like 10;
 
update Produto
SET modelo_id=3
Where modelo_id like 4;
 
update Produto
SET modelo_id=2
Where modelo_id like 5;
 
update Produto
SET modelo_id=10
Where modelo_id like 3;
 
update Produto
SET modelo_id=16
Where modelo_id like 1;
 
 
/*DELETES*/
 
 
 
Delete from Cliente
Where cpf_cliente like '3573490519306660';
 
Delete from Cliente
Where cpf_cliente like '3573490111106660';
 
Delete from Cliente
Where cpf_cliente like '3573491111116660';
 
Delete from Cliente
Where cpf_cliente like '3573490519311110';
 
Delete from Cliente
Where cpf_cliente like '3573490213306660';
 
 
 
 
 
Delete from Endereco
Where cep like '68084_055';
 
Delete from Endereco
Where cep like '68084_033';
 
Delete from Endereco
Where cep like '68084_111';
 
Delete from Endereco
Where cep like '68084_022';
 
Delete from Endereco
Where cep like '68084_222';
 
 
 
 
 
 
Delete from Compra
Where codigo like 'LPVZ';
 
Delete from Compra
Where codigo like 'ZZZZ';
 
Delete from Compra
Where codigo like 'TTTT';
 
Delete from Compra
Where codigo like 'BOLA';
 
Delete from Compra
Where codigo like 'POMB';
 
 
 
 
 
 
 
 
Delete from Fornecedor
Where fornecedor_id like 1;
 
Delete from Fornecedor
Where fornecedor_id like 10;
 
Delete from Fornecedor
Where fornecedor_id like 3;
 
Delete from Fornecedor
Where fornecedor_id like 5;
 
Delete from Fornecedor
Where fornecedor_id like 9;
 
 
 
 
 
 
Delete from Produto
Where modelo_id like 1;
 
Delete from Produto
Where modelo_id like 10;
 
Delete from Produto
Where modelo_id like 3;
 
Delete from Produto
Where modelo_id like 5;
 
Delete from Produto
Where modelo_id like 9;
 
 
 
 
/*SELECTS*/
 
 
 
Select * from Cliente order by desc;
 
Select * from Endereco order by desc;
 
Select * from Cliente_endereco order by desc;
 
Select * from Compra order by desc;
 
Select * from Fornecedor order by desc;
 
Select * from Produto order by desc;
 
Select * from Carrinho order by desc;
 
 
 
 
Select * from Cliente Where cpf_cliente like '3534668292679100';
 
Select * from Endereco Where cep like '11673_444';
 
Select * from Compra Where codigo like 2;
 
Select * from Fornecedor Where fornecedor_id like 3;
 
Select * from Produto Where modelo_id like 1;
 
 
 
 
 
 
/*Select com join*/




 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

