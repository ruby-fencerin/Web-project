<?php
declare(strict_types=1);

ini_set('display_errors', '0');
header('Content-Type: application/json; charset=utf-8');

require_once __DIR__ . '/db.php';

$eventId   = isset($_GET['eventid']) ? (int)$_GET['eventid'] : 0;
$userId = isset($_GET['userid']) ? (int)$_GET['userid'] : 0;

if ($eventId <= 0 || $userId <= 0) {
  http_response_code(400);
  echo json_encode(['error' => 'Invalid eventid or userid']);
  exit;
}


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
$event = $eventStmt->fetch();

if (!$event) {
  http_response_code(404);
  echo json_encode(['error' => 'Event not found']);
  exit;
}

$attStmt = $pdo->prepare("
  SELECT CONCAT(u.first_name, ' ', u.last_name) AS name
  FROM attendances a
  JOIN users u ON u.id = a.student_id
  WHERE a.event_id = ? AND a.present = 1
  ORDER BY u.last_name, u.first_name
");
$attStmt->execute([$eventId]);
$students = $attStmt->fetchAll(PDO::FETCH_COLUMN);

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
    'count' => count($students),
    'students' => $students
  ]
]);
