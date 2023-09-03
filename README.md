# Construindo um Projeto Lógico de Banco de Dados

Repositório do Desafio de Projeto referente ao módulo _Modelagem de Dados e Projetos Lógicos na Prática com SQL_, parte do bootcamp **Potência Tech powered by iFood | Ciência de Dados com Python**.

> 📌 O projeto está dividido em duas partes, em suas respectivas pastas: _Projeto Lógico E-commerce_ e _Projeto Lógico do Zero_.

<br>

## 🔍 Requisições das Consultas

Ambos projetos tinham estipulados como obrigatório nas consultas, as seguintes cláusulas:

- Recuperações simples com SELECT Statement
- Filtros com WHERE Statement
- Crie expressões para gerar atributos derivados
- Defina ordenações dos dados com ORDER BY
- Condições de filtros aos grupos – HAVING Statement
- Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados

<br>
---


## 📲 Projeto Lógico E-commerce

Nesta etapa do desafio, recriamos o **projeto lógico de e-commerce** apresentado, sendo necessário refinar o modelo para acrescentarmos os seguintes pontos:

- Os compradores (Client) poderiam ser PF ou PJ, mas não os dois ao mesmo tempo.
- Habilitar a possibilidade de ter mais de uma forma de pagamento (Boleto, Cartão de Débito, Cartão de Crédito - aqui na minha resolução)
- Adicionar a definição de Entrega, demonstrando o status da entrega (por pedido) e armazenando um código de rastreio de cada entrega.

As visualizações criadas foram:

- Visualizar a tabela de Fornecedores (Supplier) e a de Vendedores (Seller)
- Pedidos finalizados
- 15 produtos mais pedidos
- Produtos com quantia acima de 10 em estoque
- Preço final, sem frete, dos pedidos da categoria "Papelaria"

---

## 🛠 Projeto Lógico do Zero

Agora, nesta segunda parte, deveríamos por a mão-na-massa e criarmos sozinho (do zero) o projeto lógica e implementação para o cenário de uma **oficina**.

As visualizações criadas foram:

- Visualizar a tabela de Funcionários (Employee) e a de Unidades/Lojas da Oficina (StoreUnit)
- Visualizar segmentação dos Funcionários por faixa etária pré-determinada
- Visualizar quanto (em volume) cada serviço é requisitado por cada categoria de veículo
- Serviços mais recorrentes em Carros de Passeio
- Funcionários cujos depedentes tenham mais de 10 anos

> 📌 Interessante, posteriormente, acrescentar entrada para descrição de cada atendimento e feedback do cliente. Também, acrescentar tabela de controle de estoque de produtos (óleo, peças)