<%-- 
    Document   : example_01
    Created on : Feb 10, 2025, 9:59:21 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%! int a = 9; %>
        
        <%
            double b;
            b = Math.sqrt(a);
        %>
        
        Kết quả: sqrt(<%=a%>)= <span style="color: red"><%=b%></span><br\>
    </body>
</html>
