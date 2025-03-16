<%-- 
    Document   : dashboard
    Created on : Mar 14, 2025, 11:18:19 AM
    Author     : LENOVO
--%>

<%@page import="dto.ExamCategoriesDTO"%>
<%@page import="utils.AuthUtils"%>
<%@page import="java.util.List"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dash Board</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #FEFEFE;
                margin: 0;
                padding: 0;
                text-align: left;
            }
            
            h1 {
                color: #333;
            }
            form {
                margin-top: 20px;
            }
            
            .user-container span{
                color: gray;
                font-size: 24px;
            }
            
            .user-name {
                background: linear-gradient(to right, #f7971e, #ffd200);
                -webkit-background-clip: text;
                background-clip: text;
                color: transparent;
                -webkit-text-fill-color: transparent;
                font-weight: bold; /* Optional */
                font-size: 18px; /* Optional, adjust as needed */
            }
            
           .divider {
                border: none;
                height: 10px;
                background: linear-gradient(to right, #ff5722, #007bff);
                margin: 0 auto;
                width: 100%; /* Hoặc % tùy theo ý */
                opacity: 0.7;
            }
            
            .add-btn {
                display: inline-block;
                background-color: #007bff;
                color: white;
                text-decoration: none;
                border-radius: 4px;
                padding: 10px 15px;
                margin-bottom: 20px;
                margin-top: 10px;
                font-weight: bold;
                transition: background-color 0.3s;
            }

            .add-btn:hover {
                background-color: #0069d9;
                text-decoration: none;
            }

            /* Add a nice icon to the add button */
            .add-btn::before {
                content: "+";
                margin-right: 5px;
                font-weight: bold;
            }
            
            input[type="text"] {
                width: 80%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 16px;
            }
            input[type="submit"] {
                background: #28a745;
                color: white;
                border: none;
                padding: 10px 15px;
                border-radius: 5px;
                cursor: pointer;
                font-size: 16px;
                transition: 0.3s;
            }
            input[type="submit"]:hover {
                background: #218838;
            }
            .logout-btn {
                background: #dc3545;
            }
            .logout-btn:hover {
                background: #c82333;
            }
            .form-table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            .form-table th, .form-table td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }

            .form-table th {
                background-color: #f2f2f2;
                font-weight: bold;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp"%>
        <div style="min-height: 500px; padding: 10px">
            <%
                UserDTO user = (session != null) ? (UserDTO) session.getAttribute("user") : null;
                if (user != null) {
                    String searchTerm = (request.getAttribute("searchTerm") != null) ? request.getAttribute("searchTerm").toString() : "";
                    List<ExamCategoriesDTO> examsCategories = (List<ExamCategoriesDTO>) request.getAttribute("examsCategories");
                    if (examsCategories != null && AuthUtils.isLoggedIn(session)) {
                        UserDTO role = AuthUtils.getUser(session);
            %>
            <div class="user-container">
                <span class="welcome-text">Login as <span style="color: blue" class="user-name"><%= role.getRoleID() %></span>!</span>
            </div>
            <hr class="divider">
            <h1 class="Exams-Categories-Title">Exams Categories</h1>
            <table class="form-table">
                <thead>
                    <tr>
                        <th>CategoryID</th>
                        <th>CategoryName</th>
                        <th>Description</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (ExamCategoriesDTO exct : examsCategories) {
                    %>
                        <tr>
                            <td><%= exct.getCategoryID() %></td>
                            <td><%= exct.getCategoryName() %></td>
                            <td><%= exct.getDescription() %></td>
                            <td>
                                <a href="ExamController?action=viewExams&categoryID=<%= exct.getCategoryID() %>">View Exams</a>
                            </td>
                        </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <%
                    } else {
            %>
                <p>No projects found.</p>
            <%
                    }
                } else {
            %>
                <p>You do not have permission to access this content.</p>
            <%
                }
            %>

        </div>
        <%@include file="footer.jsp"%>
    </body>
</html>