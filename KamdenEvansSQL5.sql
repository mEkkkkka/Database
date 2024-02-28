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
    course.subjectCode || ' ' || course.courseNumber AS class,
    RPAD(SUBSTR(course.courseDescription, 1, 33), 40, '*') AS course_details,
    COUNT(*) AS sections_per_course
FROM
    courses course
JOIN
    sections sec
ON
    course.courseID = sec.courseID
WHERE  
    course.courseNumber BETWEEN '3000' AND '3999'
    AND course.subjectCode LIKE '%CS%'
GROUP BY
    course.courseNumber, course.subjectCode, course.courseDescription
;
-- This one is done

-- 3
SELECT
    course.subjectCode || ' ' || course.courseNumber AS class,
    COUNT(*) AS count
FROM
    courses course
JOIN
    sections sec
ON
    cou.courseID = sec.courseID
WHERE
    sec.professorID = 10051 -- 10051 is the professor ID of Anabell Freedman
GROUP BY
    course.subjectCode, course.courseNumber
ORDER BY
    course.courseNumber ASC
;
-- This one is done

-- 4
SELECT
    code.assignmentTypeID || ' ' || code.description AS code_description,
    AVG(score) AS average_grade,
    COUNT(*) AS count
FROM
    assignmentCode code
JOIN
    assignmentScore scr
ON
    code.assignmentTypeID = scr.assignmentTypeID
WHERE
    scr.sectionID = 21495 -- the numbers listed are all 18 section IDs for the CS 2550 course
    OR scr.sectionID = 21496
    OR scr.sectionID = 21655
    OR scr.sectionID = 22547
    OR scr.sectionID = 11402
    OR scr.sectionID = 11404
    OR scr.sectionID = 23703
    OR scr.sectionID = 23723
    OR scr.sectionID = 31897
    OR scr.sectionID = 33300
    OR scr.sectionID = 34306
    OR scr.sectionID = 30766
    OR scr.sectionID = 30767
    OR scr.sectionID = 31752
    OR scr.sectionID = 34993
    OR scr.sectionID = 10699
    OR scr.sectionID = 11423
    OR scr.sectionID = 11427
GROUP BY
    code.assignmentTypeID, code.description
ORDER BY
    code_description ASC
;
-- This one is done

-- 5
SELECT
    stu.firstName || ' ' || stu.lastName AS student_name,
    reg.sectionID AS section_id
FROM
    students stu
JOIN
    registration reg
ON
    stu.studentID = reg.studentID
JOIN
    assignmentScore scr
ON
    stu.studentID = scr.studentID
    AND reg.sectionID = scr.sectionID
WHERE
    reg.finalClassGrade LIKE '%B-%'
GROUP BY
    stu.firstName, stu.lastName, reg.sectionID
HAVING
    COUNT(*) = 17
;
-- Check this one

-- 6
SELECT
    stu.firstName || ' ' || stu.lastName AS full_name,
    course.subjectCode || ' ' || course.courseNumber AS course,
    scr.assignmentTypeID AS type,
    scr.assignmentScore AS score,
    COUNT(*) AS homework_count
FROM
    students stu
JOIN
    assignmentScore scr
ON
    stu.studentID = scr.studentID
JOIN
    sections sec
ON
    stu.sectionID = sec.sectionID
JOIN
    courses course
ON
    sec.sectionID = course.sectionID
WHERE
    stu.lastName LIKE '%Brancaccio%'
    OR stu.lastName LIKE '%Krassow%'
    OR stu.lastName LIKE '%Dalley%'
GROUP BY
    stu.firstName, 
    stu.lastName, 
    course.subjectCode, 
    course.courseNumber, 
    scr.assignmentTypeID, 
    scr.assignmentScore
HAVING
    COUNT(*) > 2
ORDER BY
    full_name ASC
;
-- Check this one

-- 7
SELECT
    bld.buildingName AS building_name
    COUNT(*) AS room_count
FROM
    buildings bld
JOIN
    location loc
ON
    bld.building = loc.building
GROUP BY
    bld.buildingName
HAVING
    COUNT(*) > 10
;
-- Check this one

-- 8
SELECT
    stu.firstName || ' ' || stu.lastName AS student_name,
    stu.phone AS phone
FROM
    students stu
JOIN
    registration reg
ON
    stu.studentID = reg.studentID
WHERE
    TO_CHAR(reg.registrationDate, 'HH24:MM YYYY Month') < '09:00 2020 January'
ORDER BY
    lastName ASC,
    firstName ASC
;
-- Check this one

-- 9
SELECT
    course.subjectCode || ' ' || course.courseNumber AS course,
    COUNT(*) AS max_group
FROM
    sections sec
JOIN
    assignmentScore scr
ON
    sec.sectionID = scr.sectionID
JOIN
    courses course
ON
    sec.courseID = cou.courseID
WHERE
    course.subjectCode LIKE '%WEB%'
GROUP BY
    course.subjectCode, course.courseNumber
HAVING
    COUNT(*) > 1
;
-- Check this one

-- 10
SELECT
    sec.sectionID AS section_id,
    AVG(scr.assignmentScore) AS average
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
WHERE
    sec.capacity > 14
    AND prof.firstName LIKE '%Co%'
GROUP BY
    sec.sectionID
ORDER BY
    sec.sectionID DESC
;
-- Check this one