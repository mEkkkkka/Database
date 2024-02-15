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
    EXTRACT(DAY FROM sectionStartDate) DESC,
    TO_CHAR(sectionStartDate, 'HH') DESC
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
    NEXT_DAY(SYSDATE, 'FRIDAY') || ' is the next Friday' AS next_friday,
    TO_CHAR((TO_DATE('September 15, 2023, 08:00', 'Month DD, YYYY, HH24:MI') + 182.625), 'fmDay Month fmDdspth, YYYY HH24:MI') ||  ' is my next half birthday' AS half_birthday,
    'This is a year of the ' || CASE
        WHEN MOD(EXTRACT(YEAR FROM SYSDATE), 12) = 4 THEN 'Rat'
        WHEN MOD(EXTRACT(YEAR FROM SYSDATE), 12) = 5 THEN 'Ox'
        WHEN MOD(EXTRACT(YEAR FROM SYSDATE), 12) = 6 THEN 'Tiger'
        WHEN MOD(EXTRACT(YEAR FROM SYSDATE), 12) = 7 THEN 'Rabbit'
        WHEN MOD(EXTRACT(YEAR FROM SYSDATE), 12) = 8 THEN 'Dragon'
        WHEN MOD(EXTRACT(YEAR FROM SYSDATE), 12) = 9 THEN 'Snake'
        WHEN MOD(EXTRACT(YEAR FROM SYSDATE), 12) = 10 THEN 'Horse'
        WHEN MOD(EXTRACT(YEAR FROM SYSDATE), 12) = 11 THEN 'Sheep'
        WHEN MOD(EXTRACT(YEAR FROM SYSDATE), 12) = 0 THEN 'Monkey'
        WHEN MOD(EXTRACT(YEAR FROM SYSDATE), 12) = 1 THEN 'Rooster'
        WHEN MOD(EXTRACT(YEAR FROM SYSDATE), 12) = 2 THEN 'Dog'
        ELSE 'Pig'
    END AS chinese_zodiac
FROM
    dual
;
-- This one is done

-- 6
SELECT
    courseID AS course_id,
    sectionID AS section_id,
    sectionStartDate AS section_st,
    capacity AS capacity
FROM
    sections
WHERE
    TO_CHAR(SectionStartDate, 'YYYY') LIKE '%2019%'
    AND TO_CHAR(SectionStartDate, 'HH:MI') LIKE '%07:30%'
    AND (TO_CHAR(SectionStartDate, 'Month') LIKE '%May%'
    OR TO_CHAR(SectionStartDate, 'Month') LIKE '%June%'
    OR TO_CHAR(SectionStartDate, 'Month') LIKE '%July%')
ORDER BY
    capacity ASC, section_id ASC, course_id ASC, section_st ASC
;
-- This one is done

-- 7
SELECT
    firstName || ' ' || lastName AS student_name
FROM
    students
WHERE
    (TO_CHAR(admissionDate, 'DD') LIKE '%13%'
    OR TO_CHAR(admissionDate, 'DD') LIKE '%29%')
    AND TO_CHAR(admissionDate, 'YYYY') LIKE '%2022%'
ORDER BY
    lastName ASC
;
-- This one is done

-- 8
SELECT
    firstName AS first,
    lastName AS last,
    ROUND(MONTHS_BETWEEN(SYSDATE, hireDate), 2) AS employed
FROM
    professors
WHERE
    phone LIKE '701%'
ORDER BY
    employed DESC
;
-- This one is done

-- 9
SELECT DISTINCT
    CASE
        WHEN TO_CHAR(sectionStartDate, 'HH24') < 12 THEN TO_CHAR(sectionStartDate, 'HH24:MI') || ' AM'
        ELSE TO_CHAR(sectionStartDate, 'HH24:MI') || 'PM'
    END AS time
FROM
    sections
ORDER BY
    time ASC
;
-- This one is done

-- 10
SELECT
    TO_CHAR(registrationDate, 'HH:MI') || ' PM' AS enroll_time,
    studentID AS student_id,
    sectionID AS section
FROM
    registration
WHERE
    TO_CHAR(registrationDate, 'HH24:MI') LIKE '%13:35%'
ORDER BY
    student_id DESC
;
-- This one is done