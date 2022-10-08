create database soja; 
use soja;

drop table users;
drop table sensores;
        
create table users(
	idUser int primary key auto_increment,
    nome varchar(45),
    email varchar(60),
	constraint chk01email check (email not like '%[^a-z0-9@._-]%'),
	constraint chk02email check (email not like '%@%@%'),
	constraint chk03email check (email not like '%.@%'),
	constraint chk04email check (email not like '%. .%'),
	constraint chk05email check (email not like '%.'),
    dtNasc date,
    senha varchar(45),
    cpf char(11),
    cnpj char(14),
    tipoCredencial varchar(45),
    constraint chk01tipoCredencial check (tipoCredencial in('Técnico', 'Administrador','Cliente', 'Outros'))
)auto_increment=100;

insert into users(cpf, nome, email, tipoCredencial)value
	('12345678948','Carlos','carlos@chagas.com','Técnico'),
	('23548976458','Pedro','pedro@gamer.com','Outros'),
	('12546897123','Jonas','Jonas@pedreido.com','Outros'),
	('12221023545','Bruno','bruno@email.com','Administrador'),
	('12221023545','Bruno','bruno@email.com','Administrador'),
	('23423344345','Rodrigo','rodrigo@email.com','Cliente'),
	('34532233224','Suelen','suelen@email.com','Cliente'),
	('34523123433','Natan','natan@email.com','Cliente');      
    

create table sensores(
	idSensor int auto_increment primary key,
	galpaoSilo varchar(50),
	unidadeResponsavel varchar(50),
	temperatura decimal (10,2) ,
	umidade decimal(10,2),
	dtRegistro datetime,
	situacao varchar(50),
	constraint chkSituacao check(situacao in('ativo','inoperante','manutenção','ausente'))
)auto_increment = 100;
		

insert into sensores(galpaoSilo,unidadeResponsavel, temperatura, umidade, dtRegistro,situacao)values
	('100','A1',10.20,14.2,'2022-05-17 00:22:12','manutenção'),
	('101','A1',10.20,13.2,'2022-05-17 00:23:56','inoperante'),
	('102','A1',10.20,13.2,'2022-05-17 00:56:01','ativo'),
	('103','A1',10.20,13.2,'2022-05-17 00:56:01','ativo'),
	('104','A1',10.20,13.2,'2022-05-17 00:56:01','ativo'),
	('200','A2',10.20,13.2,'2022-05-17 00:56:01','ativo'),
	('201','A2',10.20,14.2,'2022-05-17 00:22:12','ativo'),
	('202','A2',10.20,14.2,'2022-05-17 00:22:12','ativo'),
	('203','A2',10.20,14.2,'2022-05-17 00:22:12','ativo'),
	('204','A2',10.20,14.2,'2022-05-17 00:22:12','ativo');
		
select * from users;
select * from sensores;
select nome, email, cpf, tipoCredencial from users;
select galpaoSilo, unidadeResponsavel, temperatura, umidade, situacao from sensores;
select * from users order by cpf;
select * from users order by cpf desc;
select * from sensores order by umidade;
select * from sensores order by umidade desc;
select * from users where nome like 'b%';
select * from users where nome like '%a%';
select * from users where nome like '%o';
select * from users where nome like '%a_';

alter table sensores add column fkUser int;
alter table sensores add foreign key (fkUser) references users(idUser);

select * from users;
select * from sensores;
update sensores set fkUser = 101 where idSensor = 102;
Update sensores set fkUser = 102 where idSensor = 101;
update sensores set fkUser = 107 where idSensor = 109;
update sensores set fkUser = 102 where idSensor = 106;
update sensores set fkUser = 103 where idSensor = 105;
update sensores set fkUser = 105 where idSensor = 104;
update sensores set fkUser = 104 where idSensor = 103;
update sensores set fkUser = 106 where idSensor = 107;
update sensores set fkUser = 107 where idSensor = 108;

select * from sensores join users
	on fkUsers = idUser;
    
select * from sensores left join users
	on fkUsers = idUser;
    
desc users;
desc sensores;
select*from users;



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
	idOrcamento int primary key auto_increment,
    valorTotal decimal(10,2),
    fkCliente int,
    foreign key (fkCliente) references cliente(idCliente)
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
	idSensor int primary key auto_increment,
    fkGalpaoSilo int,
    foreign key (fkGalpaoSilo) references galpaoSilo(idGalpaoSilo)
);

create table registro(
	idRegistro int primary key auto_increment,
    temperatura decimal(5,2),
    umidade decimal(4,2),
    dataHoraReg datetime,
    fkSensor int,
    fkGalpaoSiloR int,
    foreign key (fkSensor) references sensor(idSensor),
    foreign key (fkGalpaoSiloR) references galpaoSilo(idGalpaoSilo)
);

desc armazem;
desc cliente;
desc funcionario;
desc galpaoSilo;
desc orcamento;
desc;
desc sensor;

alter table cliente drop column cpfCnpj;

alter table cliente add column cnpj char(14) after senha;