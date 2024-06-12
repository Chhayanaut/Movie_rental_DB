--rating
SELECT 
    m.Title,
    g.GenreName,
    r.RatingName,
    m.ReleaseYear,
    m.Duration
FROM 
    Movies m
JOIN 
    Genres g ON m.GenreID = g.GenreID
JOIN 
    Ratings r ON m.RatingID = r.RatingID;
