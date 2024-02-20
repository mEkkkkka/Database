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
    TO_CHAR(ROUND(AVG(score), 4), '99.9999') AS average_grade
FROM
    assignmentScore
WHERE
    sectionID = 30775
GROUP BY
    studentID, sectionID
ORDER BY
    average_grade DESC
;
-- This one is done

-- 7
SELECT
    studentID AS student_id,
    COUNT(*) AS section_count
FROM
    registration
WHERE
    studentID = 2735 OR studentID = 1398 OR studentID = 2847 OR studentID = 2959 OR studentID = 3200
GROUP BY
    studentID
ORDER BY
    section_count DESC
;
-- This one is done

-- 8
SELECT
    sectionID AS section_id,
    MIN(score) AS lowest_quiz_score
FROM
    assignmentScore
WHERE
    assignmentTypeID = 'QZ'
GROUP BY
    sectionID
HAVING
    MIN(score) >= 80 AND COUNT(*) < 5
ORDER BY
    lowest_quiz_score ASC
;
-- This one is done

-- 9
SELECT
    city AS city,
    COUNT(*) AS student_count
FROM
    students
WHERE
    UPPER(SUBSTR(city, 1, 1)) = 'A'
    OR UPPER(SUBSTR(city, 1, 1)) = 'B'
    OR UPPER(SUBSTR(city, 1, 1)) = 'C'
    OR UPPER(SUBSTR(city, 1, 1)) = 'D'
    OR UPPER(SUBSTR(city, 1, 1)) = 'E'
    OR UPPER(SUBSTR(city, 1, 1)) = 'F'
    OR UPPER(SUBSTR(city, 1, 1)) = 'G'
    OR UPPER(SUBSTR(city, 1, 1)) = 'H'
    OR UPPER(SUBSTR(city, 1, 1)) = 'I'
    OR UPPER(SUBSTR(city, 1, 1)) = 'J'
    OR UPPER(SUBSTR(city, 1, 1)) = 'K'
    OR UPPER(SUBSTR(city, 1, 1)) = 'L'
GROUP BY
    city
HAVING
    COUNT(*) > 19 AND COUNT(*) < 101
ORDER BY
    student_count ASC
;
-- This one is done

-- 10
SELECT
    sectionID AS section_id,
    COUNT(*) AS participation,
    MIN(score) AS lowest_score
FROM
    assignmentScore
WHERE
    assignmentTypeID = 'PA'
GROUP BY
    sectionID
HAVING
    COUNT(*) > 35
ORDER BY
    participation
;
-- This one is done