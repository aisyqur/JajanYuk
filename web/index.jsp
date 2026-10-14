<%--
    Document   : index
    Created on : 25 Nov 2025, 12.02.55
    Author     : User
--%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JajanYuk - Temukan Jajanan Favoritmu</title>
    <link rel="icon" href="icon.png">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Fraunces:ital,opsz,wght@0,9..144,400;0,9..144,600;0,9..144,700;1,9..144,500&family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <link href="css/theme.css" rel="stylesheet">
    <style>
        .hero {
            position: relative;
            z-index: 1;
            max-width: 1100px;
            margin: 0 auto;
            padding: 70px 30px 40px;
            display: grid;
            grid-template-columns: 1.1fr 0.9fr;
            gap: 40px;
            align-items: center;
            min-height: 72vh;
        }
        .hero-eyebrow {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: rgba(201, 116, 45, 0.12);
            color: var(--jy-primary-dark);
            font-weight: 700;
            font-size: 12.5px;
            letter-spacing: 0.06em;
            text-transform: uppercase;
            padding: 7px 16px;
            border-radius: var(--jy-radius-pill);
            margin-bottom: 20px;
        }
        .hero h1 {
            font-family: var(--jy-font-display);
            font-size: clamp(36px, 5.2vw, 58px);
            line-height: 1.08;
            margin: 0 0 18px;
            color: var(--jy-ink);
        }
        .hero h1 span {
            background: var(--jy-gradient-warm);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
        }
        .hero p.lead {
            font-size: 17px;
            color: var(--jy-ink-soft);
            max-width: 480px;
            margin-bottom: 30px;
        }
        .hero-actions {
            display: flex;
            gap: 14px;
            flex-wrap: wrap;
        }
        .hero-stats {
            display: flex;
            gap: 28px;
            margin-top: 40px;
        }
        .hero-stats div strong {
            display: block;
            font-family: var(--jy-font-display);
            font-size: 24px;
            color: var(--jy-ink);
        }
        .hero-stats div span {
            font-size: 12.5px;
            color: var(--jy-ink-faint);
        }

        .hero-art {
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .hero-art .plate {
            width: 320px;
            height: 320px;
            border-radius: 50%;
            background: var(--jy-gradient-warm);
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: var(--jy-shadow-card);
            animation: jySpinIn 0.9s ease;
        }
        .hero-art .plate img {
            width: 240px;
            height: 240px;
            border-radius: 50%;
            object-fit: cover;
            border: 8px solid rgba(255, 248, 236, 0.85);
            background: #fff;
        }
        .float-chip {
            position: absolute;
            background: #fff;
            border-radius: var(--jy-radius-pill);
            padding: 10px 16px;
            font-size: 13px;
            font-weight: 700;
            box-shadow: var(--jy-shadow-soft);
            display: flex;
            align-items: center;
            gap: 6px;
            animation: jyFloatChip 5s ease-in-out infinite;
        }
        .float-chip.chip-1 { top: 6%; left: -8%; color: var(--jy-primary-dark); }
        .float-chip.chip-2 { bottom: 10%; right: -10%; color: var(--jy-success); animation-delay: -2s; }
        .float-chip.chip-3 { top: 48%; left: -16%; color: var(--jy-accent); animation-delay: -3.5s; }
        @keyframes jyFloatChip {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-14px); }
        }

        .features {
            position: relative;
            z-index: 1;
            max-width: 1100px;
            margin: 20px auto 80px;
            padding: 0 30px;
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 24px;
        }
        .feature-card {
            background: var(--jy-surface);
            border-radius: var(--jy-radius-md);
            padding: 28px 24px;
            box-shadow: var(--jy-shadow-soft);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .feature-card:hover {
            transform: translateY(-6px);
            box-shadow: var(--jy-shadow-card);
        }
        .feature-icon {
            width: 48px;
            height: 48px;
            border-radius: 14px;
            background: var(--jy-gradient-warm);
            color: #fff8ec;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 22px;
            margin-bottom: 16px;
        }
        .feature-card h3 {
            font-family: var(--jy-font-display);
            margin: 0 0 8px;
            font-size: 18px;
        }
        .feature-card p {
            margin: 0;
            font-size: 14px;
            color: var(--jy-ink-soft);
            line-height: 1.55;
        }

        @media (max-width: 860px) {
            .hero { grid-template-columns: 1fr; text-align: center; padding-top: 40px; }
            .hero p.lead { margin-left: auto; margin-right: auto; }
            .hero-actions, .hero-stats { justify-content: center; }
            .hero-art { margin-top: 20px; }
            .hero-art .plate { width: 240px; height: 240px; }
            .hero-art .plate img { width: 180px; height: 180px; }
            .features { grid-template-columns: 1fr; }
        }
    </style>
</head>
<body class="jy-body">

    <div class="jy-blob jy-blob--a"></div>
    <div class="jy-blob jy-blob--b"></div>
    <div class="jy-blob jy-blob--c"></div>

    <nav class="jy-navbar">
        <a class="jy-brand" href="index.jsp">
            <img src="icon.png" alt="JajanYuk">
            JajanYuk
        </a>
        <div class="jy-nav-actions">
            <a href="login.jsp" class="btn-jy btn-jy--ghost btn-jy--sm">Login</a>
            <a href="register.jsp" class="btn-jy btn-jy--sm">Sign Up</a>
        </div>
    </nav>

    <section class="hero">
        <div class="jy-reveal jy-d1">
            <div class="hero-eyebrow"><i class="bi bi-stars"></i> Teman jajan sehari-hari</div>
            <h1>Temukan <span>jajanan enak</span><br>di sekitarmu, tanpa drama.</h1>
            <p class="lead">
                JajanYuk bantu kamu menjelajah rasa — dari makanan berat, camilan, minuman, sampai
                dessert favorit — lengkap dengan rating &amp; review jujur dari sesama pecinta jajan.
            </p>
            <div class="hero-actions">
                <a href="register.jsp" class="btn-jy">
                    <i class="bi bi-rocket-takeoff"></i> Mulai Jelajah
                </a>
                <a href="login.jsp" class="btn-jy btn-jy--outline">
                    Saya sudah punya akun
                </a>
            </div>
            <div class="hero-stats">
                <div><strong>4.8<i class="bi bi-star-fill" style="color:var(--jy-gold); font-size:14px; margin-left:3px;"></i></strong><span>Rating pengguna</span></div>
                <div><strong>1000+</strong><span>Tempat jajan</span></div>
                <div><strong>24/7</strong><span>Selalu update</span></div>
            </div>
        </div>

        <div class="hero-art jy-reveal jy-d2">
            <div class="plate">
                <img src="icon.png" alt="JajanYuk">
            </div>
            <div class="float-chip chip-1"><i class="bi bi-egg-fried" style="color:#e6a13a;"></i> Makanan Berat</div>
            <div class="float-chip chip-2"><i class="bi bi-cup-straw" style="color:#3f9142;"></i> Minuman Segar</div>
            <div class="float-chip chip-3"><i class="bi bi-cake2" style="color:#c9742d;"></i> Dessert</div>
        </div>
    </section>

    <section class="features">
        <div class="feature-card jy-reveal-scroll">
            <div class="feature-icon"><i class="bi bi-geo-alt-fill"></i></div>
            <h3>Jelajahi Sekitarmu</h3>
            <p>Lihat daftar tempat jajan lengkap dengan foto, alamat, dan kategori — mulai dari camilan sampai makanan berat.</p>
        </div>
        <div class="feature-card jy-reveal-scroll">
            <div class="feature-icon"><i class="bi bi-chat-heart-fill"></i></div>
            <h3>Review Jujur</h3>
            <p>Baca &amp; tulis review asli dari pengguna lain supaya kamu nggak salah pilih jajanan.</p>
        </div>
        <div class="feature-card jy-reveal-scroll">
            <div class="feature-icon"><i class="bi bi-plus-circle-fill"></i></div>
            <h3>Tambahkan Tempat</h3>
            <p>Punya tempat jajan favorit? Tambahkan ke JajanYuk dan bantu orang lain menemukannya juga.</p>
        </div>
    </section>

    <footer class="jy-footer">
        <div class="jy-brand"><img src="icon.png" alt="JajanYuk"> JajanYuk</div>
        <div class="jy-foot-links">
            <a href="#"><i class="bi bi-instagram"></i></a>
            <a href="#"><i class="bi bi-tiktok"></i></a>
            <a href="#"><i class="bi bi-whatsapp"></i></a>
        </div>
        <p>&copy; 2025 JajanYuk &mdash; Restaurant &amp; Jajanan Guide. All rights reserved.</p>
    </footer>

    <script src="js/app.js"></script>
</body>
</html>
