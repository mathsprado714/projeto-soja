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

create table pacote(
	idPacote int primary key auto_increment,
    nomePacote varchar(45),
    descricao varchar(255),
    valorTotal decimal(10,2)
);

create table pacoteCliente(
	fkPacote int,
    fkCliente int,
    foreign key (fkPacote) references pacote(idPacote),
    foreign key (fkCliente) references cliente(idCliente),
    primary key (fkPacote, fkCliente)
);
##create table armazem(
##	idArmazem int primary key auto_increment,
##    logradouro varchar(45),
##    numero varchar(45),
##    bairro varchar(45),
##    cidade varchar(45),
##    estado varchar(45),
##    cep char(8),
##    fkClienteA int,
##    foreign key (fkClienteA) references cliente(idCliente)
##);



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
select*from armazem;
desc cliente;
select*from cliente;
desc funcionario; 
select*from funcionario;
desc galpaoSilo; 
select*from galpaoSilo;
desc orcamento;
select*from orcamento;
desc sensor;
show tables;
alter table cliente drop column cpfCnpj;

alter table cliente add column cnpj char(14) after senha;

insert into cliente (nome, email, senha, cnpj, telefone1,telefone2, logradouro, numero, complemento, bairro, cidade, estado, cep) values
	('Soares', 'soaresgonzalito@yahoo.com', 'senha123', '12345612345612', '123456987456', '123456789654', 'Rua da Imprensa', '2', null, 'Monte Castelo', 'cityone', 'GO', '12365478');

insert into cliente (nome, email, senha, cnpj, telefone1,telefone2, logradouro, numero, complemento, bairro, cidade, estado, cep) values
	('Soares2', 'soares2@yahoo.com', 'senha2', '13345612345612', '143456987456', '153456789654', 'Rua do jornalismo', '3', null, 'Itaim Bibi', 'citytwo', 'SP', '22365478'),
    ('Soares3', 'soares3@yahoo.com', 'senha3', '13345612345622', '143456987466', '153456789644', 'Rua do Publicitario', '4', null, 'Jardins', 'city3', 'BA', '22365488');

insert into armazem (logradouro, numero, bairro, cidade, estado, cep) values
	('Alameda dos Rins', '59', 'Vila Conceição', 'São Paulo', 'SP', '02221000');

insert into armazem (logradouro, numero, bairro, cidade, estado, cep) values
	('Jardim Alves', '104', 'Consolação', 'São Paulo', 'SP', '02222000');

insert into armazem (logradouro, numero, bairro, cidade, estado, cep) values
	('Estrada do Alvarenga', '1899', 'Guacuri', 'São Paulo', 'SP', '02221040');

insert into funcionario(nome, rg, setor) values
	('Kauã', '39771788', 'Desenvolvimento');

insert into funcionario(nome, rg, setor) values
	('Lucas', '39771789', 'Operador');

insert into funcionario(nome, rg, setor) values
	('Matheus', '59781789', 'Operador');

insert into galpaoSilo (alaArmazem, anosArmazenado) values
	('Leste', '3');

insert into galpaoSilo (alaArmazem, anosArmazenado) values
	('Sul', '5');

insert into galpaoSilo (alaArmazem, anosArmazenado) values
	('Oeste', '1');

show tables;
select * from armazem;
select * from cliente;
select * from funcionario;
select * from galpaosilo;
select * from orcamento;
select * from registro;
select * from sensor;

update armazem set fkClienteA = 1 where idArmazem = 1;
update armazem set fkClienteA = 3 where idArmazem = 2;
update armazem set fkClienteA = 2 where idArmazem = 3;

update funcionario set fkArmazemF = 1 where idFuncionario = 1; 
update funcionario set fkArmazemF = 3 where idFuncionario = 2;
update funcionario set fkArmazemF = 2 where idFuncionario = 3;

update galpaosilo set fkArmazemGS = 3 where idGalpaoSilo = 1;
update galpaosilo set fkArmazemGS = 1 where idGalpaoSilo = 2;
update galpaosilo set fkArmazemGS = 2 where idGalpaoSilo = 3;

update funcionario set fkSupervisor = null where idFuncionario = 1; 
update funcionario set fkSupervisor = 1 where idFuncionario = 2;
update funcionario set fkSupervisor = 1 where idFuncionario = 3;

-- Select 
select c.*,a.*,f.*
	from cliente c join armazem a
		on a.fkClienteA = c.idCliente
			join funcionario f
				on f.fkArmazemF = a.idArmazem; 

select c.nome,c.email,a.*,f.*
	from cliente c join armazem a
		on a.fkClienteA = c.idCliente
			join funcionario f
				on f.fkArmazemF = a.idArmazem
					where c.idCliente = 1;
                    
select c.*,a.*,f.*
	from cliente c join armazem a
		on a.fkClienteA = c.idCliente
			join funcionario f
				on f.fkArmazemF = a.idArmazem
					where c.idCliente = 1;
                    
                    
select f.nome, s.nome from funcionario f join funcionario s on f.idFuncionario = s.fkSupervisor;

select c.nome, c.cnpj, a.*, f.rg from cliente as c join armazem as a on a.fkClienteA = c.idCliente join funcionario as f on f.fkArmazemF = a.idArmazem;

select c.nome, a.bairro, f.setor from cliente as c join armazem as a on a.fkClienteA = c.idCliente join funcionario as f on f.fkArmazemF = a.idArmazem;