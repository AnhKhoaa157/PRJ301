<%@page import="utils.AuthUtils"%>
<%@page import="dto.startupProjectDTO"%>
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
                background-color: #f4f4f4;
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
            .project-table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            .project-table th, .project-table td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }

            .project-table th {
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
            %>
            <h1> Welcome <%= user.getName() %> </h1>
            <form action="MainController" method="post">
                <input type="hidden" name="action" value="logout"/>
                <input type="submit" value="Logout" class="logout-btn"/>
            </form>
            <br/>
            
            <% 
                String searchTerm = request.getAttribute("searchTerm")+"";
                if (searchTerm == null) searchTerm = "";
            %>
            <form action="MainController">
                <input type="hidden" name="action" value="search"/>
                Search Here: <input type="text" name="searchTerm" value="<%= searchTerm %>"/>
                <input type="submit" value="Search"/>
            </form>
            <%
                if(AuthUtils.isFounder(session)){
            %>
                <a href="addProjects.jsp" class="add-btn">Add Project</a>
            <% }%>
            <% 
                List<startupProjectDTO> projects = (List<startupProjectDTO>) request.getAttribute("projects");
                if (request.getAttribute("projects") != null) {

            %>
            <table class="project-table">
                <thead>
                    <tr>
                        <th>Project ID</th>
                        <th>Project Name</th>
                        <th>Description</th>
                        <th>Status</th>
                        <th>Estimated Launch</th>
                        <% if(AuthUtils.isFounder(session)){
                        %>
                        <th>Action</th>
                        <% } %>
                    </tr>
                </thead>
                <tbody>
                    <% for (startupProjectDTO sp : projects) { 
                    %>
                    <tr>
                        <td><%= sp.getProjectId() %></td>
                        <td><%= sp.getProjectName() %></td>
                        <td><%= sp.getDescription() %></td>
                        <td><%= sp.getStatus() %></td>
                        <td><%= sp.getEstimatedLaunch() %></td>
                        <%
                            if(AuthUtils.isFounder(session)){
                        %>
                        <td>
                            <a href="MainController?action=delete&name=<%= sp.getProjectName() %>&searchTerm=<%= searchTerm %>">
                                <img src="images/delete-icon-1877x2048-1t1g6f82.png" style="height: 25px" alt="delete-icon">
                            </a>
                        </td>
                        
                        <% }%>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <% } else { %>
                <p>No projects found.</p>
            <% } %>
            
            <% } else { %>
                <p>You do not have permission to access this content.</p>
            <% } %>
        </div>
        <%@include file="footer.jsp"%>
    </body>
</html>
