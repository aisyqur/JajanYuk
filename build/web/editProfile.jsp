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
    <title>Profile - JajanYuk</title>
    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
            font-family: Arial, Helvetica, sans-serif;
        }
        body {
            margin: 0;
            background-color: #F6EFD1;
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

        /* ===== CONTENT ===== */
        .profile-container {
            padding: 20px 40px 40px;
        }
        h1 {
            margin-bottom: 10px;
            font-weight: bold;
        }
        .card {
            background-color: #A88774;
            border-radius: 12px;
            padding: 10px;
            max-width: 500px;
        }
        .form-group {
            margin-bottom: 16px;
        }
        .form-group label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
        }
        .form-group input {
            width: 100%;
            padding: 6px 8px;
            border-radius: 6px;
            border: none;
            outline: none;
        }
        .btn-save {
            margin-top: 20px;
            padding: 8px 12px;
            border: none;
            border-radius: 14px;
            background-color: #F6EFD1;
            font-weight: bold;
            cursor: pointer;
            float: right;
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
        }

        .btn-back:hover {
            background-color: #f5d1a3;
        }

        .btn-back i {
            margin-right: 10px;
            font-size: 1.2rem;
        }
    </style>
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
    <a href="profile.jsp" class="btn-back">
        <i class="bi bi-arrow-left-circle"></i> 
    </a>
<!-- CONTENT -->
<div class="profile-container">
    <% if (request.getAttribute("message") != null) { %>
        <div style="color:red;border-radius: 12px;">
            <%= request.getAttribute("message") %>
        </div>
    <% } %>
    <h1>Profile</h1>

    <div class="card">
        <form action="EditProfileServlet" method="post">
            <div class="form-group">
                <label>Username</label>
                <input type="text"
                       name="username"
                       value="${sessionScope.username}">
            </div>

            <div class="form-group">
                <label>Full Name</label>
                <input type="text"
                       name="fullname"
                       value="${sessionScope.name}">
            </div>

            <div class="form-group">
                <label>Password Lama</label>
                <input type="password" name="password">
            </div>

            <div class="form-group">
                <label>Password Baru</label>
                <input type="password" name="newPassword">
            </div>

            <button type="submit" class="btn-save">Simpan</button>
        </form>
    </div>
</div>

</body>
</html>