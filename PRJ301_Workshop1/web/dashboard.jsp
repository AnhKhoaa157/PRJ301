<%-- 
    Document   : dashboard
    Created on : Mar 3, 2025, 9:13:28 AM
    Author     : LENOVO
--%>

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
                text-align: center;
            }
            .container {
                width: 50%;
                margin: 50px auto;
                background: white;
                padding: 20px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
            }
            h1 {
                color: #333;
            }
            form {
                margin-top: 20px;
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
        </style>
    </head>
    <body>
        <div style="min-height: 500px; padding: 10px">
            <%   if(session.getAttribute("user") != null){
                    UserDTO user = (UserDTO)session.getAttribute("user");
                
            %>
            <h1> Welcome <%=user.getName()%> </h1>
            <form action="MainController" method="post">
                <input type="hidden" name="action" value="logout"/>
                <input type="submit" value="Logout"/>
            </form>
            
            <br/>
            <% 
                String searchTerm = request.getAttribute("searchTerm")+"";
                searchTerm = searchTerm.equals("null")?"":searchTerm;
            %>
            <form action="MainController">
                <input type="hidden" name="action" value="search"/>
                Search Here: <input type="text" name="searchTerm" value="<%=searchTerm%>"/>
                <input type="submit" value="Search"/>
            </form>
                
            <%
                if(request.getAttribute("projects") != null){
                    List<startupProjectDTO> projects = (List<startupProjectDTO>)request.getAttribute("projects");
                
            %>
            <table class="project-table">
                <thead>
                    <tr>
                        <th>ProjectID</th>
                        <th>ProjectName</th>
                        <th>Description</th>
                        <th>Status</th>
                        <th>EstimatedLaunch</th>
                    </tr>
                </thead>
                <tbody>
                    <% for(startupProjectDTO sp : projects){
                    %>
                    <tr>
                        <td><%=sp.getProjectID()%></td>
                        <td><%=sp.getProjectName()%></td>
                        <td><%=sp.getDescription()%></td>
                        <td><%=sp.getStatus()%></td>
                        <td><%=sp.getEstimatedLaunch()%></td>
                        <td><a href="MainController!action=delete&id<%=sp.getProjectID()%>&searchTerm=<%=searchTerm%>">
                                <img src="images/delete-icon-1877x2048-1t1g6f82.png" style="height: 25px" alt="delete-icon">
                            </a></td>
                    </tr>
                    <% 
                        }
                    %>
                </tbody>
            </table>
            <% }
            } else { %>
                You do not have permission to access this content.
            <%}%>
        </div>
    </body>
</html>
