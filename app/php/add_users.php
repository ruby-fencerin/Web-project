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


// Взимаме данните от POST заявката
$users    = trim($_POST['users'] ?? '');
// Валидация
if ($users === '') {
  http_response_code(400);
  echo json_encode(['error' => 'Невалидни входни данни']);
  exit;
}

// Проверка дали потребителят е логнат
if (!isset($_SESSION['user_id'], $_SESSION['role'])) {
  http_response_code(401);
  echo json_encode(['error' => 'Потребителят не е вписан']);
  exit;
}

$userId = (int)$_SESSION['user_id'];
$role   = (string)$_SESSION['role'];

if($role !== 'teacher'){
  http_response_code(403);
  echo json_encode(['error' => 'Нямате права за създаване на събитие']);
  exit;
}

$userRowsArray = explode("\r\n", $users);
$userFNsString = "";
$usersFormated = array();
foreach($userRowsArray as $row){
    $temp = explode(",", $row);
    $usersFormated[] = array("first_name" => $temp[0], "last_name" => $temp[1], "email" => $temp[2], "fn" => $temp[3]);
    $userFNsString = $userFNsString . "\",\"" . end($usersFormated)["fn"];
}
$userFNsString = "\"" . $userFNsString . "\"";
#$userFNsString=substr($userFNsString,1);
#echo $userFNsString;

$stmt = $pdo->prepare("
    SELECT
        faculty_number 
    FROM users
    WHERE faculty_number IN (". $userFNsString.")
");
$stmt->execute();
$queryUserFNs = $stmt->fetchAll();

$problematicFNs = "";
foreach($queryUserFNs as $fn){
  $problematicFNs = $problematicFNs . ", " . $fn['faculty_number'];
}
#echo $problematicFNs;
if($problematicFNs != ""){
    http_response_code(409);
    echo json_encode(['error' => "Съответните факултетни номера са вече вписани:\n" . substr($problematicFNs,2)]);
    exit;
}

// Записваме коментара в базата
$stmt = $pdo->prepare("
INSERT INTO users(`role`, `first_name`, `last_name`, `faculty_number`, `email`, `password_hash`, `created_at`, `department`) 
VALUES ('student', ?, ?, ?, ?, ?, NOW(), NULL)
");
foreach($usersFormated as $user){
    $stmt->execute([$user['first_name'], $user['last_name'], $user['fn'],$user['email'],password_hash($user['fn'],PASSWORD_DEFAULT)]);
}


// Успешен отговор
echo json_encode(['success' => true]);
