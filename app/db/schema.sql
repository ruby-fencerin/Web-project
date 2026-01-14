-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Jan 14, 2026 at 10:52 PM
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
(1, 'teacher', 'Ivan', 'Petrov', NULL, 'teacher@example.com', '$2y$10$HASH_TEACHER', '2026-01-14 19:40:56', 'Алгебра'),
(2, 'student', 'Maria', 'Ivanova', '999999', 'maria@example.com', '$2y$10$HASH_STUDENT', '2026-01-14 19:40:56', NULL),
(3, 'student', 'Georgi', 'Dimitrov', '465826', 'georgi@example.com', '$2y$10$HASH_STUDENT', '2026-01-14 19:40:56', NULL),
(4, 'student', 'Petar', 'Nikolov', '456321', 'petar@example.com', '$2y$10$HASH_STUDENT', '2026-01-14 19:40:56', NULL),
(5, 'student', 'Elena', 'Stoyanova', '654416', 'elena@example.com', '$2y$10$HASH_STUDENT', '2026-01-14 19:40:56', NULL),
(6, 'student', 'Daniel', 'Kolev', '625984', 'daniel@example.com', '$2y$10$HASH_STUDENT', '2026-01-14 19:40:56', NULL),
(7, 'student', 'Nikol', 'Hristova', '633634', 'nikol@example.com', '$2y$10$HASH_STUDENT', '2026-01-14 19:40:56', NULL),
(8, 'student', 'Martin', 'Georgiev', '444212', 'martin@example.com', '$2y$10$HASH_STUDENT', '2026-01-14 19:40:56', NULL),
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
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
