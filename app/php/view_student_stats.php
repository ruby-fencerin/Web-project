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
$userId = (int)$_SESSION['user_id'];

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
$stmt = $pdo->prepare("
    SELECT COUNT(DISTINCT event_id)
    FROM attendances
    WHERE student_id = ? AND present = 1
");

// Изпълняваме заявката със studentid от URL
$stmt->execute([$studentId]);

// Взимаме резултата
$eventsCount = (int)$stmt->fetchColumn();

// Подготвяме SQL заявка за извличане на броя на събитията, посетени от студента,
// които са създадени от текущия преподавател
// Използваме prepared statement за защита от SQL Injection
$stmtTeacher = $pdo->prepare("
    SELECT COUNT(DISTINCT a.event_id)
    FROM attendances a
    JOIN events e on e.id = a.event_id
    WHERE a.student_id = ? AND e.created_by = ? AND a.present = 1
");

// Изпълняваме заявката със studentid от URL и user_id от сесията
$stmtTeacher->execute([$studentId, $userId]);

// Вземаме резултата
$eventsCountTeacher = (int)$stmtTeacher->fetchColumn();


// Подготвяме заявка, за да намерим общия брой събития
$totalStmt = $pdo->prepare("
    SELECT COUNT(*)
    FROM events
");

$totalStmt->execute();
$total = (int)$totalStmt->fetchColumn();

// Подготвяме заявка, за да намерим броя събития на текущия преподавател 
$totalTeacherStmt = $pdo->prepare("
    SELECT COUNT(*)
    FROM events
    WHERE created_by = ?
");

$totalTeacherStmt->execute([$userId]);
$totalTeacher = (int)$totalTeacherStmt->fetchColumn();

// Връщаме данните като JSON
echo json_encode([
    'events_count' => $eventsCount, 
    'events_count_teacher' => $eventsCountTeacher, 
    'total' => $total,
    'total_teacher' => $totalTeacher,
]);