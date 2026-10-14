<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.net.URLEncoder, java.sql.*, model.Tempat, model.TempatDAO, java.util.List, java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Menu | JajanYuk</title>
    <link rel="icon" href="icon.png">
    <!-- Bootstrap & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Fraunces:ital,opsz,wght@0,9..144,600;0,9..144,700&family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="css/theme.css" rel="stylesheet">

    <style>
        .page-head {
            position: relative;
            z-index: 1;
            max-width: 1200px;
            margin: 36px auto 0;
            padding: 0 24px;
        }
        .page-head h1 {
            font-family: var(--jy-font-display);
            font-size: 32px;
            margin: 0 0 4px;
        }
        .page-head p { color: var(--jy-ink-faint); margin: 0; font-size: 14px; }

        .search-box {
            position: relative;
        }
        .search-box input {
            border-radius: var(--jy-radius-pill);
            border: 1.6px solid rgba(43,22,8,0.12);
            padding: 9px 16px 9px 36px;
            height: 40px;
            background: #fff;
            font-size: 14px;
        }
        .search-box input:focus {
            outline: none;
            border-color: var(--jy-primary);
            box-shadow: 0 0 0 4px rgba(201,116,45,0.14);
        }
        .search-box .bi-search {
            position: absolute;
            left: 14px;
            top: 11px;
            color: var(--jy-primary);
            font-size: 15px;
        }

        .bi-person-circle {
            font-size: 1.8rem;
            color: var(--jy-ink);
            margin-left: 6px;
            cursor: pointer;
            transition: 0.25s;
        }
        .bi-person-circle:hover { color: var(--jy-primary-dark); transform: scale(1.06); }

        .dropdown-menu {
            border-radius: 12px;
            border: none;
            background-color: #fffef5;
            box-shadow: var(--jy-shadow-card);
            padding: 8px;
            margin-top: 10px !important;
        }
        .dropdown-item {
            border-radius: 8px;
            font-weight: 600;
            font-size: 14px;
            padding: 9px 12px;
        }
        .dropdown-item:hover { background-color: var(--jy-bg-soft); color: var(--jy-primary-dark); }

        .filter-bar {
            position: relative;
            z-index: 1;
            max-width: 1200px;
            margin: 22px auto 10px;
            padding: 0 24px;
            display: flex;
            align-items: center;
            gap: 12px;
            flex-wrap: wrap;
        }
        .filter-bar label {
            font-weight: 700;
            font-size: 13px;
            color: var(--jy-ink-soft);
            text-transform: uppercase;
            letter-spacing: 0.03em;
        }
        select.form-select {
            width: 130px;
            border-radius: var(--jy-radius-pill);
            border: 1.6px solid rgba(43,22,8,0.12);
            font-size: 14px;
            padding: 8px 14px;
        }
        select.form-select:focus {
            box-shadow: 0 0 0 4px rgba(201,116,45,0.14);
            border-color: var(--jy-primary);
        }

        .menu-grid-wrap {
            position: relative;
            z-index: 1;
            max-width: 1200px;
            margin: 0 auto;
            padding: 10px 24px 10px;
        }

        .menu-card {
            background-color: #ffffff;
            border-radius: var(--jy-radius-md);
            overflow: hidden;
            cursor: pointer;
            box-shadow: var(--jy-shadow-soft);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            height: 100%;
        }
        .menu-card:hover {
            transform: translateY(-8px);
            box-shadow: var(--jy-shadow-card);
        }
        .menu-card-img {
            position: relative;
            overflow: hidden;
            height: 190px;
        }
        .menu-card-img img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.4s ease;
        }
        .menu-card:hover .menu-card-img img {
            transform: scale(1.08);
        }
        .menu-card-img .jy-rating-badge {
            position: absolute;
            top: 10px;
            right: 10px;
        }
        .menu-card-body { padding: 14px 16px 18px; text-align: left; }
        .menu-name {
            font-family: var(--jy-font-display);
            font-weight: 700;
            font-size: 17px;
            margin-top: 2px;
            color: var(--jy-ink);
        }
        .menu-address {
            font-size: 0.85rem;
            color: var(--jy-ink-faint);
            margin: 4px 0 8px;
            display: flex;
            align-items: flex-start;
            gap: 5px;
        }
        .menu-rating span { font-size: 12.5px; color: var(--jy-ink-soft); margin-left: 4px; }

        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: var(--jy-ink-faint);
        }
        .empty-state i { font-size: 48px; color: var(--jy-primary-light); margin-bottom: 14px; display:block; }
    </style>
