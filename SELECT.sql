--ЗАДАНИЕ 2--
--1. Название и продолжительность самого длительного трека--
SELECT title, duration
FROM tracks
ORDER BY duration DESC
LIMIT 1;

--2. Название треков, продолжительность которых не менее 3,5 минут(210 секунд)--
SELECT title, duration
FROM tracks
WHERE duration >= 210;

--3. Названия сборников, вышедших в период с 2018 по 2020 год включительно--
SELECT title, release_year
FROM compilations
WHERE release_year BETWEEN 2018 AND 2020;

--4. Исполнители, чьё имя состоит из одного слова--
SELECT name
FROM artists
WHERE name NOT LIKE '% %';

--5. Название треков, которые содержат слово «мой» или «my»--
--SELECT title
--FROM tracks
--WHERE LOWER(title) LIKE '%мой%' OR LOWER(title) LIKE '%my%';

--Условие 5 - Вариант 1--
SELECT title
FROM tracks
WHERE 
   title ILIKE 'my'            -- только слово
   OR title ILIKE 'my %'          -- слово в начале
   OR title ILIKE '% my'          -- слово в конце
   OR title ILIKE '% my %'        -- слово в середине
   OR title ILIKE 'мой'
   OR title ILIKE 'мой %'
   OR title ILIKE '% мой'
   OR title ILIKE '% мой %';

--Условие 5 - Вариант 2--
SELECT title
FROM tracks
WHERE string_to_array(lower(title), ' ') && ARRAY['my', 'мой'];

--Условие 5 - Вариант 3--
SELECT title
FROM tracks
WHERE title ~* '\m(my|мой)\M';



--ЗАДАНИЕ 3--
--1. Количество исполнителей в каждом жанре--
SELECT g.name AS genre, COUNT(*) AS artist_count
FROM genres g
JOIN artist_genre ag ON g.id = ag.genre_id
GROUP BY g.name;

--2. Количество треков в альбомах 2019–2020 годов--
SELECT COUNT(*) AS track_count
FROM tracks t
JOIN albums a ON t.album_id = a.id
WHERE a.release_year BETWEEN 2019 AND 2020;

--3. Средняя продолжительность треков по каждому альбому--
SELECT a.title AS album, ROUND(AVG(t.duration), 2) AS avg_duration
FROM albums a
JOIN tracks t ON a.id = t.album_id
GROUP BY a.title;

--4. Исполнители, не выпустившие альбомы в 2020 году--
SELECT ar.name
FROM artists ar
WHERE ar.id NOT IN (
    SELECT aa.artist_id
    FROM artist_album aa
    JOIN albums a ON aa.album_id = a.id
    WHERE a.release_year = 2020
);

--5. Названия сборников, в которых есть исполнитель Drake--
SELECT DISTINCT c.title AS compilation
FROM compilations c
JOIN compilation_track ct ON c.id = ct.compilation_id
JOIN tracks t ON ct.track_id = t.id
JOIN albums a ON t.album_id = a.id
JOIN artist_album aa ON a.id = aa.album_id
JOIN artists ar ON aa.artist_id = ar.id
WHERE ar.name = 'Drake';
