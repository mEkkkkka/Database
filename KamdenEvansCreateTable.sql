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
-- Check this one

-- Creating table artists
CREATE TABLE artists
(
    artist_id NUMBER(3) PRIMARY KEY,
    name VARCHAR2(120) NOT NULL
);
-- Check this one

-- Creating table genres
CREATE TABLE genres
(
    genre_id NUMBER(3) PRIMARY KEY,
    name VARCHAR2(120) NOT NULL
);
-- Check this one

-- Creating table media_types
CREATE TABLE media_types
(
    media_type_id NUMBER(3) PRIMARY KEY,
    name VARCHAR2(120) NOT NULL
);
-- Check this one

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
-- Check this one

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
-- Check this stuff

-- Inserting data into table albums
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

-- Inserting data into table artists

-- TBD

-- Inserting data into table genres

-- TBD

-- Inserting data into table media_types

-- TBD

-- Inserting data into table tracks

-- TBD