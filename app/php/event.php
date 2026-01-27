<?php
declare(strict_types=1);

// Стартираме PHP сесията,
// за да имаме достъп до $_SESSION (логнат потребител)
session_start();

// Изключваме показването на PHP грешки в отговора,
// за да не се наруши JSON форматът
ini_set('display_errors', '0');

// Указваме, че този файл връща JSON отговор
header('Content-Type: application/json; charset=utf-8');

// Включваме файла с PDO връзката към базата данни
require_once __DIR__ . '/db.php';

// Взимаме идентификатора на събитието от URL (?eventid=...)
$eventId = isset($_GET['eventid']) ? (int)$_GET['eventid'] : 0;

// Проверка за валиден eventid
if ($eventId <= 0) {
  http_response_code(400); // Bad Request
  echo json_encode(['error' => 'Невалиден идентификатор на събитие']);
  exit;
}

// Проверка дали потребителят е логнат (има активна сесия)
if (!isset($_SESSION['user_id'])) {
  http_response_code(401); // Unauthorized
  echo json_encode(['error' => 'Потребителят не е логнат']);
  exit;
}

// Взимаме id на логнатия потребител от сесията
$userId = (int)$_SESSION['user_id'];
$role   = $_SESSION['role'];

if ($role === 'student') {

  // Проверка дали студентът е присъствал на събитието
  $check = $pdo->prepare("
    SELECT 1
    FROM attendances
    WHERE event_id = ? AND student_id = ? AND present = 1
    LIMIT 1
  ");
  $check->execute([$eventId, $userId]);

  if (!$check->fetchColumn()) {
    http_response_code(403);
    echo json_encode(['error' => 'Нямате достъп до това събитие!']);
    exit;
  }

} elseif ($role === 'teacher') {

  // Проверка дали преподавателят е създал събитието
  $check = $pdo->prepare("
    SELECT 1
    FROM events
    WHERE id = ? AND created_by = ?
    LIMIT 1
  ");
  $check->execute([$eventId, $userId]);

  if (!$check->fetchColumn()) {
    http_response_code(403);
    echo json_encode(['error' => 'Нямате достъп до това събитие!']);
    exit;
  }

} else {

  http_response_code(403);
  echo json_encode(['error' => 'Невалидна роля']);
  exit;
}

// Заявка за извличане на информация за събитието
$eventStmt = $pdo->prepare("
  SELECT
    e.id,
    e.title,
    e.description AS info,
    e.start_at,
    e.end_at,
    CONCAT(t.first_name, ' ', t.last_name) AS teacher_name
  FROM events e
  JOIN users t ON t.id = e.created_by
  WHERE e.id = ?
  LIMIT 1
");
$eventStmt->execute([$eventId]);

// Вземаме информацията за събитието
$event = $eventStmt->fetch();

// Ако събитието не съществува
if (!$event) {
  http_response_code(404); // Not Found
  echo json_encode(['error' => 'Събитието не е намерено']);
  exit;
}

// Заявка за списък с присъствалите студенти
$attStmt = $pdo->prepare("
  SELECT
    u.id,
    CONCAT(u.first_name, ' ', u.last_name) AS name,
    u.faculty_number AS fn,
    a.present
  FROM attendances a
  JOIN users u ON u.id = a.student_id
  WHERE a.event_id = ?
  ORDER BY u.last_name, u.first_name
");
$attStmt->execute([$eventId]);

// Вземаме имената на студентите в масив
$students = $attStmt->fetchAll();

// Преброяваме присъствалите
$presentCount = 0;
foreach ($students as $st) {
  $presentCount += (int)$st['present'];
}

// Връщаме крайния JSON отговор към клиента
echo json_encode([
  'event' => [
    'id' => (int)$event['id'],
    'title' => $event['title'],
    'info' => $event['info'],
    'start_at' => $event['start_at'],
    'end_at' => $event['end_at'],
    'teacher_name' => $event['teacher_name'],
  ],
  'attendance' => [
    'count' => $presentCount,   // брой присъствали
    'students' =>  $students,        // списък с имена
  ],
  'role' => $role,
]);
