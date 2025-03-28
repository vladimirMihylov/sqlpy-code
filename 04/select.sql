-- Задание 2
SELECT name, 
duration
FROM Tracks
WHERE duration = (SELECT MAX(duration) FROM Tracks);

SELECT name
FROM Tracks
WHERE duration >= 210;

SELECT name
FROM Collections
WHERE EXTRACT(year FROM year_of_release) BETWEEN '2018' AND '2020';

SELECT name
FROM Performers
WHERE name NOT LIKE '% %';

SELECT name
FROM Tracks
WHERE name LIKE '%my%' 
OR name LIKE '%мой%';

-- Задание 3
SELECT name,
COUNT (performers_id)
FROM Genres 
JOIN PerformersGenres ON Genres.id = PerformersGenres.genres_id
GROUP BY Genres.name;

SELECT COUNT (Tracks.name)
FROM Tracks 
JOIN Albums ON Tracks.album_id = Albums.id
WHERE EXTRACT(year FROM Albums.year_of_release) BETWEEN '2019' AND '2020';

SELECT Albums.name,
AVG (Tracks.duration)
FROM Tracks
JOIN Albums ON Tracks.album_id = Albums.id
GROUP BY(Albums.name);

SELECT Performers.name
FROM Performers, Albums
JOIN AlbumsPerformers ON AlbumsPerformers.albums_id = Albums.id
WHERE Performers.name NOT IN (
  SELECT DISTINCT Performers.name FROM Performers
  WHERE EXTRACT(year FROM Albums.year_of_release) = '2020'
  )
GROUP BY Performers.name;

SELECT Collections.name
FROM Collections
JOIN CollectionsTracks ON Collections.id = CollectionsTracks.collections_id
JOIN Tracks ON CollectionsTracks.tracks_id = Tracks.id 
JOIN Albums ON Tracks.album_id = Albums.id
JOIN AlbumsPerformers ON Albums.id = AlbumsPerformers.albums_id
JOIN Performers ON AlbumsPerformers.performers_id = Performers.id
WHERE Performers.name = 'Drake';

