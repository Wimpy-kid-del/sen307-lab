-- ============================================
-- VUA-SEN307 Lab 5: SELECT, Filtering and Joins
-- Name: Eniolorunda Charis Ireoluwa   Matric: VUG/SEN/24/12027
-- ============================================

USE sen307_12027;

SELECT 'Departments' AS tbl, COUNT(*) AS total FROM Department
UNION ALL SELECT 'Lecturers', COUNT(*) FROM Lecturer
UNION ALL SELECT 'Students', COUNT(*) FROM Student
UNION ALL SELECT 'Courses', COUNT(*) FROM Course
UNION ALL SELECT 'Enrolments', COUNT(*) FROM Enrolment
UNION ALL SELECT 'Allocations', COUNT(*) FROM CourseAllocation;


-- Task 1: Students in one department, sorted A-Z
SELECT s.student_id, s.matric_no, s.full_name, d.dept_name
FROM Student s
INNER JOIN Department d ON s.dept_id = d.dept_id
WHERE d.dept_name = 'Software Engineering'
ORDER BY s.full_name ASC;
-- Explanation: Student is joined to Department on dept_id so we can filter by
-- the department's name instead of its numeric ID. WHERE keeps only Software
-- Engineering students and ORDER BY s.full_name ASC sorts them alphabetically.


-- Task 2: Courses with their lecturers (INNER JOIN)
SELECT c.course_code, c.course_title, l.full_name AS lecturer
FROM Course c
INNER JOIN CourseAllocation ca ON c.course_id = ca.course_id
INNER JOIN Lecturer l ON ca.lecturer_id = l.lecturer_id
ORDER BY c.course_code, l.full_name;
-- Explanation: Course and Lecturer are not linked directly, so the query goes
-- Course -> CourseAllocation -> Lecturer using two INNER JOINs. Only courses
-- that have an allocation and lecturers who teach something appear. SEN307
-- has two lecturers, so it shows up twice.


-- Task 3: Students and their courses (LEFT JOIN)
SELECT s.full_name, c.course_title
FROM Student s
LEFT JOIN Enrolment e ON s.student_id = e.student_id
LEFT JOIN Course c ON e.course_id = c.course_id
ORDER BY s.full_name, c.course_title;
-- Explanation: LEFT JOIN keeps every row from Student (the left table) even
-- when there is no matching enrolment. For those students the course columns
-- come back as NULL.

-- Task 3 (continued): only the students with no courses
SELECT s.full_name, c.course_title
FROM Student s
LEFT JOIN Enrolment e ON s.student_id = e.student_id
LEFT JOIN Course c ON e.course_id = c.course_id
WHERE c.course_title IS NULL
ORDER BY s.full_name;
-- Explanation: Adding WHERE c.course_title IS NULL keeps only the rows where
-- the LEFT JOIN found no match, i.e. students who are not enrolled in any course.


-- Task 4: Filtering with AND / OR / IN / BETWEEN
SELECT s.full_name, s.gender, d.dept_name, s.date_of_birth
FROM Student s
INNER JOIN Department d ON s.dept_id = d.dept_id
WHERE s.gender = 'F'
  AND d.dept_name IN ('Software Engineering', 'Artificial Intelligence')
  AND s.date_of_birth BETWEEN '2004-01-01' AND '2005-12-31'
ORDER BY d.dept_name, s.full_name;
-- Explanation: This combines AND, IN and BETWEEN. It returns female students
-- who are in Software Engineering or Artificial Intelligence (IN) and were
-- born between 2004-01-01 and 2005-12-31 (BETWEEN, inclusive of both ends).
-- Department names are used instead of hard-coded IDs so the query does not
-- depend on how AUTO_INCREMENT numbered the departments.


-- Task 5: Paginating enrolments with LIMIT and OFFSET
-- Page 1 (rows 1-10)
SELECT enrolment_id, student_id, course_id
FROM Enrolment
ORDER BY enrolment_id
LIMIT 10 OFFSET 0;

-- Page 2 (rows 11-20)
SELECT enrolment_id, student_id, course_id
FROM Enrolment
ORDER BY enrolment_id
LIMIT 10 OFFSET 10;
-- Explanation: LIMIT 10 returns 10 rows at a time and OFFSET skips the rows
-- already shown (0 for page 1, 10 for page 2).
-- Why ORDER BY is needed: without it MySQL does not guarantee any row order,
-- so the same row could appear on two pages or be skipped completely.


-- Challenge: Task 3 rewritten with RIGHT JOIN (same result as the LEFT JOIN version)
SELECT s.full_name, c.course_title
FROM Course c
RIGHT JOIN Enrolment e ON c.course_id = e.course_id
RIGHT JOIN Student s ON e.student_id = s.student_id
ORDER BY s.full_name, c.course_title;
-- Explanation: RIGHT JOIN keeps all rows from the table on its right, so the
-- table order is reversed: Student must come last to be the one kept in full.
-- The LEFT JOIN version is easier to read because it starts with the main
-- table (Student) and reads left to right. With RIGHT JOIN the table we care
-- about is at the end, so the query reads backwards.