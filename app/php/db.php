<?php
declare(strict_types=1);

// Настройки за свързване с базата данни
// Първо се опитваме да ги вземем от environment променлива от докера иначе използваме по подразбиране

$host = getenv('DB_HOST') ?: 'db';
$db   = getenv('DB_NAME') ?: 'my_webapp';
$user = getenv('DB_USER') ?: 'user';
$pass = getenv('DB_PASS') ?: 'user_password';

// създаване на PDO връзка

// DSN (Data Source Name) описва типа на базата,
// адреса, името на базата и използваното кодиране
$dsn = "mysql:host={$host};dbname={$db};charset=utf8mb4";
$options = [
  PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
  PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
];

// Създаваме нова PDO инстанция – връзката с MySQL базата данни
$pdo = new PDO($dsn, $user, $pass, $options);
