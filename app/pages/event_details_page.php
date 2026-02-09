<!DOCTYPE html>
<html lang = "bg">
<head>
    <meta charset = "UTF-8">
    <meta name = "viewport" content = "width=device-width, initial-scale=1.0">
    <title>Event page</title>

    <link rel = "stylesheet" href = "../css/menu_styles.css">
    <link rel = "stylesheet" href = "../css/event_details_styles.css">

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
            <div id = "back">⇦</div>

            <h2 id = "event-title"></h2>
            <div class = "event-desc">
                <div id = "event-teacher"></div>
                <div id = "event-theme"></div>
                <div id = "event-info"></div>
            </div>

            <div id = "show-attending">
                Присъствали: <span id = "count-attendance">30</span>
            </div>

            <div id = "attendance-list" class = "hidden">
            </div>

            <p id = "remove-student-instruction" class = "hidden">
                * За да отбележите, че студент не е присъствал на
                събитието, кликнете върху него. Ако впоследствие решите да го добавите
                отново, кликнете още веднъж върху него.
            </p>

            <div id = "add-student-div" class = "hidden">
                <p id = "add-student-title">Добавяне на студент</p>

                <form id = "add-student-form">
                    <label>
                        <div class = "input-label">Име:</div>
                        <input type = "text" id = "new-name" name = "new-name" required>
                    </label>

                    <label>
                        <div class = "input-label">ФН:</div>
                        <input type = "text" id = "new-fn" name = "new-fn" required>
                    </label>
            
                    <button id = "add-student" type="button">
                        + Добави
                    </button>
                </form>

                <p id = "add-student-title">Добавяне на студенти от Big Blue Button</p>

                <form id = "add-student-form-bbb">
                    <label>
                        <div class = "input-label">Файл:</div>
                        <input type="file" id="bbb-import" name="bbb-import" accept=".txt" />
                    </label>

                    <textarea id="imported-user-list" placeholder="Списък със студенти"></textarea>
            
                    <button id = "add-student-bbb" type="button">
                        + Вмъкни
                    </button>
                </form>

                <div id = "add-student-succes"></div>
                <div id = "add-student-error"></div>
             </div>

            <hr>

            <div id = "resources-div">
                <div class = "section-title">
                    <h3>Ресурси</h3> 
                </div>

                <div id = "teacher-resources-list">
                    <!-- Добавяме ресурси с JS -->
                </div>

                <div class = "section-title">
                    <h3>Ресурси от студенти</h3> 
                </div>
                <div id = "student-resources-list">
                    <!-- Добавяме ресурси с JS -->
                </div>

                <div id = "add-resource-div">
                    <p id = "add-resource-title">Добавяне на ресурс</p>

                    <form id = "add-resource-form">
                        <label>
                            <div class = "input-label">Заглавие:</div>
                            <input type = "text" id = "new-resource-title" name = "new-resource-title" required>
                        </label>

                        <label>
                            <div class = "input-label">URL:</div>
                            <input type = "text" id = "new-resource-url" name = "new-resource-url" required>
                        </label>

                        <label>
                            <div class = "input-label">Тип на ресурса:</div>
                            <select id = "new-resource-type" name = "new-resource-type" required>
                                <option>pdf</option>
                                <option>live_link</option>
                                <option>js</option>
                                <option>php</option>
                                <option>html</option>
                                <option>sql</option>
                                <option>recording</option>
                            </select>
                        </label>
                
                        <button id = "add-resource" type = "button">
                            + Добави
                        </button>
                    </form>

                    <div id = "add-resource-succes"></div>
                    <div id = "add-resource-error"></div>
                </div>

            </div>

            <hr>

            <div id = "comments-div">
                <div class = "section-title">
                    <h3>Коментари</h3>
                </div>

                <!-- тук JS ще добавя всички коментари -->
                <div id="comments-list"></div>

                <!-- поле за нов коментар -->
                <textarea id="comment-text" placeholder="Добави коментар..."></textarea>
                <div id = "add-comment">
                    Изпрати
                </div>
            </div>
        </main>
    </div>

    <script src = "../js/attendance-list.js"></script>
    <script src = "../js/add-resource.js"></script>
    <script src = "../js/add-comment.js"></script>
    <script src = "../js/add-attendance.js"></script>

    <script src= "../js/event-details.js"></script>
    <script src= "../js/menu.js" defer></script>

</body>
</html>