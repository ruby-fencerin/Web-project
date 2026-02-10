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

// Проверка дали потребителят е логнат
if (!isset($_SESSION['user_id'], $_SESSION['role'])) {
  http_response_code(401);
  echo json_encode(['error' => 'Потребителят не е вписан'], JSON_UNESCAPED_UNICODE);
  exit;
}
if ((string)$_SESSION['role'] !== 'teacher') {
  http_response_code(403);
  echo json_encode(['error' => 'Нямате права за създаване на събитие'], JSON_UNESCAPED_UNICODE);
  exit;
}
$userId = (int)$_SESSION['user_id'];
$role   = (string)$_SESSION['role'];

// Взимаме данните от POST заявката
$users    = trim($_POST['users'] ?? '');

// Валидация
if ($users === '') {
  http_response_code(400);
  echo json_encode(['error' => 'Невалидни входни данни']);
  exit;
}



$userRowsArray = preg_split("/\r\n|\n|\r/", $users);
$userFNsString = "";
$usersFormated = array();

foreach ($userRowsArray as $row) {
    $row = trim($row);
    if ($row === '') continue;

    $temp = array_map('trim', explode(",", $row));

    if (count($temp) < 8) {
        http_response_code(400);
        echo json_encode(['error' => 'Невалиден формат: first,last,email,fn,major,group,start_year,study_year']);
        exit;
    }

    $usersFormated[] = array(
        "first_name"   => $temp[0],
        "last_name"    => $temp[1],
        "email"        => $temp[2],
        "fn"           => $temp[3],
        "major"        => $temp[4],
        "group"        => $temp[5],
        "start_year"   => (int)$temp[6],
        "study_year"   => (int)$temp[7],
    );

    $userFNsString = $userFNsString . "\",\"" . end($usersFormated)["fn"];
}
#$userFNsString = "\"" . $userFNsString . "\"";
#$userFNsString=substr($userFNsString,1);
#echo $userFNsString;

$fns = array_values(array_unique(array_map(fn($u) => $u['fn'], $usersFormated)));
$placeholders = implode(',', array_fill(0, count($fns), '?'));

$stmt = $pdo->prepare("
  SELECT faculty_number
  FROM users
  WHERE faculty_number IN ($placeholders)
");
$stmt->execute($fns);
$queryUserFNs = $stmt->fetchAll(PDO::FETCH_COLUMN);

if ($queryUserFNs) {
  http_response_code(409);
  echo json_encode(['error' => "Съответните факултетни номера са вече вписани:\n" . implode(', ', $queryUserFNs)], JSON_UNESCAPED_UNICODE);
  exit;
}


// Записваме user-a в базата
$stmtUser = $pdo->prepare("
  INSERT INTO users(`role`, `first_name`, `last_name`, `faculty_number`, `email`, `password_hash`, `created_at`, `department`) 
  VALUES ('student', ?, ?, ?, ?, ?, NOW(), NULL)
");

$stmtAcad = $pdo->prepare("
  INSERT INTO student_academic_info(`student_id`, `major`, `student_group`, `study_year`, `start_year`)
  VALUES (?, ?, ?, ?, ?)
");

foreach ($usersFormated as $user) {
    $stmtUser->execute([
        $user['first_name'],
        $user['last_name'],
        $user['fn'],
        $user['email'],
        password_hash($user['fn'], PASSWORD_DEFAULT)
    ]);

    $studentId = (int)$pdo->lastInsertId();

    $stmtAcad->execute([
        $studentId,
        $user['major'],
        $user['group'],
        (int)$user['study_year'],
        (int)$user['start_year']
    ]);
}



// Успешен отговор
echo json_encode(['success' => true]);
