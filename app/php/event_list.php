<?php
declare(strict_types=1);

ini_set('display_errors', '0');
header('Content-Type: application/json; charset=utf-8');

require_once __DIR__ . '/db.php';

$studentId = isset($_GET['userid']) ? (int)$_GET['userid'] : 0;
if ($studentId <= 0) {
  http_response_code(400);
  echo json_encode(['error' => 'Invalid userid']);
  exit;
}

$stmt = $pdo->prepare("
  SELECT
    e.id,
    e.title,
    e.start_at,
    e.end_at
  FROM attendances a
  JOIN events e ON e.id = a.event_id
  WHERE a.student_id = ? AND a.present = 1
  ORDER BY e.start_at DESC
");
$stmt->execute([$studentId]);

$events = $stmt->fetchAll();

echo json_encode(['events' => $events]);
