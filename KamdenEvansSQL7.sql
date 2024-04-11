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
SELECT DISTINCT
    cou.subjectCode || ' ' || cou.courseNumber AS course,
    SUM(capacity) AS total_capacity
FROM
    courses cou
JOIN
    sections sec
ON
    cou.courseID = sec.courseID
WHERE
    cou.courseNumber BETWEEN '3000' AND '3999'
    AND cou.subjectCode = 'CS'
    AND EXISTS
    (
        SELECT
            'X'
        FROM
            registration reg
        WHERE
            reg.sectionID = sec.sectionID
    )
GROUP BY
    cou.subjectCode, cou.courseNumber
ORDER BY
    course ASC
;
-- This one is done

-- 4
SELECT
    cou.subjectCode AS subject,
    cou.courseNumber AS course_number
FROM
    courses cou
WHERE
    NOT EXISTS
    (
        SELECT
            'X'
        FROM
            sections sec
        WHERE
            sec.courseID = cou.courseID
    )
    AND
    (
        cou.subjectCode = 'CS'
        OR cou.subjectCode = 'WEB'
    )
;
-- This one is done

-- 5
WITH times_per_course AS
(
    SELECT
        COUNT(*) AS amount,
        sec.courseID AS id,
        reg.studentID AS student_id
    FROM
        registration reg
    JOIN
        sections sec
    ON
        reg.sectionID = sec.sectionID
    GROUP BY
        sec.courseID, reg.studentID
)
SELECT DISTINCT
    stu.studentID AS student_id,
    stu.firstName AS first_name,
    stu.lastName AS last_name
FROM
    students stu
JOIN
    registration reg
ON
    stu.studentID = reg.studentID
JOIN
    sections sec
ON
    reg.sectionID = sec.sectionID
JOIN
    times_per_course tpc
ON
    sec.courseID = tpc.id
WHERE
    tpc.amount > 3
ORDER BY
    last_name ASC,
    first_name ASC
;
-- This one is done

-- 6
-- 6
WITH classes_per_junior AS
(
    SELECT
        COUNT(*) AS classes,
        reg.studentID AS id
    FROM
        registration reg
    JOIN
        sections sec
    ON
        reg.sectionID = sec.sectionID
    JOIN
        courses cou
    ON
        sec.courseID = cou.courseID
    WHERE
        cou.courseNumber BETWEEN '3000' AND '3999'
    GROUP BY
        reg.studentID
)

SELECT
    stu.firstName AS first_name,
    stu.lastName AS last_name
FROM
    students stu
JOIN
    classes_per_junior cpj
ON
    stu.studentID = cpj.id
WHERE
    cpj.classes =
    (
        SELECT
            FLOOR(AVG(cpj.classes)) AS average
        FROM
            classes_per_junior cpj
    )
ORDER BY
    last_name ASC
;
-- This one is done

-- 7
WITH students_per_course AS
(
    SELECT
        COUNT(*) AS students,
        sec.courseID AS id
    FROM
        registration reg
    JOIN
        section sec
    ON
        reg.sectionID = sec.sectionID
    JOIN
        courses cou
    ON
        sec.courseID = cou.courseID
    WHERE
        cou.subjectCode = 'CS'
    GROUP BY
        sec.courseID
)
SELECT
    cou.subjectCode || ' ' || cou.courseNumber AS course_info
FROM
    courses cou
WHERE
    cou.courseID IN
    (
        SELECT
            cou.courseID
        FROM
            courses cou
        JOIN
            students_per_course spc
        ON
            cou.courseID = spc.id
        WHERE
            spc.students > 
            (
                SELECT
                    AVG(spc.students)
                FROM
                    students_per_course spc
            )
            AND cou.subjectCode = 'CS'
    )
;
-- TBD

-- 8
SELECT
    stu.studentID AS student_id
FROM
    students stu
;
-- TBD