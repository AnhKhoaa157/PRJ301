<%-- 
    Document   : example_04
    Created on : Feb 10, 2025, 10:33:19 AM
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
        <% 
            for(int i = 2; i<=9;i++){
                %>
                <hr/>
                <h3><b><span style="color: red">Bảng Cửu Chương <%=i%></span></b></h3>
                <%
                for(int j = 1; j <= 9; j++){
                    %>
                    <%=i%> x <%=j%> = <%=i*j%><br/>
                    <%
                }                  
                %>
                <%    
            }
        %>
    </body>
</html>