</head>
<body class="jy-body">

    <div class="jy-blob jy-blob--a"></div>
    <div class="jy-blob jy-blob--c"></div>

    <!-- Navbar -->
    <nav class="jy-navbar">
        <a class="jy-brand" href="All menu.jsp">
            <img src="icon.png" alt="JajanYuk">
            JajanYuk
        </a>

        <div class="jy-nav-actions">
            <!-- Search -->
            <div class="search-box">
                <i class="bi bi-search"></i>
                <form action="PencarianServlet" method="get">
                    <input type="text" name="keyword" class="form-control"
                       placeholder="Cari makanan..."
                       value="<%= request.getParameter("keyword") != null ? request.getParameter("keyword") : "" %>">
                </form>
            </div>

            <!-- Profile Dropdown -->
            <div class="dropdown">
                <i class="bi bi-person-circle dropdown-toggle" id="profileDropdown" data-bs-toggle="dropdown"></i>
                <ul class="dropdown-menu dropdown-menu-end">
                    <li><a class="dropdown-item" href="profile.jsp"><i class="bi bi-person me-2"></i>Profile</a></li>
                    <li><a class="dropdown-item" href="tambahTempat.jsp"><i class="bi bi-plus-circle me-2"></i>Tambahkan Tempat</a></li>
                    <li><a class="dropdown-item" href="index.jsp"><i class="bi bi-box-arrow-right me-2"></i>Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="page-head jy-reveal">
        <h1>Semua Jajanan</h1>
        <p>Jelajahi tempat makan &amp; jajanan pilihan, lengkap dengan rating dari pengguna lain.</p>
    </div>

    <!-- Filter Section -->
    <form action="PencarianServlet" method="get" class="filter-bar jy-reveal jy-d1">
        <label for="rating"><i class="bi bi-funnel-fill"></i> Filter</label>

        <select id="rating" name="rating" class="form-select" onchange="this.form.submit()">
            <option value="">Semua Rating</option>

            <% String selectedRating = request.getParameter("rating"); %>

            <option value="1" <%= "1".equals(selectedRating) ? "selected" : "" %>>&#9733; 1</option>
            <option value="2" <%= "2".equals(selectedRating) ? "selected" : "" %>>&#9733; 2</option>
            <option value="3" <%= "3".equals(selectedRating) ? "selected" : "" %>>&#9733; 3</option>
            <option value="4" <%= "4".equals(selectedRating) ? "selected" : "" %>>&#9733; 4</option>
            <option value="5" <%= "5".equals(selectedRating) ? "selected" : "" %>>&#9733; 5</option>
        </select>

        <input type="hidden" name="keyword"
               value="<%= request.getParameter("keyword") != null ? request.getParameter("keyword") : "" %>">
    </form>

    <!-- Menu List -->
    <div class="menu-grid-wrap">
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

                if (hasil == null || hasil.isEmpty()) {
            %>
                <div class="empty-state">
                    <i class="bi bi-emoji-frown"></i>
                    Belum ada jajanan yang cocok. Coba ubah kata kunci atau filter rating ya!
                </div>
            <%
                } else {
                // Display filtered places (sekarang menggunakan list 'hasil')
                int cardIndex = 0;
                for (Tempat tempat : hasil) {
                    cardIndex++;

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
                <div class="menu-card jy-reveal-scroll" onclick="window.location.href='LihatDetail.jsp?placeID=<%= tempat.getPlaceID() %>'">
                    <div class="menu-card-img">
                        <img src="<%= request.getContextPath() + "/uploads/" + tempat.getFoto() %>" alt="<%= tempat.getNamaTempat() %>">
                        <span class="jy-rating-badge"><i class="bi bi-star-fill"></i> <%= displayRating %>.0</span>
                    </div>

                    <div class="menu-card-body">
                        <div class="menu-name"><%= tempat.getNamaTempat() %></div>
                        <div class="menu-address"><i class="bi bi-geo-alt-fill" style="margin-top:2px;"></i> <%= tempat.getAlamat() %></div>

                        <div class="menu-rating jy-stars">
                            <% for (int j = 0; j < 5; j++) { %>
                                <% if (j < displayRating) { %>
                                    <i class="bi bi-star-fill"></i>
                                <% } else { %>
                                    <i class="bi bi-star"></i>
                                <% } %>
                            <% } %>
                            <span><%= displayRating %>/5</span>
                        </div>
                    </div>
                </div>
            </div>

            <% } } %>

        </div>
    </div>

    <footer class="jy-footer">
        <div class="jy-brand"><img src="icon.png" alt="JajanYuk"> JajanYuk</div>
        <p>&copy; 2025 JajanYuk | All Rights Reserved</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/app.js"></script>
</body>
</html>
