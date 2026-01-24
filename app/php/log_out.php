<?php
session_start();

// Изчистваме всички session променливи
$_SESSION = [];

// Унищожаваме сесията
session_destroy();

// Пренасочваме към login страницата
header("Location: ../pages/login_page.php");
exit;
