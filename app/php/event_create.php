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
$title    = json_decode($_POST['title'],true) ?? '';
$description    = json_decode($_POST['description'],true) ?? '';
$start_at    = json_decode($_POST['start_at'],true) ?? '';
$end_at    = json_decode($_POST['end_at'],true) ?? '';

// Валидация
if ($title === '' || $description === '' || $start_at === '' || $end_at === '') {
  http_response_code(400);
  echo json_encode(['error' => 'Невалидни входни данни']);
  exit;
}

// Превръщане към време
$start_at = $start_at;
$end_at = $end_at;
// Проверка дали потребителят е логнат
if (!isset($_SESSION['user_id'], $_SESSION['role'])) {
  http_response_code(401);
  echo json_encode(['error' => 'Потребителят не е вписан']);
  exit;
}

$userId = (int)$_SESSION['user_id'];
$role   = (string)$_SESSION['role'];

if($role !== 'teacher'){
  http_response_code(403);
  echo json_encode(['error' => 'Нямате права за създаване на събитие']);
  exit;
}
#var_dump($title);

// Записваме коментара в базата
$stmt = $pdo->prepare("
  INSERT INTO events(`title`, `description`, `start_at`, `end_at`, `created_by`, `created_at`)
  VALUES (?, ?, ?, ?, ? , NOW())
");
for ($i = 0; $i < count($title); $i++) {
  $stmt->execute([$title[$i], $description[$i], $start_at[$i], $end_at[$i], $userId]);
}

$eventId = [];
$stmt = $pdo->prepare("
  SELECT 
    id 
  FROM events
  WHERE title = ? AND description = ? AND start_at = ? AND end_at = ? AND created_by = ?
");
for ($i = 0; $i < count($title); $i++) {
  $stmt->execute([$title[$i], $description[$i], $start_at[$i], $end_at[$i], $userId]);
  $eventIdPerFetch = $stmt->fetchAll();
  $eventId[] = json_encode($eventIdPerFetch);
}

// Успешен отговор
echo json_encode(['success' => true, 'eventId' => $eventId]);
