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

$year = isset($_POST['year']) ? (int)$_POST['year'] : 0;
if ($year <= 0) {
  http_response_code(400);
  echo json_encode(['error' => 'Липсва или невалиден курс'], JSON_UNESCAPED_UNICODE);
  exit;
}

$groupsRaw = trim($_POST['groups'] ?? '');
$groups = [];
if ($groupsRaw !== '') {
  $groups = array_values(array_unique(array_filter(array_map('trim', explode(',', $groupsRaw)), fn($x) => $x !== '')));
}

$eventID = [];
// Create event
$stmt = $pdo->prepare("
  INSERT INTO events(`title`, `description`, `start_at`, `end_at`, `created_by`, `created_at`)
  VALUES (?, ?, ?, ?, ?, NOW())
");
for ($i = 0; $i < count($title); $i++) {
  $stmt->execute([$title[$i], $description[$i], $start_at[$i], $end_at[$i], $userId]);
  $eventId[] = (int)$pdo->lastInsertId();
  // echo end($eventId);
  // Add ALL students from this major and group with present=0

  if (count($groups) === 0) {
    // No group filter => whole major
    $stmt1 = $pdo->prepare("
      INSERT INTO attendances (`event_id`, `student_id`, `present`, `added_by`, `added_at`)
      SELECT ?, u.id, 0, ?, NOW()
      FROM users u
      JOIN student_academic_info sai ON sai.student_id = u.id
      WHERE u.role = 'student'
        AND sai.major = ?
        AND sai.study_year = ?
      ON DUPLICATE KEY UPDATE
        present = present
    ");
    $stmt1->execute([$eventId[$i], $userId, $major, $year]);
    
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
        AND sai.study_year = ?
        AND sai.student_group IN ($placeholders)
      ON DUPLICATE KEY UPDATE present = present
    ";

    $params = array_merge([$eventId[$i], $userId, $major, $year], $groups);

    $stmt2 = $pdo->prepare($sql);
    $stmt2->execute($params);
  }
}

// Успешен отговор
echo json_encode(['success' => true, 'eventId' => $eventId]);
