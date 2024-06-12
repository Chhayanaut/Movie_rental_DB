-- Find Movies with Outstanding Late Fees
SELECT
    m.MovieID,
    m.Title,
    lf.FeeAmount,
    lf.PaidStatus,
    r.DueDate,
    r.ReturnDate,
    mem.Name AS MemberName
FROM
    LateFees lf
INNER JOIN
    Rentals r ON lf.RentalID = r.RentalID
INNER JOIN
    Movies m ON r.MovieID = m.MovieID
INNER JOIN
    Members mem ON r.MemberID = mem.MemberID
WHERE
    lf.PaidStatus = 'Unpaid';
