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
-- This one is done

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
-- This one is done

-- 5
SELECT DISTINCT
    zip as zip
FROM
    students
WHERE
    city = 'Las Vegas'
ORDER BY
    zip ASC
;
-- This one is done

-- 6
SELECT
    studentID AS student_id, score AS score, 
    CASE 
        WHEN score > 69 THEN 'PASS'
        ELSE 'FAIL'
    END AS result
FROM
    assignmentScore
WHERE
    sectionID = 10702 AND assignmentTypeID = 'FI'
ORDER BY
    score DESC
;
-- This one is done

-- 7
SELECT
    CASE
        WHEN state = 'NM' THEN 'New Mexico'
        WHEN state = 'ND' THEN 'North Dakota'
        WHEN state = 'UT' THEN 'Utah'
        WHEN state = 'MT' THEN 'Montana'
        WHEN state = 'SD' THEN 'South Dakota'
        ELSE 'Who knows'
    END AS state_name, 
     state AS state, city AS city
FROM
    professors
WHERE
    (SUBSTR(firstName, 1, 1) = 'P' OR SUBSTR(lastName, 1, 1) = 'L') AND (state = 'NM' OR state = 'ND' OR state = 'UT' OR state = 'MT' OR state = 'SD')
ORDER BY
    state ASC
;
-- This one is done

-- 8
SELECT
    firstName || ' ' || lastName || ' ' || streetAddress || ' ' || city || ' ' || state || ' ' || zip AS student_address
FROM
    students
WHERE
    state = 'UT' AND ROUND(zip, -2) >= 84500
ORDER BY
    firstName ASC
;
-- This one is done

-- 9
SELECT
    studentID AS student_id, score AS score, sectionID AS section_id
FROM
    assignmentScore
;
-- DO THIS!!!!!!!

-- 10
SELECT
    CONCAT('Kamden ', 'Evans') AS full_name, CONCAT('Mac n', ' cheese') AS favorite_food, CONCAT('66','6') AS favorite_number, CONCAT('443','556') AS squared, LENGTH(CONCAT('Kamden ', 'Evans')) AS length_of_name
FROM
    dual
;
-- This one is done