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

-- UPDATE
UPDATE Classroom SET building = 'Biology Block' WHERE classroom_id = 1;

-- DELETE
DELETE FROM Classroom WHERE classroom_id = 5;

-- SELECT
SELECT * FROM Classroom WHERE capacity > 30;

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

