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

// Само преподавател може да добавя
if (!isset($_SESSION['role']) || $_SESSION['role'] !== 'teacher') {
  http_response_code(403);
  echo json_encode(['error' => 'Нямате право да добавяте студенти']);
  exit;
}

// Взимаме данните от POST
$eventId = isset($_POST['eventid']) ? (int)$_POST['eventid'] : 0;
$fn      = trim($_POST['fn'] ?? '');
$name    = trim($_POST['name'] ?? ''); // може да е празно


if ($eventId <= 0 || $fn === '') {
  http_response_code(400);
  echo json_encode(['error' => 'Липсва eventid или ФН.']);
  exit;
}

// Търсим студент по ФН
$stmt = $pdo->prepare("
  SELECT id,
         CONCAT(first_name,' ',last_name) AS name,
         faculty_number AS fn,
         email
  FROM users
  WHERE role = 'student' AND faculty_number = ?
  LIMIT 1
");
$stmt->execute([$fn]);
$student = $stmt->fetch();

if (!$student) {
  http_response_code(404);
  echo json_encode(['error' => 'Няма студент с този факултетен номер']);
  exit;
}

// Ако е въведено име, може да проверим дали съвпада
if ($name !== '' && mb_strtolower($name) !== mb_strtolower((string)$student['name'])) {
  http_response_code(400);
  echo json_encode(['error' => 'Името не съвпада с ФН. Проверете данните.']);
  exit;
}

// Добавяме/обновяваме attendance реда (ако вече съществува, само present=1)
$ins = $pdo->prepare("
  INSERT INTO attendances (event_id, student_id, present, added_by)
  VALUES (?, ?, 1, ?)
  ON DUPLICATE KEY UPDATE present = 1, added_by = VALUES(added_by)
");
$ins->execute([$eventId, (int)$student['id'], (int)$_SESSION['user_id']]);


// Успешен отговор
echo json_encode([
  'success' => true,
  'student' => $student
]);
