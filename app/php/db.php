<?php
declare(strict_types=1);

$host = getenv('DB_HOST') ?: 'db';
$db   = getenv('DB_NAME') ?: 'my_webapp';
$user = getenv('DB_USER') ?: 'user';
$pass = getenv('DB_PASS') ?: 'user_password';

$dsn = "mysql:host={$host};dbname={$db};charset=utf8mb4";
$options = [
  PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
  PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
];

$pdo = new PDO($dsn, $user, $pass, $options);
