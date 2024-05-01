-- Kamden Evans
-- SQL 11
-- 04/29/2024

-- Creating table albums
CREATE TABLE albums
(
    album_id NUMBER(3) PRIMARY KEY,
    title VARCHAR2(160) NOT NULL,
    artist_id NUMBER(3) NOT NULL,
    year DATE
);
-- This one is done

-- Creating table artists
CREATE TABLE artists
(
    artist_id NUMBER(3) PRIMARY KEY,
    name VARCHAR2(120) NOT NULL
);
-- This one is done

-- Creating table genres
CREATE TABLE genres
(
    genre_id NUMBER(3) PRIMARY KEY,
    name VARCHAR2(120) NOT NULL
);
-- This one is done

-- Creating table media_types
CREATE TABLE media_types
(
    media_type_id NUMBER(3) PRIMARY KEY,
    name VARCHAR2(120) NOT NULL
);
-- This one is done

-- Creating table tracks
CREATE TABLE tracks
(
    track_id NUMBER(5) PRIMARY KEY,
    name VARCHAR2(200) NOT NULL,
    album_id NUMBER(3) NOT NULL,
    artist_id NUMBER(3),
    media_type_id NUMBER(3) NOT NULL,
    genre_id NUMBER(3) NOT NULL,
    composer VARCHAR2(220),
    milliseconds NUMBER(10) NOT NULL,
    bytes NUMBER(10) NOT NULL,
    unit_price NUMBER(10,2) NOT NULL,
    play_count NUMBER(3) NOT NULL,
    skip_count NUMBER(4) NOT NULL,
    track_index NUMBER(3)
);
-- This one is done

-- SAVEPOINT tables_created

-- Creating foreign keys
ALTER TABLE
    albums
ADD CONSTRAINT
    fk_albums_artists
FOREIGN KEY
    (artist_id)
REFERENCES
    artists (artist_id)
ON DELETE
    CASCADE
;

ALTER TABLE
    tracks
ADD CONSTRAINT
    fk_tracks_albums
FOREIGN KEY
    (album_id)
REFERENCES
    albums (album_id)
ON DELETE
    CASCADE
;
ALTER TABLE
    tracks
ADD CONSTRAINT
    fk_tracks_artists
FOREIGN KEY
    (artist_id)
REFERENCES
    artists (artist_id)
ON DELETE
    CASCADE
;
ALTER TABLE
    tracks
ADD CONSTRAINT
    fk_tracks_media_types
FOREIGN KEY
    (media_type_id)
REFERENCES
    media_types (media_type_id)
ON DELETE
    CASCADE
;
ALTER TABLE
    tracks
ADD CONSTRAINT
    fk_tracks_genres
FOREIGN KEY
    (genre_id)
REFERENCES
    genres (genre_id)
ON DELETE
    CASCADE
;
-- This stuff is done

-- SAVEPOINT fks_created

-- IMPORTANT: ALL BLANK NEED NULL

-- Inserting data into table albums
INSERT INTO albums (album_id, title, year, artist_id)
WITH album_stuff AS
(
    SELECT 74, 'The Bog / I-Q', NULL, 12 FROM dual UNION ALL
    SELECT 84, 'Faith (2005 Remaster Deluxe Edition)', TO_DATE('2005', 'YYYY'), 13 FROM dual UNION ALL
    SELECT 85, 'Nightmare Revisited', TO_DATE('2008', 'YYYY'), 22 FROM dual UNION ALL
    SELECT 89, 'When Your Heart Stops Beating (Explicit)', TO_DATE('2002', 'YYYY'), 28 FROM dual UNION ALL
    SELECT 93, 'RIOT!', NULL, 32 FROM dual UNION ALL
    SELECT 176, 'Funhouse (Deluxe Version)', TO_DATE('2008', 'YYYY'), 38 FROM dual UNION ALL
    SELECT 178, 'Ultra Dubstep', TO_DATE('2013', 'YYYY'), 119 FROM dual UNION ALL
    SELECT 179, 'Tranceport (Paul Oakenfold)', TO_DATE('1998', 'YYYY'), 120 FROM dual UNION ALL
    SELECT 185, 'no title', TO_DATE('1991', 'YYYY'), 126 FROM dual UNION ALL
    SELECT 186, 'This Year''s Model', NULL, 127 FROM dual UNION ALL
    SELECT 191, 'American Thighs', TO_DATE('1994', 'YYYY'), 732 FROM dual UNION ALL
    SELECT 192, 'Thirteen', TO_DATE('2001', 'YYYY'), 733 FROM dual UNION ALL
    SELECT 198, 'Plans', NULL, 95 FROM dual UNION ALL
    SELECT 200, 'Stars Come Out (Dillon Francis Remix)', TO_DATE('2012', 'YYYY'), 737 FROM dual UNION ALL
    SELECT 332, 'M!Ssundaztood', TO_DATE('2001', 'YYYY'), 38 FROM dual UNION ALL
    SELECT 340, 'Feel Good Inc - Single', TO_DATE('2005', 'YYYY'), 46 FROM dual UNION ALL
    SELECT 342, 'Church Of Scars', NULL, 48 FROM dual UNION ALL
    SELECT 343, 'The Very Best of Sheryl Crow', NULL, 49 FROM dual UNION ALL
    SELECT 348, 'Who Is, This Is?', TO_DATE('1990', 'YYYY'), 55 FROM dual UNION ALL
    SELECT 435, 'Hook Me Up', TO_DATE('2007', 'YYYY'), 752 FROM dual UNION ALL
    SELECT 443, 'Fearless', TO_DATE('2008', 'YYYY'), 97 FROM dual UNION ALL
    SELECT 632, 'American IV - The Man Comes Around', NULL, 65 FROM dual UNION ALL
    SELECT 685, 'Hits! The Very Best Of Erasure', NULL, 98 FROM dual
)
SELECT
    *
