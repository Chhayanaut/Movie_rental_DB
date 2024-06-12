--memeber info
SELECT 
    r.RentalID,
    m.Name AS MemberName,
    mo.Title AS MovieTitle,
    r.RentalDate,
    r.DueDate,
    r.ReturnDate
FROM 
    Rentals r
JOIN 
    Members m ON r.MemberID = m.MemberID
JOIN 
    Movies mo ON r.MovieID = mo.MovieID;
