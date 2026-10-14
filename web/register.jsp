<%--
    Document   : register
    Created on : 17 Nov 2025, 21.34.21
    Author     : User
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - JajanYuk</title>
    <link rel="icon" href="icon.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Fraunces:ital,opsz,wght@0,9..144,600;0,9..144,700&family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="css/theme.css" rel="stylesheet">

    <style>
        .auth-wrap {
            position: relative;
            z-index: 1;
            min-height: calc(100vh - 70px);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 30px 20px 60px;
        }
        .auth-card {
            width: 100%;
            max-width: 420px;
            padding: 40px 36px;
            text-align: center;
        }
        .auth-card img.logo { width: 56px; margin-bottom: 8px; }
        .auth-card h2 {
            font-family: var(--jy-font-display);
            font-size: 28px;
            margin: 4px 0 6px;
        }
        .auth-card .subtitle {
            color: var(--jy-ink-faint);
            font-size: 13.5px;
            margin-bottom: 26px;
        }
        .redirect {
            margin-top: 16px;
            font-size: 13.5px;
            color: var(--jy-ink-soft);
        }
        .redirect a {
            font-weight: 700;
            text-decoration: none;
            color: var(--jy-primary-dark);
        }
        .redirect a:hover { text-decoration: underline; }
    </style>
</head>
<body class="jy-body">

    <div class="jy-blob jy-blob--a"></div>
    <div class="jy-blob jy-blob--b"></div>

    <nav class="jy-navbar">
        <a class="jy-brand" href="index.jsp">
            <img src="icon.png" alt="JajanYuk">
            JajanYuk
        </a>
        <div class="jy-nav-actions">
            <a href="login.jsp" class="btn-jy btn-jy--ghost btn-jy--sm">Login</a>
            <a href="register.jsp" class="btn-jy btn-jy--sm">Sign Up</a>
        </div>
    </nav>

    <div class="auth-wrap">
        <div class="jy-panel auth-card jy-reveal">

            <img src="icon.png" alt="icon" class="logo">
            <h2>Gabung JajanYuk</h2>
            <p class="subtitle">Buat akun baru dan mulai berbagi jajanan favoritmu</p>

            <form action="register" method="post">

                <div class="jy-field has-icon">
                    <label>Nama Lengkap</label>
                    <i class="bi bi-badge-ad jy-icon"></i>
                    <input type="text" name="name" placeholder="Nama lengkapmu" required>
                </div>

                <div class="jy-field has-icon">
                    <label>Username</label>
                    <i class="bi bi-person jy-icon"></i>
                    <input type="text" name="username" placeholder="Pilih username" required>
                </div>

                <div class="jy-field has-icon">
                    <label>Password</label>
                    <i class="bi bi-lock jy-icon"></i>
                    <input type="password" name="password" placeholder="Buat password" required>
                </div>

                <button class="btn-jy btn-jy--block" type="submit">
                    <i class="bi bi-person-check"></i> Daftar
                </button>

                <p class="redirect">
                    Sudah punya akun? <a href="login.jsp">Login di sini</a>
                </p>
            </form>
        </div>
    </div>

    <script src="js/app.js"></script>
</body>
</html>
