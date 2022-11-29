-- Create a table named teachers
CREATE TABLE teachers (
  id INT NOT NULL PRIMARY KEY,
  first_name varchar(25) NOT NULL,
  last_name varchar(50),
  school varchar(50) NOT NULL,
  hire_date date,
  salary numeric
  );

-- Insert data into teachers table 'with param id'
INSERT INTO teachers (id, first_name, last_name, school, hire_date, salary)
    VALUES (1,'Janet', 'Smith', 'MIT', '2011-10-30', 36200),
           (2,'Lee', 'Reynolds', 'MIT', '1993-05-22', 65000),
           (3,'Samuel', 'Cole', 'Cambridge University', '2005-08-01', 43500),
           (4,'Samantha', 'Bush', 'Cambridge University', '2011-10-30', 36200),
           (5,'Betty', 'Diaz', 'Cambridge University', '2005-08-30', 43500),
           (6,'Kathleen', 'Roush', 'MIT', '2010-10-22', 38500),
           (7,'James', 'Diaz', 'Harvard University', '2003-07-18', 61000),
           (8,'Zack', 'Smith', 'Harvard University', '2000-12-29', 55500),
           (9,'Luis', 'Gonzales', 'Standford University', '2002-12-01', 50000),
           (10,'Frank', 'Abbers', 'Standford University', '1999-01-30', 66000);

-- Insert data into teachers table 'with param id'
INSERT INTO teachers (id, first_name, last_name, school, hire_date, salary)
    VALUES (11, 'Samuel', 'Abbers', 'Standford University', '2006-01-30', 32000),
           (12, 'Jessica', 'Abbers', 'Standford University', '2005-01-30', 33000),
           (13, 'Tom', 'Massi', 'Harvard University', '1999-09-09', 39500),
           (14, 'Esteban', 'Brown', 'MIT', '2007-01-30', 36000),
           (15, 'Carlos', 'Alonso', 'Standford University', '2001-01-30', 44000);

-- Show teachers table
select * from teachers

-- Create a table named courses
CREATE TABLE courses (
  id INT NOT NULL PRIMARY KEY,
  name varchar(20),
  teachers_id INT,
  total_students INT
  );
  
-- Insert data into courses table 'without param id'
INSERT INTO courses (id, name, teachers_id, total_students)
    VALUES  (1, 'Calculus', 2, 20),
            (2, 'Physics', 2, 10),
            (3, 'Calculus', 1, 30),
            (4, 'Computer Science', 1, 20),
            (5, 'Politic', 13, 15),
            (6, 'Algebra', 2, 10),
            (7, 'Algebra', 13, 30),
            (8, 'Computer Science', 10, 35),
            (9, 'Life Science', 11, 20),
            (10, 'Chemistry', 9, 22),
            (11, 'Chemistry', 8, 16),
            (12, 'Calculus', 5, 19),
            (13, 'Politic', 4, 17),
            (14, 'Biology', 6, 22),
            (15, 'Physics', 3, 29),
            (16, 'Biology', 8, 28),
            (17, 'Calculus', 12, 34),
            (18, 'Physics', 13, 34),
            (19, 'Biology', 14, 25),
            (20, 'Calculus', 15, 20);
 
 -- Show courses table
select * from courses

-- Soal : 
-- Carilah dosen yang memiliki gaji tertinggi per masing-masing mata kuliah. Tampilkan  semua atribut dosen dan semua atribut mata kuliahnya. Urutkan hasilnya berdasarkan nama  mata kuliahnya secara ascending(A-Z).
SELECT *, MAX(teachers.salary) as highest_salary
FROM teachers
INNER JOIN courses
ON teachers.id = courses.teachers_id
GROUP BY courses.name
ORDER BY courses.name

-- C.1 Group By
-- Case 1 Who is the teacher with the highest salary for each university ?
SELECT school, first_name, last_name, MAX(salary) as highest_salary
FROM teachers
GROUP BY school

-- Case 2 Who is the teacher with the highest salary from Standford University ?
SELECT school, first_name, last_name, MAX(salary) as highest_salary
FROM teachers
WHERE School = 'Standford University'

-- C.2 Join
-- Case 1 Display all courses with teacher's identity
SELECT *
FROM teachers
INNER JOIN courses
ON teachers.id = courses.teachers_id

-- Case 2 Display how many courses per universities
SELECT teachers.school, COUNT(DISTINCT courses.name) as total_courses
FROM teachers
INNER JOIN courses
ON teachers.id = courses.teachers_id
GROUP BY teachers.school

-- Case 3 : Display how many total_students per teachers
SELECT teachers.first_name, teachers.last_name, SUM(courses.total_students) as total_students_per_teacher
FROM teachers
LEFT JOIN courses
ON teachers.id = courses.teachers_id
GROUP BY teachers.id

-- Case 4 : Display how many courses per teachers
SELECT teachers.first_name, teachers.last_name, COUNT(DISTINCT courses.name) as total_courses
FROM teachers
LEFT JOIN courses
ON teachers.id = courses.teachers_id
GROUP BY teachers.id