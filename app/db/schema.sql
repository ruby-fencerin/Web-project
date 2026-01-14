-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Jan 14, 2026 at 11:21 PM
-- Server version: 12.1.2-MariaDB-ubu2404
-- PHP Version: 8.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_webapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `present` tinyint(1) NOT NULL DEFAULT 1,
  `added_by` int(10) UNSIGNED NOT NULL,
  `added_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `event_id`, `student_id`, `present`, `added_by`, `added_at`) VALUES
(95, 1, 12, 1, 9, '2026-01-14 22:51:32'),
(96, 1, 13, 1, 9, '2026-01-14 22:51:32'),
(97, 1, 14, 1, 9, '2026-01-14 22:51:32'),
(98, 1, 15, 1, 9, '2026-01-14 22:51:32'),
(99, 1, 16, 1, 9, '2026-01-14 22:51:32'),
(100, 2, 17, 1, 11, '2026-01-14 22:51:32'),
(101, 2, 18, 1, 11, '2026-01-14 22:51:32'),
(102, 2, 19, 1, 11, '2026-01-14 22:51:32'),
(103, 3, 12, 1, 9, '2026-01-14 22:51:32'),
(104, 3, 16, 1, 9, '2026-01-14 22:51:32'),
(105, 3, 20, 1, 9, '2026-01-14 22:51:32'),
(106, 3, 21, 1, 9, '2026-01-14 22:51:32'),
(107, 4, 13, 1, 11, '2026-01-14 22:51:32'),
(108, 4, 14, 1, 11, '2026-01-14 22:51:32'),
(109, 4, 19, 1, 11, '2026-01-14 22:51:32'),
(110, 5, 15, 1, 10, '2026-01-14 22:51:32'),
(111, 5, 16, 1, 10, '2026-01-14 22:51:32'),
(112, 5, 17, 1, 10, '2026-01-14 22:51:32'),
(113, 5, 20, 1, 10, '2026-01-14 22:51:32'),
(114, 5, 21, 1, 10, '2026-01-14 22:51:32'),
(115, 6, 12, 1, 11, '2026-01-14 22:51:32'),
(116, 6, 13, 1, 11, '2026-01-14 22:51:32'),
(117, 7, 16, 1, 10, '2026-01-14 22:51:32'),
(118, 7, 14, 1, 10, '2026-01-14 22:51:32'),
(119, 7, 20, 1, 10, '2026-01-14 22:51:32'),
(120, 7, 18, 1, 10, '2026-01-14 22:51:32'),
(121, 8, 17, 1, 11, '2026-01-14 22:51:32'),
(122, 8, 15, 1, 11, '2026-01-14 22:51:32'),
(123, 8, 21, 1, 11, '2026-01-14 22:51:32'),
(124, 9, 22, 1, 9, '2026-01-14 22:51:32'),
(125, 9, 12, 1, 9, '2026-01-14 22:51:32'),
(126, 9, 13, 1, 9, '2026-01-14 22:51:32'),
(127, 10, 22, 1, 11, '2026-01-14 22:51:32'),
(128, 10, 16, 1, 11, '2026-01-14 22:51:32'),
(129, 11, 15, 1, 10, '2026-01-14 22:51:32'),
(130, 11, 22, 1, 10, '2026-01-14 22:51:32'),
(131, 12, 16, 1, 11, '2026-01-14 22:51:32'),
(132, 12, 22, 1, 11, '2026-01-14 22:51:32'),
(133, 12, 17, 1, 11, '2026-01-14 22:51:32');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `body` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `event_id`, `user_id`, `body`, `created_at`) VALUES
(6, 5, 12, 'Много добра въвеждаща лекция, благодаря!', '2026-01-14 23:12:51'),
(7, 5, 13, 'Беше полезно обяснението за променливите.', '2026-01-14 23:12:51'),
(8, 5, 16, 'Може ли примерите да бъдат качени като файл?', '2026-01-14 23:12:51'),
(9, 6, 17, 'Задачите бяха интересни и полезни.', '2026-01-14 23:12:51'),
(10, 6, 18, 'Имах затруднения с логическите оператори.', '2026-01-14 23:12:51'),
(11, 7, 12, 'Темата за if и switch беше добре обяснена.', '2026-01-14 23:12:51'),
(12, 7, 20, 'Много ясно представяне на примерите.', '2026-01-14 23:12:51'),
(13, 8, 13, 'Задачите помогнаха да затвърдя материала.', '2026-01-14 23:12:51'),
(14, 8, 19, 'Добра практика, но ми трябваше малко повече време.', '2026-01-14 23:12:51'),
(15, 9, 15, 'Циклите бяха обяснени много разбираемо.', '2026-01-14 23:12:51'),
(16, 9, 21, 'Примерите с foreach бяха най-полезни.', '2026-01-14 23:12:51'),
(17, 10, 12, 'Добри практически задачи.', '2026-01-14 23:12:51'),
(18, 10, 13, 'Може ли още примери за while цикъл?', '2026-01-14 23:12:51'),
(19, 11, 16, 'Темата за масивите беше много полезна.', '2026-01-14 23:12:51'),
(20, 11, 14, 'Хареса ми сравнението между асоциативни и индексни масиви.', '2026-01-14 23:12:51'),
(21, 12, 17, 'Задачите с масиви бяха предизвикателни.', '2026-01-14 23:12:51'),
(22, 12, 21, 'foreach ми стана много по-ясен.', '2026-01-14 23:12:51'),
(23, 13, 22, 'Функциите бяха обяснени много добре.', '2026-01-14 23:12:51'),
(24, 13, 12, 'Примерите с параметри и return бяха полезни.', '2026-01-14 23:12:51'),
(25, 14, 22, 'Задачите с функции ми помогнаха да разбера материала.', '2026-01-14 23:12:51'),
(26, 14, 16, 'Комбинацията от функции и масиви беше добра практика.', '2026-01-14 23:12:51'),
(27, 15, 15, 'Работата с файлове беше интересна тема.', '2026-01-14 23:12:51'),
(28, 15, 22, 'Примерите с fopen и fwrite бяха полезни.', '2026-01-14 23:12:51'),
(29, 16, 16, 'Задачите за четене от файл бяха полезни.', '2026-01-14 23:12:51'),
(30, 16, 17, 'Сега ми е по-ясно как се работи с файлове в PHP.', '2026-01-14 23:12:51');

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `start_at` datetime NOT NULL,
  `end_at` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `title`, `description`, `start_at`, `end_at`, `created_by`, `created_at`) VALUES
(1, 'Лекция 02.01', 'Въведение в бази данни', '2026-01-02 10:00:00', NULL, 9, '2026-01-14 23:14:03'),
(2, 'Лекция 03.01', 'Релационен модел', '2026-01-03 10:00:00', NULL, 9, '2026-01-14 23:14:03'),
(3, 'Лекция 04.01', 'SQL – основни заявки', '2026-01-04 10:00:00', NULL, 9, '2026-01-14 23:14:03'),
(4, 'Лекция 04.01 (част 2)', 'Връзки между таблици', '2026-01-04 12:00:00', NULL, 9, '2026-01-14 23:14:03'),
(5, 'Лекция 05.01', 'Основи на PHP', '2026-01-05 15:00:00', NULL, 1, '2026-01-14 22:47:27'),
(6, 'Упражнение 06.01', 'PHP променливи и оператори', '2026-01-06 12:00:00', NULL, 3, '2026-01-14 22:47:27'),
(7, 'Лекция 07.01', 'Условни конструкции', '2026-01-07 10:00:00', NULL, 1, '2026-01-14 22:47:27'),
(8, 'Упражнение 08.01', 'Условни конструкции – задачи', '2026-01-08 18:00:00', NULL, 3, '2026-01-14 22:47:27'),
(9, 'Лекция 09.01', 'Цикли в PHP', '2026-01-09 11:00:00', NULL, 2, '2026-01-14 22:47:27'),
(10, 'Упражнение 11.01', 'Цикли – упражнения', '2026-01-11 15:00:00', NULL, 3, '2026-01-14 22:47:27'),
(11, 'Лекция 13.01', 'Масиви в PHP', '2026-01-13 08:00:00', NULL, 2, '2026-01-14 22:47:27'),
(12, 'Упражнение 14.01', 'Работа с масиви', '2026-01-14 09:00:00', NULL, 3, '2026-01-14 22:47:27'),
(13, 'Лекция 14.01', 'Функции в PHP', '2026-01-14 16:00:00', NULL, 1, '2026-01-14 22:47:27'),
(14, 'Упражнение 15.01', 'Функции – упражнения', '2026-01-15 10:00:00', NULL, 3, '2026-01-14 22:47:27'),
(15, 'Лекция 15.01', 'Файлове в PHP', '2026-01-15 13:00:00', NULL, 2, '2026-01-14 22:47:27'),
(16, 'Упражнение 16.01', 'Файлове – упражнения', '2026-01-16 11:00:00', NULL, 3, '2026-01-14 22:47:27');

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

CREATE TABLE `resources` (
  `id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL,
  `type` enum('pdf','live_link','js','php','html','sql','recording') NOT NULL,
  `title` varchar(200) NOT NULL,
  `url` varchar(2048) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resources`
--

INSERT INTO `resources` (`id`, `event_id`, `type`, `title`, `url`, `created_by`, `created_at`) VALUES
(32, 1, 'pdf', 'Лекция: Въведение в бази данни', 'https://example.com/db_intro.pdf', 9, '2026-01-14 23:19:01'),
(33, 1, 'recording', 'Запис от лекцията – Въведение в БД', 'https://example.com/db_intro_video', 9, '2026-01-14 23:19:01'),
(34, 2, 'pdf', 'Релационен модел – презентация', 'https://example.com/relational_model.pdf', 9, '2026-01-14 23:19:01'),
(35, 2, 'sql', 'Примери с CREATE TABLE', 'https://example.com/relational_examples.sql', 9, '2026-01-14 23:19:01'),
(36, 3, 'pdf', 'SQL – основни заявки', 'https://example.com/sql_basics.pdf', 9, '2026-01-14 23:19:01'),
(37, 3, 'sql', 'SQL примери: SELECT / INSERT', 'https://example.com/sql_examples.sql', 9, '2026-01-14 23:19:01'),
(38, 4, 'pdf', 'Връзки между таблици и външни ключове', 'https://example.com/table_relations.pdf', 9, '2026-01-14 23:19:01'),
(39, 4, 'sql', 'Примери с FOREIGN KEY', 'https://example.com/foreign_keys.sql', 9, '2026-01-14 23:19:01'),
(40, 5, 'pdf', 'Основи на PHP – лекция', 'https://example.com/php_intro.pdf', 9, '2026-01-14 23:19:01'),
(41, 5, 'recording', 'Запис от лекция: Основи на PHP', 'https://example.com/php_intro_video', 9, '2026-01-14 23:19:01'),
(42, 6, 'pdf', 'Задачи: PHP променливи и оператори', 'https://example.com/php_variables_tasks.pdf', 11, '2026-01-14 23:19:01'),
(43, 7, 'pdf', 'Условни конструкции в PHP', 'https://example.com/php_conditions.pdf', 9, '2026-01-14 23:19:01'),
(44, 8, 'pdf', 'Практически задачи: if и switch', 'https://example.com/php_conditions_tasks.pdf', 11, '2026-01-14 23:19:01'),
(45, 9, 'pdf', 'Цикли в PHP', 'https://example.com/php_loops.pdf', 10, '2026-01-14 23:19:01'),
(46, 10, 'pdf', 'Задачи: цикли в PHP', 'https://example.com/php_loops_tasks.pdf', 11, '2026-01-14 23:19:01'),
(47, 11, 'pdf', 'Масиви в PHP', 'https://example.com/php_arrays.pdf', 10, '2026-01-14 23:19:01'),
(48, 12, 'pdf', 'Задачи: масиви в PHP', 'https://example.com/php_arrays_tasks.pdf', 11, '2026-01-14 23:19:01'),
(49, 13, 'pdf', 'Функции в PHP', 'https://example.com/php_functions.pdf', 9, '2026-01-14 23:19:01'),
(50, 14, 'pdf', 'Задачи: функции и масиви', 'https://example.com/php_functions_tasks.pdf', 11, '2026-01-14 23:19:01'),
(51, 15, 'pdf', 'Работа с файлове в PHP', 'https://example.com/php_files.pdf', 10, '2026-01-14 23:19:01'),
(52, 16, 'pdf', 'Задачи: файлове в PHP', 'https://example.com/php_files_tasks.pdf', 11, '2026-01-14 23:19:01');

-- --------------------------------------------------------

--
-- Table structure for table `resource_visibility`
--

CREATE TABLE `resource_visibility` (
  `id` int(10) UNSIGNED NOT NULL,
  `resource_id` int(10) UNSIGNED NOT NULL,
  `student_id` int(10) UNSIGNED NOT NULL,
  `is_visible` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resource_visibility`
