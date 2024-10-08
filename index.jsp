<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Clothing Store</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        header {
            background-color: #333;
            color: white;
            padding: 10px;
            text-align: center;
        }
        nav {
            background-color: #444;
            overflow: hidden;
        }
        nav a {
            float: left;
            display: block;
            color: white;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
        }
        nav a:hover {
            background-color: #ddd;
            color: black;
        }
        .banner {
            background: url('banner.jpg') no-repeat center center;
            height: 400px;
            text-align: center;
            color: white;
            font-size: 2em;
            line-height: 400px;
        }
        .categories {
            display: flex;
            justify-content: space-around;
            margin: 20px 0;
        }
        .category {
            width: 30%;
            text-align: center;
        }
        .category img {
            width: 100%;
            height: auto;
        }
        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px;
            position: fixed;
            width: 100%;
            bottom: 0;
        }
    </style>
</head>
<body>

<header>
    <h1>Welcome to Our Clothing Store</h1>
</header>

<nav>
    <a href="index.jsp">Home</a>
    <a href="shop.jsp">Shop</a>
    <a href="cart.jsp">Cart</a>
    <a href="contact.jsp">Contact</a>
</nav>

<div class="banner">
    New Arrivals Just For You!
</div>

<div class="categories">
    <div class="category">
        <img src="C:\Users\inchu\OneDrive\Desktop\men.jpg" alt="Men's Clothing">
        <h2>Men</h2>
    </div>
    <div class="category">
        <img src="C:\Users\inchu\OneDrive\Desktop\women.jpg" alt="Women's Clothing">
        <h2>Women</h2>
    </div>
    <div class="category">
        <img src="C:\Users\inchu\OneDrive\Desktop\kids.jpg" alt="Kids' Clothing">
        <h2>Kids</h2>
    </div>
</div>

<footer>
    <p>Clothing Store © 2024. All Rights Reserved.</p>
    <p>Follow us on: Facebook | Instagram | Twitter</p>
</footer>

</body>
</html>
