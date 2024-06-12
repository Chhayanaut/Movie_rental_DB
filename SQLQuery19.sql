--Create Stored Procedures
-- Drop existing AddMember stored procedure if it exists
IF OBJECT_ID('AddMember', 'P') IS NOT NULL
    DROP PROCEDURE AddMember;
GO

-- Create the AddMember stored procedure
CREATE PROCEDURE AddMember
    @Name NVARCHAR(255),
    @Email NVARCHAR(255),
    @Phone NVARCHAR(20),
    @Address NVARCHAR(MAX),
    @MembershipDate DATE
AS
BEGIN
    INSERT INTO Members (Name, Email, Phone, Address, MembershipDate)
    VALUES (@Name, @Email, @Phone, @Address, @MembershipDate);
END;
GO
