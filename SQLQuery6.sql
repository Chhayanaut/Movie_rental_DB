--latefee
SELECT 
    r.RentalID,
    mem.Name AS MemberName,
    mov.Title AS MovieTitle,
    r.DueDate,
    lf.FeeAmount,
    lf.PaidStatus
FROM 
    Rentals r
JOIN 
    Members mem ON r.MemberID = mem.MemberID
JOIN 
    Movies mov ON r.MovieID = mov.MovieID
LEFT JOIN 
    LateFees lf ON r.RentalID = lf.RentalID
WHERE 
    r.ReturnDate IS NULL AND r.DueDate < GETDATE();
