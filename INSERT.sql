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
('Scorpion', 2018),
('Scorpion new', 2019);

INSERT INTO tracks (title, duration, album_id) VALUES 
('Radioactive', 186, 1),
('Demons', 177, 1),
('Hello', 295, 2),
('Send My Love', 223, 2),
('God''s Plan', 198, 3),
('In My Feelings', 217, 3);

INSERT INTO tracks (title, duration, album_id)
VALUES ('New Song', 200, 4);

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
(4, 4);



INSERT INTO compilation_track (compilation_id, track_id) VALUES 
(1, 1),
(1, 3),
(2, 2),
(2, 5),
(3, 4),
(3, 6),
(4, 1),
(4, 6);


