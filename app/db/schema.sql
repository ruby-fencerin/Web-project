-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Jan 14, 2026 at 09:49 PM
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
-- Database: `course_events_db`
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
(1, 1, 2, 1, 1, '2026-01-14 19:40:56'),
(2, 1, 3, 1, 1, '2026-01-14 19:40:56'),
(3, 1, 4, 1, 1, '2026-01-14 19:40:56'),
(4, 1, 5, 1, 1, '2026-01-14 19:40:56'),
(5, 2, 2, 1, 1, '2026-01-14 19:40:56'),
(6, 2, 3, 1, 1, '2026-01-14 19:40:56'),
(7, 2, 6, 1, 1, '2026-01-14 19:40:56'),
(8, 2, 7, 1, 1, '2026-01-14 19:40:56'),
(9, 3, 2, 1, 1, '2026-01-14 19:40:56'),
(10, 3, 4, 1, 1, '2026-01-14 19:40:56'),
(11, 3, 5, 1, 1, '2026-01-14 19:40:56'),
(12, 3, 8, 1, 1, '2026-01-14 19:40:56'),
(13, 4, 3, 1, 1, '2026-01-14 19:40:56'),
(14, 4, 6, 1, 1, '2026-01-14 19:40:56'),
(15, 4, 7, 1, 1, '2026-01-14 19:40:56'),
(16, 4, 8, 1, 1, '2026-01-14 19:40:56');

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
(1, 1, 2, 'Very clear introduction, thank you!', '2026-01-14 19:40:56'),
(2, 1, 3, 'Will the slides be uploaded later?', '2026-01-14 19:40:56'),
(3, 2, 6, 'The HTML examples were helpful.', '2026-01-14 19:40:56'),
(4, 3, 4, 'Can you share more PDO examples?', '2026-01-14 19:40:56'),
(5, 4, 7, 'Security topics were very interesting.', '2026-01-14 19:40:56');

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
(1, 'Lecture 1: Introduction', 'Course overview and requirements', '2026-01-05 10:00:00', '2026-01-05 11:30:00', 1, '2026-01-14 19:40:56'),
(2, 'Lecture 2: Web Basics', 'HTML, CSS and basic JavaScript', '2026-01-07 10:00:00', '2026-01-07 11:30:00', 1, '2026-01-14 19:40:56'),
(3, 'Lecture 3: PHP & MySQL', 'Backend fundamentals', '2026-01-12 10:00:00', '2026-01-12 11:30:00', 1, '2026-01-14 19:40:56'),
(4, 'Lecture 4: Security', 'Authentication and access control', '2026-01-14 10:00:00', '2026-01-14 11:30:00', 1, '2026-01-14 19:40:56');

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

CREATE TABLE `resources` (
  `id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL,
  `type` enum('pdf','live_link','recording') NOT NULL,
  `title` varchar(200) NOT NULL,
  `url` varchar(2048) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `resources`
--

INSERT INTO `resources` (`id`, `event_id`, `type`, `title`, `url`, `created_by`, `created_at`) VALUES
(1, 1, 'pdf', 'Lecture 1 Slides', 'https://example.com/lec1-slides.pdf', 1, '2026-01-14 19:40:56'),
(2, 1, 'recording', 'Lecture 1 Recording', 'https://example.com/lec1-video', 1, '2026-01-14 19:40:56'),
(3, 2, 'pdf', 'HTML & CSS Slides', 'https://example.com/lec2-slides.pdf', 1, '2026-01-14 19:40:56'),
(4, 2, 'live_link', 'Live Session Link', 'https://meet.example.com/lec2', 1, '2026-01-14 19:40:56'),
(5, 3, 'pdf', 'PHP & MySQL Slides', 'https://example.com/lec3-slides.pdf', 1, '2026-01-14 19:40:56'),
(6, 4, 'pdf', 'Security Slides', 'https://example.com/lec4-slides.pdf', 1, '2026-01-14 19:40:56'),
(7, 4, 'recording', 'Security Lecture Recording', 'https://example.com/lec4-video', 1, '2026-01-14 19:40:56');

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
(1, 5, 2, 1),
(2, 5, 4, 1),
(3, 5, 5, 1);

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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `first_name`, `last_name`, `faculty_number`, `email`, `password_hash`, `created_at`) VALUES
(1, 'teacher', 'Ivan', 'Petrov', NULL, 'teacher@example.com', '$2y$10$HASH_TEACHER', '2026-01-14 19:40:56'),
(2, 'student', 'Maria', 'Ivanova', '999999', 'maria@example.com', '$2y$10$HASH_STUDENT', '2026-01-14 19:40:56'),
(3, 'student', 'Georgi', 'Dimitrov', '465826', 'georgi@example.com', '$2y$10$HASH_STUDENT', '2026-01-14 19:40:56'),
(4, 'student', 'Petar', 'Nikolov', '456321', 'petar@example.com', '$2y$10$HASH_STUDENT', '2026-01-14 19:40:56'),
(5, 'student', 'Elena', 'Stoyanova', '654416', 'elena@example.com', '$2y$10$HASH_STUDENT', '2026-01-14 19:40:56'),
(6, 'student', 'Daniel', 'Kolev', '625984', 'daniel@example.com', '$2y$10$HASH_STUDENT', '2026-01-14 19:40:56'),
(7, 'student', 'Nikol', 'Hristova', '633634', 'nikol@example.com', '$2y$10$HASH_STUDENT', '2026-01-14 19:40:56'),
(8, 'student', 'Martin', 'Georgiev', '444212', 'martin@example.com', '$2y$10$HASH_STUDENT', '2026-01-14 19:40:56');

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `resources`
--
ALTER TABLE `resources`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `resource_visibility`
--
ALTER TABLE `resource_visibility`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
