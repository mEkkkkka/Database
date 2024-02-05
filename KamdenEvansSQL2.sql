-- Kamden Evans
-- SQL 2
-- 02/05/2024

-- 1
SELECT
    firstName || ' ' || lastName AS full_name, phone AS phone, zip AS zip
FROM
    students
WHERE
    city LIKE '%Medford%'
ORDER BY
    full_name ASC
;
-- This one is done

-- 2
SELECT
    firstName || ' ' || lastName AS full_name, phone AS phone, tuitionBalance AS balance
FROM
    students
WHERE
    phone LIKE '701%'
ORDER BY
    full_name ASC
;
-- This one is done

-- 3
SELECT
    UPPER(lastName) || ', ' || UPPER(SUBSTR(firstName, 1, 1)) || '.' AS student_name, LPAD(phone, 17, '*') AS phone, streetAddress AS street
FROM
    students
WHERE
    phone LIKE '623%'
ORDER BY
    student_name ASC
;
-- TBD

-- 4
SELECT
    studentID AS id, tuitionBalance AS balance
FROM
    students
WHERE
    MOD(tuitionBalance, 2) = 1 AND tuitionBalance > 9000 AND state = 'OR' 
ORDER BY
    tuitionBalance ASC
;
-- TBD

-- 5
SELECT DISTINCT
    zip as zip
FROM
    students
;
-- TBD

-- 6
SELECT
    studentID AS student_id, score AS score
FROM
    assignmentScore
;
-- TBD

-- 7
SELECT
    state AS state_name, state AS state, city AS city
FROM
    professors
;
-- TBD

-- 8
SELECT
    firstName || ' ' || lastName || ' ' || streetAddress || ' ' || city || ' ' || state || ' ' || zip AS student_address
FROM
    students
;
-- TBD

-- 9
SELECT
    studentID AS student_id, score AS score, sectionID AS section_id
FROM
    assignmentScore
;
-- TBD

-- 10
SELECT
    AS full_name, AS favorite_food, AS favorite_number, AS squared, AS length_of_name
FROM
    dual
;
-- TBD