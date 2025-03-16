<%-- 
    Document   : login
    Created on : Mar 14, 2025, 11:18:25 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
                    <div class="login-container">
                <form action="MainController" method="post">
                    <h2 class="Login-Title">Đăng Nhập</h2>
                    <div class="login-form">
                        <input type="hidden" name="action" id="action" value="login"/>
                        <div class="form-group">
                            <label for="userid">Tên Đăng Nhập</label>
                            <input type="text" name="txtUserName" id="txtUserName" required/> 
                        </div>

                        <div class="form-group">
                            <label for="password">Mật Khẩu</label>
                            <input type="password" name="txtPassword" id="txtPassword" required/> 
                        </div>
                        <button type="submit" class="submit-btn">Đăng nhập</button>
                        <%
                            String message = request.getAttribute("message")+"";
                        %>
                        <%=message.equals("null")?"":message%>
                    </div>
                </form>
            </div>
            <%@include file="footer.jsp"%>
    </body>
</html>
