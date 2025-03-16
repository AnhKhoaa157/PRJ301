<%-- 
    Document   : index
    Created on : Mar 13, 2025, 10:46:46 AM
    Author     : LENOVO
--%>

<%-- 
    Document   : index
    Created on : Mar 13, 2025, 10:46:46 AM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="dto.BookDTO"%>
<!DOCTYPE html>
<html>
<head>
    <title>Book Store</title>
    <style>
        .product-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 20px; }
        .product-card { border: 1px solid #ddd; padding: 15px; border-radius: 10px; text-align: center; background: white; }
        .product-card img { width: 100%; height: 200px; object-fit: cover; }
        .product-title { font-weight: bold; margin: 10px 0; }
        .product-price { color: red; font-weight: bold; }
        .pagination { margin: 20px 0; text-align: center; }
        .pagination a { padding: 8px 16px; margin: 0 5px; text-decoration: none; border: 1px solid #ddd; }
        .pagination a.active { background-color: #4CAF50; color: white; }
    </style>
</head>
<body>
    <h1>Book Store</h1>

    <form action="MainController" method="post">
        <input type="text" name="txtSearch" placeholder="Search books..." />
        <input type="submit" name="action" value="SearchBook" />
    </form>

    <a href="MainController?action=ListBook">Load Book List</a>

    <div class="product-grid">
        <%
            List<BookDTO> list = (List<BookDTO>) request.getAttribute("LIST_BOOK");
            if (list != null && !list.isEmpty()) {
                // Thiết lập phân trang
                int itemsPerPage = 4;
                int currentPage = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1;
                int totalItems = list.size();
                int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);
                
                // Tính chỉ số bắt đầu và kết thúc
                int startIndex = (currentPage - 1) * itemsPerPage;
                int endIndex = Math.min(startIndex + itemsPerPage, totalItems);

                // Hiển thị sản phẩm cho trang hiện tại
                for (int i = startIndex; i < endIndex; i++) {
                    BookDTO book = list.get(i);
        %>
        <div class="product-card">
            <img src="<%= book.getImage() %>" alt="Book Image">
            <div class="product-title"><%= book.getTitle() %></div>
            <div>Author: <%= book.getAuthor() %></div>
            <div class="product-price">$<%= String.format("%.2f", book.getPrice()) %></div>
        </div>
        <%
                }
        %>
    </div>

    <!-- Phân trang -->
    <div class="pagination">
        <%
            if (totalPages > 1) {
                for (int i = 1; i <= totalPages; i++) {
                    String activeClass = (i == currentPage) ? "active" : "";
        %>
        <a href="MainController?action=ListBook&page=<%= i %>" class="<%= activeClass %>"><%= i %></a>
        <%
                }
            }
            } else {
        %>
        <p>No books available.</p>
        <%
            }
        %>
    </div>
</body>
</html>


