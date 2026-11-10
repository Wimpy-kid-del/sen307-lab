USE sen307_11434;

SHOW TABLES;

INSERT INTO Department (dept_name) VALUES
('Software Engineering'),
('Computer Science'),
('Artificial Intelligence'),
('Data Science'),
('Cybersecurity');

INSERT INTO Course (course_code, course_title, credit_units, description, dept_id) VALUES
('SEN307', 'Database Systems', 3,
'Relational database design, SQL queries, normalization, transactions and indexing using MySQL.',
(SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),

('SEN301', 'Software Architecture', 3,
'Architectural styles, design patterns, microservices and how to structure large software systems.',
(SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),

('COS301', 'Operating Systems', 3,
'Processes, threads, CPU scheduling, memory management and file systems.',
(SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),

('COS305', 'Computer Networks', 3,
'TCP/IP, routing, switching, LAN and WAN design and network protocols.',
(SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),

('AIN301', 'Introduction to Artificial Intelligence', 3,
'Intelligent agents, search algorithms, knowledge representation and reasoning.',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),

('AIN305', 'Machine Learning', 3,
'Supervised and unsupervised learning, neural networks, deep learning and model evaluation.',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),

('AIN307', 'Natural Language Processing', 3,
'Text processing, word embeddings, language models, sentiment analysis and chatbots.',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),

('DTS301', 'Data Visualization and Analytics', 2,
'Exploratory data analysis, charts, dashboards and telling stories with data.',
(SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),

('DTS305', 'Big Data Technologies', 3,
'Distributed storage and processing of very large datasets with Hadoop and Spark.',
(SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),

('CYB301', 'Network Security', 3,
'Firewalls, cryptography, intrusion detection and protecting networks from attacks.',
(SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity'));

SELECT d.dept_name, COUNT(c.course_id) AS courses
FROM Department d
LEFT JOIN Course c ON d.dept_id = c.dept_id
GROUP BY d.dept_name;

SELECT dept_id, dept_name FROM Department;

SELECT course_id, course_code FROM Course;

INSERT INTO Lecturer (staff_no, full_name, email, dept_id) VALUES
('VUA/ST/101', 'Dr Amaka Okafor', 'a.okafor@vua.edu.ng',
(SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),

('VUA/ST/102', 'Dr Musa Bello', 'm.bello@vua.edu.ng',
(SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),

('VUA/ST/103', 'Prof Chinedu Eze', 'c.eze@vua.edu.ng',
(SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),

('VUA/ST/104', 'Dr Fatima Yusuf', 'f.yusuf@vua.edu.ng',
(SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),

('VUA/ST/105', 'Dr Ngozi Okeke', 'n.okeke@vua.edu.ng',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),

('VUA/ST/106', 'Dr Ibrahim Sani', 'i.sani@vua.edu.ng',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),

('VUA/ST/107', 'Dr Esther James', 'e.james@vua.edu.ng',
(SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),

('VUA/ST/108', 'Dr David Obi', 'd.obi@vua.edu.ng',
(SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),

('VUA/ST/109', 'Dr Grace Nwosu', 'g.nwosu@vua.edu.ng',
(SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity')),

('VUA/ST/110', 'Dr Samuel Ade', 's.ade@vua.edu.ng',
(SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity'));

SELECT * FROM Lecturer;


INSERT INTO Student (matric_no, full_name, gender, date_of_birth, dept_id) VALUES

('VUG/SEN/24/11434', 'Chukwube Daniel', 'M', '2008-06-13',
(SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),

('VUA/2024/001', 'Ada Obi', 'F', '2005-03-14',
(SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),

('VUA/2024/002', 'John Musa', 'M', '2004-11-02',
(SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),

('VUA/2024/003', 'Chinonso Eze', 'M', '2005-06-21',
(SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),

('VUA/2024/004', 'Fatima Bello', 'F', '2006-01-18',
(SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),

('VUA/2024/005', 'Emeka Okafor', 'M', '2003-09-12',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),

('VUA/2024/006', 'Grace Nwosu', 'F', '2005-12-05',
(SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),

('VUA/2024/007', 'Ibrahim Sani', 'M', '2004-04-23',
(SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity')),

('VUA/2024/008', 'Ngozi Okeke', 'F', '2006-07-11',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),

('VUA/2024/009', 'David James', 'M', '2005-02-16',
(SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),

('VUA/2024/010', 'Esther John', 'F', '2007-08-19',
(SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity')),

('VUA/2024/011', 'Samuel Ade', 'M', '2003-05-27',
(SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),

('VUA/2024/012', 'Blessing Peter', 'F', '2004-10-09',
(SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),

('VUA/2024/013', 'Chidera Umeh', 'F', '2006-03-30',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),

('VUA/2024/014', 'Michael Ojo', 'M', '2005-11-15',
(SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),

('VUA/2024/015', 'Aisha Mohammed', 'F', '2007-01-24',
(SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity')),

('VUA/2024/016', 'Daniel Okoro', 'M', '2004-08-07',
(SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),

('VUA/2024/017', 'Precious Eze', 'F', '2003-12-20',
(SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),

('VUA/2024/018', 'Tunde Balogun', 'M', '2006-09-03',
(SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),

('VUA/2024/019', 'Maryam Yusuf', 'F', '2005-04-13',
(SELECT dept_id FROM Department WHERE dept_name = 'Data Science'));

SELECT * FROM Student;

UPDATE Student
SET matric_no = CONCAT(
    'VUG/SEN/24/',
    11434 + CAST(SUBSTRING_INDEX(matric_no, '/', -1) AS UNSIGNED)
)
WHERE matric_no LIKE 'VUA/2024/%';

SELECT matric_no, full_name
FROM Student
ORDER BY matric_no;

SELECT student_id, matric_no, full_name FROM Student;

SELECT lecturer_id, full_name FROM Lecturer;

SELECT course_id, course_code FROM Course;


INSERT INTO Enrolment (student_id, course_id)
SELECT s.student_id, c.course_id
FROM (
    SELECT 'VUG/SEN/24/11434' AS matric_no, 'SEN307' AS course_code
    UNION ALL SELECT 'VUG/SEN/24/11435', 'SEN307'
    UNION ALL SELECT 'VUG/SEN/24/11436', 'SEN307'
    UNION ALL SELECT 'VUG/SEN/24/11437', 'SEN307'
    UNION ALL SELECT 'VUG/SEN/24/11438', 'SEN307'
    UNION ALL SELECT 'VUG/SEN/24/11439', 'SEN307'
    UNION ALL SELECT 'VUG/SEN/24/11440', 'SEN307'
    UNION ALL SELECT 'VUG/SEN/24/11441', 'SEN307'

    UNION ALL SELECT 'VUG/SEN/24/11434', 'SEN301'
    UNION ALL SELECT 'VUG/SEN/24/11442', 'SEN301'
    UNION ALL SELECT 'VUG/SEN/24/11443', 'SEN301'
    UNION ALL SELECT 'VUG/SEN/24/11444', 'SEN301'
    UNION ALL SELECT 'VUG/SEN/24/11445', 'SEN301'

    UNION ALL SELECT 'VUG/SEN/24/11435', 'COS301'
    UNION ALL SELECT 'VUG/SEN/24/11442', 'COS301'
    UNION ALL SELECT 'VUG/SEN/24/11446', 'COS301'
    UNION ALL SELECT 'VUG/SEN/24/11447', 'COS301'
    UNION ALL SELECT 'VUG/SEN/24/11448', 'COS301'

    UNION ALL SELECT 'VUG/SEN/24/11436', 'COS305'
    UNION ALL SELECT 'VUG/SEN/24/11443', 'COS305'
    UNION ALL SELECT 'VUG/SEN/24/11446', 'COS305'
    UNION ALL SELECT 'VUG/SEN/24/11449', 'COS305'

    UNION ALL SELECT 'VUG/SEN/24/11437', 'AIN301'
    UNION ALL SELECT 'VUG/SEN/24/11444', 'AIN301'
    UNION ALL SELECT 'VUG/SEN/24/11447', 'AIN301'
    UNION ALL SELECT 'VUG/SEN/24/11450', 'AIN301'

    UNION ALL SELECT 'VUG/SEN/24/11438', 'AIN305'
    UNION ALL SELECT 'VUG/SEN/24/11445', 'AIN305'
    UNION ALL SELECT 'VUG/SEN/24/11448', 'AIN305'
    UNION ALL SELECT 'VUG/SEN/24/11451', 'AIN305'

    UNION ALL SELECT 'VUG/SEN/24/11439', 'AIN307'
    UNION ALL SELECT 'VUG/SEN/24/11446', 'AIN307'
    UNION ALL SELECT 'VUG/SEN/24/11449', 'AIN307'
    UNION ALL SELECT 'VUG/SEN/24/11450', 'AIN307'

    UNION ALL SELECT 'VUG/SEN/24/11440', 'DTS301'
    UNION ALL SELECT 'VUG/SEN/24/11447', 'DTS301'

    UNION ALL SELECT 'VUG/SEN/24/11441', 'DTS305'
    UNION ALL SELECT 'VUG/SEN/24/11448', 'DTS305'
    UNION ALL SELECT 'VUG/SEN/24/11449', 'DTS305'
    UNION ALL SELECT 'VUG/SEN/24/11451', 'DTS305'
) AS enrolment_data
JOIN Student s ON s.matric_no = enrolment_data.matric_no
JOIN Course c ON c.course_code = enrolment_data.course_code;

SELECT s.matric_no, s.full_name, c.course_code, c.course_title
FROM Enrolment e
JOIN Student s ON e.student_id = s.student_id
JOIN Course c ON e.course_id = c.course_id
ORDER BY s.matric_no;

INSERT INTO CourseAllocation (course_id, lecturer_id)
SELECT c.course_id, l.lecturer_id
FROM (
    SELECT 'SEN307' AS course_code, 'VUA/ST/101' AS staff_no
    UNION ALL SELECT 'SEN307', 'VUA/ST/102'
    UNION ALL SELECT 'SEN301', 'VUA/ST/101'
    UNION ALL SELECT 'COS301', 'VUA/ST/103'
    UNION ALL SELECT 'COS305', 'VUA/ST/104'
    UNION ALL SELECT 'AIN301', 'VUA/ST/105'
    UNION ALL SELECT 'AIN305', 'VUA/ST/106'
    UNION ALL SELECT 'AIN307', 'VUA/ST/105'
    UNION ALL SELECT 'DTS301', 'VUA/ST/107'
    UNION ALL SELECT 'DTS305', 'VUA/ST/108'
    UNION ALL SELECT 'CYB301', 'VUA/ST/109'
) AS allocations
JOIN Course c ON c.course_code = allocations.course_code
JOIN Lecturer l ON l.staff_no = allocations.staff_no;

SELECT c.course_code, c.course_title, l.full_name
FROM CourseAllocation ca
JOIN Course c ON ca.course_id = c.course_id
JOIN Lecturer l ON ca.lecturer_id = l.lecturer_id
ORDER BY c.course_code;

SELECT matric_no, full_name, dept_id
FROM Student
WHERE matric_no = 'VUG/SEN/24/11435';

UPDATE Student
SET dept_id = 2
WHERE matric_no = 'VUG/SEN/24/11435';

SELECT dept_id, dept_name
FROM Department;

UPDATE Student
SET dept_id = 4
WHERE matric_no = 'VUG/SEN/24/11435';

SELECT matric_no, full_name, dept_id
FROM Student
WHERE matric_no = 'VUG/SEN/24/11435';

INSERT INTO Department (dept_name)
VALUES ('Library and Information Science');

INSERT INTO Student (matric_no, full_name, dept_id)
VALUES (
    '20239999',
    'Transfer Student',
    (SELECT dept_id FROM Department
     WHERE dept_name = 'Library and Information Science')
);

DELETE FROM Department
WHERE dept_name = 'Library and Information Science';

UPDATE Student
SET dept_id = (
    SELECT dept_id FROM Department
    WHERE dept_name = 'Software Engineering'
)
WHERE matric_no = '20239999';

DELETE FROM Department
WHERE dept_name = 'Library and Information Science';

SELECT * FROM Department;

SELECT 'Departments' AS tbl, COUNT(*) AS total FROM Department
UNION ALL
SELECT 'Lecturers', COUNT(*) FROM Lecturer
UNION ALL
SELECT 'Students', COUNT(*) FROM Student
UNION ALL
SELECT 'Courses', COUNT(*) FROM Course
UNION ALL
SELECT 'Enrolments', COUNT(*) FROM Enrolment
UNION ALL
SELECT 'Allocations', COUNT(*) FROM CourseAllocation;