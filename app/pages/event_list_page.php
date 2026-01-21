<!DOCTYPE html>
<html lang = "bg">
<head>
    <meta charset = "UTF-8">
    <meta name = "viewport" content = "width=device-width, initial-scale=1.0">
    <title>List of events</title>

    <link rel = "stylesheet" href = "../css/menu_styles.css">
    <link rel = "stylesheet" href = "../css/event_list_styles.css">
    
</head>
<body>
    <div id = "nav-div">
        <nav id = "menu">
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
            <div class = "header-option"></div>
            <div class = "header-option">Профил</div>
        </header>
        <main>
            <div id = "add-event" class="hidden">
                + Добави
            </div>
            <div id = "events">
                <!-- Добавяме ги с JS -->
            </div>
        </main>
    </div>

    <script src = "../js/event-list.js"></script>
    <script src = "../js/menu.js" defer></script>

    
</body>
</html>