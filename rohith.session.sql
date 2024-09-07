CREATE DATABASE information;
use information

CREATE TABLE student_details (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    department VARCHAR(100),
    gpa DECIMAL(3, 2),
    enrollment_year INT
);


INSERT INTO student_details (student_id, first_name, last_name, age, gender, department, gpa, enrollment_year)
VALUES
(1, 'Rohith', 'Kumar', 22, 'Male', 'Computer Science', 3.8, 2021),
(2, 'Alan', 'Walker', 23, 'Male', 'Mechanical Engineering', 3.6, 2020),
(3, 'Sara', 'Smith', 21, 'Female', 'Data Science', 3.9, 2022),
(4, 'Vikas', 'Sharma', 24, 'Male', 'Information Technology', 3.5, 2019),
(5, 'Priya', 'Rao', 22, 'Female', 'Electrical Engineering', 3.7, 2021);


ALTER DATABASE information READ ONLY =1;

SELECT * from student_details


ALTER TABLE student_details
MODIFY  gender VARCHAR(10)
AFTER last_name;

ALTER TABLE student_details
MODIFY enrollment_year INT
FIRST;

SELECT * from student_details

