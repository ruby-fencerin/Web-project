<?php
declare(strict_types=1);
// Стартираме PHP сесията,
// за да можем да записваме информация за логнатия потребител
session_start();

// Изключваме показването на грешки в отговора,
// за да не се наруши JSON форматът
ini_set('display_errors', '0');

// Указваме, че този файл връща JSON отговор
header('Content-Type: application/json; charset=utf-8');

// Включваме файла за връзка с базата данни (PDO)
require_once __DIR__ . '/db.php';

// Проверка за логнат потребител
if (!isset($_SESSION['user_id'])) {
  http_response_code(401);
  echo json_encode(['error' => 'Моля впишете се преди да продължите']);
  exit;
}

$userId = (int)$_SESSION['user_id'];

// Четем тялоto на HTTP заявката (JSON)
$raw = file_get_contents("php://input");

// Преобразуваме JSON текста в PHP асоциативен масив
$input = json_decode($raw, true);

// Проверка дали заявката съдържа валиден JSON
if (!is_array($input)) {
  http_response_code(400);
  echo json_encode(['error' => 'Невалиден формат на заявката.']);
  exit;
}
// Взимаме стара и нова парола от входните данни
$pass = (string)($input['password'] ?? '');
$newPass = (string)($input['new_password'] ?? '');

// Проверка дали и двете полета са попълнени
if ($pass === '' || $newPass === '') {
  http_response_code(400);
  echo json_encode(['error' => 'Моля, попълнете старата парола и новата парола.']);
  exit;
}

// Вземаме текущия password_hash от базата за логнатия потребител
$stmt = $pdo->prepare("
  SELECT password_hash
  FROM users
  WHERE id = ?
  LIMIT 1
");
$stmt->execute([$userId]);
$user = $stmt->fetch();

// Ако по някаква причина потребителят липсва
if (!$user) {
  http_response_code(404);
  echo json_encode(['error' => 'Потребителят не е намерен.']);
  exit;
}

// Проверяваме дали старата парола е вярна
if (!password_verify($pass, $user['password_hash'])) {
  http_response_code(401);
  echo json_encode(['error' => 'Старата парола е грешна.']);
  exit;
}

// Хешираме новата парола и я записваме в базата
$newHash = password_hash($newPass, PASSWORD_DEFAULT);

$upd = $pdo->prepare("
  UPDATE users
  SET password_hash = ?
  WHERE id = ?
");
$upd->execute([$newHash, $userId]);

// Сменяме session ID след чувствителна операция
session_regenerate_id(true);

// Успешен отговор
echo json_encode(['success' => true]);
exit;