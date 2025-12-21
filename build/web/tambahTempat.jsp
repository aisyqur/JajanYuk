<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tambah Tempat</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #F7EEC5;
            font-family: Arial, sans-serif;
        }

        .container {
            width: 80%;
            margin: 40px auto;
            padding: 40px;
            background-color: #E7E6E6;
            border-radius: 35px;
        }

        .upload-box {
            width: 100%;
            height: 250px;
            border: 3px dashed #000;
            border-radius: 10px;
            background-color: #F2F2F2;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            cursor: pointer;
            margin-bottom: 25px;
        }

        .upload-box img {
            width: 60px;
            margin-bottom: 10px;
        }

        .form-row {
            display: flex;
            gap: 25px;
            margin-bottom: 10px;
        }

        .form-group {
            width: 50%;
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"], textarea, select, input[type="file"] {
            padding: 10px;
            border: 2px solid #d3d3d3;
            border-radius: 8px;
            font-size: 14px;
        }

        textarea {
            height: 120px;
            resize: none;
        }

        .btn-submit {
            margin-top: 25px;
            background-color: #F3E7C1;
            border: 2px solid #000;
            padding: 10px 28px;
            border-radius: 10px;
            font-size: 16px;
            float: right;
            cursor: pointer;
        }

        .btn-submit:hover {
            background-color: #e8d9a4;
        }

        .alert {
            padding: 10px;
            margin-bottom: 20px;
        }

        .alert-success {
            color: green;
            background-color: #d4edda;
        }

        .alert-danger {
            color: red;
            background-color: #f8d7da;
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

<div class="container">

    <!-- Tombol Kembali ke Menu -->
    <a href="All menu.jsp" class="btn-back">
        <i class="bi bi-arrow-left-circle"></i> 
    </a>

    <% String status = request.getParameter("status"); %>
    <% if ("sukses".equals(status)) { %>
        <div class="alert alert-success">
            Data tempat berhasil disimpan.
        </div>
    <% } %>

    <% String error = (String) request.getAttribute("error"); %>
    <% if (error != null) { %>
        <div class="alert alert-danger">
            <%= error %>
        </div>
    <% } %>

    <!-- Upload Foto -->
    <div class="upload-box" onclick="document.getElementById('file').click();">
        <img src="https://cdn-icons-png.flaticon.com/512/685/685655.png" alt="Upload">
        <p>Klik untuk upload foto</p>
    </div>

    <!-- FORM -->
    <form action="tambahTempat" method="post" enctype="multipart/form-data">
        <input type="file" id="file" name="foto" style="display:none;">

        <!-- Nama & Alamat -->
        <div class="form-row">
            <div class="form-group">
                <label>Nama Tempat:</label>
                <input type="text" name="namaTempat" placeholder="Contoh: Warung Makan WDP" required>
            </div>

            <div class="form-group">
                <label>Alamat:</label>
                <textarea name="alamat" placeholder="Masukkan alamat lengkap" required></textarea>
            </div>
        </div>

        <!-- Kategori & Rating -->
        <div class="form-row">
            <div class="form-group">
                <label>Kategori:</label>
                <select name="kategori" required>
                    <option value="">Pilih kategori...</option>
                    <option value="Makanan Berat">Makanan Berat</option>
                    <option value="Makanan Penutup">Makanan Penutup</option>
                    <option value="Minuman">Minuman</option>
                    <option value="Camilan">Camilan</option>
                </select>
            </div>

            <div class="form-group">
                <label>Rating (1 - 5):</label>
                <select name="rating" required>
                    <option value="">Pilih rating...</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </div>
        </div>

        <button type="submit" class="btn-submit">Simpan</button>
    </form>

</div>

</body>
</html>
