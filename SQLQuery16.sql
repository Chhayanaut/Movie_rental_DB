-- Get Detailed Information on Late Fees
SELECT
    lf.FeeID,
    r.RentalID,
    m.Title AS MovieTitle,
    mem.Name AS MemberName,
    lf.FeeAmount,
    lf.PaidStatus
FROM
    LateFees lf
INNER JOIN
    Rentals r ON lf.RentalID = r.RentalID
INNER JOIN
    Movies m ON r.MovieID = m.MovieID
INNER JOIN
    Members mem ON r.MemberID = mem.MemberID;
