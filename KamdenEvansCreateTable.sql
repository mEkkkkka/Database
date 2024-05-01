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
    fk_artists
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
    fk_albums
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
    fk_tracks_to_artists
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
    fk_media_types
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
    fk_genres
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
INSERT INTO albums (album_id, title, artist_id, year)
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
-- Check this one

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
-- Check this one

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
-- Check this one

-- Inserting data into table media_types
INSERT INTO media_types (media_type_id, name)
WITH media_type_stuff AS
(
    SELECT 1, 'MPEG audio file' FROM dual UNION ALL
    SELECT 2, 'Internet audio stream' FROM dual UNION ALL
    SELECT 3, 'AAC audio file' FROM dual UNION ALL
    SELECT 4, 'Purchased AAC audio file' FROM dual UNION ALL
    SELECT 5, 'PDF document' FROM dual UNION ALL
    SELECT 6, 'Protected AAC audio file' FROM
)
SELECT
    *
FROM
    media_type_stuff
;
-- Check this one

-- Inserting data into table tracks
INSERT INTO tracks (track_id, title, milliseconds, artist_id, album_id, genre_id, play_count, skip_count, composer, track_index, bytes, unit_price, media_type_id)
WITH track_stuff AS
(
    SELECT 18, 'Hurt', 219000, 65, 632, 11, 32, 0, NULL, 2, 3879731, 0, 1 FROM dual UNION ALL
    SELECT 24, 'Make You Smile', 225000, 28, 89, 3, 81, 3, NULL, NULL, 1992294, 0.99, 4 FROM dual UNION ALL
    SELECT 25, 'La Migra (Mas Espanol)', 174000, 55, 348, 3, 55, 0, NULL, 12, 2936013, 0.99, 4 FROM dual UNION ALL
    SELECT 34, 'Stars Come Out (Dillon Francis Remix)', 249000, 737, 200, 12, 5, 1, NULL, 1, 6291456, 0, 3 FROM dual UNION ALL
    SELECT 37, 'Christmas Eve Montage', 226000, 22, 85, 6, 15, 0, NULL, 15, 7864320, 0, 3 FROM dual UNION ALL
    SELECT 60, 'Please Don''t Leave Me', 232000, 38, 176, 2, 1, 2, 'P!nk &' || ' Max Martin', 5, 8703181, 0.99, 4 FROM dual UNION ALL
    SELECT 148, 'Shiver', 202000, 733, 192, 21, 12, 1, NULL, 1, 3460301, 0, 1 FROM dual UNION ALL
    SELECT 171, 'Promises', 257000, 119, 178, 14, 5, 0, NULL, 1, 8703181, 0, 1 FROM dual UNION ALL
    SELECT 184, 'Don''t Let Me Get Me (Radio Edit)', 211000, 38, 332, 2, 0, 1, 'P!nk &' || ' Dallas Austin', 2, 8178893, 0.99, 6 FROM dual UNION ALL
    SELECT 202, 'Running Out Of Angels (Demo)', 125000, 127, 186, 3, 69, 0, NULL, NULL, 1153434, 0.99, 4 FROM dual UNION ALL
    SELECT 236, 'Tempt My Trouble', 194000, 48, 342, 4, 8, 0, NULL, 1, 8283750, 1.99, 4 FROM dual UNION ALL
    SELECT 289, 'White Horse', 234000, 97, 443, 11, 0, 3, NULL, 5, 8703181, 0.99, 4 FROM dual UNION ALL
    SELECT 301, 'The Bog (Radio Mix)', 243000, 12, 74, 5, 70, 0, NULL, NULL, 2097152, 0, 1 FROM dual UNION ALL
    SELECT 344, 'Seether', 197000, 732, 191, 3, 13, 0, 'Nina Gordon', 3, 3670016, 0, 1 FROM dual UNION ALL
    SELECT 346, 'Untouched', 255000, 752, 435, 2, 42, 0, 'Toby Gad, Jessica Origliasso &' || ' Lisa Origliasso', 1, 4508877, 0.99, 6 FROM dual UNION ALL
    SELECT 390, '!Purple (Sasha v. The Light)', 495000, 120, 179, 19, 60, 1, NULL, NULL, 8283750, 0, 1 FROM dual UNION ALL
    SELECT 391, 'Feel Good Inc (Single Edit)', 221000, 46, 340, 4, 54, 0, NULL, 1, 3774874, 0.99, 6 FROM dual UNION ALL
    SELECT 759, 'Charlotte Sometimes (Single)', 253000, 13, 84, 3, 63, 0, NULL, NULL, 2202010, 0, 1 FROM dual UNION ALL
    SELECT 788, 'Solsbury Hill', 259000, 98, 685, 8, 66, 0, NULL, NULL, 2306867, 0, 1 FROM dual UNION ALL
    SELECT 798, 'For A Pessimist, I''m Pretty Optimistic', 217000, 32, 93, 3, 68, 0, NULL, NULL, 1992294, 0.99, 4 FROM dual UNION ALL
    SELECT 31611, 'Soul Meets Body', 231000, 95, 198, 3, 65, 0, NULL, NULL, 1992294, 0, 1 FROM dual UNION ALL
    SELECT 43173, 'Twas the Night Before Xmas', 248000, 126, 185, 3, 1, 0, NULL, NULL, 4194304, 0, 1 FROM dual
)
SELECT
    *
FROM
    track_stuff
;
-- Check this one