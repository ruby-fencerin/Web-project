<?php
declare(strict_types=1);
header('Content-Type: application/json; charset=utf-8');

require_once __DIR__ . '/db.php'; // PDO connection

// Validate input
$userId = isset($_GET['userid']) ? (int)$_GET['userid'] : 0;
if ($userId <= 0) {
  http_response_code(400);
  echo json_encode(['error' => 'Invalid userid']);
  exit;
}

$stmt = $pdo->prepare("
  SELECT id,
         CONCAT(first_name, ' ', last_name) AS name,
         faculty_number AS fn,
         email
  FROM users
  WHERE id = ? AND role = 'student'
");
$stmt->execute([$userId]);

$student = $stmt->fetch();
if (!$student) {
  http_response_code(404);
  echo json_encode(['error' => 'Student not found']);
  exit;
}

echo json_encode($student);
