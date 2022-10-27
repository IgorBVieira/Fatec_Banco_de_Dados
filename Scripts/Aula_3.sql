---------------------------------------------------------------------------------------------------------------------
--Acessar Banco de Dados 2

---------------------------------------

use VendasBD_INFON
go


---------------------------------------
--CRUD: READ - SELECT
---------------------------------------

--------------------------------------
-- 1) Consultar o nome e cpf das Pessoas cadastradas
---------------------------------------

select nome, cpf
from Pessoas
go

--------------------------------------
-- 2) Consultar o id, nome e cpf das Pessoas cadastradas
-- e renomear as colunas da tabela
---------------------------------------
select idPessoa Codigo, nome 'Nome Pessoa', cpf CPF
from Pessoas
go

--------------------------------------
-- 3) Consultar todos os dados das pessoas cadastradas
---------------------------------------

select *
from Pessoas
go


--------------------------------------
-- 4) Consultar todos os dados dos clientes cadastrados
-- Objetivo é juntar as tabdelas (join)
---------------------------------------

select *
from Pessoas, Clientes
where Pessoas.idPessoa = Clientes.pessoaId
go

--------------------------------------
-- 5) Consultar todos os dados dos vendedores cadastrados
-- Objetivo é juntar as tabdelas (join)
---------------------------------------

select*
from Pessoas, Vendedores
where Pessoas.idPessoa = Vendedores.pessoaId
go

--------------------------------------
-- 6) Consultar o nome,cpf, renda dos clientes cadastrados
-- Objetivo é juntar as tabdelas (join)
---------------------------------------

select Pessoas.nome cliente, Pessoas.cpf CPF, Clientes.renda Renda
from Pessoas, Clientes
where Pessoas.idPessoa = Clientes.pessoaId
go

--------------------------------------
-- 7) Consultar o nome,cpf, renda dos clientes cadastrados
--quando a renda do cliente for maior que 2000.00 R$
-- Objetivo é juntar as tabdelas (join)
---------------------------------------

select Pessoas.nome Cliente, Pessoas.cpf CPF, Clientes.renda Renda
from Pessoas, Clientes
where Pessoas.idPessoa = Clientes.pessoaId and Clientes.renda > 2000.00
go

--------------------------------------
-- 8) Consultar o nome,cpf, renda dos vendedores cadastrados
--quando o salario for maior que 3000.00 R$
-- Objetivo é juntar as tabdelas (join) e usar alias de tabela
----------------------------------------------------------------

select P.nome, P.cpf, V.salario
from Pessoas P, Vendedores V
where P.idPessoa = V.pessoaId and V.salario > 3000.00
go

--------------------------------------
-- 9) Consultar todos os produtos do Pedido 1
-- Objetivo é juntar as tabdelas (join) e usar alias de tabelas
----------------------------------------------------------------

select Pe.idPedido, Pe.data, Pr.descricao, Pr.valor
from Pedidos Pe, Produtos Pr, Itens_Pedidos IP
where Pe.idPedido = IP.pedidoId and Pr.idProduto = IP.produtoId
    and Pe.idPedido = 1
go

--------------------------------------
-- 10) Consultar todos os produtos com valor entre 10,00
-- e 25,00
----------------------------------------------------------------

select *
from Produtos
where valor between 10.00 and 25.00
go

--------------------------------------
-- 11) Consultar todos os produtos com nome substring rve
----------------------------------------------------------------

select*
from Produtos
where descricao like '%rve%'
go

--------------------------------------
-- 12) Consultar todos os produtos com nome começando com a letra C e tenha qualquer letra
----------------------------------------------------------------

select*
from Produtos
where descricao like '%C_o%'
go

--------------------------------------
-- 13) Consultar todos os Pedidos com status 1 ou 3
----------------------------------------------------------------

select*
from Pedidos
where status = 1 or status =3
go

--------------------------------------
-- 14) Consultar todos os Pessoas is null
----------------------------------------------------------------

select *
from Pessoas
where status is null
go

--------------------------------------
-- 15) Consultar todos os Pessoas not null
----------------------------------------------------------------

select *
from Pessoas
where status is not null
go

--------------------------------------
-- 16 Consultar todas as pessoas pelo nome
----------------------------------------------------------------
select *
from Pessoas
order by nome DESC
go

--------------------------------------
--17) Consultar todas as pessoas pelo nome
-----------------------------------------------------------


select*
from Produtos
order by valor DESC
go

select Distinct Pr.idProduto, Pr.descricao
from Produtos Pr, Itens_Pedidos I
where Pr.idProduto = I.produtoId
go
