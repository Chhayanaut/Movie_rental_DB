-- Ensure no active connections to the database before dropping it
USE master;
GO

ALTER DATABASE movie_rental_DB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO

-- Only drop the database if it exists (optional)
IF EXISTS (SELECT name FROM sys.databases WHERE name = 'movie_rental_DB')
BEGIN
    DROP DATABASE movie_rental_DB;
END
GO

-- Creating the database
CREATE DATABASE movie_rental_DB;
GO
USE movie_rental_DB;
GO

-- Creating Genres table first because it's referenced by Movies
IF OBJECT_ID('Genres', 'U') IS NULL 
BEGIN
    CREATE TABLE Genres (
        GenreID INT IDENTITY(1,1) PRIMARY KEY,
        GenreName VARCHAR(100) NOT NULL
    );
END
GO

-- Creating Ratings table next because it's referenced by Movies
IF OBJECT_ID('Ratings', 'U') IS NULL 
BEGIN
    CREATE TABLE Ratings (
        RatingID INT IDENTITY(1,1) PRIMARY KEY,
        RatingName VARCHAR(50) NOT NULL
    );
END
GO

-- Creating Movies table
IF OBJECT_ID('Movies', 'U') IS NULL 
BEGIN
    CREATE TABLE Movies (
        MovieID INT IDENTITY(1,1) PRIMARY KEY,
        Title VARCHAR(255) NOT NULL,
        GenreID INT,
        ReleaseYear INT,
        RatingID INT,
        Duration INT,
        FOREIGN KEY (GenreID) REFERENCES Genres(GenreID),
        FOREIGN KEY (RatingID) REFERENCES Ratings(RatingID)
    );
END
GO

-- Creating Members table
IF OBJECT_ID('Members', 'U') IS NULL 
BEGIN
    CREATE TABLE Members (
        MemberID INT IDENTITY(1,1) PRIMARY KEY,
        Name VARCHAR(255) NOT NULL,
        Email VARCHAR(255) NOT NULL,
        Phone VARCHAR(20),
        Address TEXT,
        MembershipDate DATE
    );
END
GO

-- Creating Rentals table
IF OBJECT_ID('Rentals', 'U') IS NULL 
BEGIN
    CREATE TABLE Rentals (
        RentalID INT IDENTITY(1,1) PRIMARY KEY,
        MovieID INT,
        MemberID INT,
        RentalDate DATE,
        ReturnDate DATE,
        DueDate DATE,
        FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
        FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
    );
END
GO

-- Creating Payments table
IF OBJECT_ID('Payments', 'U') IS NULL 
BEGIN
    CREATE TABLE Payments (
        PaymentID INT IDENTITY(1,1) PRIMARY KEY,
        RentalID INT,
        Amount DECIMAL(10, 2),
        PaymentDate DATE,
        PaymentMethod VARCHAR(50),
        FOREIGN KEY (RentalID) REFERENCES Rentals(RentalID)
    );
END
GO

-- Creating LateFees table
IF OBJECT_ID('LateFees', 'U') IS NULL 
BEGIN
    CREATE TABLE LateFees (
        FeeID INT IDENTITY(1,1) PRIMARY KEY,
        RentalID INT,
        FeeAmount DECIMAL(10, 2),
        PaidStatus VARCHAR(20) NOT NULL,
        FOREIGN KEY (RentalID) REFERENCES Rentals(RentalID)
    );
END
GO

-- Creating Employees table
IF OBJECT_ID('Employees', 'U') IS NULL 
BEGIN
    CREATE TABLE Employees (
        EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
        Name VARCHAR(255) NOT NULL,
        Position VARCHAR(100),
        HireDate DATE,
        Email VARCHAR(255)
    );
END
GO

-- Creating Inventory table
IF OBJECT_ID('Inventory', 'U') IS NULL 
BEGIN
    CREATE TABLE Inventory (
        InventoryID INT IDENTITY(1,1) PRIMARY KEY,
        MovieID INT,
        QuantityAvailable INT,
        ConditionStatus VARCHAR(100),
        FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
    );
END
GO

-- Creating Reviews table
IF OBJECT_ID('Reviews', 'U') IS NULL 
BEGIN
    CREATE TABLE Reviews (
        ReviewID INT IDENTITY(1,1) PRIMARY KEY,
        MemberID INT,
        MovieID INT,
        ReviewText TEXT,
        Rating INT,
        ReviewDate DATE,
        FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
        FOREIGN KEY (MovieID) REFERENCES Movies(MovieID)
    );
END
GO
