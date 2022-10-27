----------------------------------------------------------------------------------------------------------------------------------------------
-- Acessando o Banco de Dados 1 
--------------------------------------------------------------
use VendasBD_INFON
go

--------------------------------------------------------------
-- Uso da Linguagem de Manipulação de Dados - DML
--------------------------------------------------------------
-- Operação: insert
--------------------------------------------------------------

--------------------------------------------------------------
-- Inserir dados na TABELA Pessoas
--------------------------------------------------------------
insert into Pessoas
    (nome, cpf, status)
values
    ('Bruce Wane', '111.222.111-11', 1)
go

insert into Pessoas
    (nome, cpf)
values
    ('Batman', '222.222.111-22')
go

insert into Pessoas
values
    ('Alfred', '333.222.111-22', 2)
go

insert into Pessoas
    (nome, cpf, status)
values
    ('Clark Kent', '444.521.654-44', 2),
    ('Super Man', '555.251.691-55', 3),
    ('Tonny Stark', '666.231.654-66', 2),
    ('Iron Man', '777.987.210-77', 1)
go

insert into Pessoas
values
    ('Diana', '445.521.654-44', 2),
    ('Mulher Maravilha', '888.222.111-88', 3),
    ('Barry Allen', '999.214.658-99', 2),
    ('Flash', '101.010.000-10', 1)
go

select *
from Pessoas
go

--------------------------------------------------------------
-- Inserir dados na TABELA Clientes
--------------------------------------------------------------
insert into Clientes
    (pessoaId, renda, credito)
values
    (1, 1500.00, 450.00)
go

insert into Clientes
values
    (3, 4500.00, 1450.00)
go

insert into Clientes
    (pessoaId, renda, credito)
values
    (5, 2500.00, 600.00),
    (7, 3500.00, 750.00),
    (9, 1780.00, 634.00),
    (11, 8900.52, 1724.96)
go

select *
from Clientes
go

--------------------------------------------------------------
-- Inserir dados na TABELA Vendedores
--------------------------------------------------------------
insert into Vendedores
    (pessoaId, salario)
values
    (2, 1500.00)
go

insert into Vendedores
    (pessoaId, salario)
values
    (4, 4500.00),
    (6, 3600.00),
    (8, 1400.00),
    (10, 1800.00)
go

select *
from Vendedores
go

--------------------------------------------------------------
-- Inserir dados na TABELA Produtos
--------------------------------------------------------------
insert into Produtos
    (descricao, qtd, valor, status)
values
    ('Chocolate', 100, 8.50, 1)
go

insert into Produtos
    (descricao, qtd, valor, status)
values
    ('Sorvete de Creme', 20, 10.50, 1)
go

insert into Produtos
    (descricao, qtd, valor, status)
values
    ('Coca-Cola', 120, 5.50, 2),
    ('X-Burger', 5, 19.90, 1),
    ('Doce de Leite', 170, 4.50, 1),
    ('Bombom Branco', 200, 7.80, 2),
    ('Agua com gas', 75, 3.80, 2),
    ('Cerveja', 150, 7.99, 1),
    ('Macarrao', 25, 7.58, 2),
    ('Hot Dog', 50, 11.50, 1)
go

select *
from Produtos
go

--------------------------------------------------------------
-- Inserir dados na TABELA Pedidos
--------------------------------------------------------------
insert into Pedidos
    (data, status, vendedorId, clienteId)
values
    (getdate(), 1, 2, 1)
go

insert into Pedidos
    (data, status, vendedorId, clienteId)
values
    (getdate(), 1, 4, 1)
go

insert into Pedidos
    (data, status, vendedorId, clienteId)
values
    (getdate(), 3, 4, 3)
go

insert into Pedidos
    (data, status, vendedorId, clienteId)
values
    (getdate(), 1, 4, 11),
    (getdate(), 2, 6, 3),
    (getdate(), 2, 10, 3),
    (getdate(), 2, 6, 5),
    (getdate(), 1, 6, 7),
    (getdate(), 2, 10, 9),
    (getdate(), 3, 8, 11)
go

select *
from Pedidos
go

--------------------------------------------------------------
-- Inserir dados na TABELA Itens_Pedidos
--------------------------------------------------------------

-- Pedido 1
insert into Itens_Pedidos
    (pedidoId, produtoId, qtd, valor)
Values
    (1, 2, 10, 10.20),
    (1, 4, 100, 19.90),
    (1, 10, 50, 11.50)
go

-- Pedido 2
insert into Itens_Pedidos
    (pedidoId, produtoId, qtd, valor)
Values
    (2, 5, 25, 4.50),
    (2, 7, 150, 3.80),
    (2, 4, 250, 19.90),
    (2, 6, 15, 7.80)
go

-- Pedido 3
insert into Itens_Pedidos
    (pedidoId, produtoId, qtd, valor)
Values
    (3, 9, 15, 7.58)
go

-- Pedido 4
insert into Itens_Pedidos
    (pedidoId, produtoId, qtd, valor)
Values
    (4, 8, 1500, 7.99),
    (4, 10, 2, 11.50),
    (4, 1, 15, 8.50),
    (4, 3, 250, 5.50)
go

-- Pedido 5
insert into Itens_Pedidos
    (pedidoId, produtoId, qtd, valor)
Values
    (5, 3, 150, 5.50),
    (5, 9, 20, 7.58)
go


-- Pedido 6
insert into Itens_Pedidos
    (pedidoId, produtoId, qtd, valor)
Values
    (6, 6, 21, 7.80),
    (6, 7, 20, 3.80),
    (6, 8, 15, 7.50)
go

-- Pedido 7
insert into Itens_Pedidos
    (pedidoId, produtoId, qtd, valor)
Values
    (7, 6, 25, 7.80),
    (7, 2, 5, 10.50)
go

-- Pedido 8
insert into Itens_Pedidos
    (pedidoId, produtoId, qtd, valor)
Values
    (8, 9, 5, 7.58)
go

-- Pedido 9
insert into Itens_Pedidos
    (pedidoId, produtoId, qtd, valor)
Values
    (9, 10, 2, 11.50),
    (9, 1, 3, 8.50)
go

-- Pedido 10
insert into Itens_Pedidos
    (pedidoId, produtoId, qtd, valor)
Values
    (10, 10, 5, 11.30),
    (10, 9, 3, 7.58)
go

select *
from Itens_Pedidos
go
