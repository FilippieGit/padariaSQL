-- apagando banco de dados se existir
drop database dbpadaria;
-- criando banco de dados
create database dbpadaria;

-- acessar o banco de dados
use dbpadaria;

create table tbGenero(
codGen int not null auto_increment,
nome varchar(100),
primary key(codGen)
);

--criando as tabelas no banco de dados
create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(100),
email varchar(100),
telCel char(10),
dataNasc datetime,
salario decimal(9,2) default 0 check (salario >= 0),
sexo char(1) default "?" check(sexo in("F","M")),
codGen int not null,
primary key(codFunc)
foreign key(codGen) references tbGenero(codFunc)
);

create table tbUsuarios(
codUsu int not null auto_increment,
nome varchar(50) not null,
senha varchar(12) not null,
codFunc int not null,
primary key(codUsu),
foreign key(codFunc) references tbFuncionarios(codFunc)
);

-- visualizando as tabelas
show tables;

-- visualizando a estrutura das tabelas
desc tbUsuarios;
desc tbFuncionarios;