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


// Взимаме данните от POST заявката
$eventId = isset($_POST['eventid']) ? (int)$_POST['eventid'] : 0;
$text    = trim($_POST['text'] ?? '');

// Валидация
if ($eventId <= 0 || $text === '') {
  http_response_code(400);
  echo json_encode(['error' => 'Невалидни входни данни']);
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

// Записваме коментара в базата
$stmt = $pdo->prepare("
  INSERT INTO comments (event_id, user_id, body)
  VALUES (?, ?, ?)
");
$stmt->execute([$eventId, $userId, $text]);

// Успешен отговор
echo json_encode(['success' => true]);
