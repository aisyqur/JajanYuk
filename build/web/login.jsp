<%-- 
    Document   : login
    Created on : 17 Nov 2025, 21.04.05
    Author     : User
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - JajanYuk</title>

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #F3E8C9; /* warna krem */
        }

        /* NAVBAR */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 40px;
            background: transparent;
        }

        .navbar .logo {
            font-size: 22px;
            font-weight: bold;
        }

        .nav-buttons button {
            padding: 7px 18px;
            cursor: pointer;
            background: white;
            border: 2px solid black;
            border-radius: 8px;
            font-weight: bold;
            margin-left: 10px;
        }

        .nav-buttons button:hover {
            background: #dedede;
        }

        /* LOGIN CONTAINER */
        .login-container {
            width: 380px;
            margin: 50px auto;
            text-align: center;
            padding: 30px;
        }

        .login-container img {
            width: 80px;
            margin-bottom: 10px;
        }

        .login-container h2 {
            margin-bottom: 20px;
            font-size: 26px;
        }

        .input-group {
            text-align: left;
            margin-bottom: 15px;
        }

        .input-group label {
            font-size: 14px;
            margin-left: 3px;
            font-weight: bold;
        }

        .input-group input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 8px;
            border: 2px solid #ccc;
            font-size: 16px;
        }

        /* LOGIN BUTTON */
        .login-btn {
            width: 100%;
            padding: 12px;
            background: #3A1F04; /* coklat gelap */
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            margin-top: 10px;
        }

        .login-btn:hover {
            opacity: 0.9;
        }

        /* SIGNUP LINK */
        .signup-text {
            margin-top: 10px;
            font-size: 13px;
        }

        .signup-text a {
            font-weight: bold;
            text-decoration: none;
            color: #3A1F04;
        }

        /* Error or success message */
        .message {
            color: red;
            margin-top: 10px;
        }

    </style>
</head>
<body>

<!-- NAVBAR -->
<div class="navbar">
    <div class="logo">JajanYuk</div>

    <div class="nav-buttons">
        <button onclick="location.href='login.jsp'">Login</button>
        <button onclick="location.href='register.jsp'">Sign Up</button>
    </div>
</div>

<!-- LOGIN FORM -->
<div class="login-container">

    <!-- ICON -->
    <img src="icon.png" alt="icon">  <!-- ganti dengan path icon kamu -->

    <h2>Login</h2>

    <form action="login" method="post">

        <div class="input-group">
            <label>Username</label>
            <input type="text" name="username" required>
        </div>

        <div class="input-group">
            <label>Password</label>
            <input type="password" name="password" required>
        </div>

        <p class="signup-text">
            You don't have an account? click <a href="register.jsp">sign in</a>
        </p>

        <button type="submit" class="login-btn">Login</button>

        <p class="message">${message}</p>
    </form>

</div>

</body>
</html>