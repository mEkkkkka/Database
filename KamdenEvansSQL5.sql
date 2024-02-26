-- Kamden Evans
-- SQL 5
-- 26/02/2024

-- 1
SELECT
    stu.firstName AS first_name,
    stu.lastName AS last_name,
    stu.tuitionBalance AS amount_owed,
    reg.finalClassGrade AS final_grade
FROM
    students stu
JOIN
    registration reg
ON
    stu.studentID = reg.studentID
WHERE
    TO_CHAR(reg.registrationDate, 'Month DD') LIKE '%November%18%'
ORDER BY
    amount_owed DESC,
    first_name DESC,
    last_name DESC
;
-- This one is done

-- 2
SELECT
    cou.subjectCode || ' ' || cou.courseNumber AS class,
    RPAD(SUBSTR(cou.courseDescription, 1, 33), 40, '*') AS course_details,
    COUNT(*) AS sections_per_course
FROM
    courses cou
JOIN
    sections sec
ON
    cou.courseID = sec.courseID
WHERE  
    cou.courseNumber BETWEEN '3000' AND '3999'
    AND cou.subjectCode LIKE '%CS%'
GROUP BY
    cou.courseNumber, cou.subjectCode, cou.courseDescription
;
-- This one is done

-- 3
SELECT
    cou.subjectCode || ' ' || cou.courseNumber AS class, COUNT(*) AS count
FROM
    courses cou
JOIN
    sections sec
ON
    cou.courseID = sec.courseID
;
-- TBD

-- 4
SELECT
    code.assignmentTypeID || ' ' || code.description AS code_description
FROM
    assignmentCode code
JOIN
    assignmentScore scr
ON
    code.assignmentTypeID = scr.assignmentTypeID
;
-- TBD

-- 5
SELECT
    stu.firstName || ' ' || stu.lastName AS student_name
FROM
    students stu
JOIN
    registration reg
ON
    stu.studentID = reg.studentID
;
-- TBD

-- 6
SELECT
    stu.firstName || ' ' || stu.lastName AS student_name
FROM
    students stu
JOIN
    assignmentScore scr
ON
    stu.studentID = scr.studentID
;
-- TBD

-- 7
SELECT
    bld.buildingName AS building_name
FROM
    buildings bld
JOIN
    location loc
ON
    bld.building = loc.building
;
-- TBD

-- 8
SELECT
    stu.firstName || ' ' || stu.lastName AS student_name
FROM
    students stu
JOIN
    registration reg
ON
    stu.studentID = reg.studentID
;
-- TBD

-- 9
SELECT
    cou.subjectCode || ' ' || cou.courseNumber AS course
FROM
    sections sec
JOIN
    assignmentScore scr
ON
    sec.sectionID = scr.sectionID
JOIN
    courses cou
ON
    sec.courseID = cou.courseID
;
-- TBD

-- 10
SELECT
    sec.sectionID AS section_id
FROM
    sections sec
JOIN
    professors prof
ON
    sec.professorID = prof.professorID
JOIN
    assignmentScore scr
ON
    scr.sectionID = sec.sectionID
;
-- TBD