<?php
declare(strict_types=1);

ini_set('display_errors', '0');
header('Content-Type: application/json; charset=utf-8');

require_once __DIR__ . '/db.php'; // adjust if db.php is elsewhere

$userId = isset($_GET['userid']) ? (int)$_GET['userid'] : 0;
if ($userId <= 0) {
  http_response_code(400);
  echo json_encode(['error' => 'Invalid userid']);
  exit;
}

$stmt = $pdo->prepare("
  SELECT id,
         CONCAT(first_name, ' ', last_name) AS name,
         department,
         email
  FROM users
  WHERE id = ? AND role = 'teacher'
");
$stmt->execute([$userId]);

$teacher = $stmt->fetch();
if (!$teacher) {
  http_response_code(404);
  echo json_encode(['error' => 'Teacher not found']);
  exit;
}

echo json_encode($teacher);
