--Retrieve Inventory Status
SELECT
    mo.MovieID,
    mo.Title,
    inv.QuantityAvailable,
    inv.ConditionStatus
FROM
    Inventory inv
INNER JOIN
    Movies mo ON inv.MovieID = mo.MovieID
ORDER BY
    mo.Title;
