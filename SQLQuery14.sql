--List Overdue Movies
SELECT
    r.RentalID,
    m.Title AS MovieTitle,
    mem.Name AS MemberName,
    r.RentalDate,
    r.DueDate,
    r.ReturnDate,
    DATEDIFF(DAY, r.DueDate, GETDATE()) AS DaysOverdue
FROM
    Rentals r
INNER JOIN
    Members mem ON r.MemberID = mem.MemberID
INNER JOIN
    Movies m ON r.MovieID = m.MovieID
WHERE
    r.ReturnDate IS NULL AND r.DueDate < GETDATE();
