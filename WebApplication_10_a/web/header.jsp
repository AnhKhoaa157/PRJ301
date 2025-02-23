<%-- 
    Document   : header
    Created on : Feb 17, 2025, 10:55:12 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    
    .header {
        background-image: url('image/minimal-geometric-background-orange-elements-with-fluid-gradient-for-posters-banners-and-website-landing-pages-free-vector.jpg');
        background-size: cover;
        background-position: center;
        padding: 2rem 0;
        width: 100%;
        position: relative;
    }
    
    .container {
        max-width: 1700px;
        margin-left: auto;
        margin-right: auto;
        padding: 0 auto;
    }
    
    .nav{
        display: flex;
        align-items: center;
        justify-content: space-between;
        flex-wrap: wrap;
        padding: 10px;
        position: relative;
        z-index: 2;
    }
    
    .logo {
        display: flex;
        text-decoration: none;
        margin-left: 50px;
        gap: 10px;
        
    }
    .logo img {
        max-width: 80px;
        height: auto;
        display: block;
        top: 0;
        border-radius: 100px;
    }
    
    .logo p {
        display: flex;
        font-weight: bold;
        align-items: center;
        font-size: 20px;
        color: #FFFFFF;
    
    }
    .menu {
        display: flex;
        list-style: none;
        gap: 2rem;
        padding: 10px;
        border-radius: 10px;
        background-color: #495D5F;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
    }
    
    .menu-item {
        display: flex;
        align-items: center; /* Căn giữa nội dung theo chiều dọc */
        justify-content: center; /* Căn giữa theo chiều ngang */
        padding: 0;
    }
    .menu-item a {
        color: #FFFFFF;
        font-weight: bold;
        text-decoration: none;
        font-size: 1.3rem;
        transition: color 0.3s ease;
        margin: 0 40px;
    }
    
    .menu-item a:hover{
        color: #a0d2eb;
    }
    
    .search-bar{
        display: flex;
        align-items: center;
        background: #fff;
        border-radius: 20px;
        padding: 0 1rem;
        margin-right: 50px;
    }
    
    .search-input {
        border: none;
        outline: none;
        padding: 0.5rem;
        flex-grow: 1;
        font-size: 1rem;
        color: #333;
        background: transparent;
    }
    
    .search-button {
        background: none;
        border: none;
        cursor: pointer;
        color: yellow;
        padding: 0;
        margin-left: 20px;
    }
    
    .login {
        display: flex;
        border: none;
        background: white;
        cursor: pointer;
        border-radius: 25px;
        position: absolute;
        right: 0;
    }
    .login img {
        display: flex;
        width: 50px;
        height: 50px;
    }
    
</style>

<header class="header">
    <%
        int x = 100;
    %>
    <div class="container">
        <nav class="nav">
            <a href="#" class="logo">
                <img src="image/Ban_Game_Online_Logo.jpg" alt="Bán Game Online">
                <p class="Banner">Tên Shop</p>
            </a>

            <button class="login">
                <img src="image/user-interface.png" alt="Login Image"/>
            </button>
            <ul class="menu">
                <li class="menu-item"><a href="#">Trang Chủ</a></li>
                <li class="menu-item"><a href="#">Sản phẩm</a></li>
                <li class="menu-item"><a href="#">Giỏ hàng</a></li>
                <li class="menu-item"><a href="#">Liên hệ</a></li>
            </ul>

            <div class="search-bar">
                <input type="text" class="search-input" placeholder="Tìm kiếm...">
                <button class="search-button">🔍</button>
            </div>

        </nav>
    </div>
</header>
