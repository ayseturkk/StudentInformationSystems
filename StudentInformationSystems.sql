CREATE DATABASE StudentInformationSystems

USE StudentInformationSystems;
GO


CREATE TABLE students (
    std_id INT PRIMARY KEY IDENTITY(1,1),
    first_name NVARCHAR(50),
    last_name NVARCHAR(50),
    birthdate DATE,
    gender CHAR(1)
);


CREATE TABLE lessons (
    lesson_id INT PRIMARY KEY IDENTITY(1,1),
    lesson_name NVARCHAR(100),
    credit INT,
    teacher_id INT
);


CREATE TABLE grades (
    grade_id INT PRIMARY KEY IDENTITY(1,1),
    std_id INT FOREIGN KEY REFERENCES students(std_id),
    lesson_id INT FOREIGN KEY REFERENCES lessons(lesson_id),
    grade DECIMAL(4,2)
);


CREATE TABLE teachers (
    teacher_id INT PRIMARY KEY IDENTITY(1,1),
    first_name NVARCHAR(50),
    last_name NVARCHAR(50),
    birthdate DATE,
    gender CHAR(1)
);


ALTER TABLE lessons
ADD CONSTRAINT FK_lessons_teachers FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id);


INSERT INTO teachers (first_name, last_name, birthdate, gender)
VALUES
('Ahmet', 'Yýlmaz', '2000-05-15', 'E'),
('Ayþe', 'Türk', '2001-10-06', 'K'),
('Mehmet', 'Demir', '2001-12-30', 'E');


INSERT INTO students (first_name, last_name, birthdate, gender)
VALUES
('Ali', 'Veli', '1975-01-10', 'E'),
('Ayþe', 'Öztürk', '1980-03-25', 'K'),
('Mehmet', 'Çetin', '1985-07-14', 'E');


INSERT INTO lessons(lesson_name, credit, teacher_id)
VALUES
('Matematik', 4, 1),
('Fizik', 3, 2),
('Kimya', 2, 3);


INSERT INTO grades (std_id, lesson_id, grade)
VALUES
(1, 1, 85.5),
(1, 2, 78.0),
(2, 1, 92.0),
(3, 3, 68.5);


SELECT 
    students.first_name AS StudentName,
    students.last_name AS StudentSurname,
    lessons.lesson_name,
    grades.grade
FROM 
    grades
INNER JOIN 
    students ON grades.std_id = students.std_id
INNER JOIN 
    lessons ON grades.lesson_id = lessons.lesson_id;


SELECT 
    students.first_name AS StudentName,
    students.last_name AS StudentSurname,
    lessons.lesson_name,
    grades.grade
FROM 
    grades
INNER JOIN 
    students ON grades.std_id = students.std_id
INNER JOIN 
    lessons ON grades.lesson_id = lessons.lesson_id
WHERE 
    students.std_id = 1;


SELECT 
    teachers.first_name AS TeacherName,
    teachers.last_name AS TeacherSurname,
    lessons.lesson_name
FROM 
    lessons
INNER JOIN 
    teachers ON lessons.teacher_id = teachers.teacher_id;


SELECT 
    teachers.first_name AS TeacherName,
    teachers.last_name AS TeacherSurname,
    lessons.lesson_name,
    students.first_name AS StudentName,
    students.last_name AS StudentSurname,
    lessons.lesson_name,
    grades.grade
FROM 
    grades
INNER JOIN 
    students ON grades.std_id = students.std_id
INNER JOIN 
    lessons ON grades.lesson_id = lessons.lesson_id
INNER JOIN 
    teachers ON lessons.teacher_id = teachers.teacher_id;
