--  .....................................................
-- :         Group 30: The ALU Database Schema           :
-- :.....................................................:

-- =======================================================
-- 1. CREATE DATABASE
-- =======================================================
CREATE DATABASE IF NOT EXISTS defaultdb;
USE defaultdb;

-- =======================================================
-- 2. CREATE TABLE statements (in dependency order)
-- =======================================================

-- =======================================================
-- Member A - Student Table (Billy Mellika Assita Ouattara)
-- =======================================================
CREATE TABLE Students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    classroom_id INT,
    enrollment_date DATE,
    FOREIGN KEY (classroom_id) REFERENCES Classroom(classroom_id)
);

-- INSERT
INSERT INTO Students (name, email, classroom_id, enrollment_date) VALUES
('Laila', 'laila.k@alu.edu', 1, '2023-09-01'),
('Virginie Sia', 'virginie.sia@alu.edu', 2, '2023-09-01'),
('Germain Akayezu', 'germain.akayezu@alu.edu', 3, '2023-09-05'),
('Ryan Gakire', 'ryan.gakire@alu.edu', 6, '2024-01-15'),
('Lucky Umoka', 'lucky.umoka@alu.edu', 8, '2024-01-20');

-- UPDATE
UPDATE Students
SET email = 'laila.k@alu.edu'
WHERE name = 'Laila';

-- DELETE
DELETE FROM Students
WHERE name = 'Lucky Umoka';

-- SELECT
SELECT * FROM Students
WHERE classroom_id = 2;

-- =======================================================
-- Member B - Classroom table (Ryan Prince Gakire)
-- =======================================================
CREATE TABLE Classroom(
        classroom_id INT PRIMARY KEY AUTO_INCREMENT,
        room_number VARCHAR(10),
        building VARCHAR(50),
        capacity INT
);

-- INSERT (Member B)
INSERT INTO Classroom (room_number, building, capacity) VALUES
('106', 'Engineering Block', 28),
('107', 'Engineering Block', 32),
('108', 'Computer Science Block', 38),
('109', 'Computer Science Block', 22),
('110', 'Arts Block', 50);

-- UPDATE (Member B)
UPDATE Classroom
SET capacity = 30
WHERE room_number = '106';

-- DELETE (Member B)
DELETE FROM Classroom
WHERE room_number = '110';

-- SELECT (Member B)
SELECT * FROM Classroom
WHERE capacity > 25;


-- =======================================================
-- Member C - Faculty Table (Sia Virginie Millimouno)
-- =======================================================
CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    department VARCHAR(50),
    hire_date DATE,
    phone_number VARCHAR(20)
);

-- INSERT (Member C) - Dates d'embauche réparties de 2024 à 2026
INSERT INTO Faculty (first_name, last_name, email, department, hire_date, phone_number) VALUES
('Sia', 'Millimouno', 'sia.millimouno@alu.edu', 'Software Engineering', '2024-02-15', '0788123456'),
('Ryan', 'Gakire', 'ryan.gakire@alu.edu', 'Software Engineering', '2024-11-10', '0788234567'),
('Billy', 'Ouattara', 'billy.ouattara@alu.edu', 'Entrepreneurial Leadership', '2025-03-01', '0788345678'),
('Germain', 'Iradukunda', 'germain.iradukunda@alu.edu', 'Software Engineering', '2025-08-20', '0788456789'),
('Lucky', 'Umoka', 'lucky.umoka@alu.edu', 'Software Engineering', '2026-01-05', '0788567890'),
('Blessing', 'Agordome', 'blessing.agordome@alu.edu', 'Entrepreneurial Leadership', '2026-03-12', '0788678901'),
('Hulda', 'Kabore', 'hulda.kabore@alu.edu', 'Software Engineering', '2026-05-01', '0788789012');

-- UPDATE (Member C)
UPDATE Faculty
SET department = 'Computer Science'
WHERE faculty_id = 3;

-- DELETE (Member C)
DELETE FROM Faculty
WHERE faculty_id = 7;

-- SELECT (Member C)
SELECT * FROM Faculty
WHERE department = 'Software Engineering';

-- ================================================
-- Member D - Courses Table (Iradukunda Akayezu Germain)
-- ================================================
CREATE TABLE Courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    credits INT,
    faculty_id INT,
    classroom_id INT,
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id),
    FOREIGN KEY (classroom_id) REFERENCES Classroom(classroom_id)
);

-- INSERT (Member D)
INSERT INTO Courses (course_name, credits, faculty_id, classroom_id) VALUES
('Database Systems', 4, 1, 1),
('Software Engineering', 3, 2, 2),
('Web Development', 3, 1, 3),
('Data Structures', 4, 3, 1),
('Operating Systems', 4, 2, 2);

-- UPDATE (Member D)
UPDATE Courses
SET credits = 5
WHERE course_name = 'Database Systems';

-- DELETE (Member D)
DELETE FROM Courses
WHERE course_name = 'Operating Systems';

-- SELECT (Member D)
SELECT * FROM Courses
WHERE credits >= 4;

-- =======================================================
-- Member E - Extra Curricular Activities (Fiinsi)
-- =======================================================
CREATE TABLE Extra_Curricular_Activities (
    activity_id INT PRIMARY KEY AUTO_INCREMENT,
    activity_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    schedule_day VARCHAR(20),
    advisor_id INT,
    max_participants INT,
    FOREIGN KEY (advisor_id) REFERENCES Faculty(faculty_id)
);

