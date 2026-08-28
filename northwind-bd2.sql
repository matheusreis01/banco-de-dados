-- Remove o banco se ele já existir para evitar conflitos de tabelas antigas
DROP DATABASE IF EXISTS Northwind;

-- Criando o banco de dados limpo para MySQL Workbench
CREATE DATABASE Northwind;
USE Northwind;

-- ==========================================
-- 1. TABELAS INDEPENDENTES (Sem Chaves Estrangeiras)
-- ==========================================

CREATE TABLE Suppliers (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    SupplierName VARCHAR(255) NOT NULL,
    ContactName VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(100),
    PostalCode VARCHAR(20),
    Country VARCHAR(100),
    Phone VARCHAR(50)
) ENGINE=InnoDB;

-- Esta tabela deve vir antes de 'Products'
CREATE TABLE CategoryProducts (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(255) NOT NULL,
    Description TEXT
) ENGINE=InnoDB;

CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerName VARCHAR(255) NOT NULL,
    ContactName VARCHAR(255),
    Address VARCHAR(255),
    City VARCHAR(100),
    PostalCode VARCHAR(20),
    Country VARCHAR(100)
) ENGINE=InnoDB;

CREATE TABLE Employees (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    LastName VARCHAR(15),
    FirstName VARCHAR(15),
    BirthDate DATETIME,
    Photo VARCHAR(25),
    Notes VARCHAR(1024)
) ENGINE=InnoDB;

CREATE TABLE Shippers (
    ShipperID INT AUTO_INCREMENT PRIMARY KEY,
    ShipperName VARCHAR(255) NOT NULL,
    Phone VARCHAR(50)
) ENGINE=InnoDB;

-- ==========================================
-- 2. TABELAS DEPENDENTES (Com Chaves Estrangeiras)
-- ==========================================

CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(255) NOT NULL,
    Unit VARCHAR(50),
    Price DECIMAL(10,2),
    SupplierID INT,
    CategoryID INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
    -- Aponta para 'CategoryProducts'
    FOREIGN KEY (CategoryID) REFERENCES CategoryProducts(CategoryID)
) ENGINE=InnoDB;

CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    EmployeeID INT,
    OrderDate DATETIME,
    ShipperID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ShipperID) REFERENCES Shippers(ShipperID)
) ENGINE=InnoDB;

CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
) ENGINE=InnoDB;

-- ==========================================
-- 3. CONSULTA DE TESTE
-- ==========================================

SELECT * FROM CategoryProducts;