--

INSERT INTO `resource_visibility` (`id`, `resource_id`, `student_id`, `is_visible`) VALUES
(4, 41, 12, 1),
(5, 41, 13, 1),
(6, 41, 16, 1),
(7, 41, 22, 1),
(11, 37, 13, 1),
(12, 37, 14, 1),
(13, 37, 20, 1),
(14, 37, 21, 1),
(18, 35, 12, 1),
(19, 35, 16, 1),
(20, 35, 17, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role` enum('student','teacher') NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `faculty_number` varchar(20) DEFAULT NULL,
  `email` varchar(190) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `department` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `first_name`, `last_name`, `faculty_number`, `email`, `password_hash`, `created_at`, `department`) VALUES
(1, 'teacher', 'Иван', 'Петров', NULL, 'teacher@example.com', '$2y$10$HASH_TEACHER', '2026-01-14 19:40:56', 'Алгебра'),
(2, 'student', 'Мария', 'Иванова', '999999', 'maria@example.com', '$2y$10$HASH_STUDENT', '2026-01-14 19:40:56', NULL),
(3, 'student', 'Георги', 'Димитров', '465826', 'georgi@example.com', '$2y$10$HASH_STUDENT', '2026-01-14 19:40:56', NULL),
(4, 'student', 'Петър', 'Николов', '456321', 'petar@example.com', '$2y$10$HASH_STUDENT', '2026-01-14 19:40:56', NULL),
(5, 'student', 'Елена', 'Стоянова', '654416', 'elena@example.com', '$2y$10$HASH_STUDENT', '2026-01-14 19:40:56', NULL),
(6, 'student', 'Даниел', 'Колев', '625984', 'daniel@example.com', '$2y$10$HASH_STUDENT', '2026-01-14 19:40:56', NULL),
(7, 'student', 'Никол', 'Христова', '633634', 'nikol@example.com', '$2y$10$HASH_STUDENT', '2026-01-14 19:40:56', NULL),
(8, 'student', 'Мартин', 'Георгиев', '444212', 'martin@example.com', '$2y$10$HASH_STUDENT', '2026-01-14 19:40:56', NULL),
(9, 'teacher', 'Иван', 'Иванов', NULL, 'ivan.ivanov@uni.bg', 'HASH', '2026-01-14 22:43:01', 'Информатика'),
(10, 'teacher', 'Мария', 'Петрова', NULL, 'maria.petrova@uni.bg', 'HASH', '2026-01-14 22:43:01', 'Софтуерни технологии'),
(11, 'teacher', 'Георги', 'Георгиев', NULL, 'georgi.georgiev@uni.bg', 'HASH', '2026-01-14 22:43:01', 'Компютърни науки'),
(12, 'student', 'Ана', 'Петрова', '1MI0800181', 'ana.petrova@gmail.com', 'HASH', '2026-01-14 22:44:29', NULL),
(13, 'student', 'Борис', 'Велинов', '1MI0800182', 'boris.velinov@gmail.com', 'HASH', '2026-01-14 22:44:29', NULL),
(14, 'student', 'Весела', 'Иванова', '1MI0800183', 'vesela.ivanova@gmail.com', 'HASH', '2026-01-14 22:44:29', NULL),
(15, 'student', 'Иван', 'Георгиев', '1MI0800184', 'ivan.georgiev@gmail.com', 'HASH', '2026-01-14 22:44:29', NULL),
(16, 'student', 'Мария', 'Николова', '1MI0800185', 'maria.nikolova@gmail.com', 'HASH', '2026-01-14 22:44:29', NULL),
(17, 'student', 'Георги', 'Димитров', '1MI0800186', 'georgi.dimitrov@gmail.com', 'HASH', '2026-01-14 22:44:29', NULL),
(18, 'student', 'Николай', 'Петров', '1MI0800187', 'nikolay.petrov@gmail.com', 'HASH', '2026-01-14 22:44:29', NULL),
(19, 'student', 'Силвия', 'Маринова', '1MI0800188', 'silvia.marinova@gmail.com', 'HASH', '2026-01-14 22:44:29', NULL),
(20, 'student', 'Петър', 'Стоянов', '1MI0800191', 'petar.stoyanov@gmail.com', 'HASH', '2026-01-14 22:44:29', NULL),
(21, 'student', 'Радослав', 'Колев', '1MI0800190', 'radoslav.kolev@gmail.com', 'HASH', '2026-01-14 22:44:29', NULL),
(22, 'student', 'Стефанка', 'Манахова', '1MI0800189', 'fani.manahova@gmail.com', 'HASH', '2026-01-14 22:44:29', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_attendance_event_student` (`event_id`,`student_id`),
  ADD KEY `idx_attendance_student` (`student_id`),
  ADD KEY `idx_attendance_event` (`event_id`),
  ADD KEY `fk_att_added_by` (`added_by`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_comments_event` (`event_id`),
  ADD KEY `idx_comments_user` (`user_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_events_start_at` (`start_at`),
  ADD KEY `idx_events_created_by` (`created_by`);

--
-- Indexes for table `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_resources_event` (`event_id`),
  ADD KEY `fk_resources_created_by` (`created_by`);

--
-- Indexes for table `resource_visibility`
--
ALTER TABLE `resource_visibility`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_visibility_resource_student` (`resource_id`,`student_id`),
  ADD KEY `idx_visibility_student` (`student_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_users_email` (`email`),
  ADD UNIQUE KEY `uq_users_faculty_number` (`faculty_number`),
  ADD KEY `idx_users_role` (`role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `resources`
--
ALTER TABLE `resources`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `resource_visibility`
--
ALTER TABLE `resource_visibility`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `fk_att_added_by` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_att_event` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_att_student` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `fk_comments_event` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_comments_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `fk_events_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `resources`
--
ALTER TABLE `resources`
  ADD CONSTRAINT `fk_resources_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_resources_event` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `resource_visibility`
--
ALTER TABLE `resource_visibility`
  ADD CONSTRAINT `fk_vis_resource` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_vis_student` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