-- INSERT (Member E)
INSERT INTO Extra_Curricular_Activities (activity_name, category, schedule_day, advisor_id, max_participants) VALUES
('Movie Club', 'Entertainment', 'Monday', 1, 25),
('Theatre Club', 'Arts', 'Tuesday', 2, 20),
('Book Club', 'Academic Club', 'Wednesday', 3, 30),
('Design Club', 'Academic Club', 'Thursday', 4, 40),
('Photography Club', 'Arts', 'Friday', 5, 15),
('Critics Club', 'Entertainment', 'Saturday', 1, 20);

-- UPDATE (Member E)
UPDATE Extra_Curricular_Activities
SET max_participants = 35
WHERE activity_name = 'Book Club';

-- DELETE (Member E)
DELETE FROM Extra_Curricular_Activities
WHERE activity_name = 'Photography Club';

-- SELECT (Member E)
SELECT * FROM Extra_Curricular_Activities
WHERE category = 'Academic Club';

-- SELECT with GROUP BY (Member E)
SELECT category, COUNT(*) AS total
FROM Extra_Curricular_Activities
GROUP BY category;

-- =======================================================
-- Member 5 (Lucky Umoka) - Junction Tables
-- =======================================================

-- -------------------------------------------------------
-- JUNCTION TABLE 1: Student_Courses
-- PURPOSE: One student can take many courses.
--          One course can have many students.
--          We cannot store this in either table alone
--          so we create a middle table that stores pairs.
-- -------------------------------------------------------
CREATE TABLE IF NOT EXISTS Student_Courses (
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- INSERT (Member 5)
INSERT INTO Student_Courses (student_id, course_id, enrollment_date) VALUES
(1, 1, '2026-01-15'),
(1, 2, '2026-01-15'),
(2, 1, '2026-01-16'),
(3, 3, '2026-01-17'),
(4, 2, '2026-01-18');

-- UPDATE (Member 5)
UPDATE Student_Courses
SET enrollment_date = '2026-02-01'
WHERE student_id = 1 AND course_id = 1;

-- DELETE (Member 5)
DELETE FROM Student_Courses
WHERE student_id = 4 AND course_id = 2;

-- SELECT (Member 5)
SELECT * FROM Student_Courses
WHERE course_id = 1;

-- -------------------------------------------------------
-- JUNCTION TABLE 2: Student_Activities
-- PURPOSE: One student can join many activities.
--          One activity can have many students.
--          Same many-to-many problem solved with junction.
-- -------------------------------------------------------
CREATE TABLE IF NOT EXISTS Student_Activities (
    student_id INT NOT NULL,
    activity_id INT NOT NULL,
    join_date DATE,
    PRIMARY KEY (student_id, activity_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (activity_id) REFERENCES Extra_Curricular_Activities(activity_id)
);

-- INSERT (Member 5)
INSERT INTO Student_Activities (student_id, activity_id, join_date) VALUES
(1, 1, '2026-02-01'),
(2, 2, '2026-02-05'),
(3, 1, '2026-02-10'),
(4, 3, '2026-02-12'),
(1, 2, '2026-02-15');

-- UPDATE (Member 5)
UPDATE Student_Activities
SET join_date = '2026-03-01'
WHERE student_id = 1 AND activity_id = 1;

-- DELETE (Member 5)
DELETE FROM Student_Activities
WHERE student_id = 4 AND activity_id = 3;

-- SELECT (Member 5)
SELECT * FROM Student_Activities
WHERE student_id = 1;

-- -------------------------------------------------------
-- JOIN QUERY 1:
-- "Student X is enrolled in Course Y,
--  taught by Faculty Z, in Classroom W"
-- -------------------------------------------------------
SELECT
    s.name AS student_name,
    c.course_name,
    CONCAT(f.first_name, ' ', f.last_name) AS faculty_name,
    cl.room_number AS classroom
FROM Students s
JOIN Student_Courses sc ON s.student_id = sc.student_id
JOIN Courses c ON sc.course_id = c.course_id
JOIN Faculty f ON c.faculty_id = f.faculty_id
JOIN Classroom cl ON c.classroom_id = cl.classroom_id;

-- -------------------------------------------------------
-- JOIN QUERY 2:
-- "Student X participates in Activity Y,
--  advised by Faculty Z"
-- -------------------------------------------------------
SELECT
    s.name AS student_name,
    a.activity_name,
    CONCAT(f.first_name, ' ', f.last_name) AS advisor_name
FROM Students s
JOIN Student_Activities sa ON s.student_id = sa.student_id
JOIN Extra_Curricular_Activities a ON sa.activity_id = a.activity_id
JOIN Faculty f ON a.advisor_id = f.faculty_id;

-- -------------------------------------------------------
-- JOIN QUERY 3:
-- "All students with their enrolled courses and credits"
-- -------------------------------------------------------
SELECT
    s.name AS student_name,
    c.course_name,
    c.credits,
    sc.enrollment_date
FROM Students s
JOIN Student_Courses sc ON s.student_id = sc.student_id
JOIN Courses c ON sc.course_id = c.course_id
ORDER BY s.name;

-- -------------------------------------------------------
-- AGGREGATE QUERY:
-- "How many students are enrolled in each course"
-- -------------------------------------------------------
SELECT
    c.course_name,
    COUNT(sc.student_id) AS number_of_students
FROM Courses c
JOIN Student_Courses sc ON c.course_id = sc.course_id
GROUP BY c.course_name;

/*
NORMALIZATION CHECK - Group 30:
Our database is in Third Normal Form (3NF). Each table stores
information about exactly one thing. Students stores student data,
Faculty stores faculty data, Courses stores course data, and so on.
We avoided many-to-many duplication by using two junction tables.
Student_Courses connects students to courses without repeating
student or course information in either table. Student_Activities
connects students to activities the same way. No table contains
data that belongs in another table, and all non-key columns depend
only on the primary key of their own table. This design prevents
data anomalies when inserting, updating, or deleting records.
*/


