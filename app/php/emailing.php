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

// Шаблони за имейлите
$subject = [
    'Credentials created for lil moodle',
    'dummy'
];
$message = [
    'Your creadentials for entering lil moodle:'."\r\n".
    'username: the email you recieved this mail'."\r\n".
    'password: your faculty number'."\r\n\r\n".
    'Best regards, lil moodle team.',
    'dummy'
];
$headers = array(
    'From' => 'lilmoodle@example.com',
    'Reply-To' => 'bugybon1@gmail.com',
    'X-Mailer' => 'PHP/' . phpversion()
);

// Получаване на всички ID-та от URL (временно решение)
$userIds = (isset($_GET['ids']) && is_array($_GET['ids'])) ? array_map('intval',$_GET['ids']) : 0;

if($userIds == 0){
  // При невалиден параметър връщаме HTTP 400 (Bad Request)
  http_response_code(400);
  echo json_encode(['error' => 'Invalid userid']);
  exit;
}

$userIdsString = implode(',',$userIds);

$stmt = $pdo->prepare("
  SELECT
    email
  FROM users
  WHERE id IN (".$userIdsString.") 
");
$stmt->execute();

$emails = $stmt->fetchAll();

foreach($emails as $email){
    foreach($email as $to){
        echo $to . "\r\n";
        mail($to, $subject[0], wordwrap($message[0], 70, "\r\n"), $headers);
    }
}