<%@page import="dto.UserDTO"%>
<%@page import="utils.AuthUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    .header {
        background-color: #009688;
        padding: 1rem 0;
        width: 100%;
        top: 0;
    }

    .container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 1rem;
    }

    .nav {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .logo {
        color: #fff;
        font-size: 1.5rem;
        font-weight: bold;
        text-decoration: none;
    }

    .menu {
        display: flex;
        list-style: none;
        gap: 2rem;
    }

    .menu-item a {
        color: #fff;
        text-decoration: none;
        font-size: 1rem;
        transition: color 0.3s ease;
    }

    .menu-item a:hover {
        color: #3498db;
    }

    .search-bar {
        display: flex;
        align-items: center;
        background: #fff;
        border-radius: 20px;
        padding: 0.5rem 1rem;
    }

    .search-input {
        border: none;
        outline: none;
        padding: 0.2rem;
        width: 200px;
    }

    .search-button {
        background: none;
        border: none;
        cursor: pointer;
        color: #2c3e50;
    }
    
    .user-section {
        display: flex;
        align-items: center;
        gap: 1rem;
        margin-left: 1.5rem;
    }

    .welcome-text {
        color: #fff;
        font-size: 0.95rem;
    }

    .user-name {
        color: yellow;
        font-weight: bold;
    }
    
    .logout-btn {
        background-color: #424242;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        font-weight: bold;
        transition: background-color 0.3s ease;
    }

    .logout-btn:hover {
        background-color: darkgray;
    }


</style>

<header class="header">
    
    <%
        int x = 100;
    %>
    <div class="container">
        <nav class="nav">
            <a href="#" class="logo">Online Examination</a>

            <%  if (AuthUtils.isLoggedIn(session)) {
                UserDTO userHeader = AuthUtils.getUser(session);

            %>
                <div class="user-section">
                    <span class="welcome-text">Xin chào, <span class="user-name"><%=userHeader.getFullName()%></span>!</span>
                    <form action="MainController" method="post" style="margin: 0;">
                        <input type="hidden" name="action" value="logout"/>
                        <button type="submit" class="logout-btn">Đăng xuất</button>
                    </form>
                </div>
            <%}%>
        </nav>
    </div>
</header>
    