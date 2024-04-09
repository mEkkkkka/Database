-- Kamden Evans
-- SQL 7
-- 04/09/2024

-- 1
SELECT
    prof.firstName AS first_name,
    prof.lastName AS last_name
FROM
    professors prof
WHERE
    prof.professorID NOT IN 
    (
        SELECT
            sec.professorID AS prof_id
        FROM
            sections sec
        JOIN
            courses cou
        ON
            sec.courseID = cou.courseID
        JOIN
            assignmentScore scr
        ON
            sec.sectionID = scr.sectionID
        WHERE
            scr.assignmentTypeID LIKE '%GP%'
    )
    AND prof.professorID IN
    (
        SELECT
            sec.professorID AS prof_id
        FROM 
            sections sec
        JOIN
            courses cou
        ON
            sec.courseID = cou.courseID
        WHERE
            cou.subjectCode LIKE '%CS%'
    )
ORDER BY
    last_name ASC
;
-- This one is done

-- 2
SELECT
    sec.sectionID AS section_id,
    COUNT(*) AS num_under_avg
FROM
    sections sec
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
    courses cou
ON
    sec.courseID = cou.courseID
WHERE
    sec.sectionID IN
    (
        SELECT
            sec.sectionID
        FROM
            sections sec
        JOIN
            courses cou
        ON
            sec.courseID = cou.courseID
        WHERE
            cou.subjectCode = 'CS'
            AND cou.courseNumber = 2550
    )
    AND
    scr.score < 
    (
        SELECT
            AVG(scr.score)
        FROM
            sections sec
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
            courses cou
        ON
            sec.courseID = cou.courseID
        WHERE
            cou.subjectCode = 'CS'
            AND cou.courseNumber = 2550
            AND scr.assignmentTypeID = 'FI'
    )
    AND scr.assignmentTypeID = 'FI'
GROUP BY
    sec.sectionID
;
-- This one is done

-- 3
SELECT
    cou.subjectCode || ' ' || cou.courseNumber AS course
FROM
    courses cou
;
-- TBD

-- 4
SELECT
    cou.subjectCode AS subject
FROM
    courses cou
;
-- TBD

-- 5
SELECT
    stu.studentID AS student_id
FROM
    students stu
;
-- TBD

-- 6
SELECT
    stu.firstName AS first_name
FROM
    students stu
;
-- TBD

-- 7
SELECT
    cou.subjectCode || ' ' || cou.courseNumber AS course_info
FROM
    courses cou
;
-- TBD

-- 8
SELECT
    stu.studentID AS student_id
FROM
    students stu
;
-- TBD