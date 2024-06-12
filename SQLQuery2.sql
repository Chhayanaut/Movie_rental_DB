-- Use the movie_rental_DB database
USE movie_rental_DB;
GO

-- Adding data to Genres table (only if not already populated)
IF NOT EXISTS (SELECT * FROM Genres)
BEGIN
    INSERT INTO Genres (GenreName) VALUES ('Action'), ('Comedy'), ('Drama'), ('Horror'), ('Sci-Fi');
END

-- Adding data to Ratings table (only if not already populated)
IF NOT EXISTS (SELECT * FROM Ratings)
BEGIN
    INSERT INTO Ratings (RatingName) VALUES ('G'), ('PG'), ('PG-13'), ('R'), ('NC-17');
END

-- Adding 50 movies to the Movies table
IF NOT EXISTS (SELECT * FROM Movies)
BEGIN
    INSERT INTO Movies (Title, GenreID, ReleaseYear, RatingID, Duration) VALUES
    ('The Avengers', 1, 2012, 3, 143),
    ('Toy Story', 2, 1995, 1, 81),
    ('Titanic', 3, 1997, 3, 195),
    ('Saw', 4, 2004, 4, 103),
    ('Star Wars', 5, 1977, 4, 121),
    ('Inception', 1, 2010, 4, 148),
    ('The Dark Knight', 1, 2008, 4, 152),
    ('Forrest Gump', 3, 1994, 2, 142),
    ('The Matrix', 5, 1999, 4, 136),
    ('Finding Nemo', 2, 2003, 1, 100),
    ('Jurassic Park', 1, 1993, 2, 127),
    ('Shrek', 2, 2001, 2, 95),
    ('Pulp Fiction', 3, 1994, 4, 154),
    ('The Shawshank Redemption', 3, 1994, 4, 142),
    ('The Lion King', 2, 1994, 2, 88),
    ('Gladiator', 1, 2000, 4, 155),
    ('A Beautiful Mind', 3, 2001, 3, 135),
    ('Interstellar', 5, 2014, 3, 169),
    ('The Silence of the Lambs', 4, 1991, 4, 118),
    ('Frozen', 2, 2013, 1, 102),
    ('Avatar', 5, 2009, 4, 162),
    ('Mad Max: Fury Road', 1, 2015, 4, 120),
    ('The Godfather', 3, 1972, 4, 175),
    ('The Incredibles', 2, 2004, 1, 115),
    ('Aliens', 5, 1986, 4, 137),
    ('Toy Story 3', 2, 2010, 1, 103),
    ('Jaws', 4, 1975, 3, 124),
    ('Goodfellas', 3, 1990, 4, 146),
    ('The Departed', 3, 2006, 4, 151),
    ('Avengers: Endgame', 1, 2019, 3, 181),
    ('Up', 2, 2009, 1, 96),
    ('Iron Man', 1, 2008, 3, 126),
    ('The Godfather: Part II', 3, 1974, 4, 202),
    ('Rocky', 3, 1976, 3, 120),
    ('Spider-Man: Homecoming', 1, 2017, 2, 133),
    ('Deadpool', 1, 2016, 4, 108),
    ('Logan', 1, 2017, 4, 137),
    ('Black Panther', 1, 2018, 3, 134),
    ('Schindler''s List', 3, 1993, 4, 195),
    ('The Wolf of Wall Street', 3, 2013, 4, 180),
    ('Guardians of the Galaxy', 1, 2014, 3, 122),
    ('E.T. the Extra-Terrestrial', 5, 1982, 2, 115),
    ('Monsters, Inc.', 2, 2001, 1, 92),
    ('Die Hard', 1, 1988, 4, 132),
    ('The Exorcist', 4, 1973, 4, 122),
    ('Inside Out', 2, 2015, 1, 95),
    ('Saving Private Ryan', 1, 1998, 4, 169),
    ('Coco', 2, 2017, 1, 105);
END

-- Adding data to Members table
INSERT INTO Members (Name, Email, Phone, Address, MembershipDate) 
VALUES ('John Doe', 'john.doe@example.com', '555-1234', '123 Main St', '2024-01-01'),
       ('Jane Smith', 'jane.smith@example.com', '555-5678', '456 Elm St', '2024-02-01'),
       ('Michael Johnson', 'michael.johnson@example.com', '555-8765', '789 Oak Rd', '2024-03-05'),
       ('Emily Davis', 'emily.davis@example.com', '555-4321', '321 Pine Ln', '2024-04-12');

-- Adding data to Rentals table
INSERT INTO Rentals (MovieID, MemberID, RentalDate, DueDate, ReturnDate) 
VALUES (1, 1, '2024-06-01', '2024-06-08', NULL),
       (2, 2, '2024-06-02', '2024-06-09', NULL),
       (3, 3, '2024-06-03', '2024-06-10', NULL),
       (4, 4, '2024-06-04', '2024-06-11', NULL);

-- Adding data to Payments table
INSERT INTO Payments (RentalID, Amount, PaymentDate, PaymentMethod) 
VALUES (1, 4.99, '2024-06-01', 'Credit Card'),
       (2, 3.99, '2024-06-02', 'Cash'),
       (3, 5.99, '2024-06-03', 'Debit Card'),
       (4, 6.99, '2024-06-04', 'Check');

-- Adding data to LateFees table
INSERT INTO LateFees (RentalID, FeeAmount, PaidStatus) 
VALUES (1, 1.00, 'Paid'),
       (2, 1.50, 'Unpaid'),
       (3, 2.00, 'Unpaid'),
       (4, 0.50, 'Paid');

-- Adding data to Employees table
INSERT INTO Employees (Name, Position, HireDate, Email) 
VALUES ('Alice Johnson', 'Manager', '2023-01-15', 'alice.johnson@company.com'),
       ('Bob Brown', 'Assistant', '2023-05-10', 'bob.brown@company.com'),
       ('Carol White', 'Clerk', '2023-03-20', 'carol.white@company.com'),
       ('Dan Green', 'Technician', '2023-07-30', 'dan.green@company.com');

-- Adding data to Inventory table
INSERT INTO Inventory (MovieID, QuantityAvailable, ConditionStatus) 
VALUES (1, 5, 'Good'),
       (2, 3, 'Excellent'),
       (3, 7, 'Fair'),
       (4, 2, 'Like New'),
       (5, 6, 'Good');

-- Adding data to Reviews table
INSERT INTO Reviews (MemberID, MovieID, ReviewText, Rating, ReviewDate) 
VALUES (1, 1, 'Great movie!', 5, '2024-06-03'),
       (2, 2, 'Very funny!', 4, '2024-06-04'),
       (3, 3, 'Excellent storytelling.', 5, '2024-06-05'),
       (4, 4, 'Quite scary!', 4, '2024-06-06');
