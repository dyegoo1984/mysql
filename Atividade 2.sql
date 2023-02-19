create database Construtora_Oliveira;
use Construtora_Oliveira;

create table Cargo (
	idCargo int not null auto_increment,
    cargo varchar(20) not null,
    remuneracao decimal (8,2) not null,
    primary key(idCargo)    
);
create table Funcionarios (
	idFuncionario int not null auto_increment,
    nomeFuncionario varchar(45) not null,
    cargoFuncionario int not null,
    enderecoFuncionario varchar(45) not null,
    telefoneFuncionario varchar(12) not null,
    cpfFuncionario varchar(11) not null,
    rgFuncionario varchar (15),
    primary key(idFuncionario),
    constraint fk_Funcionarios_Cargo_idx foreign key(cargoFuncionario) references Cargo (idCargo)    
);
create table Catalogo_Construcoes (
	idConstrucao int not null auto_increment,
	areaConstruida int not null,
	descricao varchar(140) not null,
	valorConstrucao decimal(8,2) not null,
	primary key(idConstrucao)
);
create table Clientes (
	idCliente int not null auto_increment,
    nomeCliente varchar(45) not null,
    cpfCliente varchar(11) not null,
    rgCliente varchar(15) not null,
    enderecoCliente varchar(45) not null,
    telefoneCliente varchar(12) not null,
    primary key(idCliente)
);
create table Vendas (
	idVenda int not null auto_increment,
    dataVenda date not null,
    comprador int not null,
    vendedor int not null,
    construcao int not null,
    enderecoConstrucao varchar(45) not null,
    primary key(idVenda),
    constraint fk_comprador_cliente_idx foreign key(comprador) references Clientes (idCliente),
    constraint fk_vendedor_funcionario_idx foreign key(vendedor) references Funcionarios (idFuncionario),
    constraint fk_construcao_catalogo_idx foreign key(construcao) references Catalogo_Construcoes (idConstrucao)    
);

/* Povoamento tabelas*/ 

insert into Cargo (cargo, remuneracao) values
	('Assistente de Vendas', '1450.00'),
    ('Vendedor', '1800.00'),
    ('Supervisor de Vendas', '2900.00'),
    ('Gerente Geral', '4500.00');    
select*from Cargo;
    
insert into Funcionarios (nomeFuncionario, cargoFuncionario, enderecoFuncionario, telefoneFuncionario, cpfFuncionario, rgFuncionario) values
	('Antonio Alberto Aciolli', 4, 'Rua das Acácias 450', '58-987456585', '74785236319', '98582563'),
    ('Bernadete Buarque Batista', 3, 'Avenida Beira Mar 1590', '59-987415256', '00236521485', '11225585'),
    ('Carlos Conceição', 2, 'Rua C 300', '58-32458565', '01475795985', '01253652'),
    ('Dolores Dangelo Duran', 2, 'Avenida Diogenes Duarte 2975', '57-32423545', '85896646532', '74859636'),
    ('Elias Ernandes Esteves', 1, 'Rua Edu Emanuel 20', '58-985024565', '00232525365', '10203052'),
    ('Fernanda Fagundes da Fontoura', 1, 'Rua Fabio Fernandes 985', '57-49303265', '00675712152', '44405265');
select*from Funcionarios;

insert into Catalogo_Construcoes (areaConstruida, descricao, valorConstrucao) values
	(48 , 'Casa em Madeira, 2 dormitórios, 1 sanitário, Sala e cozinha integrados, varanda', '68900.00'),
    (65, 'Casa em Madeira, 3 dormitórios, 1 Sanitario, Sala e cozinha integrados', '93300.00'),
    (78, 'Casa em Madeira, 3 dormitórios, 2 Sanitários, Sala e cozinha integrados, lavanderia', '111990.00'),
    (97, 'Casa em Madeira, 3 dormitórios, 2 Sanitários, Sala e cozinha integrados, lavanderia e garagem ', '139900.00'),
    ( 125, 'Sobrado em Madeira Nobre, 2 dormitórios, 2 sanitários, escritório, sala, cozinha, área gourmet e garagem', '198750.00'),
    ( 140, 'Sobrado em Madeira Nobre, 3 dormitórios, 2 Sanitários, sala e cozinha integrados, lavanderia, sacada e garagem', '222600.00'),
    ( 48, 'Casa em Alvenaria, 2 dormitórios, 1 sanitário, Sala e cozinha integrados, varanda', '91200.00'),
    ( 65, 'Casa em Alvenaria, 3 dormitórios, 1 Sanitario, Sala e cozinha integrados', '123500.00'),
    ( 97, 'Casa em Alvenaria, 3 dormitórios, 2 Sanitários, Sala e cozinha integrados, lavanderia e garagem ', '184300.00'),
    ( 125, 'Sobrado em Alvenaria, 2 dormitórios, 2 sanitários, escritório, sala, cozinha, área gourmet e garagem', '237500.00');
