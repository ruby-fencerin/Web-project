<?php
declare(strict_types=1);

// Настройки за свързване с базата данни
// Първо се опитваме да ги вземем от environment променлива от докера иначе използваме по подразбиране

$host = getenv('DB_HOST') ?: 'localhost'; // PHP
//$host = getenv('DB_HOST') ?: 'db'; // Docker
$port = getenv('DB_PORT') ?: '3306';
$db   = getenv('DB_NAME') ?: 'my_webapp';
$user = getenv('DB_USER') ?: 'root';
$pass = getenv('DB_PASS') ?: ''; // PHP
//$pass = getenv('DB_PASS') ?: 'root_password'; // Docker

// създаване на PDO връзка

// DSN (Data Source Name) описва типа на базата,
// адреса, името на базата и използваното кодиране
$dsn = "mysql:host={$host};port={$port};dbname={$db};charset=utf8mb4";
$options = [
  PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
  PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
];

// Създаваме нова PDO инстанция – връзката с MySQL базата данни
$pdo = new PDO($dsn, $user, $pass, $options);
