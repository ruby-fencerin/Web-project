<?php
declare(strict_types=1);

// Стартираме сесията
session_start();

// Забраняваме HTML грешки, за да не чупят JSON-а
ini_set('display_errors', '0');
header('Content-Type: application/json; charset=utf-8');

// Проверка дали потребителят е логнат
if (!isset($_SESSION['user_id'], $_SESSION['role'])) {
  http_response_code(401);
  echo json_encode(['error' => 'Потребителят не е логнат']);
  exit;
}

// Взимаме ролята от сесията
$role = $_SESSION['role'];

// По подразбиране режимът е "за мен"
$mode = 'me';

// Проверяваме дали в URL има studentid
$studentId = isset($_GET['studentid']) ? (int)$_GET['studentid'] : 0;

// Ако потребителят е преподавател и има подаден studentid,
// преминаваме в режим "преглед на студент"
if ($role === 'teacher' && $studentId > 0) {
  $mode = 'student';
}

// Връщаме информацията към JavaScript
echo json_encode([
  'role' => $role,          // роля на текущия потребител
  'mode' => $mode,          // "me" или "student"
  'studentid' => $studentId // id на студента (ако има)
]);
