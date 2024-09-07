-- Create the main database
CREATE DATABASE school;
USE school;

-- Create the students table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    department VARCHAR(100),
    enrollment_year INT
);

-- Create the courses table
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    department VARCHAR(100)
);

-- Create the enrollments table
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enrollment_date DATE
);

-- Insert data into students
INSERT INTO students (student_id, first_name, last_name, age, department, enrollment_year)
VALUES
(1, 'John', 'Doe', 20, 'Computer Science', 2022),
(2, 'Jane', 'Smith', 22, 'Mathematics', 2021),
(3, 'Alice', 'Johnson', 21, 'Physics', 2023),
(4, 'Bob', 'Brown', 23, 'Chemistry', 2020);

-- Insert data into courses
INSERT INTO courses (course_id, course_name, department)
VALUES
(101, 'Database Systems', 'Computer Science'),
(102, 'Calculus I', 'Mathematics'),
(103, 'Quantum Mechanics', 'Physics'),
(104, 'Organic Chemistry', 'Chemistry');

-- Insert data into enrollments
INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES
(1, 101, '2023-01-15'),
(2, 102, '2023-01-20'),
(3, 103, '2023-01-25'),
(4, 104, '2023-01-30');

-- Perform different types of joins

-- 1. Inner Join: Get student names and their enrolled courses
SELECT s.first_name AS Student, s.last_name AS LastName, c.course_name AS Course
FROM students s
INNER JOIN enrollments e ON s.student_id = e.student_id
INNER JOIN courses c ON e.course_id = c.course_id;

-- 2. Left Join: List all students and their enrolled courses (including students with no enrollments)
SELECT s.first_name AS Student, s.last_name AS LastName, c.course_name AS Course
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
LEFT JOIN courses c ON e.course_id = c.course_id;

-- 3. Right Join: List all courses and their enrolled students (including courses with no enrollments)
SELECT c.course_name AS Course, s.first_name AS Student, s.last_name AS LastName
FROM courses c
RIGHT JOIN enrollments e ON c.course_id = e.course_id
RIGHT JOIN students s ON e.student_id = s.student_id;

-- Full Outer Join: List all students and courses, including those without enrollments
(
    SELECT s.first_name AS Student, s.last_name AS LastName, c.course_name AS Course
    FROM students s
    LEFT JOIN enrollments e ON s.student_id = e.student_id
    LEFT JOIN courses c ON e.course_id = c.course_id
)
UNION
(
    SELECT s.first_name AS Student, s.last_name AS LastName, c.course_name AS Course
    FROM courses c
    LEFT JOIN enrollments e ON c.course_id = e.course_id
    LEFT JOIN students s ON e.student_id = s.student_id
);

