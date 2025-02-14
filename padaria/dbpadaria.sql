-- apagando banco de dados se existir
drop database dbpadaria;
-- criando banco de dados
create database dbpadaria;
-- acessar o banco de dados
use dbpadaria;
--criando as tabelas no banco de dados
create table tbUsuarios(
codUsu int not null auto_increment,
nome varchar(50) not null,
senha varchar(12) not null,
primary key(codUsu)
);
create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(100),
email varchar(100),
telCel char(10),
dataNasc datetime,
salario decimal(9,2),
sexo char(1),
primary key(codFunc)
);
-- visualizando as tabelas
show tables;
-- visualizando a estrutura das tabelas
desc tbUsuarios;
desc tbFuncionarios;