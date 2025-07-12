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