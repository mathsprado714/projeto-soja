create database soja; 
use soja;

drop table users;

        
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

select u.nome as Unome, s.galpaoSilo
	as galpao, s.temperatura, s.umidade, s.situacao
		from users as u join sensores as s on u.idUser = s.fkUser;
        
