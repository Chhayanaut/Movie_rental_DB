--Retrieve All Movies and Their Average Ratings
SELECT
    mo.MovieID,
    mo.Title,
    AVG(rev.Rating) AS AverageRating
FROM
    Movies mo
LEFT JOIN
    Reviews rev ON mo.MovieID = rev.MovieID
GROUP BY
    mo.MovieID, mo.Title
ORDER BY
    AverageRating DESC;
