-- Kamden Evans
-- SQL 10
-- 04/23/2024

-- 1
INSERT INTO professors
    (
        firstName,
        lastName, 
        professorID, 
        streetAddress, 
        city, 
        state, 
        zip, 
        phone, 
        hireDate
    )
VALUES
    (
        'Cody', 
        'Henrichsen', 
        666, 
        '101101 Digital Way', 
        'New York City', 
        'NY', 
        '10011', 
        '2125550000', 
        SYSDATE - 1
        )
;
-- This one is done

-- 2
INSERT INTO sections
    (
        professorID, 
        courseID, 
        sectionID, 
        sectionStartDate, 
        capacity, 
        semester, 
        locationID
    )
VALUES
    (
        666, 
        10534, 
        99999, 
        TO_DATE('August 17, 2024 7:30', 'Month DD, YYYY HH24:MI'), 
        30, 
        'FAL2024', 
        0
        )
;
-- This one is done

-- 3
INSERT INTO registration (sectionID, studentID, registrationDate)
WITH newStudents AS
(
    SELECT 99999, 4073, SYSDATE FROM dual UNION ALL
    SELECT 99999, 3894, SYSDATE FROM dual UNION ALL
    SELECT 99999, 1305, SYSDATE FROM dual UNION ALL
    SELECT 99999, 2679, SYSDATE FROM dual
)
SELECT
    *
FROM
    newStudents
;
-- This one is done

-- 4
DELETE FROM
    assignmentScore scr
WHERE
    scr.studentID = 2736
;

DELETE FROM
    registration reg
WHERE
    reg.studentID = 2736
;

DELETE FROM
    students stu
WHERE
    stu.studentID = 2736
;
-- This one is done

-- created SAVEPOINT one_through_four

-- 5
DELETE FROM 
    assignmentScore scr
WHERE
    scr.sectionID = 20684
    AND scr.studentID = 1978
;

DELETE FROM
    registration reg
WHERE
    reg.studentID = 1978
    AND reg.sectionID = 20684
;
-- This one is done

-- 6
UPDATE
    professors prof
SET
    prof.phone = '3141592653'
WHERE
    prof.professorID = 666
;
-- This one is done

-- 7
UPDATE
    assignmentScore scr
SET
    scr.score = 100
WHERE
    scr.sectionID = 31752
    AND scr.assignmentTypeID = 'HM'
    AND scr.assignmentNumber = 1
;
-- This one is done

-- 8
UPDATE
    assignmentScore scr
SET
    scr.score = scr.score + 10
WHERE
    scr.sectionID = 31752
    AND scr.assignmentTypeID = 'FI'
;
-- This one is done

-- 9
UPDATE
    courses cou
SET
    cou.prerequisite = 
    (
        SELECT
            cou.courseID AS id
        FROM
            courses cou
        WHERE
            cou.subjectCode = 'CS'
            AND cou.courseNumber = '1400'
    )
WHERE
    cou.courseID = 
    (
        SELECT
            cou.courseID AS id
        FROM
            courses cou
        WHERE
            cou.subjectCode = 'CS'
            AND cou.courseNumber = '1410'
    )
;

UPDATE
    courses cou
SET
    cou.prerequisite = 
    (
        SELECT
            cou.courseID AS id
        FROM
            courses cou
        WHERE
            cou.subjectCode = 'CS'
            AND cou.courseNumber = '1410'
    )
WHERE
    cou.courseID = 
    (
        SELECT
            cou.courseID AS id
        FROM
            courses cou
        WHERE
            cou.subjectCode = 'CS'
            AND cou.courseNumber = '2550'
    )
;
-- This one is done

-- created SAVEPOINT one_through_nine

-- 10
SELECT
    acou.subjectCode || ' ' || acou.courseNumber AS prerequisite,
    'is required for' AS text,
    cou.subjectCode || ' ' || cou.courseNumber AS course
FROM
    courses cou
JOIN
    courses acou
ON
    cou.prerequisite = acou.courseID
WHERE
    cou.prerequisite IS NOT NULL
;
-- This one is done

-- 11
WITH students_per_section AS
(
    SELECT
        COUNT(*) AS student_count,
        reg.sectionID AS id
    FROM
        registration reg
    GROUP BY
        reg.sectionID
)
SELECT
    sec.sectionID AS section_id,
    loc.building AS building,
    sps.student_count AS enrolled_students
FROM
    sections sec
JOIN
    location loc
ON
    sec.locationID = loc.locationID
JOIN
    students_per_section sps
ON
    sec.sectionID = sps.id
WHERE
    sec.courseID = 10534
ORDER BY
    section_id ASC
;
-- This one is done

-- 12
SELECT DISTINCT
    prof.firstName AS first_name,
    prof.lastName AS last_name,
    SUBSTR(prof.phone, 1,3) || ',' || SUBSTR(prof.phone, 4,6) || '.' || SUBSTR(prof.phone, 7) AS phone
FROM
    professors prof
JOIN
    sections sec
ON
    prof.professorID = sec.professorID
WHERE
    sec.courseID = 10534
ORDER BY
    first_name ASC
;
-- This one is done

-- 13
WITH averageScore AS
(
    SELECT
        ROUND(AVG(scr.score), 2) AS average,
        scr.studentID AS student
    FROM
        assignmentScore scr
    WHERE
        scr.sectionID = 31752
    GROUP BY
        scr.studentID
)
SELECT
    stu.studentID AS student_id,
    stu.firstName AS first_name,
    stu.lastName AS last_name,
    TO_CAHR(avs.average, '99.99') AS average_score
FROM
    students stu
JOIN
    averageScore avs
ON
    stu.studentID = avs.student
JOIN
    registration reg
ON
    stu.studentID = reg.studentID
WHERE
    reg.sectionID = 31752
ORDER BY
    student_id
;
-- Check this one





WITH score_to_student AS
(
    SELECT
        scr.studentID AS id,
        ROUND(AVG(scr.score), 2) AS average_score
    FROM
        assignmentScore scr
    WHERE
        scr.sectionID = 31752
    GROUP BY
        scr.studentID
)
SELECT
    stu.studentID AS student_id,
    stu.firstName AS first_name,
    stu.lastName AS last_name,
    TO_CHAR(sts.average_score, '99.99') AS average_score
FROM
    score_to_student sts
JOIN
    students stu
ON
    sts.id = stu.studentID
ORDER BY
    student_id ASC
;