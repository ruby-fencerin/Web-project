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

// Взимаме e-mail и парола от входните данни
$email = trim((string)($input['email'] ?? ''));
$pass  = (string)($input['password'] ?? '');

// Проверка дали и двете полета са попълнени
if ($email === '' || $pass === '') {
  http_response_code(400);
  echo json_encode(['error' => 'Моля, попълнете e-mail и парола.']);
  exit;
}

// Подготвяме SQL заявка за намиране на потребител по e-mail
$stmt = $pdo->prepare("
    SELECT id, role, password_hash 
    FROM users 
    WHERE email = ? 
    LIMIT 1
");


$stmt->execute([$email]);
$user = $stmt->fetch();


// Ако няма потребител с този e-mail
if (!$user) {
  http_response_code(401);
  echo json_encode(['error' => 'Невалиден e-mail или парола.']);
  exit;
}

// Проверяваме дали въведената парола съвпада с хеша в базата
if (!password_verify($pass, $user['password_hash'])) {
  http_response_code(401);
  echo json_encode(['error' => 'Невалиден e-mail или парола.']);
  exit;
}


// Генерираме нов session ID
session_regenerate_id(true);
$_SESSION['user_id'] = (int)$user['id'];
$_SESSION['role'] = $user['role'];

// Връщаме успешен JSON отговор към клиента
echo json_encode(['success' => true]);
exit;
