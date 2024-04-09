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
    sec.sectionID AS section_id
FROM
    sections sec
;
-- TBD

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