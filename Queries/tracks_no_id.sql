-- tracks_no_id.sql: Provide a query that shows all the Tracks, but displays no IDs. The result should include the Album name, Media type and Genre.

SELECT t.[Name], a.Title, mt.[Name], g.[Name] FROM Track t
    JOIN Album a ON a.AlbumId = t.AlbumId
    JOIN MediaType mt ON mt.MediaTypeId = t.MediaTypeId
    JOIN Genre g ON g.GenreId = t.GenreId
    ORDER BY t.TrackId;