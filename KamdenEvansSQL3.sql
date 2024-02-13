-- Kamden Evans
-- SQL 3
-- 02/12/2024

-- 1
SELECT
    firstName || ' ' || lastName AS student_name,
    phone AS phone,
    TO_CHAR(admissionDate, YYYY) AS admit_year
FROM
    students
WHERE
    TO_CHAR(admissionDate, MM) = '06' || TO_CHAR(admissionDate, DD) = '13'
ORDER BY
    TO_CHAR(admissionDate, YYYY) ASC, lastName ASC
;
-- Check this one

-- 2
SELECT
    courseID AS course_id,
    sectionID AS section_id,
    TO_CHAR(sectionStartDate, HH) || ':' || TO_CHAR(sectionStartDate, MI) || ' ' || TO_CHAR(sectionStartDate, DDD) AS start_date_time
FROM
    sections
WHERE
    locationID = 8396
ORDER BY
    EXTRACT(sectionStartDate)
;
-- Check this one; almost definitely is wrong in at least one way

-- 3
SELECT
    courseID AS course_id
FROM
    sections
;
-- TBD

-- 4
SELECT
    finalClassGrade AS grade
FROM
    registration
;
-- TBD; use format mask

-- 5
SELECT
    'calculations will go ' || 'here' AS next_friday
FROM
    dual
;
-- TBD; next friday, half birthday, chinese zodiac year

-- 6
SELECT
    capacity AS capacity
FROM
    sections
;
-- TBD

-- 7
SELECT
    firstName || ' ' || lastName AS student_name
FROM
    students
;
-- TBD

-- 8
SELECT
    firstName AS first
FROM
    professors
;
-- TBD; dates will not match in all likelihood

-- 9
SELECT DISTINCT
    sectionStartDate AS time
FROM
    sections
;
-- TBD

-- 10
SELECT
    registrationDate AS enroll_time
FROM
    registration
;
-- TBD