<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tambah Tempat | JajanYuk</title>
    <link rel="icon" href="icon.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Fraunces:ital,opsz,wght@0,9..144,600;0,9..144,700&family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="css/theme.css" rel="stylesheet">
    <style>
        .add-wrap {
            position: relative;
            z-index: 1;
            max-width: 760px;
            margin: 0 auto;
            padding: 24px 20px 70px;
        }
        .add-card { padding: 34px 36px; }
        .add-card h2 {
            font-family: var(--jy-font-display);
            margin: 0 0 4px;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .add-card .subtitle {
            color: var(--jy-ink-faint);
            font-size: 13.5px;
            margin-bottom: 26px;
        }

        .upload-box {
            width: 100%;
            height: 220px;
            border: 2.5px dashed rgba(201,116,45,0.45);
            border-radius: var(--jy-radius-md);
            background-color: var(--jy-bg-soft);
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            cursor: pointer;
            margin-bottom: 26px;
            transition: border-color 0.25s ease, transform 0.2s ease;
            text-align: center;
        }
        .upload-box:hover {
            border-color: var(--jy-primary);
            transform: translateY(-2px);
        }
        .upload-box .upload-icon {
            width: 56px;
            height: 56px;
            border-radius: 50%;
            background: var(--jy-gradient-warm);
            color: #fff8ec;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            margin-bottom: 10px;
        }
        .upload-box p { margin: 0; font-weight: 600; color: var(--jy-ink-soft); font-size: 14px; }
        .upload-box span { font-size: 12px; color: var(--jy-ink-faint); }
        .upload-box.jy-has-preview {
            border-style: solid;
            border-color: var(--jy-primary);
        }
        .upload-box.jy-has-preview .upload-icon,
        .upload-box.jy-has-preview p,
        .upload-box.jy-has-preview span {
            background: rgba(255,248,236,0.88);
            backdrop-filter: blur(2px);
            border-radius: 10px;
            padding: 4px 10px;
        }
        .upload-box.jy-has-preview .upload-icon { padding: 0; }

        .form-row {
            display: flex;
            gap: 22px;
            flex-wrap: wrap;
        }
        .form-row .jy-field { flex: 1; min-width: 220px; }
    </style>
</head>
<body class="jy-body">

<div class="jy-blob jy-blob--a"></div>
<div class="jy-blob jy-blob--c"></div>

<nav class="jy-navbar">
    <a class="jy-brand" href="All menu.jsp">
        <img src="icon.png" alt="JajanYuk">
        JajanYuk
    </a>
</nav>

<div class="add-wrap">
    <a href="All menu.jsp" class="jy-back"><i class="bi bi-arrow-left"></i> Kembali ke Menu</a>

    <div class="jy-panel add-card jy-reveal">
        <h2><i class="bi bi-shop" style="color:var(--jy-primary);"></i> Tambahkan Tempat Jajan</h2>
        <p class="subtitle">Bagikan tempat jajan favoritmu supaya pengguna lain bisa menemukannya.</p>

        <% String status = request.getParameter("status"); %>
        <% if ("sukses".equals(status)) { %>
            <div class="jy-alert jy-alert--success">
                <i class="bi bi-check-circle-fill"></i> Data tempat berhasil disimpan.
            </div>
        <% } %>

        <% String error = (String) request.getAttribute("error"); %>
        <% if (error != null) { %>
            <div class="jy-alert jy-alert--danger">
                <i class="bi bi-exclamation-triangle-fill"></i> <%= error %>
            </div>
        <% } %>

        <!-- FORM -->
        <form action="tambahTempat" method="post" enctype="multipart/form-data">

            <!-- Upload Foto -->
            <div class="upload-box" id="uploadBox" onclick="document.getElementById('file').click();">
                <div class="upload-icon"><i class="bi bi-camera-fill"></i></div>
                <p>Klik untuk upload foto</p>
                <span>PNG atau JPG, disarankan rasio 4:3</span>
            </div>
            <input type="file" id="file" name="foto" accept="image/*" style="display:none;">

            <!-- Nama & Alamat -->
            <div class="form-row">
                <div class="jy-field">
                    <label>Nama Tempat</label>
                    <input type="text" name="namaTempat" placeholder="Contoh: Warung Makan WDP" required>
                </div>

                <div class="jy-field">
                    <label>Alamat</label>
                    <textarea name="alamat" placeholder="Masukkan alamat lengkap" required></textarea>
                </div>
            </div>

            <!-- Kategori & Rating -->
            <div class="form-row">
                <div class="jy-field">
                    <label>Kategori</label>
                    <select name="kategori" required>
                        <option value="">Pilih kategori...</option>
                        <option value="Makanan Berat">Makanan Berat</option>
                        <option value="Makanan Penutup">Makanan Penutup</option>
                        <option value="Minuman">Minuman</option>
                        <option value="Camilan">Camilan</option>
                    </select>
                </div>

                <div class="jy-field">
                    <label>Rating Awal (1 - 5)</label>
                    <select name="rating" class="jy-rating-select" required>
                        <option value="">Pilih rating...</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>
                </div>
            </div>

            <button type="submit" class="btn-jy" style="margin-top:10px;"><i class="bi bi-cloud-arrow-up-fill"></i> Simpan Tempat</button>
        </form>
    </div>
</div>

<script src="js/app.js"></script>
</body>
</html>