FROM
    album_stuff
;
-- This one is done

-- Inserting data into table artists
INSERT INTO artists (artist_id, name)
WITH artist_stuff AS
(
    SELECT 12, 'Bigod 20' FROM dual UNION ALL
    SELECT 13, 'The Cure' FROM dual UNION ALL
    SELECT 22, 'RJD2' FROM dual UNION ALL
    SELECT 28, '(+44)' FROM dual UNION ALL
    SELECT 32, 'Paramore' FROM dual UNION ALL
    SELECT 38, 'P!nk' FROM dual UNION ALL
    SELECT 46, 'Gorillaz' FROM dual UNION ALL
    SELECT 48, 'Bishop Briggs' FROM dual UNION ALL
    SELECT 49, 'Sheryl Crow' FROM dual UNION ALL
    SELECT 55, 'Voodoo Glow Skulls' FROM dual UNION ALL
    SELECT 65, 'Johnny Cash' FROM dual UNION ALL
    SELECT 95, 'Death Cab For Cutie' FROM dual UNION ALL
    SELECT 97, 'Taylor Swift' FROM dual UNION ALL
    SELECT 98, 'Erasure' FROM dual UNION ALL
    SELECT 119, 'Nero' FROM dual UNION ALL
    SELECT 120, 'Gus Gus' FROM dual UNION ALL
    SELECT 126, 'Henry Rollins' FROM dual UNION ALL
    SELECT 127, 'Elvis Costello' FROM dual UNION ALL
    SELECT 732, 'Veruca Salt' FROM dual UNION ALL
    SELECT 733, 'Horny Toad!' FROM dual UNION ALL
    SELECT 737, 'Zedd' FROM dual UNION ALL
    SELECT 752, 'The Veronicas' FROM dual
)
SELECT
    *
FROM
    artist_stuff
;
-- This one is done

-- Inserting data into table genres
INSERT INTO genres (genre_id, name)
WITH genre_stuff AS
(
    SELECT 1, 'Sound Effect' FROM dual UNION ALL
    SELECT 2, 'Pop' FROM dual UNION ALL
    SELECT 3, 'Rock' FROM dual UNION ALL
    SELECT 4, 'Alternative' FROM dual UNION ALL
    SELECT 5, 'Industrial' FROM dual UNION ALL
    SELECT 6, 'Soundtrack' FROM dual UNION ALL
    SELECT 7, 'Holiday' FROM dual UNION ALL
    SELECT 8, 'Dance - Electronica' FROM dual UNION ALL
    SELECT 9, 'Unknown Genre' FROM dual UNION ALL
    SELECT 10, 'Tween' FROM dual UNION ALL
    SELECT 11, 'Country' FROM dual UNION ALL
    SELECT 12, 'Electronic' FROM dual UNION ALL
    SELECT 13, 'Blues' FROM dual UNION ALL
    SELECT 14, 'Dance' FROM dual UNION ALL
    SELECT 15, 'Comedy' FROM dual UNION ALL
    SELECT 16, 'Punk' FROM dual UNION ALL
    SELECT 17, 'Classical' FROM dual UNION ALL
    SELECT 18, 'Hard Rock' FROM dual UNION ALL
    SELECT 19, 'Trance' FROM dual UNION ALL
    SELECT 20, 'Hip-Hop - Rap' FROM dual UNION ALL
    SELECT 21, 'Ska' FROM dual UNION ALL
    SELECT 22, 'Other' FROM dual
)
SELECT
    *
FROM
    genre_stuff
;
-- This one is done

