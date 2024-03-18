-- Kamden Evans
-- SQL 6
-- 03/18/2024

-- 1
SELECT
    stu.student AS student
FROM
    students stu
;
--TBD

-- 2
SELECT
    stu.studentID AS student_id
FROM
    students stu
;
--TBD

-- 3
SELECT
    SUBSTR(prof.lastName, 1, 1) AS letter
FROM
    professors prof
;
--TBD

-- 4
SELECT
    stu.studentID AS student_id
FROM
    students stu
;
--TBD

-- 5
SELECT
    MAX(scc.section_count) AS most_sections
FROM
    (
        SELECT
            COUNT(*) AS section_count
        FROM
            sections sec
        ;
    ) scc
;
--TBD

-- 6
SELECT
    loc.city AS city
FROM
    location loc
;
--TBD

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