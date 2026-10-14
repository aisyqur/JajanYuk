<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="model.Review" %>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Review | JajanYuk</title>
    <link rel="icon" href="icon.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Fraunces:ital,opsz,wght@0,9..144,600;0,9..144,700&family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="css/theme.css" rel="stylesheet">
    <style>
        .edit-wrap {
            position: relative;
            z-index: 1;
            max-width: 560px;
            margin: 0 auto;
            padding: 30px 20px 70px;
        }
        .edit-card { padding: 32px 30px; }
        .edit-card h2 {
            font-family: var(--jy-font-display);
            margin: 0 0 6px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .edit-card .subtitle {
            color: var(--jy-ink-faint);
            font-size: 13.5px;
            margin-bottom: 24px;
        }
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
</nav>

<%
    Review review = (Review) request.getAttribute("review");
    String placeID = request.getParameter("placeID");
%>

<div class="edit-wrap">
    <a href="LihatDetail.jsp?placeID=<%= placeID %>" class="jy-back"><i class="bi bi-arrow-left"></i> Kembali ke Detail</a>

    <div class="jy-panel edit-card jy-reveal">
        <h2><i class="bi bi-pencil-square" style="color:var(--jy-primary);"></i> Edit Review</h2>
        <p class="subtitle">Perbarui rating dan ulasanmu di bawah ini.</p>

        <form action="ReviewServlet" method="post">

            <input type="hidden" name="action" value="edit">
            <input type="hidden" name="reviewID" value="<%= review.getReviewID() %>">
            <input type="hidden" name="placeID" value="<%= placeID %>">

            <div class="jy-field">
                <label>Rating</label>
                <select name="rating" class="jy-rating-select" required>
                    <option value="<%= review.getRating() %>">
                        <%= review.getRating() %> (current)
                    </option>
                    <option value="1">1 - Sangat Buruk</option>
                    <option value="2">2 - Buruk</option>
                    <option value="3">3 - Cukup</option>
                    <option value="4">4 - Bagus</option>
                    <option value="5">5 - Sangat Bagus</option>
                </select>
            </div>

            <div class="jy-field">
                <label>Ulasan</label>
                <textarea name="konten" minlength="50" required><%= review.getKonten() %></textarea>
            </div>

            <button class="btn-jy btn-jy--block" type="submit"><i class="bi bi-check-circle"></i> Simpan Perubahan</button>
        </form>
    </div>
</div>

<script src="js/app.js"></script>
</body>
</html>
