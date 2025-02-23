<%-- 
    Document   : footer
    Created on : Feb 18, 2025, 11:24:49 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
    .footer {
        background-color: #E7E6E6;
        padding: 3rem 0;
        margin-bottom:  2rem;
        position:absolute;
        bottom:0;
        width:100%;
        height:170px;
    }
    
    .footer-container{
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 1rem;
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 2rem;
    }
    
    .footer-section h3 {
        font-size: 1.2rem;
        margin-bottom: 1rem;
        color: #ff0000;
    }

    .footer-section p {
        margin-bottom: 0.5rem;
        font-size: 0.9rem;
        line-height: 1.0;
        color:#0033ff;
    }

    .footer-links {
        list-style: none;
    }

    .footer-links li {
        margin-bottom: 0.5rem;
    }

    .footer-links a {
        color: #0033ff;
        text-decoration: none;
        transition: color 0.3s ease;
    }

    .footer-links a:hover {
        color: #3498db;
    }

    .social-links {
        display: flex;
        gap: 1rem;
        margin-top: 1rem;
    }

    .social-links a {
        color: #3498db;
        text-decoration: none;
        font-size: 1.5rem;
    }

    .copyright {
        text-align: center;
        padding-top: 2rem;
        margin-top: 2rem;
        border-top: 1px solid #34495e;
        font-size: 0.9rem;
        background-color: #cccccc;
        height:30px;
    }
</style>
 <footer class="footer">
        <div class="footer-container">
        <div class="footer-section">
            <h3>Về chúng tôi</h3>
            <p></p>
        </div>
        <div class="footer-section">
            <h3>Liên kết nhanh</h3>
            <ul class="footer-links">
                <li><a href="#">a</a></li>
                <li><a href="#">b</a></li>
                <li><a href="#">c</a></li>
                <li><a href="#">d</a></li>
            </ul>
        </div>
        
        <div class="footer-section">
            <h3>Liên hệ</h3>
            <p>Địa chỉ: </p>
            <p>Email: </p>
            <p>Điện thoại: </p>
        </div>
        
        <div class="footer-section">
            <h3>Theo dõi chúng tôi</h3>
            <p></p>
            <div class="social-links">
                <a href="#">📱</a>
                <a href="#">💬</a>
                <a href="#">📷</a>
            </div>
        </div>
    </div>
    
    <div class="copyright">
        <p>&copy;</p>
    </div>
</footer>
