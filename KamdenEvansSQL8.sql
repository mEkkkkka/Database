-- Kamden Evans
-- SQL 8
-- 04/11/2024

-- 1
SELECT
    stu.firstName AS first_name,
    stu.lastName AS last_name,
    'Student' AS role
FROM
    students stu
WHERE
    TO_CHAR(stu.admissionDate, 'DD, MM, fmMonth') = 
    (
        SELECT
            MIN(TO_CHAR(stu.admissionDate, 'DD, MM, fmMonth')) AS earliest_day
        FROM
            students stu
    )

UNION

SELECT
    prof.firstName AS first_name,
    prof.lastName AS last_name,
    'Professor' AS role
FROM
    professors prof
WHERE
    TO_CHAR(prof.hireDate, 'DD, MM, fmMonth') = 
    (
        SELECT
            MAX(TO_CHAR(prof.hireDate, 'DD, MM, fmMonth')) AS latest_day
        FROM
            professors prof
    )

ORDER BY
    2 ASC,
    1 ASC
;
--TBD

-- 2
SELECT
    stu.lastName
FROM
    students stu
;
--TBD

-- 3
SELECT
    cou.subjectCode
FROM
    courses cou
;
--TBD

-- 4
SELECT
    stu.studentID,
    stu.firstName,
    stu.lastName
FROM
    students stu
;
--TBD

-- 5
SELECT
    cou.subjectCode,
    cou.courseNumber
FROM
    courses cou
;
--TBD

-- 6
SELECT
    stu.firstName,
    stu.lastName
FROM
    students stu
;
--TBD

-- 7
SELECT
    cou.subjectCode || ' ' || cou.courseNumber
FROM
    courses cou
;
--TBD

-- 8
SELECT
    
    sec.sectionID AS section_id,
    cou.subjectCode || ' ' || cou.courseNumber AS course_info,
    sec.capacity AS capacity
FROM
    courses cou
JOIN
    sections sec
ON
    cou.courseID = sec.sectionID
;
--TBD

-- 9
SELECT
    stu.firstName || ' ' || stu.lastName
FROM
    students stu
;
--TBD