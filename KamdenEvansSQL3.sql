-- Kamden Evans
-- SQL 3
-- 02/12/2024

-- 1
SELECT
    firstName || ' ' || lastName AS student_name, phone AS phone, admissionDate AS admit_year
FROM
    students
;
-- TBD

-- 2
SELECT
    courseID AS course_id
FROM
    sections
;
-- TBD

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