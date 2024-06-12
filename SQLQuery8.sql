--Retrieve All Members and Their Rental History
SELECT
    m.MemberID,
    m.Name AS MemberName,
    m.Email,
    r.RentalID,
    mo.Title AS MovieTitle,
    r.RentalDate,
    r.DueDate,
    r.ReturnDate
FROM
    Members m
LEFT JOIN
    Rentals r ON m.MemberID = r.MemberID
LEFT JOIN
    Movies mo ON r.MovieID = mo.MovieID
ORDER BY
    m.MemberID, r.RentalDate;
