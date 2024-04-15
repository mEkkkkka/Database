-- Kamden Evans
-- SQL 9
-- 04/15/2024

-- 1
WITH sections_per_professor AS
(
    SELECT
        COUNT(*) AS section_count,
        sec.professorID AS id
    FROM
        sections sec
    GROUP BY
        sec.professorID
)
SELECT
    prof.professorID AS professor_id,
    prof.lastName AS last_name,
    prof.firstName AS first_name,
    spp.section_count AS num_sections
FROM
    professors prof
JOIN
    sections_per_professor spp
ON
    prof.professorID = spp.id
WHERE
    spp.section_count = 
    (
        SELECT
            MAX(spp.section_count) AS max_sections
        FROM
            sections_per_professor spp
    )
;
-- This one is done

-- 2
SELECT
    prof.zip AS zip,
    prof.firstName AS first_name,
    prof.lastName AS last_name
FROM
    professors prof
;
-- TBD

-- 3
SELECT
    prof.firstName AS first_name,
    prof.lastName AS last_name,
    prof.city AS city,
    'Instructor' AS role
FROM
    professors prof

UNION

SELECT
    stu.firstName AS first_name,
    stu.lastName AS last_name,
    stu.city AS city,
    'Student' AS role
FROM
    students stu
;
-- TBD

-- 4
SELECT
    loc.locationID AS location_id
FROM
    locations loc
;
-- TBD

-- 5
SELECT
    scr.assignmentTypeID AS assignment_type_id,
    scr.score AS score
FROM
    assginmentScore scr
WHERE
    scr.studentID = 1798
    AND scr.sectionID = 10813

UNION

SELECT
    'Average for student ' || scr.studentID || ' is ' AS assignment_type_id,
    AVG(scr.score) AS score
FROM
    assignmentScore scr
WHERE
    scr.studentID = 1798
    AND scr.sectionID = 10813
;
-- TBD

-- 6
SELECT
    cou.courseID AS course_id,
    cou.subjectCode || ' ' || cou.courseNumber AS course_info
FROM
    courses cou
;
-- TBD

-- 7
SELECT
    prof.firstName AS first_name,
    prof.lastName AS last_name
FROM
    professors prof
;
-- TBD

-- 8
SELECT
    stu.studentID AS student_id,
    stu.firstName AS first_name,
    stu.lastName AS last_name
FROM
    students stu
;
-- TBD