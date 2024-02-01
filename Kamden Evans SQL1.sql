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
-- Figure out how in the world you are supposed to combine two columns into one and rename the new column

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
    courseID AS course, sectionID AS section, locationID AS location
FROM
    sections
WHERE
    capacity = 20 AND locationID BETWEEN 100 AND 1000 OR capacity = 40 AND locationID BETWEEN 100 AND 1000
ORDER BY
    locationID ASC, sectionID DESC
;
-- This one is done

-- 8
SELECT
    professorID AS id, lastName AS last_name, phone AS phone
FROM
    professors
WHERE
    city IN ('Bend', 'Lake Oswego')
ORDER BY
    hireDate ASC
;
-- This one is done

-- 9
SELECT
    studentID AS student, score AS score
FROM
    assignmentScore
ORDER BY
    studentID ASC, score ASC
;
-- Check this one

-- 10
SELECT
    ordName AS name, ordCity AS city
FROM
    orderTbl
WHERE
    empNo 
;
-- Finish the WHERE area