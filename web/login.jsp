<%--
    Document   : login
    Created on : 17 Nov 2025, 21.04.05
    Author     : User
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - JajanYuk</title>
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
            max-width: 400px;
            padding: 40px 36px;
            text-align: center;
        }
        .auth-card .jy-avatar { width: 68px; height: 68px; margin-bottom: 6px; }
        .auth-card img.logo {
            width: 56px;
            margin-bottom: 8px;
        }
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
        .signup-text {
            margin-top: 16px;
            font-size: 13.5px;
            color: var(--jy-ink-soft);
        }
        .signup-text a {
            font-weight: 700;
            text-decoration: none;
            color: var(--jy-primary-dark);
        }
        .signup-text a:hover { text-decoration: underline; }
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
            <h2>Selamat Datang</h2>
            <p class="subtitle">Masuk untuk lanjut menjelajah jajanan favoritmu</p>

            <form action="login" method="post">

                <div class="jy-field has-icon">
                    <label>Username</label>
                    <i class="bi bi-person jy-icon"></i>
                    <input type="text" name="username" placeholder="Masukkan username" required>
                </div>

                <div class="jy-field has-icon">
                    <label>Password</label>
                    <i class="bi bi-lock jy-icon"></i>
                    <input type="password" name="password" placeholder="Masukkan password" required>
                </div>

                <button type="submit" class="btn-jy btn-jy--block">
                    <i class="bi bi-box-arrow-in-right"></i> Login
                </button>

                <p class="signup-text">
                    Belum punya akun? <a href="register.jsp">Daftar di sini</a>
                </p>

                <% if (request.getAttribute("message") != null) { %>
                    <div class="jy-alert jy-alert--danger" style="margin-top:16px;">
                        <i class="bi bi-exclamation-triangle-fill"></i> ${message}
                    </div>
                <% } %>
            </form>

        </div>
    </div>

    <script src="js/app.js"></script>
</body>
</html>
