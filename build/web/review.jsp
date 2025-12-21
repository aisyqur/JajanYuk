<%-- 
    Document   : review
    Created on : 17 Nov 2025, 20.01.18
    Author     : User


<!DOCTYPE html> 
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Review Makanan</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5dc;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        label {
            font-size: 16px;
            font-weight: bold;
        }
        textarea {
            width: 100%;
            height: 150px;
            margin-top: 10px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }
        select, input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }
        .submit-btn {
            background-color: #6a4c3c;
            color: white;
            font-size: 16px;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            width: 100%;
            margin-top: 20px;
            cursor: pointer;
        }
        .submit-btn:hover {
            background-color: #8b6e4e;
        }
        .info {
            margin-top: 10px;
            font-size: 14px;
            color: #888;
        }
    </style>
</head>
<body>

    <form action="AddReview" method="post">
    <label for="rating">Rating Makanan</label>
    <select id="rating" name="rating" required>
        <option value="">-- Pilih Rating --</option>
        <option value="1">1 - Sangat Buruk</option>
        <option value="2">2 - Buruk</option>
        <option value="3">3 - Cukup</option>
        <option value="4">4 - Bagus</option>
        <option value="5">5 - Sangat Bagus</option>
    </select>
    
    <label for="konten">Tulis Ulasan minimal 50 Karakter</label>
    <textarea id="konten" name="konten" placeholder="Tulis ulasan Anda di sini..." minlength="50" required></textarea>

    <!-- Menyertakan placeID sebagai input tersembunyi -->
    <input type="hidden" name="placeID" value="<%= request.getParameter("placeID") %>">

    <button type="submit" class="submit-btn">Kirim</button>
</form>


</body>
</html>
--%>