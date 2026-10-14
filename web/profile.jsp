<%--
    Document   : profile
    Created on : 13 Dec 2025, 07.48.19
    Author     : Organizer
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile - JajanYuk</title>
    <link rel="icon" href="icon.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Fraunces:ital,opsz,wght@0,9..144,600;0,9..144,700&family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="css/theme.css" rel="stylesheet">
    <style>
        .profile-wrap {
            position: relative;
            z-index: 1;
            min-height: calc(100vh - 70px);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 30px 20px 60px;
        }
        .profile-card {
            width: 100%;
            max-width: 400px;
            padding: 40px 34px;
            text-align: center;
        }
        .profile-card h2 {
            font-family: var(--jy-font-display);
            margin: 4px 0 26px;
        }
        .profile-item { margin-bottom: 16px; text-align: left; }
        .profile-item label {
            font-weight: 700;
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: 0.03em;
            color: var(--jy-ink-soft);
            display: block;
            margin-bottom: 6px;
        }
        .profile-item .value {
            background: var(--jy-bg-soft);
            padding: 11px 14px;
            border-radius: var(--jy-radius-sm);
            font-weight: 600;
            color: var(--jy-ink);
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
        <div class="jy-nav-actions">
            <a href="All menu.jsp" class="jy-back" style="margin:0;"><i class="bi bi-arrow-left"></i> Kembali</a>
        </div>
    </nav>

    <%
    String message = (String) session.getAttribute("message");
        if (message != null) {
    %>
    <div class="jy-alert jy-alert--success" style="max-width:400px; margin:20px auto 0; z-index:1; position:relative;">
        <i class="bi bi-check-circle-fill"></i> <%= message %>
    </div>
    <%
        // Hapus message supaya tidak muncul lagi di refresh berikutnya
        session.removeAttribute("message");
    }
    %>

    <!-- Profile Card -->
    <div class="profile-wrap">
        <div class="jy-panel profile-card jy-reveal">
            <div class="jy-avatar"><%= (session.getAttribute("name") != null && session.getAttribute("name").toString().length() > 0) ? session.getAttribute("name").toString().substring(0,1).toUpperCase() : "?" %></div>
            <h2>Profile Saya</h2>

            <div class="profile-item">
                <label><i class="bi bi-person"></i> Username</label>
                <div class="value">${sessionScope.username}</div>
            </div>

            <div class="profile-item">
                <label><i class="bi bi-badge-ad"></i> Full Name</label>
                <div class="value">${sessionScope.name}</div>
            </div>

            <a href="editProfile.jsp" class="btn-jy btn-jy--block" style="margin-top:10px;"><i class="bi bi-pencil-square"></i> Edit Profile</a>
        </div>
    </div>

</body>
</html>
