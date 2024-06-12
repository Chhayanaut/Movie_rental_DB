--Create Views for Frequent Queries
CREATE VIEW RentalOverview AS
SELECT 
    r.RentalID,
    mem.Name AS MemberName,
    mov.Title AS MovieTitle,
    r.RentalDate,
    r.DueDate,
    r.ReturnDate,
    lf.FeeAmount,
    lf.PaidStatus
FROM 
    Rentals r
JOIN 
    Members mem ON r.MemberID = mem.MemberID
JOIN 
    Movies mov ON r.MovieID = mov.MovieID
LEFT JOIN 
    LateFees lf ON r.RentalID = lf.RentalID;
