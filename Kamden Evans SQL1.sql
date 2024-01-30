-- Kamden Evans
-- SQL 1
-- 01/30/2024


-- 1
SELECT
    prodName AS product,
    prodMfg AS manufacturer,
    prodPrice AS price
FROM
    product
ORDER BY
    prodMfg ASC
;
-- This one is done

-- 2
SELECT DISTINCT
    ordCity AS city
FROM 
    orderTbl
ORDER BY
    ordCity DESC
;
-- This one is done

-- 3
SELECT
    custFirstName AS first_name,
    custLastName AS last_name
FROM
    customer
WHERE
    custLastName LIKE 'W%'
ORDER BY
    custLastName ASC
;
-- This one is done

-- 4
SELECT
    firstName
FROM
    students
UNION
SELECT
    lastName AS full_name
FROM
    students
SELECT
    city AS city,
    phone AS phone
WHERE
    firstName LIKE 'Kassandra%'
ORDER BY
    city ASC
;
--UNION shouldn't be needed; figure out how to combine the columns

-- 5
SELECT
    empNo
FROM
    orderTbl
;

-- 6
SELECT
    buildingName
FROM
    buildings
;

-- 7
SELECT
    locationID
FROM
    sections
;

-- 8
SELECT
    professorId
FROM
    professors
;

-- 9
SELECT
    assignmentNumber
FROM
    assignmentScore
;

-- 10
SELECT
    ordCity
FROM
    orderTbl
;