select*from Catalogo_Construcoes

insert into Clientes (nomeCliente, enderecoCliente, telefoneCliente, cpfCliente, rgCliente) values
		('Zilda Gomide Osório', 'Av Itacolomi 325', '65-32569584', '06598712364', '312465978'),
		('Armindo Moreira Azeredo', 'Rua dos Sabiás 498', '19-34842596', '98512469532', '658215'),
    	('Cármen Mata Camargo', 'Travessa de Prata 925', '54-32822002', '52103296502', '45859652'),
    	('César Sítima Faria', 'Rua São Luis 404', '85-985206545', '00152385009', '85779865'),
    	('Evandro Trindade Bouça', 'Rua das Camélias', '48-21148565', '95865232104', '52623252'),
    	('Ederson Gomes Carvalho',  'Av Ipiranga 3690/404', '51-985459002', '00440895865', '142565'),
    	('Carlos Gomes Lima', 'Rua Caravelas 130', '21-49008532', '74185296321', '1232654585'),
    	('Gabriel Tiburcio',  'Rua Ituporanga 500', '35-21142336', '45295247896', '78541236'),
    	('Thiago Gonçalves', 'Rua Valtoir Silva 650', '55-49605545', '03267916598', '01236526'),
    	('Roberto Alves Michelin', 'Avenida Por do sol 985', '11-999858525', '00789564512', '00145258'),
    	('Julia Silva Alves', 'Estrada Neopolis 7045', '42-34884987', '12423569885', '98653212'),
    	('Maria Andrade Souza', 'Rua Laçador 450', '82-32569865', '49175382585', '00235489'),
    	('Beatriz Oliveira Praxedes',  'Avenida Freitas e Cavalcante 165/902', '19-974142585', '00364891485', '74859632'),
    	('João Roberto Silva', 'Travesa Granville 784', '62-25368501', '00125852325', '77012255'),
    	('Luiza Moura', 'Rua Farroupilha 383', '51-20231225', '02485799831', '78986525');
	select*from Clientes;
    
    insert into Vendas (dataVenda, comprador, vendedor, construcao, enderecoConstrucao) values
		('2021-01-25', 1, 3, 1,'Rua da Prata 980'),
        ('2021-02-15', 2, 4, 2, 'Avenida das Araucárias 55'),
        ('2021-02-26', 3, 5, 3, 'Rua das Tainhas 322'),
        ('2021-03-08', 4, 6, 4, 'Rua Pereira Pinto 1020'),
        ('2021-03-18', 5, 3, 5, 'Avenida Almeira Maciel 2980'),
        ('2021-04-12', 6, 4, 6, 'Servidão dos Tambaquis 25'),
        ('2021-04-27', 7, 3, 7, 'Beco do Gonzaga 40'),
        ('2021-05-04', 8, 4, 8, 'Estrada Fazenda Palmonari S/N'),
        ('2021-05-23', 9, 5, 9, 'Avenida das Limeiras 870'),
        ('2021-06-12', 10, 3, 10, 'Rua Parobé 680'),
        ('2021-07-14', 11, 6, 4, 'Estrada Vale dos Lírios 7855'),
        ('2021-09-17', 12, 4, 7, 'Servidão do Estreito 66'),
        ('2021-10-20', 13, 3, 9, 'Travessa Folclore 210'),
        ('2021-11-03', 14, 4, 10, 'Rua Capitão Padilha 300'),
        ('2021-12-20', 15, 3, 3, 'Rua Romeu Borges 3252');
	select*from Vendas;
        


