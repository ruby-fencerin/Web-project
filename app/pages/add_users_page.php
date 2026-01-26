<!DOCTYPE html>
<html lang = "bg">
<head>
    <meta charset = "UTF-8">
    <meta name = "viewport" content = "width=device-width, initial-scale=1.0">
    <title>Event creation page</title>
    
    <link rel = "stylesheet" href = "../css/menu_styles.css">
    <link rel = "stylesheet" href = "../css/add_users_styles.css">

    <!-- The images that are needed for all sorts of icons in browsers -->
    <link rel="icon" type="image/png" href="/images/favicon-96x96.png" sizes="96x96" />
    <link rel="icon" type="image/svg+xml" href="/images/favicon.svg" />
    <link rel="shortcut icon" href="/images/favicon.ico" />
    <link rel="apple-touch-icon" sizes="180x180" href="/images/apple-touch-icon.png" />
    <meta name="apple-mobile-web-app-title" content="MyWebSite" />
    <link rel="manifest" href="/images/site.webmanifest" />

</head>
<body>
    <div id = "nav-div">
        <nav id = "menu">
            <img id="logo" type="image/png" src="/images/weblogo.png" />

            <div class = "menu-option" id = "for-me">
                За мен
            </div>

            <div class = "menu-option" id = "my-events">
                Мои събития
            </div>

             <div class = "menu-option chosen" id = "list-all-students">
                Студенти
            </div>
        </nav>
    </div>
    <div id = "right-side">
        <header>
            <div class = "header-option">Преподавател</div>
            <div class = "header-option">Профил</div>
        </header>
        <main>
            <div id = "back">⇦</div>
            <h1> Вмъкване на единичен студент </h1>
            <h2 id = "event"></h2>
            <div class = "event-desc">
                <div id = "user-first-name">Първо име</div>
                <input type="text" id="first-name" placeholder="Потребител"/>
                <div id = "user-family-name">Фамилия</div>
                <input type="text" id="family-name" placeholder="Потребителов"/>
                <div id = "user-email">Имейл</div>
                <input type="text" id="email" placeholder="user@example.com" />
                <div id = "user-fn">Факултетен номер</div>
                <input type="text" id="fn" placeholder="1234567 или 0ab1234567" />
            </div>
            <div id = "add-one">
                Импорт
            </div>

            <h1> Вмъкване на мнозина студенти </h1>
            <input type="file" id="users-import" name="users-import" accept=".csv" />
            <textarea id="imported-user-list" placeholder="Списък със студенти" readonly></textarea>
            <div id = "add-multiple">
                Импорт
            </div>
            </div>
        </main>
    </div>

    <script src="../js/add-users.js"></script>
    <script src="../js/menu.js"></script>
</body>
</html>