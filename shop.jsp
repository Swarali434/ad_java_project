<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Shop - Clothing Store</title>
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
        .products {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            margin: 20px;
        }
        .product {
            background-color: white;
            border: 1px solid #ddd;
            padding: 10px;
            margin: 10px;
            text-align: center;
            width: 30%;
        }
        .product img {
            width: 100%;
            height: auto;
        }
        .product h2 {
            font-size: 1.5em;
            margin: 10px 0;
        }
        .product p {
            color: #555;
        }
        .product button {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
        }
        .product button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<header>
    <h1>Shop - Clothing Store</h1>
</header>

<nav>
    <a href="index.jsp">Home</a>
    <a href="shop.jsp">Shop</a>
    <a href="cart.jsp">Cart</a>
    <a href="contact.jsp">Contact</a>
</nav>

<div class="products">

<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        // Load PostgreSQL driver
        Class.forName("org.postgresql.Driver");

        // Connect to the database
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/swarali", "postgres", "system");

        // Create statement
        stmt = conn.createStatement();
        String query = "SELECT * FROM products";

        // Execute query
        rs = stmt.executeQuery(query);

        // Display products
        while (rs.next()) {
            String productName = rs.getString("name");
            String productCategory = rs.getString("category");
            String productPrice = rs.getString("price");
            

%>

    <div class="product">
        
        <h2><%= productName %></h2>
        <p>Category: <%= productCategory %></p>
        <p>Price: $<%= productPrice %></p>
        <button>Add to Cart</button>
    </div>

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
