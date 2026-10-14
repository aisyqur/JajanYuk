<%--
    Document   : editprofile
    Created on : 16 Dec 2025, 07.08.27
    Author     : Organizer
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile - JajanYuk</title>
    <link rel="icon" href="icon.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Fraunces:ital,opsz,wght@0,9..144,600;0,9..144,700&family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="css/theme.css" rel="stylesheet">
    <style>
        .edit-profile-wrap {
            position: relative;
            z-index: 1;
            max-width: 520px;
            margin: 0 auto;
            padding: 30px 20px 70px;
        }
        .edit-profile-card { padding: 34px 32px; }
        .edit-profile-card h2 {
            font-family: var(--jy-font-display);
            margin: 4px 0 6px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .edit-profile-card .subtitle {
            color: var(--jy-ink-faint);
            font-size: 13.5px;
            margin-bottom: 24px;
        }
    </style>
</head>
<body class="jy-body">

<div class="jy-blob jy-blob--a"></div>
<div class="jy-blob jy-blob--b"></div>

<!-- Navbar -->
<nav class="jy-navbar">
    <a class="jy-brand" href="All menu.jsp">
        <img src="icon.png" alt="JajanYuk">
        JajanYuk
    </a>
</nav>

<div class="edit-profile-wrap">
    <a href="profile.jsp" class="jy-back"><i class="bi bi-arrow-left"></i> Kembali ke Profile</a>

    <div class="jy-panel edit-profile-card jy-reveal">
        <% if (request.getAttribute("message") != null) { %>
            <div class="jy-alert jy-alert--danger">
                <i class="bi bi-exclamation-triangle-fill"></i> <%= request.getAttribute("message") %>
            </div>
        <% } %>

        <div class="jy-avatar"><i class="bi bi-person-fill"></i></div>
        <h2>Edit Profile</h2>
        <p class="subtitle">Perbarui data akunmu. Kosongkan password jika tidak ingin mengubahnya.</p>

        <form action="EditProfileServlet" method="post">
            <div class="jy-field has-icon">
                <label>Username</label>
                <i class="bi bi-person jy-icon"></i>
                <input type="text"
                       name="username"
                       value="${sessionScope.username}">
            </div>

            <div class="jy-field has-icon">
                <label>Full Name</label>
                <i class="bi bi-badge-ad jy-icon"></i>
                <input type="text"
                       name="fullname"
                       value="${sessionScope.name}">
            </div>

            <div class="jy-field has-icon">
                <label>Password Lama</label>
                <i class="bi bi-lock jy-icon"></i>
                <input type="password" name="password" placeholder="Password saat ini">
            </div>

            <div class="jy-field has-icon">
                <label>Password Baru</label>
                <i class="bi bi-key jy-icon"></i>
                <input type="password" name="newPassword" placeholder="Password baru (opsional)">
            </div>

            <button type="submit" class="btn-jy btn-jy--block"><i class="bi bi-check-circle"></i> Simpan Perubahan</button>
        </form>
    </div>
</div>

</body>
</html>
