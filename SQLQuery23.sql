-- Creating a new user
CREATE LOGIN MovieRentalUser WITH PASSWORD = 'Password';
USE movie_rental_DB;
CREATE USER MovieRentalUser FOR LOGIN MovieRentalUser;

-- Granting read and write privileges
GRANT SELECT, INSERT, UPDATE, DELETE ON DATABASE::movie_rental_DB TO MovieRentalUser;
