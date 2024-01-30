-- Kamden Evans
-- SQL 1
-- 01/30/2024


-- 1
SELECT
    prodName,
    prodMtg,
    prodPrice
FROM
    product
ORDER BY
    prodMtg ASC
;

-- 2
SELECT DISTINCT
    ordCity
FROM 
    orderTbl
ORDER BY
    ordCity DESC
;

-- 3
SELECT
    custFirstName,
    custLastName
FROM
    customer
;

-- 4
SELECT
    firstName
FROM
    students
;

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