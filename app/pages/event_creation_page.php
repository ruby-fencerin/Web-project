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
                <div id="major-select-div">Специалност</div>
                <select id="major-select">
                    <option value="">-- Избери специалност --</option>
                </select>
                <div id="year-select-div">Курс</div>
                <input type="number" id="year-select" min="1" max="4"/>
                <div id="group-select-div">Група</div>
                <input type="text" id="group-select" placeholder="напр. 1, 2, 3 (празно = всички)" />
                

            </div>  
            <div id="textareas">
                <h4>Вмъкване на участвали в Big Blue Button (Съвместимо с множествено и единично вкъкване)</h4>
                <p>За момета търси редът "Sorted by last name:\r\n" и започва да чете след него ред по ред име и фамилия на потребител. Отбелязва ги като присъствали.</p>
                <input type="file" id="bbb-import" name="bbb-import" accept=".txt" />
                <textarea id="imported-user-list" placeholder="Списък със студенти"></textarea>
                <div id = "add">
                    Импорт
                </div>
                
                <h4>Вмъкване на множество материали (Съвместимо с множествено и единично вкъкване)</h4>
                <p>Приема CSV файл, в който редовете трябва да са подредени така:<br>
                номер на събитието от множеството(изпуска се при ръчно създаване на събитие чрез GUI), <br>
                име, линк, вид(Валидни са pdf,live_link,js,php,html,sql,recording)
                </p>
                <input type="file" id="material-import" name="material-import" accept=".csv" />
                <textarea id="imported-material-list" placeholder="Списък с материали"></textarea>

                <h4>Вмъкване на множество събития</h4>
                <p>Приема CSV файл, в който редовете трябва да са подредени така:<br>
                име, описание, дата начало(формат година-месец-ден), час начало(формат час:минути), дата край(формат година-месец-ден), час край(формат час:минути)
                Т1,Тестване,2026-02-10,10:00,2026-02-10,12:00
                </p>
                <input type="file" id="event-import" name="event-import" accept=".csv" />
                <textarea id="imported-event-list" placeholder="Списък с събития"></textarea>
                
                <div id = "add-multiple">
                    Импорт няколко събития
                </div>
            </div>
            </div>
        </main>
    </div>

    <script src="../js/event-creation.js"></script>
    <script src="../js/menu.js"></script>
</body>
</html>