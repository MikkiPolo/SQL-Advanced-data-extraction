-- 1. ЖАНРЫ
CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- 2. ИСПОЛНИТЕЛИ
CREATE TABLE artists (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- 3. СВЯЗЬ ИСПОЛНИТЕЛЬ ↔ ЖАНР (многие ко многим)
CREATE TABLE artist_genre (
    artist_id INT NOT NULL,
    genre_id INT NOT NULL,
    PRIMARY KEY (artist_id, genre_id),
    FOREIGN KEY (artist_id) REFERENCES artists(id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES genres(id) ON DELETE CASCADE
);

-- 4. АЛЬБОМЫ
CREATE TABLE albums (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INT
);

-- 5. СВЯЗЬ ИСПОЛНИТЕЛЬ ↔ АЛЬБОМ (многие ко многим)
CREATE TABLE artist_album (
    artist_id INT NOT NULL,
    album_id INT NOT NULL,
    PRIMARY KEY (artist_id, album_id),
    FOREIGN KEY (artist_id) REFERENCES artists(id) ON DELETE CASCADE,
    FOREIGN KEY (album_id) REFERENCES albums(id) ON DELETE CASCADE
);

-- 6. ТРЕКИ
CREATE TABLE tracks (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    duration TIME NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albums(id) ON DELETE CASCADE
);

-- 7. СБОРНИКИ
CREATE TABLE compilations (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    release_year INT
);

-- 8. СВЯЗЬ СБОРНИК ↔ ТРЕК (многие ко многим)
CREATE TABLE compilation_track (
    compilation_id INT NOT NULL,
    track_id INT NOT NULL,
    PRIMARY KEY (compilation_id, track_id),
    FOREIGN KEY (compilation_id) REFERENCES compilations(id) ON DELETE CASCADE,
    FOREIGN KEY (track_id) REFERENCES tracks(id) ON DELETE CASCADE
);

INSERT INTO artists (name) VALUES 
('Imagine Dragons'),
('Adele'),
('Drake'),
('Arctic Monkeys');

INSERT INTO genres (name) VALUES 
('Pop'),
('Rock'),
('Hip-Hop');

INSERT INTO albums (title, release_year) VALUES 
('Night Visions', 2012),
('25', 2015),
('Scorpion', 2018);

INSERT INTO tracks (title, duration, album_id) VALUES 
('Radioactive', 186, 1),
('Demons', 177, 1),
('Hello', 295, 2),
('Send My Love', 223, 2),
('God''s Plan', 198, 3),
('In My Feelings', 217, 3);

INSERT INTO compilations (title, release_year) VALUES 
('Best of 2010s', 2020),
('Top Hits', 2021),
('Workout Mix', 2019),
('Chill Vibes', 2022);

INSERT INTO artist_genre (artist_id, genre_id) VALUES 
(1, 2),  -- Imagine Dragons – Rock
(1, 1),  -- Imagine Dragons – Pop
(2, 1),  -- Adele – Pop
(3, 3),  -- Drake – Hip-Hop
(4, 2);  -- Arctic Monkeys – Rock

INSERT INTO artist_album (artist_id, album_id) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 1);  -- допустим, участвовали совместно



INSERT INTO compilation_track (compilation_id, track_id) VALUES 
(1, 1),
(1, 3),
(2, 2),
(2, 5),
(3, 4),
(3, 6),
(4, 1),
(4, 6);

ALTER TABLE tracks
ALTER COLUMN duration TYPE INTEGER USING EXTRACT(EPOCH FROM duration)::INTEGER;


SELECT * FROM tracks
