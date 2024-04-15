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
WHERE
    prof.zip = 84144

UNION

SELECT
    stu.firstName AS first_name,
    stu.lastName AS last_name,
    stu.city AS city,
    'Student' AS role
FROM
    students stu
WHERE
    stu.zip = 84144
    
ORDER BY
    role ASC,
    last_name ASC,
    first_name ASC
;
-- This one is done

-- 4
WITH students_per_location AS
(
    SELECT
        COUNT(*) AS student_count,
        sec.locationID AS id
    FROM
        registration reg
    JOIN
        sections sec
    ON
        reg.sectionID = sec.sectionID
    GROUP BY
        sec.locationID
), sections_per_location AS
(
    SELECT
        COUNT(*) AS section_count,
        sec.locationID AS id
    FROM
        sections sec
    GROUP BY
        sec.locationID
)
SELECT
    sec.locationID AS location_id,
    spl.section_count AS sections,
    stpl.student_count AS students
FROM
    sections sec
JOIN
    students_per_location stpl
ON
    sec.sectionID = stpl.id
JOIN
    sections_per_location spl
ON
    sec.locationID = spl.id
WHERE
    sec.locationID > 8999
ORDER BY
    location_id ASC
;
-- Work on this one

-- 5
SELECT
    scr.assignmentTypeID AS assignment_type_id,
    scr.score AS score
FROM
    assignmentScore scr
WHERE
    scr.studentID = 1798
    AND scr.sectionID = 10813

UNION ALL

SELECT
    'Average for student ' || scr.studentID || ' is ' AS assignment_type_id,
    ROUND(AVG(scr.score), 2) AS score
FROM
    assignmentScore scr
WHERE
    scr.studentID = 1798
    AND scr.sectionID = 10813
GROUP BY
    scr.studentID

ORDER BY
    assignment_type_id DESC
;
-- This one is done

-- 6
SELECT
    cou.courseID AS course_id,
    cou.subjectCode || ' ' || cou.courseNumber AS course_info
FROM
    courses cou
WHERE
    cou.subjectCode = 'CS'
;
-- TBD

-- 7
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
    prof.firstName AS first_name,
    prof.lastName AS last_name,
    CASE
        WHEN loj.section_count IS NULL THEN 0
        ELSE loj.section_count
    END AS sections
FROM
    professors prof
LEFT OUTER JOIN
    sections_per_professor loj
ON
    prof.professorID = loj.id
WHERE
    prof.lastName > 'W'
ORDER BY
    last_name ASC
;
-- This one is done

-- 8
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
    CASE
        WHEN sps.classes IS NULL THEN 0
        ELSE sps.classes
    END AS enrollments
FROM
    students stu
LEFT OUTER JOIN
    sections_per_student sps
ON
    stu.studentID = sps.id
WHERE
    SUBSTR(stu.phone, 1, 3) = '406'
ORDER BY
    last_name ASC,
    first_name ASC
;
-- This one is done