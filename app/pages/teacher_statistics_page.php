<!DOCTYPE html>
<html lang = "bg">
<head>
    <meta charset = "UTF-8">
    <meta name = "viewport" content = "width=device-width, initial-scale=1.0">
    <title>List of students</title>

    <link rel = "stylesheet" href = "../css/menu_styles.css">
    <link rel = "stylesheet" href = "../css/stats_teacher_styles.css">

</head>
<body>
    <div id = "nav-div">
        <nav id = "menu">
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

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> 

    <script src = "../js/charts.js"></script>
    <script src = "../js/menu.js" defer></script>

</body>
</html>