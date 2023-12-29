INSERT INTO Genres(name) 
VALUES
  ('Поп'),
  ('Рэп'),
  ('Джаз');

INSERT INTO Performers(name) 
VALUES
  ('Анна Асти'),
  ('Дима Билан'),
  ('Drake'),
  ('Луи Армстронг');

INSERT INTO PerformersGenres(performers_id, genres_id) 
VALUES
  (1, 1),
  (2, 1),
  (3, 3),
  (4, 4);

INSERT INTO Albums(name, year_of_release) 
VALUES
  ('Феникс', '2023.01.15'),
  ('Care Package', '2019.04.18'),
  ('На берегу неба', '2006.06.26');

INSERT INTO AlbumsPerformers(albums_id, performers_id) 
VALUES
  (1, 1), 
  (2, 3),
  (3, 2);

INSERT INTO Tracks(name, duration, album_id) 
VALUES
  ('Феникс', 203, 1),
  ('По барам', 197, 1),
  ('Повело', 214, 1),
  ('poster', 188, 2),
  ('car', 208, 2),
  ('На берегу неба', 178, 3),
  ('Сон мой', 223, 3);  

INSERT INTO Collections(name, year_of_release) 
VALUES
  ('Сборник1', '2023.07.18'),
  ('Сборник2', '2020.05.10'),
  ('Сборник3', '2019.10.10'),
  ('Сборник4', '2015.03.08');

INSERT INTO CollectionsTracks(collections_id, tracks_id) 
VALUES
  (1, 2),
  (1, 3),
  (2, 4),
  (3, 5),
  (4, 6);
