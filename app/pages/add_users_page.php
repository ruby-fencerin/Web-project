<!DOCTYPE html>
<html lang = "bg">
<head>
    <meta charset = "UTF-8">
    <meta name = "viewport" content = "width=device-width, initial-scale=1.0">
    <title>Event creation page</title>
    
    <link rel = "stylesheet" href = "../css/menu_styles.css">
    <link rel = "stylesheet" href = "../css/add_users_styles.css">

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