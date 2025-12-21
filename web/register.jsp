<%-- 
    Document   : register
    Created on : 17 Nov 2025, 21.34.21
    Author     : User
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Signup</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f1e6c8;
        }
        .navbar {
            display: flex;
            justify-content: space-between;
            padding: 20px 40px;
        }
        .nav-buttons button {
            margin-left: 10px;
            padding: 8px 20px;
            border-radius: 20px;
            border: 1px solid #000;
            background: #fff;
            cursor: pointer;
        }
        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 50px;
        }
        .form-box {
            display: flex;
            flex-direction: column;
            width: 350px;
        }
        .form-box label {
            font-size: 12px;
            margin-bottom: 4px;
        }
        .form-box input {
            padding: 10px;
            border-radius: 10px;
            border: 1px solid #000;
            margin-bottom: 15px;
        }
        .login-btn {
            width: 120px;
            padding: 10px;
            background: #4b2e1e;
            color: #fff;
            border-radius: 10px;
            border: none;
            cursor: pointer;
            margin: 0 auto;
            margin-top: 15px;
        }
        .redirect {
            font-size: 12px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <h3>JajanYuk</h3>
        <div class="nav-buttons">
            <button onclick="location.href='login.jsp'">Login</button>
            <button onclick="location.href='register.jsp'">Sign Up</button>
        </div>
    </div>

    <div class="container">
        <img src="icon.png" alt="icon" width="80" height="80" />
        <h2>Signup</h2>

        <form action="register" method="post" class="form-box">
            <label>Full Name</label>
            <input type="text" name="name" required />

            <label>Username</label>
            <input type="text" name="username" required />

            <label>Password</label>
            <input type="password" name="password" required />

            <p class="redirect">You have account? click Login</p>
            <button class="login-btn" type="submit">Login</button>
        </form>
    </div>
</body>
</html>