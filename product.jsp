<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }
        header, footer {
            background-color: #333;
            color: white;
            padding: 10px;
            text-align: center;
        }
        nav {
            background-color: #444;
            overflow: hidden;
            text-align: center;
        }
        nav a {
            margin: 10px;
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            background-color: #333;
        }
        nav a:hover {
            background-color: #ddd;
            color: black;
        }
        .product-container {
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            width: 60%;
            border: 1px solid #ddd;
        }
        .product-img {
            text-align: center;
        }
        .product-img img {
            max-width: 100%;
            height: auto;
        }
        .product-details {
            padding: 20px;
            text-align: left;
        }
        .product-details h2 {
            margin-top: 0;
        }
        .product-details p {
            color: #555;
        }
        .product-details button {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
        }
        .product-details button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<header>
    <h1>Product Details</h1>
</header>

<nav>
    <a href="index.jsp">Home</a>
    <a href="shop.jsp">Shop</a>
    <a href="cart.jsp">Cart</a>
    <a href="contact.jsp">Contact</a>
</nav>

<div class="product-container">

<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        // Get the product ID from the request
        String productId = request.getParameter("id");

        // Load PostgreSQL driver
        Class.forName("org.postgresql.Driver");

        // Connect to the database
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/swarali", "postgres", "system");

        // Create a statement
        stmt = conn.createStatement();
        String query = "SELECT * FROM products WHERE product_id = " + productId;

        // Execute query
        rs = stmt.executeQuery(query);

        // If a product is found, display its details
        if (rs.next()) {
            String productName = rs.getString("name");
            String productCategory = rs.getString("category");
            String productPrice = rs.getString("price");
            String productDescription = rs.getString("description");
            String productImage = rs.getString("image_url");

%>

    <div class="product-img">
        <img src="<%= productImage %>" alt="<%= productName %>">
    </div>

    <div class="product-details">
        <h2><%= productName %></h2>
        <p>Category: <%= productCategory %></p>
        <p>Price: $<%= productPrice %></p>
        <p><%= productDescription %></p>
        <form action="cart.jsp" method="post">
            <input type="hidden" name="productId" value="<%= productId %>">
            <button type="submit">Add to Cart</button>
        </form>
    </div>

<%
        } else {
%>
    <p>Product not found.</p>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) {}
        if (stmt != null) try { stmt.close(); } catch (SQLException e) {}
        if (conn != null) try { conn.close(); } catch (SQLException e) {}
    }
%>

</div>

<footer>
    <p>Clothing Store © 2024. All Rights Reserved.</p>
</footer>

</body>
</html>
