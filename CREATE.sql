CREATE TABLE IF NOT EXISTS genres (
    PRIMARY KEY (genre_id),
    genre_id   SERIAL, 
    genre_name VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS albums (
    PRIMARY KEY (album_id),
    album_id     SERIAL, 
    album_name   VARCHAR(60) NOT NULL,
    release_year INTEGER     NOT NULL
                 CHECK (release_year > 1900)  
);

CREATE TABLE IF NOT EXISTS artists (
    PRIMARY KEY (artist_id),
    artist_id   SERIAL, 
    artist_name VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS collections (
    PRIMARY KEY (collection_id),
    collection_id   SERIAL, 
    collection_name VARCHAR(60) NOT NULL, 
    release_year    INTEGER     NOT NULL
                CHECK (release_year > 1900)
);

CREATE TABLE IF NOT EXISTS tracks (
    PRIMARY KEY (track_id),
    track_id      SERIAL, 
    track_name    VARCHAR(60) NOT NULL,
    album_id      INTEGER     NOT NULL 
                  REFERENCES albums(album_id),
    playback_time TIME        NOT NULL
);

CREATE TABLE IF NOT EXISTS track_collection (
    PRIMARY KEY (track_id, collection_id),
	track_id      INTEGER    NOT NULL 
                  REFERENCES tracks(track_id),
	collection_id INTEGER    NOT NULL 
                  REFERENCES collections(collection_id)
);

CREATE TABLE IF NOT EXISTS artist_album (
    PRIMARY KEY (album_id, artist_id),
	album_id  INTEGER    NOT NULL 
              REFERENCES albums(album_id),
	artist_id INTEGER    NOT NULL 
              REFERENCES artists(artist_id));
	
CREATE TABLE IF NOT EXISTS artist_genre (
    PRIMARY KEY (genre_id, artist_id),
	genre_id  INTEGER NOT NULL 
              REFERENCES genres(genre_id),
	artist_id INTEGER NOT NULL 
              REFERENCES artists(artist_id)
);