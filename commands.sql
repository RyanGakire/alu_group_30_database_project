--  .....................................................
-- : 	     Group 30: The ALU Database Schema           :
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
-- Member B - Classroom table
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

-- ============================
-- Member C - Faculty Table
-- ============================

CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    department VARCHAR(50),
    hire_date DATE,
    phone_number VARCHAR(20)
);

INSERT INTO Faculty (first_name, last_name, email, department, hire_date, phone_number) VALUES
('Sia', 'Millimouno', 'sia.millimouno@alu.edu', 'Software Engineering', '2019-08-15', '0788123456'),
('Ryan', 'Gakire', 'ryan.gakire@alu.edu', 'Software Engineering', '2020-01-10', '0788234567'),
('Billy', 'Ouattara', 'billy.ouattara@alu.edu', 'Entrepreneurial Leadership', '2018-09-01', '0788345678'),
('Germain', 'Iradukunda', 'germain.iradukunda@alu.edu', 'Software Engineering', '2021-03-20', '0788456789'),
('Lucky', 'Umoka', 'lucky.umoka@alu.edu', 'Software Engineering', '2017-11-05', '0788567890'),
('Blessing', 'Agordome', 'blessing.agordome@alu.edu', 'Entrepreneurial Leadership', '2022-05-12', '0788678901'),
('Hulda', 'Kabore', 'hulda.kabore@alu.edu', 'Software Engineering', '2020-09-01', '0788789012');

-- UPDATE
UPDATE Faculty
SET department = 'Computer Science'
WHERE faculty_id = 3;

-- DELETE
DELETE FROM Faculty
WHERE faculty_id = 7;

-- SELECT
SELECT * FROM Faculty
WHERE department = 'Software Engineering';

-- Extra_Curricular_Activities table
-- done by Fiinsi
-- waiting on Faculty table to exist before this can run
CREATE TABLE Extra_Curricular_Activities (
    activity_id INT PRIMARY KEY AUTO_INCREMENT,
    activity_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    schedule_day VARCHAR(20),
    advisor_id INT,
    max_participants INT,
    FOREIGN KEY (advisor_id) REFERENCES Faculty(faculty_id)
);

INSERT INTO Extra_Curricular_Activities (activity_name, category, schedule_day, advisor_id, max_participants) VALUES
('Movie Club', 'Entertainment', 'Monday', 1, 25),
('Theatre Club', 'Arts', 'Tuesday', 2, 20),
('Book Club', 'Academic Club', 'Wednesday', 3, 30),
('Design Club', 'Academic Club', 'Thursday', 4, 40),
('Photography Club', 'Arts', 'Friday', 5, 15),
('Critics Club', 'Entertainment', 'Saturday', 1, 20);

UPDATE Extra_Curricular_Activities
SET max_participants = 35
WHERE activity_name = 'Book Club';

DELETE FROM Extra_Curricular_Activities
WHERE activity_name = 'Photography Club';

SELECT * FROM Extra_Curricular_Activities
WHERE category = 'Academic Club';
