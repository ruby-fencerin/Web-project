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
$title    = trim($_POST['title'] ?? '');
$description    = trim($_POST['description'] ?? '');
$start_at    = trim($_POST['start_at'] ?? '');
$end_at    = trim($_POST['end_at'] ?? '');

// Валидация
if ($title === '' || $description === '' || $start_at === '' || $end_at === '') {
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

$major = trim($_POST['major'] ?? '');
if ($major === '') {
  http_response_code(400);
  echo json_encode(['error' => 'Липсва специалност']);
  exit;
}

$groupsRaw = trim($_POST['groups'] ?? '');
$groups = [];
if ($groupsRaw !== '') {
  $groups = array_values(array_unique(array_filter(array_map('trim', explode(',', $groupsRaw)), fn($x) => $x !== '')));
}

// Create event
$stmt = $pdo->prepare("
  INSERT INTO events(`title`, `description`, `start_at`, `end_at`, `created_by`, `created_at`)
  VALUES (?, ?, ?, ?, ?, NOW())
");
$stmt->execute([$title, $description, $start_at, $end_at, $userId]);

$eventId = (int)$pdo->lastInsertId();

// Add ALL students from this major and group with present=0

if (count($groups) === 0) {
  // No group filter => whole major
  $stmt = $pdo->prepare("
    INSERT INTO attendances (`event_id`, `student_id`, `present`, `added_by`, `added_at`)
    SELECT ?, u.id, 0, ?, NOW()
    FROM users u
    JOIN student_academic_info sai ON sai.student_id = u.id
    WHERE u.role = 'student'
      AND sai.major = ?
    ON DUPLICATE KEY UPDATE
      present = present
  ");
  $stmt->execute([$eventId, $userId, $major]);
  
} else {
  // Filter by groups list
  $placeholders = implode(',', array_fill(0, count($groups), '?'));

  $sql = "
    INSERT INTO attendances (event_id, student_id, present, added_by, added_at)
    SELECT ?, u.id, 0, ?, NOW()
    FROM users u
    JOIN student_academic_info sai ON sai.student_id = u.id
    WHERE u.role = 'student'
      AND sai.major = ?
      AND sai.student_group IN ($placeholders)
    ON DUPLICATE KEY UPDATE present = present
  ";

  $params = array_merge([$eventId, $userId, $major], $groups);

  $stmt = $pdo->prepare($sql);
  $stmt->execute($params);
}


// Успешен отговор
echo json_encode(['success' => true, 'eventId' => $eventId]);
