-- ============================================
-- Member 5 (Lucky Umoka): Junction Tables
-- Student_Courses + Student_Activities
-- ============================================

-- ============================================
-- JUNCTION TABLE 1: Student_Courses
-- Connects Students to Courses (many-to-many)
-- One student can take many courses
-- One course can have many students
-- ============================================

CREATE TABLE IF NOT EXISTS Student_Courses (
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- INSERT 5 sample enrollments
INSERT INTO Student_Courses (student_id, course_id, enrollment_date) VALUES
(1, 1, '2026-01-15'),
(1, 2, '2026-01-15'),
(2, 1, '2026-01-16'),
(3, 3, '2026-01-17'),
(4, 2, '2026-01-18');

-- UPDATE enrollment date
UPDATE Student_Courses
SET enrollment_date = '2026-02-01'
WHERE student_id = 1 AND course_id = 1;

-- DELETE an enrollment
DELETE FROM Student_Courses
WHERE student_id = 4 AND course_id = 2;

-- SELECT students enrolled in course 1
SELECT * FROM Student_Courses
WHERE course_id = 1;

-- ============================================
-- JUNCTION TABLE 2: Student_Activities
-- Connects Students to Activities (many-to-many)
-- One student can join many activities
-- One activity can have many students
-- ============================================

CREATE TABLE IF NOT EXISTS Student_Activities (
    student_id INT NOT NULL,
    activity_id INT NOT NULL,
    join_date DATE,
    PRIMARY KEY (student_id, activity_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (activity_id) REFERENCES Extra_Curricular_Activities(activity_id)
);

-- INSERT 5 sample memberships
INSERT INTO Student_Activities (student_id, activity_id, join_date) VALUES
(1, 1, '2026-02-01'),
(2, 2, '2026-02-05'),
(3, 1, '2026-02-10'),
(4, 3, '2026-02-12'),
(1, 2, '2026-02-15');

-- UPDATE join date
UPDATE Student_Activities
SET join_date = '2026-03-01'
WHERE student_id = 1 AND activity_id = 1;

-- DELETE a membership
DELETE FROM Student_Activities
WHERE student_id = 4 AND activity_id = 3;

-- SELECT all activities student 1 joined
SELECT * FROM Student_Activities
WHERE student_id = 1;

