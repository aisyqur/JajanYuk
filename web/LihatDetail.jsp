<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="model.Tempat, model.TempatDAO, model.Review, model.ReviewDAO, java.util.List" %>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Detail Tempat | JajanYuk</title>
    <style>
        body { font-family: Arial; background:#f5f5dc; padding:20px; }
        .container { max-width:800px; margin:auto; background:white; padding:30px;
                     border-radius:10px; box-shadow:0 4px 8px rgba(0,0,0,0.1); }
        h2 { text-align:center; color:#333; }
        .submit-btn { background:#6a4c3c; color:white; border:none; padding:12px;
                      width:100%; border-radius:5px; margin-top:15px; cursor:pointer; }
        .submit-btn:hover { background:#8b6e4e; }
        .review-item { border-bottom:1px solid #ddd; padding:12px 0; }
        .rating { color:#ffcc00; font-weight:bold; }
        .edit-delete-btns a { margin-right:10px; color:white; padding:6px 10px;
                              border-radius:5px; text-decoration:none; }
        .btn-warning { background:#e0a800; }
        .btn-danger { background:#c82333; }
        textarea, select { width:100%; margin-top:8px; padding:10px; border-radius:5px; }
    </style>
    <!-- Link ke Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>

<%
    int placeID = Integer.parseInt(request.getParameter("placeID"));
    TempatDAO tempatDAO = new TempatDAO();
    Tempat tempat = tempatDAO.getTempatById(placeID);

    ReviewDAO reviewDAO = new ReviewDAO();
    List<Review> reviews = reviewDAO.getReviewByPlaceID(placeID);

    // Ambil user login
    Integer userID = (session.getAttribute("userID") != null) ? 
                      (Integer) session.getAttribute("userID") : 0;
%>

<div class="container">

    <!-- Tombol untuk kembali ke All Menu menggunakan ikon -->
    <a href="All menu.jsp" class="btn btn-secondary" style="margin-bottom: 20px;">
        <i class="bi bi-arrow-left-circle" style="font-size: 1.5rem; color: #3d1d00;"></i>
    </a>

    <h2><%= tempat.getNamaTempat() %></h2>

    <p><strong>Alamat:</strong> <%= tempat.getAlamat() %></p>
    <p><strong>Kategori:</strong> <%= tempat.getKategori() %></p>
    <% 
        // LOGIKA PILIH RATING TAMPILAN
        // Kita gunakan getRataRata(). Jika hasilnya 0 (nilai default int/saat NULL di DB) atau null, gunakan rating awal.
        int displayRating;
        if (tempat.getRataRata() != null && tempat.getRataRata() > 0) {
            displayRating = tempat.getRataRata();
        } else {
            displayRating = tempat.getRating();
        }
    %>
    <p><strong>Rating:</strong> <%= displayRating %> / 5</p>

    <hr>

    <h3>Tambah Review</h3>

    <form action="ReviewServlet" method="post">
        <input type="hidden" name="action" value="add">
        <input type="hidden" name="placeID" value="<%= placeID %>">

        <label>Rating</label>
        <select name="rating" required>
            <option value="">-- Pilih Rating --</option>
            <option value="1">1 - Sangat Buruk</option>
            <option value="2">2 - Buruk</option>
            <option value="3">3 - Cukup</option>
            <option value="4">4 - Bagus</option>
            <option value="5">5 - Sangat Bagus</option>
        </select>

        <label>Ulasan minimal 50 karakter</label>
        <textarea name="konten" minlength="50" required></textarea>

        <button class="submit-btn">Kirim</button>
    </form>

    <hr>

    <h3>Review Pengguna</h3>

    <% if (reviews != null && !reviews.isEmpty()) { %>
        <% for (Review r : reviews) { %>
            <div class="review-item">
                <p><strong>Rating:</strong> <span class="rating"><%= r.getRating() %> / 5</span></p>
                <p><strong>Ulasan:</strong> <%= r.getKonten() %></p>
                <p><strong>Waktu:</strong> <%= new java.text.SimpleDateFormat("dd-MM-yyyy HH:mm").format(r.getDateCreated()) %></p>

                <% if (r.getUserID() == userID) { %>
                <div class="edit-delete-btns">
                    <a href="ReviewServlet?action=editForm&reviewID=<%= r.getReviewID() %>&placeID=<%= placeID %>"
                       class="btn-warning">Edit</a>

                    <a href="ReviewServlet?action=delete&reviewID=<%= r.getReviewID() %>&placeID=<%= placeID %>"
                       class="btn-danger"
                       onclick="return confirm('Yakin ingin menghapus review?')">Delete</a>
                </div>
                <% } %>

            </div>
        <% } %>
    <% } else { %>
        <p>Belum ada review.</p>
    <% } %>

</div>
</body>
</html>
