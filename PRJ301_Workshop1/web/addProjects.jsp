<%-- 
    Document   : addProjects
    Created on : Mar 4, 2025, 9:38:14 PM
    Author     : LENOVO
--%>

<%@page import="dto.UserDTO"%>
<%@page import="utils.AuthUtils"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dto.startupProjectDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Project Forms</title>
        <style>
            body {
                background-image: url("images/1000_F_252870650_q7DFTNMjW5cstLOAgbdF09y3bVovJRgz.jpg");
                background-size: cover;
                background-position: center;
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .container {
                width: 400px;
                background-image: url("images/white-abstract-background-vector-gray-abstract-modern-design-background-for-report-and-project-presentation-template-vector-illustration-graphic-futuristic-and-circular-curve-shape.jpg");
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            h1 {
                text-align: center;
                color: #333;
            }

            .form-group {
                margin-bottom: 15px;
            }

            label {
                font-weight: bold;
                display: block;
                margin-bottom: 5px;
            }

            input, select {
                width: 100%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
                font-size: 14px;
            }

            input:focus, select:focus {
                border-color: #007bff;
                outline: none;
            }

            .error-message {
                color: red;
                font-size: 13px;
                margin-top: 5px;
            }

            button {
                width: 100%;
                background: #007bff;
                color: white;
                border: none;
                padding: 10px;
                font-size: 16px;
                cursor: pointer;
                border-radius: 4px;
            }

            button:hover {
                background: #0056b3;
            }
            
            .button-group {
                margin-top: 15px;
                text-align: center; /* Căn giữa các nút */
            }

            .button-group input {
                background-color: #007bff; /* Màu xanh cho nút */
                color: white; /* Màu chữ trắng */
                border: none;
                padding: 10px 20px;
                margin: 5px;
                cursor: pointer;
                border-radius: 5px;
                font-size: 16px;
                transition: 0.3s;
            }

            .button-group input[type="reset"] {
                background-color: #dc3545; /* Màu đỏ cho nút Reset */
            }

            .button-group input:hover {
                opacity: 0.8; /* Hiệu ứng hover làm mờ nhẹ */
            }
            
            .back-link {
                display: flex;
                text-decoration: none;
                justify-content: center;
                color: red;
                font-weight: bold;
            }
            
            .back-link:hover{
                color: yellow;
                transition: 0.5s ease;
            }
            
            .error-message {
                color: red;
                font-size: 13px;
                margin-top: 5px;
                font-weight: bold;
            }
            
            .error-container {
                background-color: #fff0f0;
                border-left: 4px solid #e74c3c;
                padding: 20px;
                border-radius: 4px;
                margin-bottom: 20px;
            }

            .error-container h1 {
                color: #e74c3c;
                margin-top: 0;
            }
        </style>

    </head>
    <body>
        <div class="page-content">
            <% if(AuthUtils.isLoggedIn(session)) {
                    UserDTO user = AuthUtils.getUser(session);
                    if(AuthUtils.isFounder(session)){
            %>
            <%
                startupProjectDTO projects = new startupProjectDTO();
                try{
                    projects = (startupProjectDTO)request.getAttribute("projects");
                } catch(Exception e){
                    projects = new startupProjectDTO();
                }
                if(projects == null){
                    projects = new startupProjectDTO();
                }

                String txtProjectName_error = request.getAttribute("txtProjectName_error")+"";
                txtProjectName_error = txtProjectName_error.equals("null")?"":txtProjectName_error;
                String txtDescription_error = request.getAttribute("txtDescription_error")+"";
                txtDescription_error = txtDescription_error.equals("null")?"":txtDescription_error;
                String txtStatus_error = request.getAttribute("txtStatus_error")+"";
                txtStatus_error = txtStatus_error.equals("null")?"":txtStatus_error;
                String txtEstimatedLaunch_error = request.getAttribute("txtEstimatedLaunch_error")+"";
                txtEstimatedLaunch_error = txtEstimatedLaunch_error.equals("null")?"":txtEstimatedLaunch_error;
            %>
            <div class="container">
                <h1>Project Information</h1>
                <form action="MainController" method="post">
                    <input type="hidden" name="action" value="add"/>
                    <div class="form-group">
                        <label for="txtProjectName">Project Name:</label>
                        <input type="text" id="txtProjectName" name="txtProjectName" value="<%=projects.getProjectName()%>"/>
                        <%  if(!txtProjectName_error.isEmpty()) {%>
                            <div class="error-message"><%=txtProjectName_error%></div>
                        <% } %>
                    </div>

                    <div class="form-group">
                        <label for="txtDescription">Description:</label>
                        <input type="text" id="txtDescription" name="txtDescription" value="<%=projects.getDescription()%>"/>
                        <%  if(!txtDescription_error.isEmpty()) {%>
                            <div class="error-message"><%=txtDescription_error%></div>
                        <% } %>
                    </div>

                    <div class="form-group">
                        <label for="txtStatus">Status:</label>
                        <select id="txtStatus" name="txtStatus">
                            <option value="Ideation" <%= "Ideation".equals(projects.getStatus()) ? "selected" : "" %>>Ideation</option>
                            <option value="Development" <%= "Development".equals(projects.getStatus()) ? "selected" : "" %>>Development</option>
                            <option value="Launch" <%= "Launch".equals(projects.getStatus()) ? "selected" : "" %>>Launch</option>
                            <option value="Scaling" <%= "Scaling".equals(projects.getStatus()) ? "selected" : "" %>>Scaling</option>    
                        </select>
                        <% if (!txtStatus_error.isEmpty()) { %>
                            <div class="error-message"><%= txtStatus_error %></div>
                        <% } %>
                    </div>

                    <%
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                        String EstimatedLaunchDate = (projects.getEstimatedLaunch() != null)? sdf.format(projects.getEstimatedLaunch()) : "";
                    %>
                    <div class="form-group">
                        <label for="txtEstimatedLaunch">Estimated_Launch:</label>
                        <input type="date" id="txtEstimatedLaunch" name="txtEstimatedLaunch" value="<%=EstimatedLaunchDate%>"/>
                        <%  if(!txtEstimatedLaunch_error.isEmpty()) {%>
                            <div class="error-message"><%=txtEstimatedLaunch_error%></div>
                        <% } %>
                    </div>
                    <div class="button-group">
                        <input type="submit" value="Save" />
                        <input type="reset" value="Reset"/>
                    </div>
                </form>
                <a href="MainController?action=search" class="back-link">Back to Dash Board</a>
            </div>
            <%} 
                else {%>
            <div class="form-container error-container">
                <h1>403 Error</h1>
                <p>Your do not have permission to access this content</p>
                <a href="MainControler?action=dashboard" class="back-link">Back to Dash Board</a>
            </div>
            <%}
                } else {%>
            <div class="form-container error-container">
                <h1>Access Denied</h1>
                <p>Please log in to access this page.</p>
                <a href="login.jsp" class="back-link">Go to Login</a>
            </div>
            <%}%>    
        </div>
    </body>
</html>
