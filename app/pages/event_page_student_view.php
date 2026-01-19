<!DOCTYPE html>
<html lang = "bg">
<head>
    <meta charset = "UTF-8">
    <meta name = "viewport" content = "width=device-width, initial-scale=1.0">
    <title>Event page</title>
    <link rel = "stylesheet" href = "../css/page_styles.css">
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
            <div class = "header-option">Студент</div>
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
                Присъствали: <span id = "count-attendance"></span>
            </div>

            <div id = "attendance-list" class = "hidden">
            </div>

            <div id = "resources-div">
                <div class = "section-title">
                    <h3>Ресурси</h3> 
                    <div class = "add-resource">
                        + Добави
                    </div>
                </div>
                <!-- Добавяме ресурси с JS -->
            </div>

            <div id = "comments-div">  
                <div class = "section-title">
                    <h3>Коментари</h3> 
                    <div class = "add-comment">
                        + Добави
                    </div>
                </div>
                <div class = "comment">
                    <div class = "comment-info">
                        <span class = "sender-name">Борис Иванов</span>
                        <span class = "comment-data">18.04</span>
                    </div>
                    <div class = "comment-content">
                        Беше скучно
                    </div>
                </div>

                <div class = "comment">
                    <div class = "comment-info">
                        <span class = "sender-name">Петя Петрова</span>
                        <span class = "comment-data">19.04</span>
                    </div>
                    <div class = "comment-content">
                        Иване, идиот такъв!
                    </div>
                </div>

                 <div class = "comment">
                    <div class = "comment-info">
                        <span class = "sender-name">Георги Терезов</span>
                        <span class = "comment-data">19.04</span>
                    </div>
                    <div class = "comment-content">
                        6-7
                    </div>
                </div>
            </div>
        </main>
    </div>

    <script src = "../js/add-resource.js"></script>
    <script src= "../js/event-details.js"></script>
    <script src= "../js/menu.js" defer></script>

</body>
</html>