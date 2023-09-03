-- Primeiro é necessário alimentar as tabelas com 'insert into [] values []' ou puxar de alguma tabela em nuvem
-- Não irei fazer o alimento da tabela, no momento

-- TODO: alimentar as tabelas

-- ##########################################

-- possíveis queries a serem feitas

-- Visualizar quantos Funcionários há e quantas Unidades da oficina há na cidade
select * from employee;
select * from storeUnit;

-- visualizar os Funcionários de acordo com faixas etárias pré-determinadas
select
	case
		when employeeAge between 18 and 24 then "jovem"
        when employeeAge between 25 and 40 then "maduro"
        when employeeAge <= 41 then "velho"
    end as faixaEtaria
from
	employee e
  ;  
  
-- visualizar quanto cada serviço é requisitado por cada tipo de veículo
select
    count(so.orderCategory) as qtdServicoPorCategoria,
    so.orderCategory,
    c.veiculeType as tipoVeiculo
from
	serviceOrders so
join
	clients c
on c.idClient = so.idOClient
;

-- Quais os serviços mais recorrentes em carros de passeio
select
    count(so.orderCategory) as qtdServicoPorCategoria,
    so.orderCategory
from
	serviceOrders so
join
	clients c
on c.idClient = so.idOClient having c.veiculeType = "Carro Passeio"
;

-- seleciona os funcionários cujos dependentes tenham mais de 10 anos
select
	idDEmployee
from
	employeeDependents ed
where
	dependentAge > 10