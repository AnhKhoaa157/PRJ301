<%-- 
    Document   : example_03
    Created on : Feb 10, 2025, 10:21:32 AM
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
        <%! int a = 100; %>
        <%
            if(a%2==0){
                %>
                <b><%=a%> là số chẵn</b>
                <%
            } else {
                %>
                <b><%=a%> là số lẻ</b>
                <%
            }
        %><br/>
        
        <%! int b = 151; %>
        <%
            if(b%2==0){
                %>
                <b><%=b%> là số chẵn</b>
                <%
            } else {
                %>
                <b><%=b%> là số lẻ</b>
                <%
            }
        %>
    </body>
</html>
