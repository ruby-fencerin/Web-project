<?php
declare(strict_types=1);

// Изключваме показването на PHP грешки в отговора,
// за да не се чупи JSON форматът
ini_set('display_errors', '0');

header('Content-Type: application/json; charset=utf-8');

// Включваме файла с PDO връзката към базата данни
require_once __DIR__ . '/db.php';


// Валидация на входните данни
$userId = isset($_GET['userid']) ? (int)$_GET['userid'] : 0;

if ($userId <= 0) {
  // При невалиден параметър връщаме HTTP 400 (Bad Request)
  http_response_code(400);
  echo json_encode(['error' => 'Invalid userid']);
  exit;
}

// Подготвяме SQL заявка за извличане на информация за студент
// Използваме prepared statement за защита от SQL Injection
$stmt = $pdo->prepare("
  SELECT id,
         role,
         CONCAT(first_name, ' ', last_name) AS name, 
         faculty_number AS fn,
         department,                      
         email                                   
  FROM users
  WHERE id = ?              
");

// Изпълняваме заявката, като подаваме userid вместо '?'
$stmt->execute([$userId]);

// Вземаме резултата като асоциативен масив
$user = $stmt->fetch();

// Ако няма намерен студент с този id
if (!$user) {
  // Връщаме HTTP 404 (Not Found)
  http_response_code(404);
  echo json_encode(['error' => 'User not found']);
  exit;
}

// Връщаме данните за студента като JSON
echo json_encode($user);
