<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.ArrayList, java.util.HashMap" %>
<!DOCTYPE html>
<html>
<head>
    <title>Shopping Cart</title>
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
        .cart-container {
            width: 80%;
            margin: 20px auto;
            background-color: white;
            padding: 20px;
            border: 1px solid #ddd;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table th, table td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }
        table th {
            background-color: #f4f4f4;
        }
        .total {
            text-align: right;
            font-size: 1.2em;
        }
        .checkout-btn {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }
        .checkout-btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<header>
    <h1>Your Shopping Cart</h1>
</header>

<nav>
    <a href="index.jsp">Home</a>
    <a href="shop.jsp">Shop</a>
    <a href="cart.jsp">Cart</a>
    <a href="contact.jsp">Contact</a>
</nav>

<div class="cart-container">

<%
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    ArrayList<HashMap<String, String>> cartItems = new ArrayList<>();

    try {
        // Load PostgreSQL driver
        Class.forName("org.postgresql.Driver");

        // Connect to the database
        conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/swarali", "postgres", "system");

        // Get product ID from the POST request
        String productId = request.getParameter("productId");

        if (productId != null) {
            // Retrieve product details
            stmt = conn.createStatement();
            String query = "SELECT * FROM products WHERE product_id = " + productId;
            rs = stmt.executeQuery(query);

            // Add product to the cart
            if (rs.next()) {
                HashMap<String, String> product = new HashMap<>();
                product.put("name", rs.getString("name"));
                product.put("price", rs.getString("price"));
                product.put("quantity", "1"); // Default quantity as 1
                cartItems.add(product);
            }
        }

%>

    <h2>Items in Your Cart</h2>

    <table>
        <thead>
            <tr>
                <th>Product Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody>

<%
        double totalPrice = 0;

        for (HashMap<String, String> item : cartItems) {
            String productName = item.get("name");
            double productPrice = Double.parseDouble(item.get("price"));
            int quantity = Integer.parseInt(item.get("quantity"));
            double itemTotal = productPrice * quantity;
            totalPrice += itemTotal;
%>
            <tr>
                <td><%= productName %></td>
                <td>$<%= productPrice %></td>
                <td><%= quantity %></td>
                <td>$<%= itemTotal %></td>
            </tr>
<%
        }
%>

        </tbody>
    </table>

    <p class="total">Total: $<%= totalPrice %></p>

    <form action="checkout.jsp" method="post">
        <button type="submit" class="checkout-btn">Proceed to Checkout</button>
    </form>

<%
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
