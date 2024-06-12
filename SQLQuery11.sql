--Get a Summary of Movies by Genre
SELECT
    g.GenreName,
    COUNT(m.MovieID) AS NumberOfMovies
FROM
    Movies m
INNER JOIN
    Genres g ON m.GenreID = g.GenreID
GROUP BY
    g.GenreName
ORDER BY
    NumberOfMovies DESC;
