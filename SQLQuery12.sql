-- List Members with the Most Rentals
SELECT
    m.MemberID,
    m.Name AS MemberName,
    COUNT(r.RentalID) AS NumberOfRentals
FROM
    Members m
INNER JOIN
    Rentals r ON m.MemberID = r.MemberID
GROUP BY
    m.MemberID, m.Name
ORDER BY
    NumberOfRentals DESC;
