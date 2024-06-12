--List All Movies That Are Currently Rented Out
SELECT
    mo.MovieID,
    mo.Title,
    r.RentalID,
    r.RentalDate,
    r.DueDate,
    r.MemberID,
    mem.Name AS MemberName
FROM
    Rentals r
INNER JOIN
    Movies mo ON r.MovieID = mo.MovieID
INNER JOIN
    Members mem ON r.MemberID = mem.MemberID
WHERE
    r.ReturnDate IS NULL;
