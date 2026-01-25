<?php
declare(strict_types=1);
// Стартираме сесията
session_start();

// Изключваме показването на PHP грешки в отговора,
// за да не се чупи JSON форматът
ini_set('display_errors', '0');

// Указваме, че този файл връща JSON отговор
header('Content-Type: application/json; charset=utf-8');

// Включваме файла с PDO връзката към базата данни
require_once __DIR__ . '/db.php';

// Проверяваме дали имаме валидна сесия
if (!isset($_SESSION['user_id'], $_SESSION['role'])) {
    // При невалиден параметър връщаме HTTP 401
    http_response_code(401);
    echo json_encode(['error' => 'Потребителят не е логнат']);
    exit;
}

// Проверяваме дали потребителят е студент
if ($_SESSION['role'] !== 'student') {
    // При невалиден параметър връщаме HTTP 401
    http_response_code(401);
    echo json_encode(['error' => 'Достъпът е разрешен само за преподаватели!']);
    exit;   
}

// Вземаме id на потребителя от текущата сесия
$userId = (int)$_SESSION['user_id'];

// Подготвяме SQL заявка за извличане на броя на събитията, посетени от студента
// Използваме prepared statement за защита от SQL Injection
$stmt = $pdo->prepare("
    SELECT COUNT(DISTINCT event_id)
    FROM attendances
    WHERE student_id = ? AND present = 1
");

// Изпълняваме заявката с user_id от сесията на логнатия потребител
$stmt->execute([$userId]);

// Взимаме резултата
$eventsCount = (int)$stmt->fetchColumn();

// Подготвяме заявка, за да намерим общия брой събития
$totalStmt = $pdo->prepare("
    SELECT COUNT(*)
    FROM events
");

$totalStmt->execute();
$total = (int)$totalStmt->fetchColumn();

// Връщаме данните като JSON
echo json_encode(['events_count' => $eventsCount, 'total' => $total]);