-- Kamden Evans
-- SQL 4
-- 02/20/2024

-- 1
SELECT
    AVG(tuitionBalance) AS average_cost
FROM
    students
;
-- TBD

-- 2
SELECT
    COUNT(*) AS admissions_2015
FROM
    registration
GROUP BY
    TO_CHAR(registrationDate, 'YYYY') LIKE '2015'
;
-- TBD

-- 3
SELECT
    AVG(score) AS average,
    MAX(score) AS highest,
    MIN(score) AS lowest
FROM
    assignmentScore
;
-- TBD

-- 4
SELECT
    city AS city,
    state AS state,
    COUNT(*) AS students
FROM
    students
;
-- TBD

-- 5
SELECT
    sectionID AS section_id,
    COUNT(*) AS wednesday_reg
FROM
    registration
;
-- TBD

-- 6
SELECT
    studentID AS student_id,
    sectionID AS section_id,
    AVG(finalClassGrade) AS average_grade
FROM
    registration
;
-- TBD

-- 7
SELECT
    studentID AS student_id,
    COUNT(*)
FROM
    registration
;
-- TBD

-- 8
SELECT
    sectionID AS section_id,
    MIN(score) AS lowest_quiz_score
FROM
    assignmentScore
;
-- TBD

-- 9
SELECT
    city AS city,
    COUNT(*) AS student_count
FROM
    students
;
-- TBD

-- 10
SELECT
    sectionID AS section_id,
    COUNT(*) AS participation,
    MIN(score) AS lowest_score
FROM
    assignmentScore
;
-- TBD