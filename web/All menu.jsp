<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.net.URLEncoder, java.sql.*, model.Tempat, model.TempatDAO, java.util.List, java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Menu | JajanYuk</title>
    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background-color: #f5eecd;
            font-family: 'Poppins', sans-serif;
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

        .nav-link {
            font-weight: 600;
            color: #3d1d00 !important;
            padding: 5px 10px;
            transition: color 0.3s ease;
        }

        .nav-link:hover {
            color: #9a5c1f !important;
        }

        .search-box {
            position: relative;
        }

        .search-box input {
            border-radius: 10px;
            border: none;
            padding-left: 35px;
            height: 36px;
        }

        .search-box .bi-search {
            position: absolute;
            left: 10px;
            top: 9px;
            color: #3d1d00;
        }

        /* Profile icon */
        .bi-person-circle {
            font-size: 1.7rem;
            color: #3d1d00;
            margin-left: 15px;
            cursor: pointer;
            transition: 0.3s;
        }

        .bi-person-circle:hover {
            color: #9a5c1f;
        }

        .dropdown-menu {
            border-radius: 8px;
            background-color: #fffef5;
        }

        .dropdown-item:hover {
            background-color: #f5eecd;
            color: #9a5c1f;
        }

        /* Filter section */
        .filter-container {
            display: flex;
            align-items: center;
            gap: 10px;
            margin: 30px 0;
        }

        select.form-select {
            width: 120px;
            border-radius: 8px;
        }

        /* Menu Cards */
        .menu-card {
            background-color: #ffffff;
            border-radius: 10px;
            text-align: center;
            padding: 12px;
            transition: 0.3s;
            cursor: pointer;
        }

        .menu-card:hover {
            transform: translateY(-5px);
            box-shadow: 0px 4px 10px rgba(0,0,0,0.15);
        }

        .menu-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 10px;
        }

        .menu-name {
            font-weight: 700;
            margin-top: 10px;
            color: #3d1d00;
        }

        .menu-address {
            font-size: 0.9rem;
            color: #555;
        }

        footer {
            background-color: #3d1d00;
            color: white;
            text-align: center;
            padding: 15px;
            margin-top: 3rem;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg shadow-sm">
        <div class="container">
            <a class="navbar-brand" href="#">JajanYuk</a>

            <div class="collapse navbar-collapse show" id="navbarNav">
                <div class="ms-auto d-flex align-items-center gap-3">
                <!-- Search -->
                <div class="search-box me-2">
                    <i class="bi bi-search"></i>
                    <form action="PencarianServlet" method="get"> <input type="text" name="keyword" class="form-control"
                       placeholder="Cari makanan..."
                       value="<%= request.getParameter("keyword") != null ? request.getParameter("keyword") : "" %>">
                    </form>
                </div>

                <!-- Profile Dropdown -->
                <div class="dropdown">
                    <i class="bi bi-person-circle dropdown-toggle" id="profileDropdown" data-bs-toggle="dropdown"></i>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="profile.jsp">Profile</a></li>
                        <li><a class="dropdown-item" href="tambahTempat.jsp">Tambahkan Tempat</a></li>
                        <li><a class="dropdown-item" href="index.jsp">Logout</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>

    <div class="container mt-4">

        <!-- Filter Section -->
        <form action="PencarianServlet" method="get" class="filter-container">
            <label for="rating">Filter by:</label>

            <select id="rating" name="rating" class="form-select" onchange="this.form.submit()">
                <option value="">Rating</option>

                <% String selectedRating = request.getParameter("rating"); %>

                <option value="1" <%= "1".equals(selectedRating) ? "selected" : "" %>>1</option>
                <option value="2" <%= "2".equals(selectedRating) ? "selected" : "" %>>2</option>
                <option value="3" <%= "3".equals(selectedRating) ? "selected" : "" %>>3</option>
                <option value="4" <%= "4".equals(selectedRating) ? "selected" : "" %>>4</option>
                <option value="5" <%= "5".equals(selectedRating) ? "selected" : "" %>>5</option>
            </select>

            <input type="hidden" name="keyword"
                   value="<%= request.getParameter("keyword") != null ? request.getParameter("keyword") : "" %>">
        </form>

        <!-- Menu List -->
        <div class="row g-4">

            <%
                // Ambil hasil pencarian yang dikirim dari PencarianServlet
                List<Tempat> hasil = (List<Tempat>) request.getAttribute("hasil");

                if (hasil == null) {
                    // Jika Servlet belum pernah dipanggil (misalnya saat pertama kali buka All menu.jsp),
                    // tampilkan semua data secara default.
                    TempatDAO tempatDAO = new TempatDAO();
                    hasil = tempatDAO.getAllTempat(); 
                }

                // Display filtered places (sekarang menggunakan list 'hasil')
                for (Tempat tempat : hasil) { 

                    // Logika penentuan rating yang akan ditampilkan tetap ada:
                    int displayRating;
                    if (tempat.getRataRata() != null && tempat.getRataRata() > 0) {
                        displayRating = tempat.getRataRata();
                    } else {
                        displayRating = tempat.getRating();
                    }
            %>

            <div class="col-md-3">
                <!-- Mengarahkan ke LihatDetail.jsp dengan parameter placeID -->
                <div class="menu-card" onclick="window.location.href='LihatDetail.jsp?placeID=<%= tempat.getPlaceID() %>'">
                    <img src="<%= request.getContextPath() + "/uploads/" + tempat.getFoto() %>" alt="<%= tempat.getNamaTempat() %>">

                    <div class="menu-name"><%= tempat.getNamaTempat() %></div>
                    <div class="menu-address"><%= tempat.getAlamat() %></div>

                    <div class="menu-rating">
                        <div class="menu-rating">
                        <% for (int j = 0; j < 5; j++) { %>
                            <% if (j < displayRating) { %>  <i class="bi bi-star-fill" style="color: #ffcc00;"></i>
                            <% } else { %>
                                <i class="bi bi-star" style="color: #ffcc00;"></i>
                            <% } %>
                        <% } %>
                        <span><%= displayRating %>/5</span> </div>
                    </div>
                </div>
            </div>

            <% } %>

        </div>
    </div>

    <footer>
        <p>© 2025 JajanYuk | All Rights Reserved</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
