-- Kamden Evans
-- SQL 6
-- 03/18/2024

-- 1
SELECT
    stu.lastName || ', ' || SUBSTR(stu.firstName, 1, 1) AS student
FROM
    students stu
WHERE
    stu.tuitionBalance < 
    (
        SELECT
            AVG(stu.tuitionBalance)
        FROM
            students stu
    )
    AND
    SUBSTR(stu.lastName, 1, 1) = 'Z'
;
-- This one is done

-- 2
SELECT
    stu.studentID AS student_id,
    stu.firstName || ' ' || stu.lastName AS student_name,
    COUNT(*) AS num_instructors
FROM
    students stu
JOIN
    registration reg
ON
    stu.studentID = reg.studentID
JOIN
    (
        SELECT DISTINCT
            sec.sectionID AS section_id,
            sec.professorID AS prof_id
        FROM
            sections sec
    ) scc
ON
    scc.section_id = reg.sectionID
GROUP BY
    stu.studentID, stu.firstName, stu.lastName
HAVING
    COUNT(*) BETWEEN 17 AND 19
ORDER BY
    num_instructors DESC
;
-- This one is done

-- 3
SELECT
    SUBSTR(prof.lastName, 1, 1) AS letter,
    COUNT(*) AS initial_count
FROM
    professors prof
WHERE
    prof.professorID NOT IN 
    (
        SELECT
            professorID AS prof_id
        FROM
            sections
    )
GROUP BY
    SUBSTR(prof.lastName, 1, 1)
;
-- This one is done

-- 4
SELECT
    scr.studentID AS student_id,
    scr.sectionID AS section_id,
    scr.score AS final_grade
FROM
    assignmentScore scr
WHERE
    scr.assignmentTypeID LIKE '%FI%'
    AND
    scr.sectionID IN
    (
        SELECT
            reg.sectionID
        FROM
            registration reg
        GROUP BY
            reg.sectionID
        HAVING
            COUNT(*) > 25
    )
ORDER BY
    scr.studentID ASC
;
-- This one is done

-- 5
SELECT
    MAX(scc.section_count) AS most_sections
FROM
    (
        SELECT
            sec.courseID AS course_id,
            COUNT(*) AS section_count
        FROM
            sections sec
        WHERE
            sec.semester LIKE 'FAL%'
        GROUP BY
            sec.courseID
    ) scc
;
-- This one is done

-- 6
SELECT
    prof.city AS city,
    prof.state AS state,
    prof.zip AS zip,
    COUNT(*) AS prof_count
FROM
    professors prof
GROUP BY
    prof.city,
    prof.state,
    prof.zip
HAVING
    COUNT(*) > 10
ORDER BY
    prof_count DESC
;
-- This one is done

-- 7
SELECT
    code.description AS description
FROM
    assignmentCode code
;
--TBD

-- 8
SELECT
    prof.firstName AS first_name
FROM
    professors prof
;
--TBD

-- 9
SELECT
    stu.firstName AS first_name
FROM
    students stu
;
--TBD

-- 10
SELECT
    stu.firstName AS first_name
FROM
    students stu
;
--TBD