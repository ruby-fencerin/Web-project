-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Feb 11, 2026 at 10:14 AM
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
(105, 3, 20, 0, 9, '2026-01-14 22:51:32'),
(106, 3, 21, 1, 9, '2026-01-14 22:51:32'),
(107, 4, 13, 0, 9, '2026-01-14 22:51:32'),
(108, 4, 14, 0, 9, '2026-01-14 22:51:32'),
(109, 4, 19, 1, 9, '2026-01-14 22:51:32'),
(110, 5, 15, 1, 10, '2026-01-14 22:51:32'),
(111, 5, 16, 1, 10, '2026-01-14 22:51:32'),
(112, 5, 17, 1, 10, '2026-01-14 22:51:32'),
(113, 5, 20, 1, 10, '2026-01-14 22:51:32'),
(114, 5, 21, 1, 10, '2026-01-14 22:51:32'),
(115, 6, 12, 1, 11, '2026-01-14 22:51:32'),
(116, 6, 13, 1, 11, '2026-01-14 22:51:32'),
(117, 7, 16, 1, 10, '2026-01-14 22:51:32'),
(118, 7, 14, 0, 10, '2026-01-14 22:51:32'),
(119, 7, 20, 0, 10, '2026-01-14 22:51:32'),
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
(133, 12, 17, 1, 11, '2026-01-14 22:51:32'),
(134, 17, 22, 1, 9, '2026-01-23 12:31:00'),
(135, 7, 22, 1, 1, '2026-01-27 22:25:36'),
(137, 7, 2, 1, 1, '2026-01-27 22:26:18'),
(138, 17, 5, 1, 9, '2026-02-10 11:18:28'),
(139, 17, 2, 1, 9, '2026-02-10 11:18:29'),
(200, 18, 16, 1, 9, '2026-02-01 11:35:00'),
(201, 18, 12, 1, 9, '2026-02-01 11:35:00'),
(202, 18, 13, 1, 9, '2026-02-01 11:35:00'),
(203, 18, 14, 0, 9, '2026-02-01 11:35:00'),
(204, 19, 16, 0, 9, '2026-02-02 13:35:00'),
(205, 19, 12, 1, 9, '2026-02-02 13:35:00'),
(206, 19, 14, 0, 9, '2026-02-02 13:35:00'),
(207, 20, 16, 1, 9, '2026-02-04 11:35:00'),
(208, 20, 15, 1, 9, '2026-02-04 11:35:00'),
(209, 20, 17, 0, 9, '2026-02-04 11:35:00'),
(210, 21, 16, 1, 9, '2026-02-05 17:35:00'),
(211, 21, 18, 1, 9, '2026-02-05 17:35:00'),
(212, 21, 19, 0, 9, '2026-02-05 17:35:00'),
(213, 22, 16, 0, 9, '2026-02-07 11:35:00'),
(214, 22, 20, 0, 9, '2026-02-07 11:35:00'),
(215, 22, 21, 0, 9, '2026-02-07 11:35:00'),
(216, 23, 16, 1, 9, '2026-02-08 19:05:00'),
(217, 23, 12, 1, 9, '2026-02-08 19:05:00'),
(218, 24, 16, 1, 9, '2026-02-09 11:35:00'),
(219, 24, 22, 0, 9, '2026-02-09 11:35:00'),
(220, 25, 16, 0, 9, '2026-02-10 15:35:00'),
(221, 25, 13, 1, 9, '2026-02-10 15:35:00'),
(222, 25, 14, 1, 9, '2026-02-10 15:35:00'),
(641, 25, 2, 1, 9, '2026-02-10 19:41:44'),
(642, 25, 3, 0, 9, '2026-02-10 19:41:44'),
(643, 25, 6, 0, 9, '2026-02-10 19:41:44'),
(644, 25, 43, 1, 9, '2026-02-10 19:41:44'),
(645, 25, 44, 0, 9, '2026-02-10 19:41:44'),
(646, 25, 51, 1, 9, '2026-02-10 19:41:44'),
(647, 25, 52, 0, 9, '2026-02-10 19:41:44'),
(648, 24, 2, 1, 9, '2026-02-10 19:42:03'),
(649, 24, 3, 0, 9, '2026-02-10 19:42:03'),
(650, 24, 6, 1, 9, '2026-02-10 19:42:03'),
(651, 24, 43, 1, 9, '2026-02-10 19:42:03'),
(652, 24, 44, 1, 9, '2026-02-10 19:42:03'),
(653, 24, 51, 0, 9, '2026-02-10 19:42:03'),
(654, 24, 52, 0, 9, '2026-02-10 19:42:03'),
(655, 22, 2, 1, 9, '2026-02-10 19:42:14'),
(656, 22, 3, 0, 9, '2026-02-10 19:42:14'),
(657, 22, 6, 1, 9, '2026-02-10 19:42:14'),
(658, 22, 43, 1, 9, '2026-02-10 19:42:14'),
(659, 22, 44, 1, 9, '2026-02-10 19:42:14'),
(660, 22, 51, 1, 9, '2026-02-10 19:42:14'),
(661, 22, 52, 0, 9, '2026-02-10 19:42:14'),
(662, 23, 44, 0, 9, '2026-02-10 19:42:35'),
(663, 23, 51, 1, 9, '2026-02-10 19:42:35'),
(664, 23, 52, 1, 9, '2026-02-10 19:42:35'),
(665, 19, 2, 1, 9, '2026-02-10 19:42:43'),
(666, 19, 3, 0, 9, '2026-02-10 19:42:43'),
(667, 19, 6, 1, 9, '2026-02-10 19:42:43'),
(668, 19, 43, 0, 9, '2026-02-10 19:42:43'),
(669, 19, 44, 0, 9, '2026-02-10 19:42:43'),
(670, 19, 51, 0, 9, '2026-02-10 19:42:43'),
(671, 19, 52, 1, 9, '2026-02-10 19:42:43'),
(672, 21, 5, 1, 9, '2026-02-10 19:44:22'),
(673, 21, 12, 1, 9, '2026-02-10 19:44:22'),
(674, 21, 13, 0, 9, '2026-02-10 19:44:23'),
(675, 21, 14, 1, 9, '2026-02-10 19:44:23'),
(676, 21, 15, 1, 9, '2026-02-10 19:44:23'),
(678, 21, 17, 1, 9, '2026-02-10 19:44:23'),
(681, 21, 21, 1, 9, '2026-02-10 19:44:23'),
(682, 21, 22, 0, 9, '2026-02-10 19:44:23'),
(683, 21, 41, 1, 9, '2026-02-10 19:44:23'),
(684, 21, 42, 1, 9, '2026-02-10 19:44:23'),
(685, 21, 47, 0, 9, '2026-02-10 19:44:23'),
(686, 21, 48, 0, 9, '2026-02-10 19:44:23'),
(687, 21, 49, 0, 9, '2026-02-10 19:44:23'),
(688, 21, 50, 1, 9, '2026-02-10 19:44:23'),
(689, 4, 5, 1, 9, '2026-02-10 19:44:38'),
(690, 4, 12, 1, 9, '2026-02-10 19:44:38'),
(693, 4, 15, 1, 9, '2026-02-10 19:44:38'),
(694, 4, 16, 1, 9, '2026-02-10 19:44:38'),
(695, 4, 17, 1, 9, '2026-02-10 19:44:38'),
(696, 4, 18, 1, 9, '2026-02-10 19:44:38'),
(698, 4, 21, 1, 9, '2026-02-10 19:44:38'),
(699, 4, 22, 1, 9, '2026-02-10 19:44:38'),
(700, 4, 41, 0, 9, '2026-02-10 19:44:38'),
(701, 4, 42, 1, 9, '2026-02-10 19:44:38'),
(702, 4, 47, 0, 9, '2026-02-10 19:44:38'),
(703, 4, 48, 0, 9, '2026-02-10 19:44:38'),
(704, 4, 49, 1, 9, '2026-02-10 19:44:38'),
(705, 4, 50, 1, 9, '2026-02-10 19:44:38'),
(706, 3, 5, 0, 9, '2026-02-10 19:45:02'),
(708, 3, 13, 0, 9, '2026-02-10 19:45:02'),
(709, 3, 14, 1, 9, '2026-02-10 19:45:02'),
(710, 3, 48, 0, 9, '2026-02-10 19:45:02'),
(711, 3, 49, 1, 9, '2026-02-10 19:45:02'),
(712, 3, 50, 1, 9, '2026-02-10 19:45:02'),
(713, 1, 5, 1, 9, '2026-02-10 19:45:14'),
(719, 1, 17, 1, 9, '2026-02-10 19:45:14'),
(720, 1, 18, 1, 9, '2026-02-10 19:45:14'),
(721, 1, 19, 1, 9, '2026-02-10 19:45:14'),
(722, 1, 21, 0, 9, '2026-02-10 19:45:14'),
(723, 1, 22, 1, 9, '2026-02-10 19:45:14'),
(724, 1, 41, 1, 9, '2026-02-10 19:45:14'),
(725, 1, 42, 1, 9, '2026-02-10 19:45:14'),
(726, 1, 47, 1, 9, '2026-02-10 19:45:14'),
(727, 1, 48, 1, 9, '2026-02-10 19:45:14'),
(728, 1, 49, 1, 9, '2026-02-10 19:45:14'),
(729, 1, 50, 1, 9, '2026-02-10 19:45:14'),
(730, 24, 24, 1, 9, '2026-02-10 19:45:57'),
(731, 17, 24, 1, 9, '2026-02-10 19:46:05'),
(732, 4, 24, 0, 9, '2026-02-10 19:46:11');

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
(30, 16, 17, 'Сега ми е по-ясно как се работи с файлове в PHP.', '2026-01-14 23:12:51'),
(32, 1, 2, 'Много полезна лекция, благодаря!', '2026-01-19 21:17:07'),
(33, 1, 3, 'Може ли да качите слайдовете като PDF?', '2026-01-19 21:17:07'),
(34, 1, 4, 'Имам въпрос относно задачата — ще има ли примерен проект?', '2026-01-19 21:17:07'),
(35, 1, 1, 'Ще кача материалите по-късно днес. Благодаря за въпросите!', '2026-01-19 21:17:07'),
(36, 2, 2, 'Календарният изглед е супер удобен.', '2026-01-19 21:17:19'),
(37, 2, 5, 'Линкът към записа работи ли? При мен дава грешка.', '2026-01-19 21:17:19'),
(38, 2, 1, 'Проверих — обнових линка. Опитайте отново.', '2026-01-19 21:17:19'),
(39, 2, 9, 'Кога ше има консултация по материала?', '2026-01-20 09:20:39'),
(40, 17, 9, 'Благодаря за активното участие!', '2026-01-23 12:35:58'),
(100, 18, 16, 'Може ли линк към репото с примерите?', '2026-02-01 11:40:00'),
(101, 18, 9, 'Да, качих примерите в ресурсите към събитието.', '2026-02-01 11:45:00'),
(102, 20, 16, 'Може ли още един пример за HTTP статус кодове?', '2026-02-04 11:40:00'),
(103, 20, 9, 'Добавих таблица със статус кодове в PDF ресурса.', '2026-02-04 12:00:00'),
(104, 23, 16, 'Имам проблем с импорта от BBB - при мен не намира имената.', '2026-02-08 19:10:00'),
(105, 23, 9, 'Провери дали имената в BBB съвпадат с тези в системата (име + фамилия).', '2026-02-08 19:15:00'),
(106, 24, 16, 'JOIN-овете вече ми се изясниха, благодаря!', '2026-02-09 11:40:00');

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
(16, 'Упражнение 16.01', 'Файлове – упражнения', '2026-01-16 11:00:00', NULL, 3, '2026-01-14 22:47:27'),
(17, 'Лекция 31.01', 'Подготовка за проект', '2026-01-23 14:30:00', '2026-01-23 14:36:00', 9, '2026-01-23 12:31:00'),
(18, 'Лекция 01.02', 'Въведение в Git и работа с версии', '2026-02-01 10:00:00', '2026-02-01 11:30:00', 9, '2026-02-01 08:00:00'),
(19, 'Упражнение 02.02', 'Git: branch, merge, conflict – упражнения', '2026-02-02 12:00:00', '2026-02-02 13:30:00', 9, '2026-02-02 09:00:00'),
(20, 'Лекция 04.02', 'HTTP, заявки и отговори (REST)', '2026-02-04 10:00:00', '2026-02-04 11:30:00', 9, '2026-02-04 08:00:00'),
(21, 'Упражнение 05.02', 'Fetch API и JSON – практикум', '2026-02-05 16:00:00', '2026-02-05 17:30:00', 9, '2026-02-05 14:00:00'),
(22, 'Лекция 07.02', 'Сесии и роли (student/teacher)', '2026-02-07 10:00:00', '2026-02-07 11:30:00', 9, '2026-02-07 08:00:00'),
(23, 'Консултация 08.02', 'Въпроси по курсов проект и дебъг', '2026-02-08 18:00:00', '2026-02-08 19:00:00', 9, '2026-02-08 16:00:00'),
(24, 'Лекция 09.02', 'SQL: JOIN, индекси и оптимизация', '2026-02-09 10:00:00', '2026-02-09 11:30:00', 9, '2026-02-09 08:00:00'),
(25, 'Упражнение 10.02', 'SQL задачи + подготовка за тест', '2026-02-10 14:00:00', '2026-02-10 15:30:00', 9, '2026-02-10 12:00:00');

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
(52, 16, 'pdf', 'Задачи: файлове в PHP', 'https://example.com/php_files_tasks.pdf', 11, '2026-01-14 23:19:01'),
(53, 13, 'pdf', 'New', 'http://localhost:8080/pages/event_details_page.php?eventid=13', 1, '2026-01-24 20:16:37'),
(54, 7, 'pdf', 'Документация', 'https://docs.google.com/document/d/1x21xljPt7bT9c1GU-eRjjiZolBSJ6EpTGFvDbJXZIbE/edit?usp=sharing', 16, '2026-01-27 22:40:47'),
(200, 18, 'pdf', 'Git – кратко ръководство', 'https://example.com/git_cheatsheet_bg.pdf', 9, '2026-02-01 11:50:00'),
(201, 18, 'live_link', 'Repo с примерите', 'https://example.com/repo/git-examples', 9, '2026-02-01 11:51:00'),
(202, 20, 'pdf', 'HTTP + REST – слайдове', 'https://example.com/http_rest_slides.pdf', 9, '2026-02-04 12:05:00'),
(203, 21, 'js', 'Fetch примери (код)', 'https://example.com/fetch_examples.js', 9, '2026-02-05 17:40:00'),
(204, 21, 'live_link', 'Мои бележки (линк)', 'https://example.com/notes_maria_fetch', 16, '2026-02-05 17:45:00'),
(205, 24, 'sql', 'JOIN примери + индекси', 'https://example.com/sql_joins_indexes.sql', 9, '2026-02-09 12:10:00'),
(206, 25, 'recording', 'Запис от упражнение (пример)', 'https://example.com/recording_sql_practice', 9, '2026-02-10 15:50:00');

