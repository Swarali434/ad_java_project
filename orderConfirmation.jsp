<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order Confirmation</title>
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
        .confirmation-container {
            width: 60%;
            margin: 20px auto;
            background-color: white;
            padding: 20px;
            border: 1px solid #ddd;
            text-align: center;
        }
        .confirmation-container h2 {
            color: green;
        }
    </style>
</head>
<body>

<header>
    <h1>Order Confirmation</h1>
</header>

<nav>
    <a href="index.jsp">Home</a>
    <a href="shop.jsp">Shop</a>
    <a href="cart.jsp">Cart</a>
    <a href="contact.jsp">Contact</a>
</nav>

<div class="confirmation-container">

<%
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Retrieve form data from checkout.jsp
        String customerName = request.getParameter("name");
        String customerEmail = request.getParameter("email");
        String shippingAddress = request.getParameter("address");
        String totalPrice = request.getParameter("totalPrice");

        // Load PostgreSQL driver
        Class.forName("org.postgresql.Driver");

        // Connect to the database
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/swarali", "postgres", "system");

        // Insert order details into the 'orders' table
        String sql = "INSERT INTO orders (customer_name, customer_email, shipping_address, total_price) VALUES (?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, customerName);
        pstmt.setString(2, customerEmail);
        pstmt.setString(3, shippingAddress);
        pstmt.setString(4, totalPrice);

        int rowsAffected = pstmt.executeUpdate();

        if (rowsAffected > 0) {
%>
            <h2>Thank you for your purchase, <%= customerName %>!</h2>
            <p>Your order has been placed successfully.</p>
            <p>Order Total: $<%= totalPrice %></p>
<%
        } else {
%>
            <h2>Order Failed</h2>
            <p>Sorry, there was an issue processing your order. Please try again later.</p>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
%>
        <h2>Error</h2>
        <p>There was an error processing your order. Please try again later.</p>
<%
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
        if (conn != null) try { conn.close(); } catch (SQLException e) {}
    }
%>

</div>

<footer>
    <p>Clothing Store © 2024. All Rights Reserved.</p>
</footer>

</body>
</html>
