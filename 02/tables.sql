CREATE TABLE IF NOT EXISTS Genres (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
);

CREATE TABLE IF NOT EXISTS Performers (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
);

CREATE TABLE IF NOT EXISTS PerformersGenres (
	performers_id INTEGER REFERENCES Performers(id),
	genres_id INTEGER REFERENCES Genres(id),
	CONSTRAINT pk PRIMARY KEY (performers_id, genres_id)
);

CREATE TABLE IF NOT EXISTS Albums (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL,
	year_of_release date NOT NULL
);

CREATE TABLE IF NOT EXISTS AlbumsPerformers (
	albums_id INTEGER REFERENCES Albums(id),
  performers_id INTEGER REFERENCES Performers(id),
	CONSTRAINT pk PRIMARY KEY (albums_id, performers_id)
);

CREATE TABLE IF NOT EXISTS Tracks (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	duration NUMERIC NOT NULL,
  album_id INTEGER NOT NULL REFERENCES Albums(id)
);

CREATE TABLE IF NOT EXISTS Collections (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	year_of_release date NOT NULL
);

CREATE TABLE IF NOT EXISTS CollectionsTracks (
	collections_id INTEGER REFERENCES Collections(id),
  tracks_id INTEGER REFERENCES Tracks(id),
	CONSTRAINT pk PRIMARY KEY (collections_id, tracks_id)
);
