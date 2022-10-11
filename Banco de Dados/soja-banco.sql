create database soja; 
use soja;
show tables;

create table cliente(
	idCliente int primary key auto_increment,
	nome varchar(45),
    email varchar(45),
    senha varchar(45),
    cpfCnpj char(14),
    telefone1 char(12),
    telefone2 char(12),
    logradouro varchar(45),
    numero varchar(45),
    complemento varchar(45),
    bairro varchar(45),
    cidade varchar(45),
    estado varchar(45),
    cep char(8)
);

create table orcamento(
	idOrcamento int auto_increment,
    valorTotal decimal(10,2),
    fkCliente int,
    foreign key (fkCliente) references cliente(idCliente),
    primary key (idOrcamento, fkCliente)
);

create table armazem(
	idArmazem int primary key auto_increment,
    logradouro varchar(45),
    numero varchar(45),
    bairro varchar(45),
    cidade varchar(45),
    estado varchar(45),
    cep char(8),
    fkClienteA int,
    foreign key (fkClienteA) references cliente(idCliente)
);


create table funcionario(
	idFuncionario int primary key auto_increment,
    nome varchar(45),
    rg char(8),
    setor varchar(45),
    fkArmazemF int,
    fkSupervisor int,
    foreign key (fkArmazemF) references armazem(idArmazem),
    foreign key (fkSupervisor) references funcionario(idFuncionario)
);

create table galpaoSilo(
	idGalpaoSilo int primary key auto_increment,
    alaArmazem varchar(45),
    anosArmazenado int,
    fkArmazemGS int,
    foreign key (fkArmazemGS) references armazem(idArmazem)
);

create table sensor(
	idSensor int auto_increment,
    fkGalpaoSilo int,
    foreign key (fkGalpaoSilo) references galpaoSilo(idGalpaoSilo),
    primary key (idSensor, fkGalpaoSilo)
);

create table registro(
	idRegistro int auto_increment,
    temperatura decimal(5,2),
    umidade decimal(4,2),
    dataHoraReg datetime,
    fkSensor int,
    fkGalpaoSiloR int,
    foreign key (fkSensor) references sensor(idSensor),
    foreign key (fkGalpaoSiloR) references galpaoSilo(idGalpaoSilo),
    primary key (idRegistro, fkSensor)
);

desc armazem;
desc cliente;
desc funcionario;
desc galpaoSilo;
desc orcamento;
desc sensor;
show tables;
alter table cliente drop column cpfCnpj;

alter table cliente add column cnpj char(14) after senha;
drop database soja;