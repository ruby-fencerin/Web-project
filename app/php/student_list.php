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

// Само преподавател има достъп
if (!isset($_SESSION['user_id'], $_SESSION['role']) || $_SESSION['role'] !== 'teacher') {
  http_response_code(403);
  echo json_encode(['error' => 'Forbidden']);
  exit;
}

// Взимаме всички студенти
$stmt = $pdo->prepare("
  SELECT
    id,
    CONCAT(first_name, ' ', last_name) AS name,
    faculty_number AS fn
  FROM users
  WHERE role = 'student'
  ORDER BY last_name, first_name
");
$stmt->execute();

$students = $stmt->fetchAll();

echo json_encode(['students' => $students]);
