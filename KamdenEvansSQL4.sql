-- Kamden Evans
-- SQL 4
-- 02/20/2024

-- 1
SELECT
    ROUND(AVG(tuitionBalance), 2) AS average_cost
FROM
    students
WHERE
    state = 'CA' OR state = 'CO' OR state = 'UT' OR state = 'OR'
;
-- This one is done

-- 2
SELECT
    COUNT(*) AS admissions_2015
FROM
    students
WHERE
    TO_CHAR(admissionDate, 'YYYY') = '2015'
;
-- This one is done

-- 3
SELECT
    ROUND(AVG(score), 2) AS average,
    MAX(score) AS highest,
    MIN(score) AS lowest
FROM
    assignmentScore
WHERE
    sectionID = 23735 AND assignmentTypeID = 'FI'
;
-- This one is done

-- 4
SELECT
    city AS city,
    state AS state,
    COUNT(*) AS students
FROM
    students
GROUP BY
    city, state
HAVING
    COUNT(*) < 5 OR COUNT(*) > 50
ORDER BY
    students DESC
;
-- This one is done

-- 5
SELECT
    sectionID AS section_id,
    COUNT(*) AS wednesday_reg
FROM
    registration
WHERE
    TO_CHAR(registrationDate, 'DAY') = 'WEDNESDAY'
GROUP BY
    sectionID
HAVING
    COUNT(*) > 3
ORDER BY
    wednesday_reg DESC
;
-- This one is done

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