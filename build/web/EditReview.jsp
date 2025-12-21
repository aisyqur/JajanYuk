<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
    import="model.Review" %>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Edit Review</title>
    <style>
        body { font-family:Arial; background:#f5f5dc; padding:20px; }
        .container { max-width:600px; margin:auto; background:white; padding:25px;
                     border-radius:10px; box-shadow:0 4px 8px rgba(0,0,0,0.1) }
        textarea, select { width:100%; padding:10px; margin-top:8px; border-radius:5px; }
        .submit-btn { background:#6a4c3c; color:white; border:none; padding:12px;
                      width:100%; border-radius:5px; margin-top:15px; cursor:pointer; }
        .submit-btn:hover { background:#8b6e4e; }
    </style>
</head>
<body>

<%
    Review review = (Review) request.getAttribute("review");
    String placeID = request.getParameter("placeID");
%>

<div class="container">

    <h2>Edit Review</h2>

    <form action="ReviewServlet" method="post">

        <input type="hidden" name="action" value="edit">
        <input type="hidden" name="reviewID" value="<%= review.getReviewID() %>">
        <input type="hidden" name="placeID" value="<%= placeID %>">

        <label>Rating</label>
        <select name="rating" required>
            <option value="<%= review.getRating() %>">
                <%= review.getRating() %> (current)
            </option>
            <option value="1">1 - Sangat Buruk</option>
            <option value="2">2 - Buruk</option>
            <option value="3">3 - Cukup</option>
            <option value="4">4 - Bagus</option>
            <option value="5">5 - Sangat Bagus</option>
        </select>

        <label>Ulasan</label>
        <textarea name="konten" minlength="50" required><%= review.getKonten() %></textarea>

        <button class="submit-btn">Simpan Perubahan</button>
    </form>

</div>

</body>
</html>
