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

// Взимаме идентификатора на събитието от URL (?eventid=...)
$eventId = isset($_GET['eventid']) ? (int)$_GET['eventid'] : 0;

// Проверка дали eventid е валиден
if ($eventId <= 0) {
  http_response_code(400); // Bad Request
  echo json_encode(['error' => 'Невалиден идентификатор на събитие']);
  exit;
}

// Проверка дали потребителят е логнат
if (!isset($_SESSION['user_id'])) {
  http_response_code(401); // Unauthorized
  echo json_encode(['error' => 'Потребителят не е логнат']);
  exit;
}

// Подготвяме SQL заявка за извличане на ресурсите за дадено събитие, добавени от преподавател
$teacherStmt = $pdo->prepare("
  SELECT
    title,   
    url      
  FROM resources r
  JOIN users u on u.id = r.created_by
  WHERE r.event_id = ? AND u.role = 'teacher'
");

// Изпълняваме заявката, като подаваме eventId
$teacherStmt->execute([$eventId]);

// Вземаме всички ресурси като масив
$teacherResources = $teacherStmt->fetchAll();

// Подготвяме SQL заявка за извличане на ресурсите за дадено събитие, добавени от студенти
$studentStmt = $pdo->prepare("
  SELECT
    title,   
    url      
  FROM resources r
  JOIN users u on u.id = r.created_by
  WHERE r.event_id = ? AND u.role = 'student'
");

// Изпълняваме заявката, като подаваме eventId
$studentStmt->execute([$eventId]);

// Вземаме всички ресурси като масив
$studentResources = $studentStmt->fetchAll();

// Връщаме ресурсите като JSON отговор
echo json_encode([
  'resources' => [
    'teacher' => $teacherResources,
    'student' => $studentResources,
  ]
]);
