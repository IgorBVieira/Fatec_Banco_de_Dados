--Procedures teste
--usar banco
use VendasBD_INFON
go

------------------------------------------------------------------------------
-- Criar uma stored procedure para cadastrar novos produtos na tabela produtos
------------------------------------------------------------------------------

create procedure sp_cadProduto
    (
    -- par�metros para receber as informa��es
    @prdDesc varchar(100),
    @prdQtd int,
    @prdValor decimal(10,2),
    @prdStatus int
)
as
begin
    insert into Produtos
    values
        (@prdDesc, @prdQtd, @prdValor, @prdStatus)
end
go


--testar procedure
select *
from Produtos

exec sp_cadProduto 'Sprite', 150, 8.50, 1
go

exec sp_cadProduto 'Chocolate Talento', 120, 5.50, 1
go

--criar

create procedure sp_cadCliente
    (
    @nomeCli varchar(50),
    @cpfCli varchar(14),
    @statusCli int,
    @rendaCli decimal (10,2)
)
as
begin
    --insert na tabela Pessoas
    insert into Pessoas
    values
        (@nomeCli, @cpfCli, @statusCli)
    -- insert na tabela Clientes
    --precisa do id da ultima pessoa cadastrada
    insert into Clientes
    values
        (@@Identity, @rendaCli, (@rendaCli * 0.30))
end
go

--testar a procedures
select *
from Pessoas
go

select *
from Clientes
go

exec sp_cadCliente 'Tarzan', '121.321.541.14', 2, 5000.00
go

exec sp_cadCliente 'Mogli', '434.345.541.14', 2, 5000.00
go

--criar procedure para cadastrar(inserir) vendedor
--Lembre que vendedor � pessoa

create procedure sp_cadVendedor
    (
    @nomeVend varchar(50),
    @cpfVend varchar(14),
    @statusVend int,
    @salarioVend decimal(10,2)
)
as
begin
    --insert na tabela pessoas
    insert into Pessoas
    values
        (@nomeVend, @cpfVend, @statusVend)
    --inser na tabela vendedos
    insert into Vendedores
    values
        (@@Identity, @salarioVend)
end
go

exec sp_cadVendedor 'Wolverine', '678.345.234-23',1, 4500.00
go

exec sp_cadVendedor 'Blac Phanter', '628.355.214-33',1, 4900.00
go


exec sp_cadCliente 'Prof. Xavier', '439.845.241.64', 2, 9000.00

exec sp_cadCliente 'Mulher Gato', '039.045.041.04', 2, 9000.00
go


--procedure para cadastrar pedido

create procedure sp_cadPedido
    (
    @statusPed int,
    @idVend int,
    @idCli int
)
as
begin
    --insert na tabela Pedidos
    insert into Pedidos
        (data, status, vendedorId, clienteId)
    values
        (GETDATE(), @statusPed, @idVend, @idCli)
end
go

--testar procedure

select *
from Vendedores
select *
from Clientes

exec sp_cadPedido 1, 10, 17
go
exec sp_cadPedido 1, 14, 16
go
exec sp_cadPedido 1, 15, 13
go

select *
from Pedidos
go

--Criar um procedure para cadastrar os itens do pedido

create procedure sp_CadItensPedido
    (
    @idPedido int,
    @idProduto int,
    @qtdItem int
)
as
begin
    --declarar uma variavel
    declare @valor decimal (10,2)
    --consultamos o valor do produto cadastrado na tab produtos
    -- o valor consultado foi atribuido a variavel @valor
    select @valor = p.valor
    from Produtos P
    where P.idProduto = @idProduto

    --insert do item do pedido na tabela ItensPedidos
    insert into Itens_Pedidos
    values
        (@idPedido, @idProduto, @qtdItem, @valor)
end
	go

select *
from Pedidos
 go

select *
from Produtos
 go

exec sp_CadItensPedido 1, 1, 5

exec sp_CadItensPedido 2, 2, 5

exec sp_CadItensPedido 3, 3, 5
 go

select *
from Itens_Pedidos
go


--criar uma procedure para dar baixa em estoque
--Sempre que um produto for cadastrado como um item de pedido
--Falha corrijida ao colocar "GO" na linha 189 
create procedure sp_BaixaEstoque
    (
    @idProd int,
    @qtdVendida int
)
as
begin
    update Produtos set qtd = qtd - @qtdVendida
        where idProduto = @idProd and
        qtd >= @qtdVendida and
        @qtdVendida >0
end
go

--testar procedure
select *
from Itens_Pedidos
go
Select *
from Produtos
go

exec sp_baixaEstoque 1, 3
exec sp_baixaEstoque 2, 3
go

--sempre que um produto for cadastrado como um item de pedido

create procedure sp_cadItensPedidoBaixa
    (
    @idPedido int,
    @idProduto int,
    @qtdItem int
)
as
begin
    --exec a procedure que cadastra itens do pedido
    exec sp_CadItensPedido @idPedido, @idProduto,@qtdItem

    --exec a procedure que da baixa no estoque
    exec sp_baixaEstoque @idProduto, @qtdItem
end
go

--testar procedure
select *
from Produtos
go

select *
from Itens_Pedidos
go

exec sp_CadItensPedido 11, 8, 3
exec sp_CadItensPedido 12, 12, 5
go

--criar uma procedure para atualizar o estoque
--sempre que um produto for comprado

create procedure sp_atualizarEstoque
    (
    @idProd int,
    @qtdComprada int
)
as
begin
    if @qtdComprada > 0
	update Produtos set qtd = qtd + @qtdComprada
	where idProduto = @idProd
end
go

--testar procedure

select *
from Produtos
go

exec sp_atualizarEstoque 4,5
go
