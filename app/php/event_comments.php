<?php
declare(strict_types=1);

session_start();

// Изключваме показването на PHP грешки в отговора,
// за да не се наруши JSON форматът
ini_set('display_errors', '0');

// Указваме, че този файл връща JSON
header('Content-Type: application/json; charset=utf-8');

// Включваме PDO връзката към базата данни
require_once __DIR__ . '/db.php';

// Взимаме eventid от URL
$eventId = isset($_GET['eventid']) ? (int)$_GET['eventid'] : 0;
if ($eventId <= 0) {
    http_response_code(400);
    echo json_encode(['error' => 'Невалидно id на събитие']);
    exit;
}

// Проверка дали потребителят е логнат
if (!isset($_SESSION['user_id'], $_SESSION['role'])) {
    http_response_code(401);
    echo json_encode(['error' => 'Потребителят не е вписан']);
    exit;
}

$userId = (int)$_SESSION['user_id'];
$role   = (string)$_SESSION['role'];


// Извличаме коментарите за събитието
$stmt = $pdo->prepare("
    SELECT
        c.id,
        c.body,
        c.created_at,
        CONCAT(u.first_name, ' ', u.last_name) AS author
    FROM comments c
    JOIN users u ON u.id = c.user_id
    WHERE c.event_id = ?
    ORDER BY c.created_at ASC
    ");
$stmt->execute([$eventId]);

// Връщаме коментарите като JSON
echo json_encode([
    'comments' => $stmt->fetchAll()
]);
