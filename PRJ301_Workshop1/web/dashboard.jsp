<%-- 
    Document   : dashboard
    Created on : Mar 3, 2025, 9:13:28 AM
    Author     : LENOVO
--%>

<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dash Board</title>
    </head>
    <body>
        <div style="min-height: 500px; padding: 10px">
            <%                UserDTO user = (UserDTO) request.getAttribute("user");
            %>
            <h1> Welcome <%=user.getName()%> </h1>
            <form action="MainController" method="post">
                <input type="hidden" name="action" value="logout"/>
                <input type="submit" value="Logout"/>
            </form>
            
            <br/>
            
            <form action="#">
                Search Value: <input type="submit" name="txtSearchValue"/><br/>
                <input type="submit" name="Search"/>
            </form>
        </div>
    </body>
</html>
