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
$title = trim($_POST['title'] ?? '');
$url = trim($_POST['url'] ?? '');
$type = trim($_POST['type'] ?? '');

// Валидация
if ($eventId <= 0 || $title === '' || $url === '' || $type === '') {
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

// Вземаме userId и роля от текущата сесия
$userId = (int)$_SESSION['user_id'];
$role   = (string)$_SESSION['role'];

$stmt = $pdo->prepare("
    INSERT INTO resources (event_id, type, title, url, created_by)
    VALUES (?, ?, ?, ?, ?)
");

$stmt->execute([$eventId, $type, $title, $url, $userId]);

// Успешен отговор
echo json_encode(['success' => true]);