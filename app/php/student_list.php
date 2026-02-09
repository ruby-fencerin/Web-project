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

// Взимаме всички студенти + статистика за присъствие (present=1 / всички записи)
$stmt = $pdo->prepare("
  SELECT
    u.id,
    CONCAT(u.first_name, ' ', u.last_name) AS name,
    u.faculty_number AS fn,
    s.major,
    s.student_group,
    s.study_year,
    s.start_year,

    COUNT(a.event_id) AS total_att, -- всички attendance записи за студента
    SUM(CASE WHEN a.present = 1 THEN 1 ELSE 0 END) AS present_att -- само present=1
  FROM users u
  LEFT JOIN student_academic_info s ON s.student_id = u.id
  LEFT JOIN attendances a ON a.student_id = u.id
  WHERE u.role = 'student'
  GROUP BY u.id, u.first_name, u.last_name, u.faculty_number, s.major, s.student_group, s.study_year, s.start_year
  ORDER BY u.last_name, u.first_name
");
$stmt->execute();

$students = $stmt->fetchAll();

echo json_encode(['students' => $students]);
