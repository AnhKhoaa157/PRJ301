/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  LENOVO
 * Created: Mar 2, 2025
 */

Create database prj301_workshop1

use prj301_workshop1

CREATE TABLE tblUsers (
    Username VARCHAR(50) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Role VARCHAR(20) NOT NULL CHECK (Role IN ('Founder', 'Team Member'))
);

CREATE TABLE tblStartupProjects (
    project_id INT IDENTITY(1,1) PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    Description TEXT NULL,
    Status VARCHAR(20) NOT NULL CHECK (Status IN ('Ideation', 'Development', 'Launch', 'Scaling')),
    estimated_launch DATE NOT NULL
);

INSERT INTO tblUsers (Username, Name, Password, Role) VALUES
-- 5 Founder
('founder01', 'Ly Anh Khoa', '123456', 'Founder'),
('founder02', 'Nguyen Minh Tuan', 'abcdef', 'Founder'),
('founder03', 'Tran Quoc Huy', 'pass123', 'Founder'),
('founder04', 'Pham Hoang Nam', 'securepass', 'Founder'),
('founder05', 'Doan Ngoc Son', 'son123', 'Founder'),

-- 15 Team Member
('team01', 'Vu Duc Hieu', 'hieu789', 'Team Member'),
('team02', 'Bui Tien Dung', 'dung@123', 'Team Member'),
('team03', 'Ngo Thanh Phong', 'phong456', 'Team Member'),
('team04', 'Pham Quang Huy', 'huyhuy', 'Team Member'),
('team05', 'Tran Dinh Bao', 'baobao', 'Team Member'),
('team06', 'Nguyen Thi Mai', 'mai123', 'Team Member'),
('team07', 'Le Hoang Anh', 'hoanganh', 'Team Member'),
('team08', 'Vu Hong Son', 'sonson', 'Team Member'),
('team09', 'Pham Bao Chau', 'chauchau', 'Team Member'),
('team10', 'Tran Van Hung', 'hung456', 'Team Member'),
('team11', 'Nguyen Thanh Tam', 'tam789', 'Team Member'),
('team12', 'Do Hoai Nam', 'namnam', 'Team Member'),
('team13', 'Bui Van Tuan', 'tuan000', 'Team Member'),
('team14', 'Vo Ngoc Linh', 'linhlinh', 'Team Member'),
('team15', 'Ly Dinh Khoa', 'khoa789', 'Team Member');


INSERT INTO tblStartupProjects (project_name, Description, Status, estimated_launch) VALUES
('SmartHome AI', 'He thong AI dieu khien nha thong minh.', 'Ideation', '2025-08-15'),
('EduTech Hub', 'Nen tang hoc truc tuyen ca nhan hoa.', 'Development', '2025-10-01'),
('GreenEnergy Solutions', 'Ung dung quan ly nang luong tai tao.', 'Launch', '2025-06-20'),
('HealthConnect', 'He thong ket noi benh vien voi benh nhan.', 'Scaling', '2025-12-10'),
('AgriTech Pro', 'Ung dung AI toi uu san xuat nong nghiep.', 'Development', '2025-11-05'),
('CryptoSecure', 'Vi dien tu blockchain an toan.', 'Launch', '2025-07-30'),
('FoodieGo', 'App giao do an thong minh.', 'Scaling', '2025-09-20'),
('FitTrack', 'Ung dung theo doi suc khoe ca nhan.', 'Ideation', '2026-01-15'),
('JobMatch', 'Nen tang ket noi nha tuyen dung va ung vien.', 'Development', '2025-10-25'),
('SmartRetail', 'He thong quan ly ban le tu dong.', 'Launch', '2025-08-05');