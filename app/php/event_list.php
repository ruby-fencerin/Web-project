<?php
declare(strict_types=1);

// Изключваме HTML грешки и казваме, че връщаме JSON
ini_set('display_errors', '0');
header('Content-Type: application/json; charset=utf-8');

// Връзка с базата данни (PDO)
require_once __DIR__ . '/db.php';

// Взимаме id на user-a от URL 
$userId = isset($_GET['userid']) ? (int)$_GET['userid'] : 0;

// Валидация на входните данни
if ($userId <= 0) {
  http_response_code(400);
  echo json_encode(['error' => 'Invalid userid']);
  exit;
}

// SQL заявка:
// - взима всички събития
// - на които студентът е присъствал
// - сортирани по дата (най-новите първи)
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

// Изпълняваме заявката със studentId
$stmt->execute([$userId]);

// Взимаме всички резултати
$events = $stmt->fetchAll();

// Връщаме ги като JSON
echo json_encode(['events' => $events]);
