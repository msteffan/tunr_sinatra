DROP TABLE IF EXISTS songs;
DROP TABLE IF EXISTS artists;


CREATE TABLE artists (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    photo_url TEXT,
    nationality TEXT
);

CREATE TABLE songs (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    album TEXT,
    preview_url TEXT,
    artist_id INTEGER REFERENCES artists(id)

);
