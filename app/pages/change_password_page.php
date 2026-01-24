<!DOCTYPE html>
<html lang="bg">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel = "stylesheet" href = "../css/login_styles.css">
    <title>Login</title>
</head>
<body>
    <form id = "change-password-form">
        <h2>Промяна на парола</h2>

        <label>
            <div class="field-name">Стара парола</div>
            <input type="password" id="password" name="password" required>
        </label>

        <label>
            <div class="field-name">Нова парола</div>
            <input type="password" id="new_password" name="new_password" required>
        </label>

        <div id="error" class="error"></div>

        <button type="submit" id = "login-btn">Запази промяна</button>
    </form>

    <script src="../js/change-password.js"></script>
</body>
</html>