<!DOCTYPE html>
<html lang = "bg">
<head>
    <meta charset = "UTF-8">
    <meta name = "viewport" content = "width=device-width, initial-scale=1.0">
    <title>Profile</title>

    <link rel = "stylesheet" href = "../css/menu_styles.css">
    <link rel = "stylesheet" href = "../css/user_page_styles.css">
    
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
            <div class = "menu-option chosen" id = "for-me">
                За мен
            </div>

            <div class = "menu-option" id = "my-events">
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
            <div id = "info-div">
                <img id = "profile-pic" src = "../images/unknown.jpg">
                <div id = "personal-info">
                    <h3 id = "name"></h3>
                    <span id = "fn/dep"></span><br>
                    e-mail: <span id = "email"></span><br>
                </div>
            </div>

            <div id = "barplot-div">
                <canvas id = "single-bar-plot"></canvas>
            </div>

             <div id = "barplot-div-view-student">
                <canvas id = "single-bar-plot-view-student"></canvas>
            </div>

        </main>
    </div>

     <script src="../js/chart.js"></script> 
     
    <script src = "../js/user-stats.js"></script>
    <script src = "../js/user.js"></script>
    <script src = "../js/menu.js" defer></script>
</body>
</html>