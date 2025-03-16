<%-- 
    Document   : login
    Created on : Mar 2, 2025, 8:54:07 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            body {
                background-image: url('images/z6356433591562_7559b4a02068fdc71cf79b652c3e79ba-processed(lightpdf.com).jpg');
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
            }
            
            .login-container {
                min-height: 600px;
                display: flex;
                justify-content: center;
                align-items: center;
            }
            
            .login-form {
                background: white;
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 300px;
                text-align: center;
                padding: 30px;
            }

            .Login-Title {
                margin-bottom: 20px;
                color: yellow;
            }

            .form-group {
                margin-bottom: 15px;
                text-align: left;
            }

            label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
            }

            input[type="text"],
            input[type="password"] {
                width: 100%;
                padding: 8px;
                margin-right: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 14px;
            }

            .submit-btn {
                width: 100%;
                background-color: #007bff;
                color: white;
                padding: 10px;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                cursor: pointer;
            }

            .submit-btn:hover {
                background-color: #0056b3;
            }

            .message {
                color: red;
                margin-top: 10px;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng Nhập</title>
    </head>
    <body>
        

            <div class="login-container">
                <form action="MainController" method="post">
                    <h2 class="Login-Title">Đăng Nhập</h2>
                    <div class="login-form">
                        <input type="hidden" name="action" id="action" value="login"/>
                        <div class="form-group">
                            <label for="userid">Tên Đăng Nhập</label>
                            <input type="text" name="txtUserName" id="username" required/> 
                        </div>

                        <div class="form-group">
                            <label for="password">Mật Khẩu</label>
                            <input type="password" name="txtPassword" id="password" required/> 
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
