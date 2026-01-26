<!DOCTYPE html>
<html lang = "bg">
<head>
    <meta charset = "UTF-8">
    <meta name = "viewport" content = "width=device-width, initial-scale=1.0">
    <title>List of students</title>

    <link rel = "stylesheet" href = "../css/menu_styles.css">
    <link rel = "stylesheet" href = "../css/stats_teacher_styles.css">

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

             <div class = "menu-option" id = "list-all-students">
                Студенти
            </div>

             <div class = "menu-option chosen" id = "statistics">
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
            <div id = "barplot-div">
                <canvas id = "myBarplot"></canvas>
            </div>

            <div id = "lineplot-div">
                <canvas id = "myLineplot"></canvas>
            </div>
        </main>
    </div>

    <script src="../js/chart.js"></script> 

    <script src = "../js/teacher-stats.js"></script>
    <script src = "../js/menu.js" defer></script>

</body>
</html>