-- Criação do banco de dados
CREATE DATABASE Exercicios
GO
USE Exercicios;

-- Criação das tabelas
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName NVARCHAR(100),
    ContactName NVARCHAR(100),
    Country NVARCHAR(50)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    DepartmentID INT,
    HireDate DATE
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName NVARCHAR(100)
);

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY IDENTITY(1,1),
    SupplierName NVARCHAR(100),
    ContactName NVARCHAR(100),
    Country NVARCHAR(50)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(100),
    SupplierID INT,
    Category NVARCHAR(50),
    UnitPrice DECIMAL(10,2),
    UnitsInStock INT
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    EmployeeID INT,
    OrderDate DATE,
    Shipper NVARCHAR(100)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10,2)
);

-- Relações de chaves estrangeiras
ALTER TABLE Employees
ADD CONSTRAINT FK_Employees_Departments FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);

ALTER TABLE Products
ADD CONSTRAINT FK_Products_Suppliers FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID);

ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID);

ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_Employees FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID);

ALTER TABLE OrderDetails
ADD CONSTRAINT FK_OrderDetails_Orders FOREIGN KEY (OrderID) REFERENCES Orders(OrderID);

ALTER TABLE OrderDetails
ADD CONSTRAINT FK_OrderDetails_Products FOREIGN KEY (ProductID) REFERENCES Products(ProductID);

-- Inserção de dados
INSERT INTO Departments (DepartmentName) VALUES
('Sales'), ('HR'), ('IT'), ('Marketing');

INSERT INTO Employees (FirstName, LastName, DepartmentID, HireDate) VALUES
('John', 'Doe', 1, '2015-03-01'),
('Jane', 'Smith', 2, '2016-07-12'),
('Alice', 'Johnson', 3, '2018-10-21'),
('Bob', 'Brown', 1, '2017-01-11');

INSERT INTO Customers (CustomerName, ContactName, Country) VALUES
('Alpha Corp', 'Mark Spencer', 'USA'),
('Beta LLC', 'Samantha Green', 'UK'),
('Gamma Inc', 'Peter White', 'Canada'),
('Delta Co', 'Linda Black', 'USA');

INSERT INTO Suppliers (SupplierName, ContactName, Country) VALUES
('Supplier A', 'Paul Blue', 'USA'),
('Supplier B', 'Laura Gray', 'Germany'),
('Supplier C', 'Tom Red', 'France');

INSERT INTO Products (ProductName, SupplierID, Category, UnitPrice, UnitsInStock) VALUES
('Laptop', 1, 'Electronics', 1200.00, 10),
('Smartphone', 1, 'Electronics', 800.00, 25),
('Office Chair', 2, 'Furniture', 150.00, 50),
('Desk Lamp', 3, 'Furniture', 40.00, 100),
('Monitor', 1, 'Electronics', 300.00, 20);

INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, Shipper) VALUES
(1, 1, '2023-01-10', 'FedEx'),
(2, 4, '2023-01-15', 'UPS'),
(3, 3, '2023-02-10', 'DHL'),
(4, 2, '2023-02-18', 'FedEx');

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price) VALUES
(1, 1, 1, 1200.00),
(1, 3, 2, 150.00),
(2, 2, 3, 800.00),
(3, 4, 5, 40.00),
(4, 5, 1, 300.00),
(4, 3, 4, 150.00);

-- Exercícios
Nível Básico (1 a 30)

Selecione todos os clientes da tabela Customers.

Liste os nomes dos produtos e seus preços da tabela Products.

Mostre os nomes e sobrenomes dos funcionários (Employees).

Liste todos os pedidos (Orders) feitos após 1º de janeiro de 2023.

Exiba o nome do cliente e a cidade em que ele está.

Selecione produtos com preço unitário maior que 500.

Liste todos os funcionários que trabalham no departamento de vendas (DepartmentID = 1).

Selecione os produtos que estão em estoque com quantidade maior que 20.

Liste os fornecedores que são da Alemanha.

Exiba o total de produtos no estoque (soma das unidades).

Selecione os pedidos feitos pelo cliente "Alpha Corp".

Liste os produtos e seus respectivos fornecedores.

Selecione todos os funcionários contratados após 2016.

Liste os nomes dos clientes e seus países.

Selecione os pedidos e ordene por data (mais recente primeiro).

Liste os produtos da categoria “Furniture”.

Selecione os detalhes dos pedidos para o pedido com ID 1.

Liste os clientes que moram nos EUA.

Selecione produtos com estoque entre 10 e 50.

Liste os funcionários que foram contratados antes de 2018.

Selecione os fornecedores que não são dos EUA.

Liste as ordens e seus respectivos clientes e funcionários (JOIN simples).

Selecione produtos com preço unitário entre 100 e 1000.

Exiba o nome do cliente, nome do funcionário e a data do pedido.

Liste os pedidos feitos no mês de janeiro de 2023.

