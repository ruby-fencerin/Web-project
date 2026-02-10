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

if (!isset($_SESSION['user_id'], $_SESSION['role'])) {
    // При невалиден параметър връщаме HTTP 401
    http_response_code(401);
    echo json_encode(['error' => 'Потребителят не е логнат']);
    exit;
}

if ($_SESSION['role'] !== 'teacher') {
    // При невалиден параметър връщаме HTTP 401
    http_response_code(401);
    echo json_encode(['error' => 'Достъпът е разрешен само за преподаватели!']);
    exit;   
}

$userId = (int)$_SESSION['user_id'];

// Подготвяме SQL заявка за извличане на брой присъствали 
// студенти за всяко събитие на преподавателя.
// Използваме prepared statement за защита от SQL Injection
$stmt = $pdo->prepare("
    SELECT
        e.id    AS event_id,
        e.title AS event_title,
        COUNT(a.student_id) AS total_students,
        SUM(CASE WHEN a.present = 1 THEN 1 ELSE 0 END) AS present_students
    FROM events e
    LEFT JOIN attendances a
        ON e.id = a.event_id
    WHERE e.created_by = ?
    GROUP BY e.id, e.title
    ORDER BY e.start_at DESC
");

// Изпълняваме заявката с user_id от сесията на логнатия потребител
$stmt->execute([$userId]);

// Взимаме всички резултати
$stats = $stmt->fetchAll();


// Връщаме данните като JSON
echo json_encode(['stats' => $stats], JSON_UNESCAPED_UNICODE);