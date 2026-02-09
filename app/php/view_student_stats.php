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
if (!isset($_SESSION['user_id'], $_SESSION['role']) || $_SESSION['role'] !== 'teacher') {
  http_response_code(403);
  echo json_encode(['error' => 'Нямате права за този ресурс']);
  exit;
}

// Взимаме user_id от текуща сесия
$teacherId = (int)$_SESSION['user_id'];

// Взимаме studentid от URL
$studentId = isset($_GET['studentid']) ? (int)$_GET['studentid'] : 0;

// Валидация
if ($studentId <= 0) {
  http_response_code(400);
  echo json_encode(['error' => 'Невалиден studentid']);
  exit;
}

// Подготвяме SQL заявка за извличане на броя на събитията, посетени от студента
// Използваме prepared statement за защита от SQL Injection
$stmtAll = $pdo->prepare("
  SELECT
    COUNT(*) AS total_count,
    SUM(CASE WHEN present = 1 THEN 1 ELSE 0 END) AS present_count
  FROM attendances
  WHERE student_id = ?
");


// Изпълняваме заявката със studentid от URL
$stmtAll->execute([$studentId]);

// Взимаме резултата
$all = $stmtAll->fetch() ?: ['total_count' => 0, 'present_count' => 0];


// Подготвяме SQL заявка за извличане на броя на събитията, посетени от студента,
// които са създадени от текущия преподавател
// Използваме prepared statement за защита от SQL Injection
$stmtTeacher = $pdo->prepare("
  SELECT
    COUNT(*) AS total_teacher,
    SUM(CASE WHEN a.present = 1 THEN 1 ELSE 0 END) AS present_teacher
  FROM attendances a
  JOIN events e ON e.id = a.event_id
  WHERE a.student_id = ? AND e.created_by = ?
");

// Изпълняваме заявката със studentid от URL и user_id от сесията
$stmtTeacher->execute([$studentId, $teacherId]);

$t = $stmtTeacher->fetch() ?: ['total_teacher' => 0, 'present_teacher' => 0];


// Връщаме данните като JSON
echo json_encode([
  'present' => (int)$all['present_count'],
  'total' => (int)$all['total_count'],
  'present_teacher' => (int)$t['present_teacher'],
  'total_teacher' => (int)$t['total_teacher'],
]);