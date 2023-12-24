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


