<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="model.Tempat, model.TempatDAO, model.Review, model.ReviewDAO, java.util.List" %>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detail Tempat | JajanYuk</title>
    <link rel="icon" href="icon.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Fraunces:ital,opsz,wght@0,9..144,600;0,9..144,700&family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="css/theme.css" rel="stylesheet">
    <style>
        .detail-wrap {
            position: relative;
            z-index: 1;
            max-width: 880px;
            margin: 0 auto;
            padding: 24px 20px 70px;
        }
        .hero-banner {
            position: relative;
            height: 280px;
            border-radius: var(--jy-radius-lg);
            overflow: hidden;
            box-shadow: var(--jy-shadow-card);
            margin-bottom: -60px;
        }
        .hero-banner img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .hero-banner::after {
            content: "";
            position: absolute;
            inset: 0;
            background: linear-gradient(180deg, rgba(43,22,8,0) 40%, rgba(43,22,8,0.75) 100%);
        }
        .hero-banner .hero-title {
            position: absolute;
            bottom: 18px;
            left: 28px;
            right: 28px;
            color: #fff8ec;
            z-index: 2;
        }
        .hero-banner .hero-title h2 {
            font-family: var(--jy-font-display);
            font-size: 30px;
            margin: 0 0 4px;
        }
        .hero-banner .hero-title .addr {
            font-size: 13.5px;
            opacity: 0.9;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .info-card {
            position: relative;
            z-index: 2;
            margin: 0 16px 28px;
            padding: 24px 28px;
        }
        .info-chips {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
            margin-top: 14px;
        }
        .info-chip {
            background: var(--jy-bg-soft);
            color: var(--jy-ink-soft);
            font-weight: 600;
            font-size: 13px;
            padding: 7px 14px;
            border-radius: var(--jy-radius-pill);
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }
        .info-chip.gold { background: rgba(255,201,60,0.18); color: var(--jy-primary-dark); }

        .section-title {
            font-family: var(--jy-font-display);
            font-size: 22px;
            margin: 34px 0 16px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .review-form-card { padding: 26px 28px; }

        .review-item {
            display: flex;
            gap: 14px;
            padding: 18px;
            border-radius: var(--jy-radius-md);
            background: var(--jy-surface);
            box-shadow: var(--jy-shadow-soft);
            margin-bottom: 14px;
        }
        .review-item .review-body { flex: 1; }
        .review-item .review-top {
            display: flex;
            align-items: center;
            justify-content: space-between;
            flex-wrap: wrap;
            gap: 6px;
        }
        .review-item .review-top .meta { font-size: 12px; color: var(--jy-ink-faint); }
        .review-item .review-content {
            margin: 8px 0 10px;
            color: var(--jy-ink);
            line-height: 1.55;
            font-size: 14.5px;
        }
        .edit-delete-btns { display: flex; gap: 8px; }

        .empty-review {
            text-align: center;
            padding: 36px 20px;
            color: var(--jy-ink-faint);
        }
        .empty-review i { font-size: 36px; color: var(--jy-primary-light); display: block; margin-bottom: 10px; }
    </style>
</head>
<body class="jy-body">

<div class="jy-blob jy-blob--a"></div>
<div class="jy-blob jy-blob--b"></div>

<nav class="jy-navbar">
    <a class="jy-brand" href="All menu.jsp">
        <img src="icon.png" alt="JajanYuk">
        JajanYuk
    </a>
    <div class="jy-nav-actions">
        <a href="All menu.jsp" class="jy-back" style="margin:0;">
            <i class="bi bi-arrow-left"></i> Kembali
        </a>
    </div>
</nav>

<%
    int placeID = Integer.parseInt(request.getParameter("placeID"));
    TempatDAO tempatDAO = new TempatDAO();
    Tempat tempat = tempatDAO.getTempatById(placeID);

    ReviewDAO reviewDAO = new ReviewDAO();
    List<Review> reviews = reviewDAO.getReviewByPlaceID(placeID);

    // Ambil user login
    Integer userID = (session.getAttribute("userID") != null) ?
                      (Integer) session.getAttribute("userID") : 0;

    // LOGIKA PILIH RATING TAMPILAN
    int displayRating;
    if (tempat.getRataRata() != null && tempat.getRataRata() > 0) {
        displayRating = tempat.getRataRata();
    } else {
        displayRating = tempat.getRating();
    }
%>

<div class="detail-wrap">

    <div class="hero-banner jy-reveal">
        <img src="<%= request.getContextPath() + "/uploads/" + tempat.getFoto() %>" alt="<%= tempat.getNamaTempat() %>">
        <div class="hero-title">
            <h2><%= tempat.getNamaTempat() %></h2>
            <div class="addr"><i class="bi bi-geo-alt-fill"></i> <%= tempat.getAlamat() %></div>
        </div>
    </div>

    <div class="jy-panel info-card jy-reveal jy-d1">
        <div class="jy-stars" style="font-size:18px;">
            <% for (int j = 0; j < 5; j++) { %>
                <% if (j < displayRating) { %><i class="bi bi-star-fill"></i><% } else { %><i class="bi bi-star"></i><% } %>
            <% } %>
            <span style="font-size:14px; color:var(--jy-ink-soft); margin-left:6px; font-weight:700;"><%= displayRating %>/5</span>
        </div>

        <div class="info-chips">
            <span class="info-chip"><i class="bi bi-tag-fill"></i> <%= tempat.getKategori() %></span>
            <span class="info-chip gold"><i class="bi bi-chat-square-text-fill"></i> <%= (reviews != null ? reviews.size() : 0) %> review</span>
        </div>
    </div>

    <h3 class="section-title"><i class="bi bi-pencil-square" style="color:var(--jy-primary);"></i> Tulis Review</h3>

    <div class="jy-panel review-form-card jy-reveal jy-d2">
        <form action="ReviewServlet" method="post">
            <input type="hidden" name="action" value="add">
            <input type="hidden" name="placeID" value="<%= placeID %>">

            <div class="jy-field">
                <label>Rating Kamu</label>
                <select name="rating" class="jy-rating-select" required>
                    <option value="">-- Pilih Rating --</option>
                    <option value="1">1 - Sangat Buruk</option>
                    <option value="2">2 - Buruk</option>
                    <option value="3">3 - Cukup</option>
                    <option value="4">4 - Bagus</option>
                    <option value="5">5 - Sangat Bagus</option>
                </select>
            </div>

            <div class="jy-field">
                <label>Ulasan (minimal 50 karakter)</label>
                <textarea name="konten" minlength="50" required placeholder="Ceritakan pengalamanmu jajan di sini..."></textarea>
            </div>

            <button class="btn-jy" type="submit"><i class="bi bi-send-fill"></i> Kirim Review</button>
        </form>
    </div>

    <h3 class="section-title"><i class="bi bi-chat-square-heart" style="color:var(--jy-primary);"></i> Review Pengguna</h3>

    <% if (reviews != null && !reviews.isEmpty()) { %>
        <% for (Review r : reviews) { %>
            <div class="review-item jy-reveal-scroll">
                <div class="jy-avatar jy-avatar--sm"><i class="bi bi-person-fill"></i></div>
                <div class="review-body">
                    <div class="review-top">
                        <div class="jy-stars" style="font-size:14px;">
                            <% for (int j = 0; j < 5; j++) { %>
                                <% if (j < r.getRating()) { %><i class="bi bi-star-fill"></i><% } else { %><i class="bi bi-star"></i><% } %>
                            <% } %>
                            <span style="font-size:12.5px; color:var(--jy-ink-soft); margin-left:4px;"><%= r.getRating() %>/5</span>
                        </div>
                        <span class="meta"><%= new java.text.SimpleDateFormat("dd MMM yyyy, HH:mm").format(r.getDateCreated()) %></span>
                    </div>
                    <p class="review-content"><%= r.getKonten() %></p>

                    <% if (r.getUserID() == userID) { %>
                    <div class="edit-delete-btns">
                        <a href="ReviewServlet?action=editForm&reviewID=<%= r.getReviewID() %>&placeID=<%= placeID %>"
                           class="btn-jy btn-jy--ghost btn-jy--sm"><i class="bi bi-pencil"></i> Edit</a>

                        <a href="ReviewServlet?action=delete&reviewID=<%= r.getReviewID() %>&placeID=<%= placeID %>"
                           class="btn-jy btn-jy--danger btn-jy--sm"
                           onclick="return confirm('Yakin ingin menghapus review?')"><i class="bi bi-trash"></i> Delete</a>
                    </div>
                    <% } %>
                </div>
            </div>
        <% } %>
    <% } else { %>
        <div class="jy-panel empty-review">
            <i class="bi bi-chat-square-dots"></i>
            Belum ada review. Jadilah yang pertama memberi review!
        </div>
    <% } %>

</div>

<script src="js/app.js"></script>
</body>
</html>
