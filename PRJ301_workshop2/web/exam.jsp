<%-- 
    Document   : exam
    Created on : Mar 14, 2025, 10:36:02 PM
    Author     : LENOVO
--%>

<%@page import="java.util.List"%>
<%@page import="dto.ExamsDTO"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
<%@include file="header.jsp" %>

        <%
            UserDTO user = (session != null) ? (UserDTO) session.getAttribute("user") : null;
            if (user != null) {
                List<ExamsDTO> examsList = (List<ExamsDTO>) request.getAttribute("examsList");
        %>
            <h1>Exam List by Category</h1>

            <% if (examsList != null && !examsList.isEmpty()) { %>
                <table>
                    <thead>
                        <tr>
                            <th>Exam ID</th>
                            <th>Title</th>
                            <th>Subject</th>
                            <th>Total Marks</th>
                            <th>Duration (mins)</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (ExamsDTO exam : examsList) { %>
                            <tr>
                                <td><%= exam.getExamID() %></td>
                                <td><%= exam.getExamTitle() %></td>
                                <td><%= exam.getSubject() %></td>
                                <td><%= exam.getTotalmarks()%></td>
                                <td><%= exam.getDuration() %></td>
                                <td><a href="MainController?action=startExam&examID=<%= exam.getExamID()%>">Start Exam</a></td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            <% } else { %>
                <p>No exams found for this category.</p>
            <% } %>

        <% } else { %>
            <p>You do not have permission to access this content.</p>
        <% } %>

        <%@include file="footer.jsp" %>
    </body>
</html>
