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
   firstName JOIN lastName AS full_name, city, phone
FROM
    students
WHERE
    firstName LIKE 'Kassandra%'
ORDER BY
    city ASC
;
-- Figure out how in the world JOIN is supposed to be used here

-- 5
SELECT
    ordNo AS order_number, ordName AS name, ordState AS state
FROM
    orderTbl
WHERE
    empNo LIKE 'E8544399'
;
-- This one is done

-- 6
SELECT
    buildingName AS building_name
FROM
    buildings
WHERE
    buildingName LIKE '_i%'
;
-- This one is done

-- 7
SELECT
    locationID
FROM
    sections
;
-- TBD

-- 8
SELECT
    professorId
FROM
    professors
;
--TBD

-- 9
SELECT
    assignmentNumber
FROM
    assignmentScore
;
-- TBD

-- 10
SELECT
    ordCity
FROM
    orderTbl
;
--TBD