-- --------------------------------------------------------

--
-- Table structure for table `student_academic_info`
--

CREATE TABLE `student_academic_info` (
  `student_id` int(10) UNSIGNED NOT NULL,
  `major` varchar(100) NOT NULL,
  `student_group` varchar(20) NOT NULL,
  `study_year` tinyint(3) UNSIGNED NOT NULL,
  `start_year` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_academic_info`
--

INSERT INTO `student_academic_info` (`student_id`, `major`, `student_group`, `study_year`, `start_year`) VALUES
(2, 'Компютърни науки', '1', 2, '2024'),
(3, 'Компютърни науки', '1', 2, '2024'),
(4, 'Компютърни науки', '2', 3, '2023'),
(5, 'Компютърни науки', '1', 1, '2025'),
(6, 'Компютърни науки', '2', 2, '2024'),
(7, 'Компютърни науки', '1', 3, '2023'),
(8, 'Софтуерни технологии', '2', 1, '2025'),
(12, 'Компютърни науки', '1', 1, '2025'),
(13, 'Компютърни науки', '1', 1, '2025'),
(14, 'Компютърни науки', '2', 1, '2025'),
(15, 'Компютърни науки', '2', 1, '2025'),
(16, 'Компютърни науки', '1', 1, '2025'),
(17, 'Компютърни науки', '2', 1, '2025'),
(18, 'Компютърни науки', '1', 1, '2025'),
(19, 'Компютърни науки', '2', 1, '2025'),
(20, 'Математика и информатика', '1', 1, '2025'),
(21, 'Компютърни науки', '2', 1, '2025'),
(22, 'Компютърни науки', '1', 1, '2025'),
(24, 'Компютърни науки', '2', 4, '2022'),
(41, 'Компютърни науки', '2', 1, '2024'),
(42, 'Компютърни науки', '2', 1, '2024'),
(43, 'Компютърни науки', '3', 2, '2023'),
(44, 'Компютърни науки', '3', 2, '2023'),
(45, 'Компютърни науки', '4', 3, '2022'),
(46, 'Компютърни науки', '4', 3, '2022'),
(47, 'Компютърни науки', '1', 1, '2024'),
(48, 'Компютърни науки', '1', 1, '2024'),
(49, 'Компютърни науки', '2', 1, '2024'),
(50, 'Компютърни науки', '2', 1, '2024'),
(51, 'Компютърни науки', '3', 2, '2023'),
(52, 'Компютърни науки', '3', 2, '2023'),
(53, 'Компютърни науки', '4', 3, '2022'),
(54, 'Компютърни науки', '4', 3, '2022');

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
(9, 'teacher', 'Иван', 'Иванов', NULL, 'ivan.ivanov@uni.bg', '$2y$12$i6r9xRBOzcfT/nM5IjcVs.iHBIM1BdtRbr7HWzQc/llmq5UFWYgFe', '2026-01-14 22:43:01', 'Информатика'),
(10, 'teacher', 'Мария', 'Петрова', NULL, 'maria.petrova@uni.bg', '$2y$12$v/q8HFVbncdq2YRlFkjpsu0X9J0EM.sJ9XEAFdl.pSjRM6pUeHiSi', '2026-01-14 22:43:01', 'Софтуерни технологии'),
(11, 'teacher', 'Георги', 'Георгиев', NULL, 'georgi.georgiev@uni.bg', '$2y$12$v/q8HFVbncdq2YRlFkjpsu0X9J0EM.sJ9XEAFdl.pSjRM6pUeHiSi', '2026-01-14 22:43:01', 'Компютърни науки'),
(12, 'student', 'Ана', 'Петрова', '1MI0800181', 'ana.petrova@gmail.com', '$2y$12$XbPLyusUrDy7nIg8JmbbaeOCgbXmPhSf7nb5gkx0bFSkS.5/mDoS2', '2026-01-14 22:44:29', NULL),
(13, 'student', 'Борис', 'Велинов', '1MI0800182', 'boris.velinov@gmail.com', '$2y$12$cfuq4Tb0PbZiyrg0QPYJ7u9PBi.hKlKBtovIpQC6mucf.4IlagQte', '2026-01-14 22:44:29', NULL),
(14, 'student', 'Весела', 'Иванова', '1MI0800183', 'vesela.ivanova@gmail.com', '$2y$12$M2dPxgo2C.bK/HTgynjNyO23NVvUAxPWCxZnG0/0fPIK5iOw9bEnu', '2026-01-14 22:44:29', NULL),
(15, 'student', 'Иван', 'Георгиев', '1MI0800184', 'ivan.georgiev@gmail.com', '$2y$12$8d1rjakItTO6NuaBYQmRkO37wp.TMDFE5I.vxcYoBK3oXNFHPNmIG', '2026-01-14 22:44:29', NULL),
(16, 'student', 'Мария', 'Николова', '0MI0000000', 'maria.nikolova@gmail.com', '$2y$12$UT7aQcUK9WafacHKlXcAYuhWmnPNb/8GBk2ZrggciXclm3qNPAcA.', '2026-01-14 22:44:29', NULL),
(17, 'student', 'Георги', 'Димитров', '1MI0800186', 'georgi.dimitrov@gmail.com', '$2y$12$RdxDb394pfwDJzH43rtXj.DLFRWfeIJC.hz1EyIsCTyFG5B4qhzYy', '2026-01-14 22:44:29', NULL),
(18, 'student', 'Николай', 'Петров', '1MI0800187', 'nikolay.petrov@gmail.com', '$2y$12$IZVk.kFqFOGNSErWSYdxLeAobB.p34B5rsmB1SjPYcNkM3ZbgnaLO', '2026-01-14 22:44:29', NULL),
(19, 'student', 'Силвия', 'Маринова', '1MI0800188', 'silvia.marinova@gmail.com', '$2y$12$QjSeiPXEyQ1XEpk6HpTNgOJCQXiIJLFwwDejXSQ4fxUD2ZyvXyNVS', '2026-01-14 22:44:29', NULL),
(20, 'student', 'Петър', 'Стоянов', '1MI0800191', 'petar.stoyanov@gmail.com', '$2y$12$nBQYjmjWARypQXRh2ebIDeMXNYZP7Hle8iDiObcTzm5vOhMKZRiJe', '2026-01-14 22:44:29', NULL),
(21, 'student', 'Радослав', 'Колев', '1MI0800190', 'radoslav.kolev@gmail.com', '$2y$12$WsfZYvxkPcQsGcHgeWyMw.vbGUVLExs7VNhj6qgZVoFdmG6lRSYaK', '2026-01-14 22:44:29', NULL),
(22, 'student', 'Стефанка', 'Манахова', '1MI0800189', 'fani.manahova@gmail.com', '$2y$12$SDVf7.03WWTvz3JhMJJqr.S8SFp1Tnc5ms9AomjZIp/iGNaJ2zG9K', '2026-01-14 22:44:29', NULL),
(24, 'student', 'Румяна', 'Иванова', '8MI0800231', 'rumiana.ivanova24@gmail.com', '$2y$12$WikCovhq7cuBmfEa5BcAheJS7x73xFgf/j9LZ0hJGPay7e.g5Qr5C', '2026-02-10 15:41:01', NULL),
(41, 'student', 'Георги', 'Георгиев', '3MI0800113', 'georgi.georgiev1@uni.bg', '$2y$12$qvigFK7yRyLgG4OtOZCefu8Q5GW8V8bbYBOCgUEoJ05CAftfK4O3i', '2026-02-10 18:38:25', NULL),
(42, 'student', 'Елена', 'Димитрова', '3MI0800114', 'elena.dimitrova1@uni.bg', '$2y$12$am/i1mKplt52FLbOxNpmlOmHBLksZ4OIyuywM..KoL5b3K.cn/K5C', '2026-02-10 18:38:25', NULL),
(43, 'student', 'Петър', 'Николов', '3MI0800215', 'petar.nikolov1@uni.bg', '$2y$12$TQt8qgxrQzjlPeR3Es2.2uEYIIMkEcgQgWVgVayMn/HBOtrRSwwVC', '2026-02-10 18:38:25', NULL),
(44, 'student', 'Анна', 'Стоянова', '3MI0800216', 'anna.stoyanova1@uni.bg', '$2y$12$jFYMK63MWdCCbjUddOv1m.BEFFUwnzkuaX5gjb8uKfanCtN3lmuUm', '2026-02-10 18:38:25', NULL),
(45, 'student', 'Николай', 'Костов', '3MI0800317', 'nikolay.kostov1@uni.bg', '$2y$12$Gg/hdwizQ95gQYkLjv3MZeNHUxv.eKBq87zwGOhdqzd6ZfM/ZUBti', '2026-02-10 18:38:25', NULL),
(46, 'student', 'Десислава', 'Тодорова', '3MI0800318', 'desislava.todorova1@uni.bg', '$2y$12$ZlTdNrt/FNXEHBb.wFsZ0.v.dcFuQtexj3HtSi66.18yYJKu1sMsC', '2026-02-10 18:38:25', NULL),
(47, 'student', 'Иван', 'Иванов', '9MI0800111', 'ivan.ivanov1234@uni.bg', '$2y$12$BX1/UCS.Q2aWluR3Z8DwDOyWvijxDsfYylo.DGoyyFK7TcpVBND8O', '2026-02-10 19:00:49', NULL),
(48, 'student', 'Мария', 'Петрова', '9MI0800112', 'maria.petrova14@uni.bg', '$2y$12$qL0lvNTqXYq/2fd3ihsI2.P6M91HfzYGov2FRE27w.QXAh/ogCkji', '2026-02-10 19:00:49', NULL),
(49, 'student', 'Георги', 'Георгиев', '9MI0800113', 'georgi.georgiev14@uni.bg', '$2y$12$9EhS8qudChBsyfptsfPLKO3jMVKLX1WhNcj2Hg/knT2wHSRZYCdcu', '2026-02-10 19:00:49', NULL),
(50, 'student', 'Елена', 'Димитрова', '9MI0800114', 'elena.dimitrova14@uni.bg', '$2y$12$P7dd.VbXK8XnhlOiUUEC/ezuZRNewWwZ9pYJkqDgMjpYkL/YMQQ/q', '2026-02-10 19:00:49', NULL),
(51, 'student', 'Петър', 'Николов', '9MI0800215', 'petar.nikolov14@uni.bg', '$2y$12$pLbKDpJG7.grK1d/nXTQy.lRrKGWl3.EMC5Aj1VnO6dnUm8ATvA0G', '2026-02-10 19:00:50', NULL),
(52, 'student', 'Анна', 'Стоянова', '9MI0800216', 'anna.stoyanova14@uni.bg', '$2y$12$GrZc1Yzebd9C847IZA6VgOMUSAqSx.RQ7wHgEUnuVKv34Iw4QfDHW', '2026-02-10 19:00:50', NULL),
(53, 'student', 'Николай', 'Костов', '9MI0800317', 'nikolay.kostov14@uni.bg', '$2y$12$IwCQSomVN9brPP2JBO/Q1ujAXPu0Y8UszqZxe9O0CRNisL6D8Dh8S', '2026-02-10 19:00:50', NULL),
(54, 'student', 'Десислава', 'Тодорова', '9MI0800318', 'desislava.todorova14@uni.bg', '$2y$12$9hcpSrpfTt6aIzr6CoM.o.vKF8y5ibafvixhTCKk4NV/n3u0y/VIi', '2026-02-10 19:00:50', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_attendance_event_student` (`event_id`,`student_id`),
  ADD UNIQUE KEY `uniq_event_student` (`event_id`,`student_id`),
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
-- Indexes for table `student_academic_info`
--
ALTER TABLE `student_academic_info`
  ADD PRIMARY KEY (`student_id`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=733;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `resources`
--
ALTER TABLE `resources`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=207;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

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
-- Constraints for table `student_academic_info`
--
ALTER TABLE `student_academic_info`
  ADD CONSTRAINT `fk_student_academic_user` FOREIGN KEY (`student_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
