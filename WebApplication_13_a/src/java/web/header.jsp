<%-- 
    Document   : header
    Created on : Feb 17, 2025, 10:55:12 AM
    Author     : LENOVO
--%>

<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap");
    * {
      font-family: "Poppins", sans-serif; /* Clean and modern font for better readability */
      margin: 0;
      padding: 0;
      scroll-padding-top: 1rem; /* Ensures smooth scrolling */
      scroll-behavior: smooth; /* Smooth scrolling for navigation */
      list-style: none;
      text-decoration: none;
      box-sizing: border-box;
    }
    
    /* Color Palette */
    :root {
/*      --main-color: #d90429;  A vibrant red to capture attention 
      --text-color: #020102;  A deep black color for text 
      --bg-color: #fff;  Clean white background for simplicity and focus */
    }
    
    body, html {
        color: #020102;
    }
    
    .header {
        background-image: url('image/z6356433591562_7559b4a02068fdc71cf79b652c3e79ba-processed(lightpdf.com).jpg');
        background-size: cover;
        background-position: center;
        display: flex;
        align-items: center;
        justify-content: space-between;
        width: 100%;
        padding: 10px 20px;
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
        display: flex;
        align-items: center; /* Căn giữa logo theo chiều dọc */
        text-decoration: none;
        margin-top: 50px;
    }

    .logo img {
        max-width: 80px;
        height: auto;
        border-radius: 50%;
    }

    .logo p {
        font-size: 18px;
        font-weight: bold;
        color: #333;
        margin-left: 10px;
    }
    
    .logo span{
        color: yellow;
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

    /* Styles for welcome and logout */
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
        color: #3498db;
        font-weight: bold;
    }

    .logout-btn {
        background-color: #e74c3c;
        color: white;
        border: none;
        border-radius: 4px;
        padding: 0.4rem 0.8rem;
        font-size: 0.85rem;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .logout-btn:hover {
        background-color: #c0392b;
    }

    /* Adjust layout for user section */
    .right-section {
        display: flex;
        align-items: center;
    }
</style>

<header class="header">
    <%
        int x = 100;
    %>
    <div class="container">
        <nav class="nav">
            <a href="#" class="logo">
                <img src="image/z6344218901443_e4fd8ed41ec42487b1140ea5a3e4832d.jpg" alt="The Best Game Online">
                <p class="Banner">The Best Game Online</p>
            </a>
            <ul class="menu">
                <li class="menu-item"><a href="#">Trang Chủ</a></li>
                <li class="menu-item"><a href="#">Sản phẩm</a></li>
                <li class="menu-item"><a href="#">Giỏ hàng</a></li>
                <li class="menu-item"><a href="#">Liên hệ</a></li>
            </ul>
            <div class="right-section">
                <div class="search-bar">
                    <input type="text" class="search-input" placeholder="Tìm kiếm...">
                    <button class="search-button">🔍</button>
                </div>
                <%                    if (session.getAttribute("user") != null) {
                        UserDTO userHeader = (UserDTO) session.getAttribute("user");

                %>
                <div class="user-section">
                    <span class="welcome-text">Xin Chào, <span class="user-name"><%=userHeader.getFullName()%></span>!</span>
                    <form action="MainController" method="post" style="margin: 0">
                            <input type="hidden" name="action" value="logout"/>
                            <input type="submit" value="Đăng xuất" class="logout-btn"/>
                    </form>
                </div>
                <% }%>
            </div>
        </nav>
    </div>
</header>
