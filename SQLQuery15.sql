-- Find All Movies That Have Never Been Rented
SELECT
    m.MovieID,
    m.Title,
    m.ReleaseYear
FROM
    Movies m
LEFT JOIN
    Rentals r ON m.MovieID = r.MovieID
WHERE
    r.RentalID IS NULL;
