-- Kamden Evans
-- SQL 7
-- 04/09/2024

-- 1
SELECT
    prof.firstName AS first_name
FROM
    professors prof
;
-- TBD

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