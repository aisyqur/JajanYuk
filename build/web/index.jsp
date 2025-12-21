<%-- 
    Document   : index
    Created on : 25 Nov 2025, 12.02.55
    Author     : User
--%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JajanYuk - Welcome</title>
<style>
    body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
        background: #F3E8C9; /* krem sama seperti login */
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
        color: black;
    }

    .nav-right button {
        padding: 7px 18px;
        cursor: pointer;
        background: white;
        border: 2px solid black;
        border-radius: 8px;
        font-weight: bold;
        margin-left: 10px;
    }

    .nav-right button:hover {
        background: #dedede;
    }

    /* MAIN CONTAINER (disamakan dengan login-container) */
    .container {
        width: 380px;
        margin: 50px auto;
        text-align: center;
        padding: 30px;
    }

    .container img {
        width: 80px;       /* sama seperti login */
        margin-bottom: 10px;
    }

    h1 {
        font-size: 26px;   /* sama dengan login h2 */
        margin-bottom: 18px;
        color: #3A1F04;
    }

    p {
        font-size: 14px;
        color: #333;
        margin-top: 0;
        width: auto; /* tidak fix width agar tidak merusak layout */
    }

</style>

</head>
<body>
    <div class="navbar">
        <h3>JajanYuk</h3>
        <div class="nav-right">
            <button onclick="location.href='login.jsp'">Login</button>
            <button onclick="location.href='register.jsp'">Sign Up</button>
        </div>
    </div>

    <div class="container">
        <img src="icon.png" alt="logo">
        <h1>JajanYuk</h1>
        <p>Restaurant or Jajanan guide helper your everyday companion for exploring flavors.</p>
    </div>
</body>
</html>
