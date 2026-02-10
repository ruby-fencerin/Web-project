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

try {
  // Ако студентите са в users и имат role='student'
  $stmt = $pdo->query("
    SELECT DISTINCT major
    FROM student_academic_info
    WHERE major IS NOT NULL
    ORDER BY major
  ");
  $majors = $stmt->fetchAll(PDO::FETCH_COLUMN);

  echo json_encode(['majors' => $majors], JSON_UNESCAPED_UNICODE);
} catch (Throwable $e) {
  http_response_code(500);
  echo json_encode(['error' => 'Грешка при зареждане на специалности']);
}
