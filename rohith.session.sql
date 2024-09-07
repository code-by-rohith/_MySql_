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


ALTER DATABASE information READ ONLY =0;

SELECT * from student_details


ALTER TABLE student_details
MODIFY  gender VARCHAR(10)
AFTER last_name;

ALTER TABLE student_details
MODIFY enrollment_year INT
FIRST;

ALTER TABLE student_details
MODIFY enrollment_year INT
AFTER gpa

SELECT * from student_details

SELECT * 
FROM student_details
WHERE first_name LIKE 'S%';

SELECT * 
FROM student_details
ORDER BY RAND()
LIMIT 1;

SELECT MAX(gpa) AS second_highest_gpa
FROM student_details
WHERE gpa < (SELECT MAX(gpa) FROM student_details);

SELECT * 
FROM student_details
ORDER BY LENGTH(first_name) DESC
LIMIT 3;

SELECT CONCAT(first_name, ' ', last_name) AS full_name, gpa
FROM student_details;

SELECT * 
FROM student_details
WHERE enrollment_year BETWEEN 2019 AND 2021;

SELECT * 
FROM student_details
WHERE INSTR(last_name, ',') > 0;



SELECT * 
FROM student_details
WHERE INSTR(first_name, ' ') > 0 OR INSTR(last_name, ' ') > 0;

SHOW INDEX FROM student_details;

UPDATE student_details
SET department = CASE
    WHEN student_id = 1 THEN 'Artificial Intelligence'
    WHEN student_id = 2 THEN 'Robotics'
    ELSE department
END
WHERE student_id IN (1, 2);


SELECT department, first_name, last_name, gpa
FROM student_details
WHERE (department, gpa) IN (
    SELECT department, MAX(gpa)
    FROM student_details
    GROUP BY department
);


SELECT enrollment_year, COUNT(*) AS number_of_students
FROM student_details
GROUP BY enrollment_year;


SELECT department, first_name, last_name, age
FROM student_details
WHERE age = (
    SELECT MIN(age)
    FROM student_details 
);


SELECT 
    ABS(
        (SELECT AVG(gpa) FROM student_details WHERE gender = 'Male') - 
        (SELECT AVG(gpa) FROM student_details WHERE gender = 'Female')
    ) AS gpa_difference;


UPDATE student_details
SET gpa = gpa + 0.1
WHERE gpa < 3.6;


SELECT*from student_details

SELECT first_name, last_name
FROM student_details
WHERE LENGTH(first_name) > 5 OR LENGTH(last_name) > 10;

SELECT first_name, last_name, gpa,
       CASE
           WHEN gpa >= 3.8 THEN 'Excellent'
           WHEN gpa >= 3.5 THEN 'Good'
           ELSE 'Needs Improvement'
       END AS performance
FROM student_details;


