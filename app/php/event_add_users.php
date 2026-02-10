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
$users    = trim($_POST['users'] ?? '');
$eventId = isset($_POST['eventid']) ? (int)$_POST['eventid'] : 0;
// Валидация
if ($users === '' || $eventId <= 0) {
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

if($role !== 'teacher'){
  http_response_code(403);
  echo json_encode(['error' => 'Нямате права за създаване на събитие']);
  exit;
}

$userNamesArray = explode("\r\n", $users);
$userNamesString = implode("\",\"", $userNamesArray);
# echo $userNamesString;

$stmt = $pdo->prepare("
    SELECT
        id 
    FROM users
    WHERE CONCAT(first_name, ' ', last_name) IN ("."\"". $userNamesString."\"" .")
");
$stmt->execute();
$queryUserIDs = $stmt->fetchAll();

// Записваме коментара в базата
$upsert = $pdo->prepare("
  INSERT INTO attendances(event_id, student_id, present, added_by, added_at)
  VALUES (?, ?, 1, ?, NOW())
  ON DUPLICATE KEY UPDATE
    present = 1,
    added_by = VALUES(added_by),
    added_at = VALUES(added_at)
");

foreach ($queryUserIDs as $row) {
  $upsert->execute([$eventId, (int)$row['id'], $userId]);
}

// Успешен отговор
echo json_encode(['success' => true]);
