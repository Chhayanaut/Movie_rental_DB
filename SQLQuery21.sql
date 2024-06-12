--Registering a New Rental:
-- Drop existing AddRental stored procedure if it exists
IF OBJECT_ID('AddRental', 'P') IS NOT NULL
    DROP PROCEDURE AddRental;
GO

-- Create the AddRental stored procedure
CREATE PROCEDURE AddRental
    @MovieID INT,
    @MemberID INT,
    @RentalDate DATE,
    @DueDate DATE
AS
BEGIN
    INSERT INTO Rentals (MovieID, MemberID, RentalDate, DueDate)
    VALUES (@MovieID, @MemberID, @RentalDate, @DueDate);
END;
GO
