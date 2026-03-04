-- ================================
-- Student Management System - SQL
-- ================================

-- 1. Create Database
CREATE DATABASE student_management;
USE student_management;

-- ================================
-- 2. Create Tables
-- ================================

-- Students Table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(50),
    year INT
);

-- Courses Table
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL,
    credits INT
);

-- Marks Table
CREATE TABLE marks (
    mark_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    marks INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- ================================
-- 3. Insert Sample Data
-- ================================

INSERT INTO students VALUES
(1, 'Ravi Kumar', 'CSE', 3),
(2, 'Anita Sharma', 'ECE', 2),
(3, 'Kiran Rao', 'IT', 4),
(4, 'Sneha Patel', 'CSE', 1);

INSERT INTO courses VALUES
(101, 'Database Management Systems', 4),
(102, 'Python Programming', 3),
(103, 'Java Programming', 4);

INSERT INTO marks VALUES
(1, 1, 101, 85),
(2, 1, 103, 90),
(3, 2, 102, 78),
(4, 3, 101, 88),
(5, 4, 102, 92);

-- ================================
-- 4. Basic Queries
-- ================================

-- View all students
SELECT * FROM students;

-- View all courses
SELECT * FROM courses;

-- View all marks
SELECT * FROM marks;

-- ================================
-- 5. Filtering Queries
-- ================================

-- Students from CSE department
SELECT * FROM students
WHERE department = 'CSE';

-- Students scoring above 80
SELECT * FROM marks
WHERE marks > 80;

-- ================================
-- 6. Aggregate Functions
-- ================================

-- Average marks of each student
SELECT student_id, AVG(marks) AS average_marks
FROM marks
GROUP BY student_id;

-- Count students in each department
SELECT department, COUNT(*) AS total_students
FROM students
GROUP BY department;

-- ================================
-- 7. JOIN Queries (IMPORTANT)
-- ================================

-- Student name, course name, and marks
SELECT s.name, c.course_name, m.marks
FROM students s
JOIN marks m ON s.student_id = m.student_id
JOIN courses c ON m.course_id = c.course_id;

-- ================================
-- End of Project
-- ================================