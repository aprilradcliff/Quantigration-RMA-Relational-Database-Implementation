-- Quantigration RMA Database Schema
-- Relational structure with enforced referential integrity

CREATE DATABASE IF NOT EXISTS QuantigrationUpdates;
USE QuantigrationUpdates;

-- ======================================
-- Collaborator Table (formerly Customer)
-- ======================================

CREATE TABLE Collaborator (
    Collaborator_ID INT PRIMARY KEY,
    First_Name VARCHAR(25),
    Last_Name VARCHAR(25),
    Street VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(25),
    ZipCode INT,
    Telephone VARCHAR(15)
);

-- ======================================
-- Orders Table
-- ======================================

CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Collaborator_ID INT,
    SKU VARCHAR(20),
    Description VARCHAR(50),
    FOREIGN KEY (Collaborator_ID)
        REFERENCES Collaborator(Collaborator_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ======================================
-- RMA Table (Return Merchandise Authorization)
-- ======================================

CREATE TABLE RMA (
    RMAID INT PRIMARY KEY,
    Order_ID INT,
    Step VARCHAR(50),
    Status VARCHAR(15),
    Reason VARCHAR(50),
    FOREIGN KEY (Order_ID)
        REFERENCES Orders(Order_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
