-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 09, 2023 at 12:01 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shorten`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) UNSIGNED NOT NULL,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `user_name` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `first_name`, `last_name`, `user_name`, `password`, `created_at`) VALUES
(1, 'mona', 'abdo', 'monaabdo88', '$2y$10$7PcjIQX/tNU0tbz9AfIqXuwrjHEHLMaNI/WKepkIb9xaJmqGO7rk2', '2023-07-23 09:21:58');

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE `links` (
  `id` int(11) UNSIGNED NOT NULL,
  `full_url` text NOT NULL,
  `short_url` varchar(191) NOT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `click` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `links`
--

INSERT INTO `links` (`id`, `full_url`, `short_url`, `user_id`, `click`, `created_at`) VALUES
(2, 'https://chat.openai.com/', '104b3600', 2, 1, '2023-08-01 05:53:27'),
(3, 'https://twitter.com/', '7caf5d5e', 2, 0, '2023-08-01 07:01:59'),
(4, 'https://www.freecodecamp.org/news/how-to-write-faster-html-and-css-using-emmet/', '20e1f8ff', 2, 0, '2023-08-01 07:03:40'),
(5, 'https://www.facebook.com/', '2597dd80', 2, 0, '2023-08-01 07:04:38'),
(6, 'https://itnext.io/build-a-drag-and-drop-kanban-board-react-typescript-tailwind-dnd-kit-ab4ec58593e5', '6e8e14be', 2, 0, '2023-08-01 07:06:15'),
(7, 'https://habr.com/en/articles/748796', '3b274da3', 2, 0, '2023-08-01 07:07:00'),
(8, 'https://www.leewayhertz.com/what-is-embedding/', '1f54544d', 2, 0, '2023-08-01 07:07:27'),
(11, 'https://twitter.com/home', '3e25d433', NULL, 0, '2023-08-04 07:29:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `user_name`, `password`, `created_at`) VALUES
(2, 'ola', 'diab', 'ola82', '$2y$10$OqcEyZw9jrYUF2dSRBXpbOvvlfiPymmvv/XDychDaTs9Cew4StGFG', '2023-07-30 20:47:06'),
(3, 'samar', 'hassan', 'samar_hassan', '$2y$10$.Jkg60lrHfvEhde/dXfqNO3jYVIDIzFgInAEesNOp5ouQE5q9KM56', '2023-07-30 20:47:35'),
(4, 'Test', 'Name', 'TestName', '$2y$10$mP/Oq4DSEjtnsEU.xm6onOa01/e5AWAZ6dSvXJpxtijcvK7KrHl8m', '2023-08-06 10:26:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_name` (`user_name`);

--
-- Indexes for table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_name` (`user_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `links`
--
ALTER TABLE `links`
  ADD CONSTRAINT `user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
