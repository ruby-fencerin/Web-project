<!DOCTYPE html>
<html lang = "bg">
<head>
    <meta charset = "UTF-8">
    <meta name = "viewport" content = "width=device-width, initial-scale=1.0">
    <title>List of events</title>
    <link rel = "stylesheet" href = "../css/page_styles.css">
</head>
<body>
    <div id = "nav-div">
        <nav>
            <div class = "menu-option" id = "for-me">
                За мен
            </div>

            <div class = "menu-option chosen" id = "my-events">
                Мои събития
            </div>

             <div class = "menu-option" id = "list-all-students">
                Студенти
            </div>

             <div class = "menu-option" id = "statistics">
                Статистика
            </div>
        </nav>
    </div>
    <div id = "right-side">
        <header>
            <div class = "header-option">Преподавател</div>
            <div class = "header-option">Профил</div>
        </header>
        <main>
            <div id = "add-event">
                + Добави
            </div>
            <div id = "events">
                <!-- Добавяме ги с JS -->
            </div>
        </main>
    </div>

    <script src = "../js/events-data.js"></script>
    <script src = "../js/teacher-events-list.js"></script>
</body>
</html>