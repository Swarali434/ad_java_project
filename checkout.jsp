<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Checkout</title>
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
        .checkout-container {
            width: 50%;
            margin: 20px auto;
            background-color: white;
            padding: 20px;
            border: 1px solid #ddd;
        }
        .checkout-form input[type="text"],
        .checkout-form input[type="email"],
        .checkout-form textarea {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
        }
        .checkout-form button {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }
        .checkout-form button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<header>
    <h1>Checkout</h1>
</header>

<nav>
    <a href="index.jsp">Home</a>
    <a href="shop.jsp">Shop</a>
    <a href="cart.jsp">Cart</a>
    <a href="contact.jsp">Contact</a>
</nav>

<div class="checkout-container">

    <h2>Complete Your Purchase</h2>

    <form class="checkout-form" action="orderConfirmation.jsp" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="address">Shipping Address:</label>
        <textarea id="address" name="address" rows="4" required></textarea>

        <input type="hidden" name="totalPrice" value="<%= request.getParameter("totalPrice") %>">

        <button type="submit">Place Order</button>
    </form>

</div>

<footer>
    <p>Clothing Store © 2024. All Rights Reserved.</p>
</footer>

</body>
</html>
