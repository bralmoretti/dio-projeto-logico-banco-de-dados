-- Criação do banco de dados para o cenário de oficina

create database oficina;
use oficina;

-- criar tabela de empregados na oficina
create table employee(
  idEmployee int auto_increment primary key,
  idEStore int,
  employeeName char(20) not null,
  employeeLast char(20) not null,
  contact char(11) not null,
  cpf char(11),
  nis char(20),
  employeeAge int default 18,
  employeeRole char(30),
  salaray float,
  vaBonus bool default True,
  vrBonus bool default True,
  vtBonus bool default False,
  dateContract date,
  constraint unique_cpf_employee unique (CPF),
  constraint unique_nis_employee unique (NIS),
  constraint fk_employee_storeunit foreign key (idEStore) references storeUnit(idStore)
  );
  
 
 -- criar tabela de dependentes de funcionários
 create table employeeDependents(
	idDependents int auto_increment primary key,
    idDEmployee int,
    dependentName char(20),
    dependentLast char(20),
    dependentAge int,
    cpf char(11),
    constraint unique_cpf_dependent unique (CPF),
    constraint fk_dependent_employee foreign key (idDEmployee) references employee(idEmployee)
 );
 
 -- criar tabela de Unidades/Lojas da oficina pela cidade
create table storeUnits(
	idStore int auto_increment primary key,
    contact char(11),
    storeLocation varchar(225) not null
);

-- criar tabela de clientes
create table clients(
	idClient int auto_increment primary key,
    clientName char(20),
    clientLast char(20),
    cpf char(11),
    contact char(11),
    clientVeicule enum("Carro Passeio", "Moto", "Caminhão") default "Carro Passeio",
    constraint unique_cpf_client unique (CPF)
);
    
-- criar tabela de solicitação de serviços
create table serviceOrders(
	idOrder int auto_increment primary key,
    idOClient int,
    idOStoreUnit int,
    orderCategory enum("Atendimento","Balanceamento/Alinhamento", "ArCondicionado", "Elétrica", "Pneus/Óleo"),
    initialDate date,
    finalDate date,
    constraint fk_order_client foreign key (idOClient) references clients(idClient),
    constraint fk_order_store foreign key (idOStoreUnit) references storeUnit(idStore)
);

-- criar tabela de pagamentos
create table payments(
	idPayment int auto_increment primary key,
    paymentType enum("Dinheiro", "Cartão Crédito", "Cartão Débito"),
    paymentParc bool default False,
    quantity bool default False
);

create table paymentOrders(
	idPOorders int,
    idPOstore int,
    idPOclient int,
    idPOpayment int,
    orderPrice float,
    orderPayment enum("Dinheiro", "Cartão Crédito", "Cartão Débito"),
    primary key(idPOorders, idPOstore, idPOclient, idPOpayment),
    constraint fk_po_orders foreign key (idPOorders) references serviceOrders(idOrder),
    constraint fk_po_store foreign key (idPOstore) references storeUnit(idStore),
    constraint fk_po_client foreign key (idPOclient) references clients(idClient),
    constraint fk_po_payment foreign key (idPOpayment) references payment(idPayment)
);
 
