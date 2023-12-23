INSERT INTO Genres(name) 
VALUES('Поп');
INSERT INTO Genres(name) 
VALUES('Рэп');
INSERT INTO Genres(name) 
VALUES('Джаз');

INSERT INTO Performers(name) 
VALUES('Анна Асти');
INSERT INTO Performers(name) 
VALUES('Дима Билан');
INSERT INTO Performers(name) 
VALUES('Drake');
INSERT INTO Performers(name) 
VALUES('Луи Армстронг');

INSERT INTO PerformersGenres(performers_id, genres_id) 
VALUES(1, 1);
INSERT INTO PerformersGenres(performers_id, genres_id) 
VALUES(2, 1);
INSERT INTO PerformersGenres(performers_id, genres_id) 
VALUES(3, 3);
INSERT INTO PerformersGenres(performers_id, genres_id) 
VALUES(4, 4);

INSERT INTO Albums(name, year_of_release) 
VALUES('Феникс', '2023.01.15');
INSERT INTO Albums(name, year_of_release) 
VALUES('Care Package', '2019.04.18');
INSERT INTO Albums(name, year_of_release) 
VALUES('На берегу неба', '2006.06.26'); 

INSERT INTO AlbumsPerformers(albums_id, performers_id) 
VALUES(1, 1); 
INSERT INTO AlbumsPerformers(albums_id, performers_id) 
VALUES(2, 3); 
INSERT INTO AlbumsPerformers(albums_id, performers_id) 
VALUES(3, 2); 

INSERT INTO Tracks(name, duration, album_id) 
VALUES('Феникс', 203, 1); 
INSERT INTO Tracks(name, duration, album_id) 
VALUES('По барам', 197, 1); 
INSERT INTO Tracks(name, duration, album_id) 
VALUES('Повело', 214, 1); 
INSERT INTO Tracks(name, duration, album_id) 
VALUES('poster', 188, 2); 
INSERT INTO Tracks(name, duration, album_id) 
VALUES('car', 208, 2); 
INSERT INTO Tracks(name, duration, album_id) 
VALUES('На берегу неба', 178, 3); 

INSERT INTO Collections(name, year_of_release) 
VALUES('Сборник1', '2023.07.18'); 
INSERT INTO Collections(name, year_of_release) 
VALUES('Сборник2', '2020.05.10');
INSERT INTO Collections(name, year_of_release) 
VALUES('Сборник3', '2019.10.10'); 
INSERT INTO Collections(name, year_of_release) 
VALUES('Сборник4', '2015.03.08');

INSERT INTO CollectionsTracks(collections_id, tracks_id) 
VALUES(1, 2); 
INSERT INTO CollectionsTracks(collections_id, tracks_id) 
VALUES(1, 3);
INSERT INTO CollectionsTracks(collections_id, tracks_id) 
VALUES(2, 4); 
INSERT INTO CollectionsTracks(collections_id, tracks_id) 
VALUES(3, 5); 
INSERT INTO CollectionsTracks(collections_id, tracks_id) 
VALUES(4, 6); 
