-- apagando banco de dados se existir
drop database dbpadaria;
-- criando banco de dados
create database dbpadaria;

-- acessar o banco de dados
use dbpadaria;

/* Tabela gênero
create table tbGenero(
codGen int not null auto_increment,
nome varchar(100),
primary key(codGen)
);

--codGen int not null,

--foreign key(codGen) references tbGenero(codGen)
*/

--criando as tabelas no banco de dados
create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(100),
email varchar(100),
telCel char(10),
dataNasc datetime,
salario decimal(9,2) default 0 check (salario >= 0),
sexo char(1) default "?" check(sexo in("F","M")),
primary key(codFunc)
);

create table tbUsuarios(
codUsu int not null auto_increment,
nome varchar(50) not null,
senha varchar(12) not null,
codFunc int not null,
primary key(codUsu),
foreign key(codFunc) references tbFuncionarios(codFunc)
);


create table tbFornecedores(
codForn int not null auto_increment,
nome varchar(100),
email varchar(100),
telCel char(10),
primary key(codForn)
);


create table tbProdutos(
codProd int not null auto_increment,
descricao varchar(100),
quantidade int,
preco decimal(9,2),
dataVal datetime,
lote char(10),
codForn int not null,
primary key(codProd),
foreign key(codForn)references tbFornecedores(codForn)
);

create table tbClientes(
codCli int not null auto_increment,
nome varchar(100) not null,
cpf char(14) not null unique,
email varchar(100) unique,
primary key(codCli)
);

create table tbVendas(
codVend int not null auto_increment,
dataVend date,
horaVend time,
quanVend decimal(9,2) default 0 check (quanVend >=0),
valVend decimal(9,2) default 0 check (valVend >=0),
codProd int not null,
codUsu int not null,
codCli int not null,
primary key(codVend),
foreign key(codCli)references tbClientes(codCli),
foreign key(codUsu)references tbUsuarios(codUsu),
foreign key(codProd) references tbProdutos(codProd)
);

-- visualizando as tabelas
show tables;

-- visualizando a estrutura das tabelas
desc tbUsuarios;
desc tbFuncionarios;
--desc tbGenero;
desc tbFornecedores;
desc tbProdutos;

--inserindo registros nas tabelas

insert into tbClientes(nome,cpf,email) values('Davi Tures', '123.456.789-99', 'davitures@gmail.com');
insert into tbClientes(nome,cpf,email) values('Filippie Zass', '214.144.144-99', 'filippiezass@gmail.com');
insert into tbFornecedores(nome,email,telCel) values('Kappa Frutas','kappafrutas@tutamail.com','914916950');
insert into tbFornecedores(nome,email,telCel) values('Carlos Almeida','carlos.almeida@email.com','912356950');
insert into tbFuncionarios(nome,email,telCel,dataNasc,salario,sexo) values('Rodrigo Silva','rodrigos@proton.com','927471128','1995-03-22',1500.05,'M');
insert into tbFuncionarios(nome,email,telCel,dataNasc,salario,sexo) values('Fernanda Paes','fernandapaes@zoton.com','963171128','2004-03-22',2500.05,'F');
insert into tbUsuarios(nome,senha,codFunc) values('Rodrigo Silva','123456',1);
insert into tbUsuarios(nome,senha,codFunc) values('Fernanda Paes','123457',2);

--visualizando os registros nas tabelas

Select * from tbClientes;
Select * from tbFornecedores;
select * from tbFuncionarios;