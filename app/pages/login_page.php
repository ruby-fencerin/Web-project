<!DOCTYPE html>
<html lang="bg">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel = "stylesheet" href = "../css/login_styles.css">
    <title>Login</title>
</head>
<body>
    <form id = "login-form" novalidate>
        <h2>Влизане в профил</h2>

        <label>
        <div class = "field-name">Потребителско име (e-mail)</div>
        <input type = "email" id = "email">
        </label>

        <label>
        <div class = "field-name">Парола</div>
        <input type = "password" id = "password">
        </label>

        <div id = "error"></div>
        <button type = "submit" id = "login-btn">Вход</button>
    </form>
</body>
</html>