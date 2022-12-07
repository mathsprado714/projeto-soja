use soja;
drop table clienteOrcamento;
create database soja;

select truncate(count(q.dht11_temperatura) / t.total * 100,2) as perc from medida q , (select count(dht11_temperatura) as total from medida) t where dht11_temperatura = 15;
select truncate(count(q.dht11_temperatura) / (select count(dht11_temperatura) as total from medida) * 100,2) as perc from medida q where dht11_temperatura = 15;
select truncate(count(q.dht11_umidade) / t.total * 100,2) as 'percentual_ideal_umid' from medida q , (select count(dht11_umidade) as total from medida) t where dht11_umidade = 11;
insert into medida (dht11_umidade) values
(11),
(11),
(11),
(10),
(12),
(11);
select * from medida;
truncate table medida;
insert into medida (dht11_temperatura) values
(15),
(15),
(15),
(15),
(17);
select * from medida;
select * from clienteOrcamento;

insert into orcamento(valorTotal, descricao)value
	(230, '1 Sensor sem instalação inclusa'),
    (460, '2 Sensores sem instalação inclusa'),
    (null, 'Mais de 3 Sensores requerem um orçamento especial que tem que ser análisado.');
create table usuario(
	id int primary key auto_increment,nome varchar(45),email varchar(45),
	senha varchar(45),cpf char(14),telefone1 char(12),telefone2 char(12),
    logradouro varchar(45),numero varchar(45),complemento varchar(45),
    bairro varchar(45),cidade varchar(45),estado varchar(45),
    cep char(8)
);
CREATE TABLE aviso (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100),
	descricao VARCHAR(150),
	fk_usuario INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
);
create table armazem ( 
	id INT PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR(300),
    fkUsuario int,
    foreign key (fkUsuario) references usuario(id)
);
create table medida (
	id INT PRIMARY KEY AUTO_INCREMENT,
	dht11_umidade DECIMAL,
	dht11_temperatura DECIMAL,
	chave TINYINT,
	dataHoraReg DATETIME,
	fk_armazem INT,
	FOREIGN KEY (fk_armazem) REFERENCES armazem(id)
);
create table orcamento(
	idOrcamento int primary key auto_increment,
    valorTotal decimal(10,2),
    descricao varchar(255)
);
create table clienteOrcamento(
	fkCliente int,
    fkOrcamentoO int,
    foreign key (fkCliente) references usuario(id),
    foreign key (fkOrcamentoO) references orcamento(idOrcamento),
    primary key (fkCliente, fkOrcamentoO)    
);

select * from clienteOrcamento;
-- Tabelas no SQL Server


create table usuario(
	id int primary key IDENTITY(1,1),
	nome varchar(45),
    email varchar(45),
    senha varchar(45),
    cpf char(14),
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

CREATE TABLE aviso (
	id INT PRIMARY KEY IDENTITY(1,1),
	titulo VARCHAR(100),
	descricao VARCHAR(150),
	fk_usuario INT,
	FOREIGN KEY (fk_usuario) REFERENCES usuario(id)
);

create table armazem (
/* em nossa regra de negócio, um aquario tem apenas um sensor */
	id INT PRIMARY KEY IDENTITY(1,1),
	descricao VARCHAR(300)
);

insert into armazem (descricao)values
('Silo do cliente');
/* altere esta tabela de acordo com o que está em INSERT de sua API do arduino */

create table medida (
	id INT PRIMARY KEY IDENTITY(1,1),
	dht11_umidade DECIMAL,
	dht11_temperatura DECIMAL,
	luminosidade DECIMAL,
	lm35_temperatura DECIMAL,
	chave TINYINT,
	momento DATETIME,
	fk_armazem INT,
	FOREIGN KEY (fk_armazem) REFERENCES armazem(id)
);


insert into medida values
(null,20.0,15.0,0,0,0,'2022-01-01 20:00:00',1);	