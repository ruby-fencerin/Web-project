-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Jan 19, 2026 at 04:46 PM
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
(1, 'teacher', 'Иван', 'Петров', NULL, 'teacher@example.com', '$2y$12$v/q8HFVbncdq2YRlFkjpsu0X9J0EM.sJ9XEAFdl.pSjRM6pUeHiSi', '2026-01-14 19:40:56', 'Алгебра'),
(2, 'student', 'Мария', 'Иванова', '999999', 'maria@example.com', '$2y$12$T60LxR18MUpD7oXO1ALZk.HGLwzBEC.ljdX34YeoV3vRWxHSxRsyu', '2026-01-14 19:40:56', NULL),
(3, 'student', 'Георги', 'Димитров', '465826', 'georgi@example.com', '$2y$12$PE0EqH1tGsy4gKESsWCUaeU4buwecCcEvAdC1S8m3u3REUgf4pQUq', '2026-01-14 19:40:56', NULL),
(4, 'student', 'Петър', 'Николов', '456321', 'petar@example.com', '$2y$12$p7r/6TQyZdKl.AB5g8DSzuvB.pr6UceUxphIRwI9hsCNdgTYjuVxq', '2026-01-14 19:40:56', NULL),
(5, 'student', 'Елена', 'Стоянова', '654416', 'elena@example.com', '$2y$12$eqDc9dwe2jMWuYpEbcF3F.Z7P34TalcpRHdj92R5FRgybE5FSS.T.', '2026-01-14 19:40:56', NULL),
(6, 'student', 'Даниел', 'Колев', '625984', 'daniel@example.com', '$2y$12$0QHh6zzE6ZaDTCZuKxt/Pej7JQhCaTL5b1tJaCUmff.6tQ6auIarK', '2026-01-14 19:40:56', NULL),
(7, 'student', 'Никол', 'Христова', '633634', 'nikol@example.com', '$2y$12$MzpvLlaQzSqbyX3Um5wZx.8SYO3W1ISTIsB35x7WO21Sd48X4F5sG', '2026-01-14 19:40:56', NULL),
(8, 'student', 'Мартин', 'Георгиев', '444212', 'martin@example.com', '$2y$12$L1HSp/o39/t.8YcO0e9GNuDRRsznsvCRXDCcIbryP91hnggXG1WHa', '2026-01-14 19:40:56', NULL),
(9, 'teacher', 'Иван', 'Иванов', NULL, 'ivan.ivanov@uni.bg', '$2y$12$v/q8HFVbncdq2YRlFkjpsu0X9J0EM.sJ9XEAFdl.pSjRM6pUeHiSi', '2026-01-14 22:43:01', 'Информатика'),
(10, 'teacher', 'Мария', 'Петрова', NULL, 'maria.petrova@uni.bg', '$2y$12$v/q8HFVbncdq2YRlFkjpsu0X9J0EM.sJ9XEAFdl.pSjRM6pUeHiSi', '2026-01-14 22:43:01', 'Софтуерни технологии'),
(11, 'teacher', 'Георги', 'Георгиев', NULL, 'georgi.georgiev@uni.bg', '$2y$12$v/q8HFVbncdq2YRlFkjpsu0X9J0EM.sJ9XEAFdl.pSjRM6pUeHiSi', '2026-01-14 22:43:01', 'Компютърни науки'),
(12, 'student', 'Ана', 'Петрова', '1MI0800181', 'ana.petrova@gmail.com', '$2y$12$XbPLyusUrDy7nIg8JmbbaeOCgbXmPhSf7nb5gkx0bFSkS.5/mDoS2', '2026-01-14 22:44:29', NULL),
(13, 'student', 'Борис', 'Велинов', '1MI0800182', 'boris.velinov@gmail.com', '$2y$12$cfuq4Tb0PbZiyrg0QPYJ7u9PBi.hKlKBtovIpQC6mucf.4IlagQte', '2026-01-14 22:44:29', NULL),
(14, 'student', 'Весела', 'Иванова', '1MI0800183', 'vesela.ivanova@gmail.com', '$2y$12$M2dPxgo2C.bK/HTgynjNyO23NVvUAxPWCxZnG0/0fPIK5iOw9bEnu', '2026-01-14 22:44:29', NULL),
(15, 'student', 'Иван', 'Георгиев', '1MI0800184', 'ivan.georgiev@gmail.com', '$2y$12$8d1rjakItTO6NuaBYQmRkO37wp.TMDFE5I.vxcYoBK3oXNFHPNmIG', '2026-01-14 22:44:29', NULL),
(16, 'student', 'Мария', 'Николова', '1MI0800185', 'maria.nikolova@gmail.com', '$2y$12$e.bPFPze5WekK0qRb9ypi.q7phyXZb.7iHx2qdsSzvC8ePouPbJyG', '2026-01-14 22:44:29', NULL),
(17, 'student', 'Георги', 'Димитров', '1MI0800186', 'georgi.dimitrov@gmail.com', '$2y$12$RdxDb394pfwDJzH43rtXj.DLFRWfeIJC.hz1EyIsCTyFG5B4qhzYy', '2026-01-14 22:44:29', NULL),
(18, 'student', 'Николай', 'Петров', '1MI0800187', 'nikolay.petrov@gmail.com', '$2y$12$IZVk.kFqFOGNSErWSYdxLeAobB.p34B5rsmB1SjPYcNkM3ZbgnaLO', '2026-01-14 22:44:29', NULL),
(19, 'student', 'Силвия', 'Маринова', '1MI0800188', 'silvia.marinova@gmail.com', '$2y$12$QjSeiPXEyQ1XEpk6HpTNgOJCQXiIJLFwwDejXSQ4fxUD2ZyvXyNVS', '2026-01-14 22:44:29', NULL),
(20, 'student', 'Петър', 'Стоянов', '1MI0800191', 'petar.stoyanov@gmail.com', '$2y$12$nBQYjmjWARypQXRh2ebIDeMXNYZP7Hle8iDiObcTzm5vOhMKZRiJe', '2026-01-14 22:44:29', NULL),
(21, 'student', 'Радослав', 'Колев', '1MI0800190', 'radoslav.kolev@gmail.com', '$2y$12$WsfZYvxkPcQsGcHgeWyMw.vbGUVLExs7VNhj6qgZVoFdmG6lRSYaK', '2026-01-14 22:44:29', NULL),
(22, 'student', 'Стефанка', 'Манахова', '1MI0800189', 'fani.manahova@gmail.com', '$2y$12$SDVf7.03WWTvz3JhMJJqr.S8SFp1Tnc5ms9AomjZIp/iGNaJ2zG9K', '2026-01-14 22:44:29', NULL);

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