Selecione os produtos cujo nome contém a palavra “Desk”.

Liste os nomes dos clientes em ordem alfabética.

Exiba os nomes dos fornecedores em ordem decrescente.

Liste os produtos e o estoque atual, ordenando do maior para o menor estoque.

Selecione os pedidos e seus detalhes (OrderDetails) usando INNER JOIN.



Nível Intermediário (31 a 70)

Conte quantos clientes existem por país.

Calcule o preço médio dos produtos por categoria.

Liste os funcionários e o nome do departamento onde trabalham (JOIN).

Encontre o pedido mais caro (OrderDetails) e o valor total do pedido.

Liste os clientes que não fizeram pedidos.

Liste os produtos que nunca foram pedidos.

Conte o total de pedidos feitos por cada funcionário.

Exiba o total gasto por cada cliente (soma dos pedidos).

Liste os pedidos com quantidade total maior que 5.

Encontre a data do pedido mais recente.

Liste clientes com mais de um pedido.

Exiba o total de vendas por mês.

Liste produtos com estoque menor que 10 e preço maior que 100.

Liste funcionários que trabalham no departamento de TI ou Marketing.

Liste os produtos que tiveram vendas em janeiro de 2023.

Selecione o cliente com o maior gasto total.

Liste os fornecedores e quantos produtos eles fornecem.

Exiba a média de preço dos produtos fornecidos por cada fornecedor.

Liste os pedidos e quantos produtos diferentes estão em cada pedido.

Calcule o total de vendas por funcionário.

Liste as datas em que mais de 2 pedidos foram feitos.

Use uma subconsulta para listar clientes que fizeram pedidos superiores a 2000.

Liste os produtos e o total vendido de cada um.

Exiba os funcionários e quantos anos cada um trabalha na empresa (baseado em HireDate).

Liste os departamentos que têm mais de um funcionário.

Liste os pedidos onde a quantidade de um produto é maior que 3.

Selecione os clientes que moram na mesma cidade que algum fornecedor.

Liste os funcionários que não gerenciaram pedidos.

Encontre os produtos com estoque maior que a média de estoque.

Liste os clientes e a quantidade de pedidos que cada um fez em 2023.

Use CTE para listar o total de vendas por produto.

Liste os clientes que fizeram pedidos em mais de um país (join simulado).

Liste os produtos com vendas totais superiores a 100 unidades.

Liste os detalhes dos pedidos que tiveram desconto (se houver campo).

Atualize o preço dos produtos com categoria “Electronics” aumentando 10%.

Delete os pedidos feitos antes de 2023 (exercício teórico).

Insira um novo cliente na tabela Customers.

Crie uma view que mostre o total de vendas por cliente.

Crie uma stored procedure para inserir um novo pedido com detalhes.

Use TRY...CATCH para tratar erros em uma operação de inserção.



Nível Avançado (71 a 100+)

Crie uma trigger que atualize o estoque ao inserir um novo pedido.

Otimize a consulta que busca pedidos com muitos joins complexos.

Crie um índice para acelerar consultas de busca por CustomerName.

Utilize ROW_NUMBER() para paginar resultados de clientes.

Use RANK() para listar produtos por valor vendido com empates.

Utilize funções de janela para calcular total acumulado de vendas por data.

Crie uma procedure que recebe parâmetros e retorna pedidos filtrados.

Use XML PATH para concatenar nomes de produtos em um pedido.

Crie uma função escalar para calcular a idade do funcionário.

Implemente uma função table-valued para listar produtos por fornecedor.

Utilize MERGE para atualizar estoque com base em uma tabela temporária.

Crie um job que roda diariamente para arquivar pedidos antigos.

Use CTE recursiva para listar hierarquia de departamentos (caso fosse hierárquico).

Implemente controle de transação com BEGIN TRAN, COMMIT, ROLLBACK.

Crie um procedimento que executa diferentes queries conforme parâmetros (IF/ELSE).

Implemente um mecanismo de auditoria usando triggers.

Use TRY_PARSE para validar dados antes da inserção.

Faça um backup teórico usando T-SQL.

Crie tabelas temporárias e faça operações complexas envolvendo elas.

Crie um exemplo de pivot para mostrar vendas por mês em colunas.

Utilize UNPIVOT para transformar colunas em linhas.

Use APPLY para fazer subconsultas correlacionadas.

Crie um índice filtrado para melhorar performance em casos específicos.

Use STRING_SPLIT para trabalhar com strings separadas por vírgulas.

Crie um procedimento para limpar dados duplicados.

Use EXEC para executar SQL dinâmico.

Crie uma trigger INSTEAD OF para atualizar uma view.

Faça tuning de consultas usando SET STATISTICS IO ON.

Utilize consultas paralelas e análise de planos de execução.

Crie um exemplo de uso de JSON com T-SQL para armazenar dados semi-estruturados.