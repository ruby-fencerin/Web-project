<!DOCTYPE html>
<html lang="bg">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel = "stylesheet" href = "../css/login_styles.css">
    <title>Login</title>

    <!-- The images that are needed for all sorts of icons in browsers -->
    <link rel="icon" type="image/png" href="/images/favicon-96x96.png" sizes="96x96" />
    <link rel="icon" type="image/svg+xml" href="/images/favicon.svg" />
    <link rel="shortcut icon" href="/images/favicon.ico" />
    <link rel="apple-touch-icon" sizes="180x180" href="/images/apple-touch-icon.png" />
    <meta name="apple-mobile-web-app-title" content="MyWebSite" />
    <link rel="manifest" href="/images/site.webmanifest" />
</head>
<body>
    <img id="logo" type="image/png" src="/images/weblogo_colorful.png" />

    <form id = "login-form">
        <h2>Влизане в профил</h2>

        <label>
            <div class="field-name">Потребителско име (e-mail)</div>
            <input type="email" id="email" name="email" required>
        </label>

        <label>
            <div class="field-name">Парола</div>
            <input type="password" id="password" name="password" required>
        </label>

        <div id="error" class="error"></div>

        <button type="submit" id = "login-btn">Вход</button>
    </form>

    <script src="../js/login.js"></script>
</body>
</html>