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
    <title>Profile - JajanYuk</title>
    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #F5ECCC;
            margin: 0;
            padding: 0;
        }

        /* Navbar */
        .navbar {
            background-color: #f5eecd;
            padding: 12px 0;
        }

        .navbar-brand {
            font-weight: 700;
            color: #3d1d00;
            font-size: 22px;
            margin-right: 30px;
        }
        .navbar-nav {
            gap: 15px;
        }

        .profile-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 70px);
            
        }

        .card {
            background: #fff;
            padding: 30px;
            width: 380px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        h2 {
            font-weight: bold;
            text-align: center;
            margin-bottom: 25px;
        }

        .profile-item {
            margin-bottom: 15px;
        }

        .profile-item label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        .profile-item .value {
            background: #f5f5f5;
            padding: 10px;
            border-radius: 6px;
        }

        .btn-edit {
            display: block;
            text-align: center;
            background: #d9c37b;
            color: #000;
            padding: 10px;
            border-radius: 6px;
            text-decoration: none;
            font-weight: bold;
            margin-top: 20px;
        }

        .btn-edit:hover {
            background: #cbb05f;
        }
        /* Kembali ke Menu Button */
        .btn-back {
            background-color: #f5eecd;
            border: 2px solid #3d1d00;
            padding: 8px 16px;
            border-radius: 10px;
            font-size: 16px;
            display: inline-block;
            cursor: pointer;
            margin-bottom: 20px;
        }

        .btn-back:hover {
            background-color: #f5d1a3;
        }

        .btn-back i {
            margin-right: 10px;
            font-size: 1.2rem;
        }
    </style>
    <!-- Link ke Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg shadow-sm">
        <div class="container">
            <a class="navbar-brand" href="#">JajanYuk</a>
            </div>
        </div>
    </nav>
    <!-- Tombol Kembali ke Menu -->
    <a href="All menu.jsp" class="btn-back">
        <i class="bi bi-arrow-left-circle"></i> 
    </a>
    <% 
    String message = (String) session.getAttribute("message");
        if (message != null) { 
    %>
    <div style="color:green; text-align:center; margin-bottom:1px; font-weight:bold;">
        <%= message %>
    </div>
    <% 
        // Hapus message supaya tidak muncul lagi di refresh berikutnya
        session.removeAttribute("message");
    } 
    %>

    <!-- Profile Card -->
    <div class="profile-container">
        <div class="card">
            <h2>Profile</h2>

            <div class="profile-item">
                <label>Username</label>
                <div class="value">${sessionScope.username}</div>
            </div>

            <div class="profile-item">
                <label>Full Name</label>
                <div class="value">${sessionScope.name}</div>
            </div>

            <a href="editProfile.jsp" class="btn-edit">Edit Profile</a>
        </div>
    </div>

</body>
</html>
