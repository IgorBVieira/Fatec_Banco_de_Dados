--------------------------------------------------------------
-- Criando o Banco de Dados
--------------------------------------------------------------
create database VendasBD_INFON
go

--------------------------------------------------------------
-- Acessar o Banco de Dados
--------------------------------------------------------------
use VendasBD_INFON
go

--------------------------------------------------------------
-- Criando as tabelas do Banco de Dados
-- TABELA: PESSOAS
--------------------------------------------------------------
create table Pessoas
(
    idPessoa int not null primary key identity,
    nome varchar(50) not null,
    cpf varchar(14) not null unique,
    status int null check(status in (1, 2, 3, 4))
)
go

--Tem como finalidade visualizar metadados dentro da nossa base de dados, 
--exibindo informações sobre colunas, tipos de dados dos campos e etc….
execute sp_help Pessoas
go

--------------------------------------------------------------
-- TABELA: Clientes
--------------------------------------------------------------
create table Clientes
(
    pessoaId int not null primary key,
    renda decimal(10,2) not null,
    credito decimal(10,2) not null,
    -- definir a chave estrangeira FK
    foreign key (pessoaId)		references	Pessoas(idPessoa),
    -- restrições dos campos
    check (renda >= 700.00),
    check (credito >= 100.00)
)
go

--------------------------------------------------------------
-- TABELA: Vendedores
--------------------------------------------------------------
create table Vendedores
(
    pessoaId int not null primary key,
    salario decimal(10,2) not null,
    -- definir a chave estrangeira FK
    foreign key (pessoaId)		references	Pessoas(idPessoa),
    -- restrições dos campos
    check (salario >= 1000.00)
)
go

--------------------------------------------------------------
-- TABELA: Pedidos
--------------------------------------------------------------
create table Pedidos
(
    idPedido int not null primary key identity,
    data datetime not null,
    valor money null,
    status int null check(status between 1 and 4),
    vendedorId int not null,
    clienteId int not null,
    -- definições das chaves estrangeiras FK
    foreign key		(vendedorId)	references	Vendedores (pessoaId),
    foreign key		(clienteId)		references	Clientes (pessoaId)
)
go

--------------------------------------------------------------
-- TABELA: Produtos
--------------------------------------------------------------
create table Produtos
(
    idProduto int not null primary key identity,
    descricao varchar(100) not null,
    qtd int null check(qtd >= 0),
    valor decimal(10,2) null check(valor > 0),
    status int null check(status in (1,2))
)
go

--------------------------------------------------------------
-- TABELA: Itens_Pedidos
--------------------------------------------------------------
create table Itens_Pedidos
(
    -- chave estrangeira
    pedidoId int not null references	Pedidos(idPedido),
    -- chave estrangeira
    produtoId int not null references	Produtos(idProduto),
    qtd int null check(qtd > 0),
    valor decimal(10,2) null check(valor > 0),
    -- chave primária composta
    primary key (pedidoId, produtoId)
)
go


