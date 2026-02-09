<!DOCTYPE html>
<html lang = "bg">
<head>
    <meta charset = "UTF-8">
    <meta name = "viewport" content = "width=device-width, initial-scale=1.0">
    <title>Event creation page</title>
    
    <link rel = "stylesheet" href = "../css/menu_styles.css">
    <link rel = "stylesheet" href = "../css/event_creation_styles.css">

    <!-- The images that are needed for all sorts of icons in browsers -->
    <link rel="icon" type="image/png" href="../images/favicon-96x96.png" sizes="96x96" />
    <link rel="icon" type="image/svg+xml" href="../images/favicon.svg" />
    <link rel="shortcut icon" href="../images/favicon.ico" />
    <link rel="apple-touch-icon" sizes="180x180" href="../images/apple-touch-icon.png" />
    <meta name="apple-mobile-web-app-title" content="MyWebSite" />
    <link rel="manifest" href="../images/site.webmanifest" />
</head>
<body>
    <div id = "nav-div">
        <nav id = "menu">
            <img id="logo" type="image/png" src="../images/weblogo.png" />

            <div class = "menu-option" id = "for-me">
                За мен
            </div>

            <div class = "menu-option chosen" id = "my-events">
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
            <div id = "back">⇦</div>

            <h2 id = "event"></h2>
            <div class = "event-desc">
                <div id = "event-theme">Заглавие</div>
                <input type="text" id="event-title" />
                <div id = "event-info">Кратко описание</div>
                <input type="text" id="event-description" />
                <div id = "event-start-at">Започва в</div>
                <input type="time" id="event-start-time" />
                <input type="date" id="event-start-date" />
                <div id = "event-end-at">Приключва в</div>
                <input type="time" id="event-end-time" />
                <input type="date" id="event-end-date" />
            </div>


            <input type="file" id="bbb-import" name="bbb-import" accept=".txt" />
            <textarea id="imported-user-list" placeholder="Списък със студенти"></textarea>
            <div id = "add">
                Импорт
            </div>
            </div>
        </main>
    </div>

    <script src="../js/event-creation.js"></script>
    <script src="../js/menu.js"></script>
</body>
</html>