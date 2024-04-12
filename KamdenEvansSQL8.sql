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
            TO_CHAR(MIN(stu.admissionDate), 'DD, MM, fmMonth') AS earliest_day
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
            TO_CHAR(MAX(prof.hireDate), 'DD, MM, fmMonth') AS latest_day
        FROM
            professors prof
    )

ORDER BY
    2 ASC,
    1 ASC
;
-- This one is done

-- 2
SELECT
    stu.lastName AS last_name
FROM
    students stu

INTERSECT

SELECT
    prof.lastName AS last_name
FROM
    professors prof
;
-- This one is done

-- 3
WITH max_capacities AS
(
    SELECT
        SUM(sec.capacity) AS total_capacity,
        sec.sectionID AS id
    FROM
        sections sec
    GROUP BY
        sec.sectionID
)
SELECT DISTINCT
    cou.courseID AS course_id,
    cou.subjectCode || ' ' || cou.courseNumber AS details,
    max.total_capacity AS total_capacity
FROM
    courses cou
JOIN
    sections sec
ON
    cou.courseID = sec.courseID
JOIN
    max_capacities max
ON
    sec.sectionID = max.id
WHERE
    max.total_capacity = 
    (
        SELECT
            MIN(sec.capacity) AS min_capacity
        FROM
            sections sec
    )
ORDER BY
    details ASC,
    total_capacity ASC
;
--TBD

-- 4
WITH sections_per_student AS
(
    SELECT
        COUNT(*) AS classes,
        reg.studentID AS id
    FROM
        registration reg
    GROUP BY
        reg.studentID
)
SELECT
    stu.studentID AS student_id,
    stu.firstName AS first_name,
    stu.lastName AS last_name,
    spc.classes AS most_classes
FROM
    students stu
JOIN
    sections_per_student spc
ON
    stu.studentID = spc.id
WHERE
    spc.classes = 
    (
        SELECT
            MAX(spc.classes) AS most_classes
        FROM
            sections_per_student spc
    )
ORDER BY
    last_name ASC,
    first_name ASC
;
-- This one is done

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
    stu.firstName AS first_name,
    stu.lastName AS last_name,
    cou.subjectCode || ' ' || cou.courseNumber AS description,
    sec.sectionID AS section_id
FROM
    courses cou
JOIN
    sections sec
ON
    cou.courseID = sec.courseID
JOIN
    registration reg
ON
    sec.sectionID = reg.sectionID
JOIN
    assignmentScore scr
ON
    reg.sectionID = scr.sectionID
    AND reg.studentID = scr.studentID
JOIN
    students stu
ON
    reg.studentID = stu.student_id
WHERE
    reg.studentID IN
    (
        SELECT
            scr.studentID AS id
        FROM
            assignmentScore scr
        WHERE
            scr.assignmentTypeID = 'MT'
            AND scr.score = 
            (
                SELECT
                    MIN(scr.score) AS min_score
                FROM
                    assignmentScore scr
                WHERE
                    scr.assignmentTypeID = 'MT'
            )
    )
ORDER BY
    last_name ASC,
    first_name ASC,
    description ASC
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