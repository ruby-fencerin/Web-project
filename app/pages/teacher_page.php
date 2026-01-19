<!DOCTYPE html>
<html lang = "bg">
<head>
    <meta charset = "UTF-8">
    <meta name = "viewport" content = "width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <link rel = "stylesheet" href = "../css/page_styles.css">
</head>
<body>
    <div id = "nav-div">
        <nav id = "menu">
            <div class = "menu-option chosen" id = "for-me">
                За мен
            </div>

            <div class = "menu-option" id = "my-events">
                Мои събития
            </div>
        </nav>
    </div>
    <div id = "right-side">
        <header>
            <div class = "header-option">Преподавател</div>
            <div class = "header-option">Профил</div>
        </header>
        <main>
            <div id = "info-div">
                <img src = "../images/unknown.jpg">
                <div id = "personal-info">
                    <h3 id = "name"></h3>
                    <span id = "fn/dep"></span><br>
                    <span id = "email"></span><br>
                </div>
            </div>
        </main>
    </div>

    <script src = "../js/teacher-user.js"></script>
    <script src = "../js/menu.js" defer></script>
</body>
</html>