-- Inserting data into table media_types
INSERT INTO media_types (media_type_id, name)
WITH media_type_stuff AS
(
    SELECT 1, 'MPEG audio file' FROM dual UNION ALL
    SELECT 2, 'Internet audio stream' FROM dual UNION ALL
    SELECT 3, 'AAC audio file' FROM dual UNION ALL
    SELECT 4, 'Purchased AAC audio file' FROM dual UNION ALL
    SELECT 5, 'PDF document' FROM dual UNION ALL
    SELECT 6, 'Protected AAC audio file' FROM dual
)
SELECT
    *
FROM
    media_type_stuff
;
-- This one is done

-- Inserting data into table tracks
INSERT INTO tracks (track_id, name, milliseconds, artist_id, album_id, genre_id, play_count, skip_count, composer, track_index, bytes, unit_price, media_type_id)
WITH track_stuff AS
(
    SELECT 18 AS track_id, 'Hurt' AS title, 219000 AS milliseconds, 65 AS artist_id, 632 AS album_id, 11 AS genre_id, 32 AS play_count, 0 AS skip_count, NULL AS composer, 2 AS track_index, 3879731 AS bytes, 0 AS unit_price, 1 AS media_type_id FROM dual UNION ALL
    SELECT 24 AS track_id, 'Make You Smile' AS title, 225000 AS milliseconds, 28 AS artist_id, 89 AS album_id, 3 AS genre_id, 81 AS play_count, 3 AS skip_count, NULL AS composer, NULL AS track_index, 1992294 AS bytes, 0.99 AS unit_price, 4 AS media_type_id FROM dual UNION ALL
    SELECT 25 AS track_id, 'La Migra (Mas Espanol)' AS title, 174000 AS milliseconds, 55 AS artist_id, 348 AS album_id, 3 AS genre_id, 55 AS play_count, 0 AS skip_count, NULL AS composer, 12 AS track_index, 2936013 AS bytes, 0.99 AS unit_price, 4 AS media_type_id FROM dual UNION ALL
    SELECT 34 AS track_id, 'Stars Come Out (Dillon Francis Remix)' AS title, 249000 AS milliseconds, 737 AS artist_id, 200 AS album_id, 12 AS genre_id, 5 AS play_count, 1 AS skip_count, NULL AS composer, 1 AS track_index, 6291456 AS bytes, 0 AS unit_price, 3 AS media_type_id FROM dual UNION ALL
    SELECT 37 AS track_id, 'Christmas Eve Montage' AS title, 226000 AS milliseconds, 22 AS artist_id, 85 AS album_id, 6 AS genre_id, 15 AS play_count, 0 AS skip_count, NULL AS composer, 15 AS track_index, 7864320 AS bytes, 0 AS unit_price, 3 AS media_type_id FROM dual UNION ALL
    SELECT 60 AS track_id, 'Please Don''t Leave Me' AS title, 232000 AS milliseconds, 38 AS artist_id, 176 AS album_id, 2 AS genre_id, 1 AS play_count, 2 AS skip_count, 'P!nk &' || ' Max Martin' AS composer, 5 AS track_index, 8703181 AS bytes, 0.99 AS unit_price, 4 AS media_type_id FROM dual UNION ALL
    SELECT 148 AS track_id, 'Shiver' AS title, 202000 AS milliseconds, 733 AS artist_id, 192 AS album_id, 21 AS genre_id, 12 AS play_count, 1 AS skip_count, NULL AS composer, 1 AS track_index, 3460301 AS bytes, 0 AS unit_price, 1 AS media_type_id FROM dual UNION ALL
    SELECT 171 AS track_id, 'Promises', 257000 AS milliseconds, 119 AS artist_id, 178 AS album_id, 14 AS genre_id, 5 AS play_count, 0 AS skip_count, NULL AS composer, 1 AS track_index, 8703181 AS bytes, 0 AS unit_price, 1 AS media_type_id FROM dual UNION ALL
    SELECT 184 AS track_id, 'Don''t Let Me Get Me (Radio Edit)' AS title, 211000 AS milliseconds, 38 AS artist_id, 332 AS album_id, 2 AS genre_id, 0 AS play_count, 1 AS skip_count, 'P!nk &' || ' Dallas Austin' AS composer, 2 AS track_index, 8178893 AS bytes, 0.99 AS unit_price, 6 AS media_type_id FROM dual UNION ALL
    SELECT 202 AS track_id, 'Running Out Of Angels (Demo)' AS title, 125000 AS milliseconds, 127 AS artist_id, 186 AS album_id, 3 AS genre_id, 69 AS play_count, 0 AS skip_count, NULL AS composer, NULL AS track_index, 1153434 AS bytes, 0.99 AS unit_price, 4 AS media_type_id FROM dual UNION ALL
    SELECT 236 AS track_id, 'Tempt My Trouble' AS title, 194000 AS milliseconds, 48 AS artist_id, 342 AS album_id, 4 AS genre_id, 8 AS play_count, 0 AS skip_count, NULL AS composer, 1 AS track_index, 8283750 AS bytes, 1.99 AS unit_price, 4 AS media_type_id FROM dual UNION ALL
    SELECT 289 AS track_id, 'White Horse' AS title, 234000 AS milliseconds, 97 AS artist_id, 443 AS album_id, 11 AS genre_id, 0 AS play_count, 3 AS skip_count, NULL AS composer, 5 AS track_index, 8703181 AS bytes, 0.99 AS unit_price, 4 AS media_type_id FROM dual UNION ALL
    SELECT 301 AS track_id, 'The Bog (Radio Mix)' AS title, 243000 AS milliseconds, 12 AS artist_id, 74 AS album_id, 5 AS genre_id, 70 AS play_count, 0 AS skip_count, NULL AS composer, NULL AS track_index, 2097152 AS bytes, 0 AS unit_price, 1 AS media_type_id FROM dual UNION ALL
    SELECT 344 AS track_id, 'Seether' AS title, 197000 AS milliseconds, 732 AS artist_id, 191 AS album_id, 3 AS genre_id, 13 AS play_count, 0 AS skip_count, 'Nina Gordon' AS composer, 3 AS track_index, 3670016 AS bytes, 0 AS unit_price, 1 AS media_type_id FROM dual UNION ALL
    SELECT 346 AS track_id, 'Untouched' AS title, 255000 AS milliseconds, 752 AS artist_id, 435 AS album_id, 2 AS genre_id, 42 AS play_count, 0 AS skip_count, 'Toby Gad, Jessica Origliasso &' || ' Lisa Origliasso' AS composer, 1 AS track_index, 4508877 AS bytes, 0.99 AS unit_price, 6 AS media_type_id FROM dual UNION ALL
    SELECT 390 AS track_id, '!Purple (Sasha v. The Light)' AS title, 495000 AS milliseconds, 120 AS artist_id, 179 AS album_id, 19 AS genre_id, 60 AS play_count, 1 AS skip_count, NULL AS composer, NULL AS track_index, 8283750 AS bytes, 0 AS unit_price, 1 AS media_type_id FROM dual UNION ALL
    SELECT 391 AS track_id, 'Feel Good Inc (Single Edit)' AS title, 221000 AS milliseconds, 46 AS artist_id, 340 AS album_id, 4 AS genre_id, 54 AS play_count, 0 AS skip_count, NULL AS composer, 1 AS track_index, 3774874 AS bytes, 0.99 AS unit_price, 6 AS media_type_id FROM dual UNION ALL
    SELECT 759 AS track_id, 'Charlotte Sometimes (Single)' AS title, 253000 AS milliseconds, 13 AS artist_id, 84 AS album_id, 3 AS genre_id, 63 AS play_count, 0 AS skip_count, NULL AS composer, NULL AS track_index, 2202010 AS bytes, 0 AS unit_price, 1 AS media_type_id FROM dual UNION ALL
    SELECT 788 AS track_id, 'Solsbury Hill' AS title, 259000 AS milliseconds, 98 AS artist_id, 685 AS album_id, 8 AS genre_id, 66 AS play_count, 0 AS skip_count, NULL AS composer, NULL AS track_index, 2306867 AS bytes, 0 AS unit_price, 1 AS media_type_id FROM dual UNION ALL
    SELECT 798 AS track_id, 'For A Pessimist, I''m Pretty Optimistic' AS title, 217000 AS milliseconds, 32 AS artist_id, 93 AS album_id, 3 AS genre_id, 68 AS play_count, 0 AS skip_count, NULL AS composer, NULL AS track_index, 1992294 AS bytes, 0.99 AS unit_price, 4 AS media_type_id FROM dual UNION ALL
    SELECT 31611 AS track_id, 'Soul Meets Body' AS title, 231000 AS milliseconds, 95 AS artist_id, 198 AS album_id, 3 AS genre_id, 65 AS play_count, 0 AS skip_count, NULL AS composer, NULL AS track_index, 1992294 AS bytes, 0 AS unit_price, 1 AS media_type_id FROM dual UNION ALL
    SELECT 43173 AS track_id, 'Twas the Night Before Xmas' AS title, 248000 AS milliseconds, 126 AS artist_id, 185 AS album_id, 3 AS genre_id, 1 AS play_count, 0 AS skip_count, NULL AS composer, NULL AS track_index, 4194304 AS bytes, 0 AS unit_price, 1 AS media_type_id FROM dual
)
SELECT
    *
FROM
    track_stuff
;
-- This one is done