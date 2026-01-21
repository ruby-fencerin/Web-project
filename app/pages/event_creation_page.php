<!DOCTYPE html>
<html lang = "bg">
<head>
    <meta charset = "UTF-8">
    <meta name = "viewport" content = "width=device-width, initial-scale=1.0">
    <title>Event page</title>
    
    <link rel = "stylesheet" href = "../css/menu_styles.css">
    <link rel = "stylesheet" href = "../css/event_creation_styles.css">

</head>
<body>
    <div id = "nav-div">
        <nav id = "menu" style="visibility:hidden">
            <div class = "menu-option" id = "for-me">
                За мен
            </div>

            <div class = "menu-option chosen" id = "my-events">
                Мои събития
            </div>
        </nav>
    </div>
    <div id = "right-side">
        <header style="visibility:hidden">
            <div class = "header-option">Преподавател</div>
            <div class = "header-option">Профил</div>
        </header>
        <main>
            <div id = "back">⇦</div>

            <h2 id = "event-title"></h2>
            <div class = "event-desc">
                <div id = "event-theme"></div>
                <div id = "event-info"></div>
            </div>

            <div id = "attendance-btns">
                <div id = "show-attending">
                    Присъствали: <span id = "count-attendance">30</span>
                </div>
                <div id = "add">
                    + Добави
                </div>
            </div>

            <div id = "attendance-list" class = "hidden">

            </div>
        </main>
    </div>

    <script src="../js/event-creation.js"></script>
    <script src="../js/menu.js" defer></script>
</body>
</html>