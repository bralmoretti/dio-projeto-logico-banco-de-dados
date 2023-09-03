-- Primeiro é necessário alimentar as tabelas com 'insert into [] values []' ou puxar de alguma tabela em nuvem
-- Não irei fazer o alimento da tabela, no momento

-- TODO: alimentar as tabelas

-- ##########################################

-- possíveis queries a serem feitas

-- pedidos finalizados
select
	count(idOrderClient) as pedidosFinalizados
from
	orders o 
left join
	delivery d
on 
	o.idOrderDelivery = d.idDelivery
where
	d.statusDelivery = "Entregue"
;

-- 15 produtos mais vendidos
select
	productName,
    count(idPOorder) as comprasProduto
from product p
left join productOrder po
on p.idProduct = po.idPOproduct
where
	poStatus = "Concluído"
order by 2 desc
limit 15
;

-- ver a tabela de fornecedores e vendedores
select * from supplier;
select * from seller;

-- na tabela produtos em estoque, visualizar produtos com mais de 10 quantidades no estoque
select
	*
from productStorageStatus having pssQuantity > 10
;

-- preço total de compras de produtos "Papelaria", sem frete
select
	idPOorder,
    po.poQuantity * p.price as priceTotal
from
	product p
inner join productOrder po
on	po.idPOproduct = p.idProduct
where p.category = "Papelaria"
