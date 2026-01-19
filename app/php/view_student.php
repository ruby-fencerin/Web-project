<?php
declare(strict_types=1);

// Стартираме сесията
session_start();

// Изключваме показването на PHP грешки в отговора,
// за да не се наруши JSON форматът
ini_set('display_errors', '0');

// Указваме, че този файл връща JSON
header('Content-Type: application/json; charset=utf-8');

// Включваме PDO връзката към базата данни
require_once __DIR__ . '/db.php';

// Само преподавател има право да достъпва този файл
if (!isset($_SESSION['role']) || $_SESSION['role'] !== 'teacher') {
  http_response_code(403);
  echo json_encode(['error' => 'Нямате права за този ресурс']);
  exit;
}

// Взимаме studentid от URL
$studentId = isset($_GET['studentid']) ? (int)$_GET['studentid'] : 0;

// Валидация
if ($studentId <= 0) {
  http_response_code(400);
  echo json_encode(['error' => 'Невалиден studentid']);
  exit;
}

// Заявка към базата – взимаме само студенти
$stmt = $pdo->prepare("
  SELECT id,
         'student' AS role,
         CONCAT(first_name, ' ', last_name) AS name,
         faculty_number AS fn,
         email
  FROM users
  WHERE id = ? AND role = 'student'
");
$stmt->execute([$studentId]);

$student = $stmt->fetch();

// Ако студентът не съществува
if (!$student) {
  http_response_code(404);
  echo json_encode(['error' => 'Студентът не е намерен']);
  exit;
}

// Връщаме данните за студента
echo json_encode($student);
