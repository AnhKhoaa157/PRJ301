<%-- 
    Document   : User
    Created on : Feb 13, 2025, 11:47:20 AM
    Author     : LENOVO
--%>

<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
        <%
            UserDTO user = (UserDTO)request.getAttribute("user");
        %>
        <h1>Welcome <%=user.getFullName()%> </h1>
    
</html>
