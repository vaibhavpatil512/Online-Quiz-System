-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2025 at 02:44 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlinequiz`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `aid` int(20) NOT NULL,
  `aname` varchar(100) NOT NULL,
  `ausername` varchar(100) NOT NULL,
  `acontact` varchar(100) NOT NULL,
  `aemail` varchar(100) NOT NULL,
  `apassword` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`aid`, `aname`, `ausername`, `acontact`, `aemail`, `apassword`) VALUES
(1, 'Vaibhav', 'vaibhavspatil512004', '9518565368', 'vaibhav@gmail.com', '123');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `question_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `question_text` text NOT NULL,
  `option_a` varchar(255) NOT NULL,
  `option_b` varchar(255) NOT NULL,
  `option_c` varchar(255) DEFAULT NULL,
  `option_d` varchar(255) DEFAULT NULL,
  `correct_option` char(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`question_id`, `quiz_id`, `question_text`, `option_a`, `option_b`, `option_c`, `option_d`, `correct_option`, `created_at`) VALUES
(1, 1, 'What is 5 + 3?', '6', '7', '8', '9', 'c', '2025-03-18 15:08:10'),
(2, 1, 'What is the value of 9 × 2?', '16', '18', '20', '22', 'b', '2025-03-19 13:26:35'),
(3, 1, 'Which number is the smallest?', '12', '8', '15', '10', 'b', '2025-03-19 13:28:02'),
(4, 1, 'What is 25 ÷ 5?', '4', '5', '6', '7', 'b', '2025-03-19 13:28:02'),
(5, 1, 'What is the next number in the pattern: 2, 4, 6, __?', '7', '8', '9', '10', 'b', '2025-03-19 13:28:02'),
(6, 1, 'If a triangle has three sides, how many sides does a square have?', '3', '4', '5', '6', 'b', '2025-03-19 13:28:02'),
(7, 1, 'What is 100 - 25?', '50', '65', '75', '80', 'c', '2025-03-19 13:28:02'),
(8, 1, 'What is half of 20?', '5', '10', '15', '20', 'b', '2025-03-19 13:28:02'),
(9, 1, 'How many minutes are there in an hour?', '30', '45', '60', '90', 'c', '2025-03-19 13:28:02'),
(10, 1, 'What is 3 squared (3²)?', '6', '9', '12', '15', 'b', '2025-03-19 13:28:02');

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `quiz_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('active','upcoming','expired') NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `questions` int(11) NOT NULL,
  `time_limit` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quizzes`
--

INSERT INTO `quizzes` (`quiz_id`, `title`, `description`, `status`, `start_date`, `end_date`, `questions`, `time_limit`, `created_at`) VALUES
(1, 'Math Quiz', 'Math Quiz', 'active', '2025-03-30 00:00:00', '2025-04-30 17:00:00', 10, 30, '2025-03-18 19:11:19'),
(10, 'Data Engineering Essentials', 'This quiz tests your understanding of fundamental concepts in data engineering, including ETL processes, data modeling, big data frameworks, and database management.', 'upcoming', '2025-04-01 12:59:00', '2025-12-31 12:59:00', 15, 60, '2025-03-31 00:41:13');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `uid` int(20) NOT NULL,
  `uname` varchar(100) NOT NULL,
  `uusername` varchar(100) NOT NULL,
  `uemail` varchar(100) NOT NULL,
  `ucontact` varchar(100) NOT NULL,
  `upassword` varchar(100) NOT NULL,
  `quiz_attempted` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`uid`, `uname`, `uusername`, `uemail`, `ucontact`, `upassword`, `quiz_attempted`) VALUES
(1, 'Vaibhav', 'vaibhavspatil512', 'vaibhav@gmail.com', '9518565368', '123', '1,'),
(2, 'Vaibhavi', 'vaibhavipa02', 'vaibhavipa02@gmail.com', '9270786897', 'Vaibhavi@14', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `quiz_id` (`quiz_id`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`quiz_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `aid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `quiz_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`quiz_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
