-- Criação do banco de dados para o cenário de e-commerce

create database ecommerce;
use ecommerce;

-- criar tabela cliente
create table clients(
	idClient int auto_increment primary key,
    firstname varchar(20),
    lastname varchar(20),
    cpf char(11),
    cnpj char(15),
    address varchar(45),
    constraint unique_cpf_client unique (CPF),
    constraint unique_cnpj_client unique (CNPJ)
);

-- criar tabela entrega
create table delivery(
	idDelivery int,
    idClient int,
    statusDelivery enum("Pendente", "Entregue", "Enviado") default "Pendente",
    trackingCode char(20),
    primary key(idDelivery, idClient),
    constraint fk_delivery_client foreign key (idClient) references clients(idClient)
);


-- criar tabela produto
create table product(
	idProduct int auto_increment primary key,
    productName varchar(20) not null,
	productDescription varchar(45),
    category enum("Brinquedo", "Higiene&Beleza", "Alimentos", "Papelaria", "Outros") not null,
	rate float default 0,
    size varchar(10) -- dimensão do produto
);

-- criar tabela pedido
create table orders(
	idOrder int auto_increment primary key,
    idOrderClient int,
    idOrderPayment int,
    idOrderDelivery int,
    orderStatus enum("Em andamento", "A pagar", "Enviado", "Concluído", "Cancelado") default "Em Andamento",
    orderDescription varchar(225),
    sendTax float,
    paymentCash bool default false,
    constraint fk_orders_client foreign key (idOrderClient) references clients(idClient),
    constraint fk_orders_payment foreign key (idOrderPayment) references payment(idPayment),
    constraint fk_orders_delivery foreign key (idOrderDelivery) references delivery(idDelivery)
);

create table productOrder(
	idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum("Em andamento", "A pagar", "Enviado", "Concluído", "Cancelado") default "Em Andamento",
    primary key(idPOproduct, idPOorder),
    constraint fk_product_order foreign key (idPOproduct) references product(idProduct),
    constraint fk_product_product foreign key (idPOorder) references orders(idOrder)
);

-- criar tabela pagamento
create table payments(
	idPaymentClient int,
    idPayment int,
    typePayment enum("Boleto", "Cartão Débito", "Cartão Crédito") not null,
    primary key(idClient, idPayment),
    constraint fk_payment_client foreign key (idPaymentClient) references clients(idClient)
);

-- criar tabela fornecedor
create table supplier(
	idSupplier int auto_increment primary key,
    socialName varchar(225) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
    supplierLocation varchar(225),
    constraint unique_cnpj_supplier unique (CNPJ)
);

create table productSupplier(
	idPsupplier int,
    idProduct int,
    prodQuantity int default 1,
    primary key(idPsupplier, idProduct),
    constraint fk_product_supplier foreign key (idPsupplier) references supplier(idSupplier),
    constraint fk_product_product foreign key (idProduct) references product(idProduct)
);

-- criar tabela vendedor
create table seller(
	idSeller int auto_increment primary key,
    socialName varchar(225) not null,
    CNPJ char(15),
    cpf char(11),
    contact char(11) not null,
    sellerLocation varchar(225),
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
);

create table productSeller(
	idPseller int,
    idProduct int,
    prodQuantity int default 1,
    primary key(idPSeller, idProduct),
    constraint fk_product_seller foreign key (idPseller) references seller(idSeller),
    constraint fk_product_product foreign key (idProduct) references product(idProduct)
);


-- criar tabela estoque
create table productStorage(
	idProdStorage int auto_increment primary key,
    storageLocation varchar(225),
    quantity int default 0
);

create table productStorageStatus(
	idPSSproduct int,
    idPSSstorage int,
    pssQuantity int default 0,
    primary key(idPSSproduct, idPSSstorage),
    constraint fk_storage_product foreign key (idPSSproduct) references product(idProduct),
    constraint fk_storage_storage foreign key (idPSSstorage) references productStorage(idProdStorage)
);
