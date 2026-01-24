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


// Взимаме eventid и studentid от POST заявката
$eventId   = isset($_POST['eventid']) ? (int)$_POST['eventid'] : 0;
$studentId = isset($_POST['studentid']) ? (int)$_POST['studentid'] : 0;

// Проверка за валидни входни данни
if ($eventId <= 0 || $studentId <= 0) {
    http_response_code(400);
    echo json_encode(['error' => 'Невалидни входни данни']);
    exit;
}

// Проверка за достъп:
// Само преподавател има право да променя присъствията
if (
    !isset($_SESSION['role']) ||
    $_SESSION['role'] !== 'teacher'
) {
    http_response_code(403);
    echo json_encode(['error' => 'Нямате право да променяте присъствия']);
    exit;
}

// Промяна на присъствието
$stmt = $pdo->prepare("
    UPDATE attendances
    SET present = NOT present
    WHERE event_id = ? AND student_id = ?
");
$stmt->execute([$eventId, $studentId]);

// След като променим стойността, извличаме новата стойност на present,
// за да я върнем обратно към JavaScript
$stmt = $pdo->prepare("
    SELECT present
    FROM attendances
    WHERE event_id = ? AND student_id = ?
");
$stmt->execute([$eventId, $studentId]);

// Взимаме стойността (0 или 1)
$present = (int)$stmt->fetchColumn();

// Връщаме успешен JSON отговор към клиента
echo json_encode([
    'success' => true,
    'present' => $present
]);
