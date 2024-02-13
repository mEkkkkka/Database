-- Kamden Evans
-- SQL 3
-- 02/12/2024

-- 1
SELECT
    firstName || ' ' || lastName AS student_name,
    phone AS phone,
    TO_CHAR(admissionDate, 'YYYY') AS admit_year
FROM
    students
WHERE
    TO_CHAR(admissionDate, 'MM') = '06' AND TO_CHAR(admissionDate, 'DD') = '13'
ORDER BY
    TO_CHAR(admissionDate, 'YYYY') ASC, lastName ASC
;
-- This one is done

-- 2
SELECT
    courseID AS course_id,
    sectionID AS section_id,
    TO_CHAR(sectionStartDate, 'HH:MI DD/MM/YYYY')  AS start_date_time
FROM
    sections
WHERE
    locationID = 8396
ORDER BY
    EXTRACT(YEAR FROM sectionStartDate) DESC,
    EXTRACT(MONTH FROM sectionStartDate) DESC,
    EXTRACT(DAY from sectionStartDate) DESC
;
-- This one is done

-- 3
SELECT
    courseID AS course_id,
    sectionID AS section_id,
    TO_CHAR(sectionStartDate, 'DD-Mon-RR') AS section_st,
    professorID AS professor_id,
    capacity AS capacity
FROM
    sections
WHERE
    MOD(EXTRACT(DAY FROM sectionStartDate), 2) = 1
    AND TO_CHAR(sectionStartDate, 'MON') = 'AUG'
    AND EXTRACT(YEAR FROM sectionStartDate) = 2020
    AND MOD(courseID, 5) = 0
    AND MOD(professorID, 2) = 0
ORDER BY
    course_id DESC,
    section_id DESC
;
-- This one is done

-- 4
SELECT
    studentID as student,
    sectionID as section,
    finalClassGrade AS grade
FROM
    registration
WHERE
    TO_CHAR(registrationDate, 'MON YYYY') = 'SEP 2020'
    AND finalClassGrade NOT LIKE '%W%'
ORDER BY
    grade ASC,
    section ASC
;
-- This one is done

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