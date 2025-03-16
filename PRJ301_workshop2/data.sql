/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  LENOVO
 * Created: Mar 14, 2025
 */
-- Create database
CREATE DATABASE PRJ301_SE1820_workshop2;
USE PRJ301_SE1820_workshop2;

DROP table tblUsers
-- Create Users Table
CREATE TABLE tblUsers (
    username VARCHAR(50) PRIMARY KEY,
    fullname VARCHAR(100) NOT NULL,
    password VARCHAR(255) NOT NULL,
    roleid VARCHAR(20) NOT NULL CHECK (roleid IN ('Instructor', 'Student'))
);

-- Create Exam Categories Table
CREATE TABLE tblExamCategories (
    categoryid INT IDENTITY(1,1) PRIMARY KEY,
    categoryname VARCHAR(50) NOT NULL,
    description TEXT
);


-- Create Exams Table
CREATE TABLE tblExams (
    examid INT IDENTITY(1,1) PRIMARY KEY,
    examtitle VARCHAR(100) NOT NULL,
    Subject VARCHAR(50) NOT NULL,
    categoryid INT NOT NULL,
    totalmarks INT NOT NULL,
    Duration INT NOT NULL, -- Duration in minutes
    FOREIGN KEY (categoryid) REFERENCES tblExamCategories(categoryid)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Create Questions Table
CREATE TABLE tblQuestions (
    questionid INT IDENTITY(1,1) PRIMARY KEY,
    examid INT NOT NULL,
    question_text TEXT NOT NULL,
    option_a VARCHAR(100) NOT NULL,
    option_b VARCHAR(100) NOT NULL,
    option_c VARCHAR(100) NOT NULL,
    option_d VARCHAR(100) NOT NULL,
    correct_option CHAR(1) NOT NULL CHECK (correct_option IN ('A', 'B', 'C', 'D')),
    FOREIGN KEY (examid) REFERENCES tblExams(examid)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Create Exam Results Table (Optional for storing student scores)
CREATE TABLE tblExamResults (
    resultid INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    examid INT NOT NULL,
    score INT NOT NULL,
    taken_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (username) REFERENCES tblUsers(username)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (examid) REFERENCES tblExams(examid)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Insert Sample Instructors
INSERT INTO tblUsers (username, fullname, password, roleid) 
VALUES 
('inst01', 'Anh Khoa', 'ak123', 'Instructor'),
('inst02', 'Phuong', 'ak456', 'Instructor');

-- Insert Sample Students
INSERT INTO tblUsers (username, fullname, password, roleid) 
VALUES 
('stud01', 'Alice Brown', 'passalice', 'Student'),
('stud02', 'David Wilson', 'passdavid', 'Student'),
('stud03', 'Maria Garcia', 'passmaria', 'Student');


-- Insert Default Categories
INSERT INTO tblExamCategories (categoryname, description) 
VALUES ('Quiz', 'Short quizzes for students'),
       ('Midterm', 'Midterm exams covering half of course'),
       ('Final', 'Final exams for course completion');

