-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 01, 2017 at 05:04 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Library`
--
CREATE DATABASE IF NOT EXISTS `Library` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `Library`;

-- --------------------------------------------------------

--
-- Table structure for table `Accounts`
--

CREATE TABLE `Accounts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `access_level` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Accounts`
--

INSERT INTO `Accounts` (`id`, `name`, `username`, `password`, `email`, `access_level`) VALUES
(1, 'admin', 'admin', 'admin', 'admin@admin.com', 'admin'),
(2, 'ropali', 'ropali', 'ropali', 'ropali@gmail.com', 'User');

-- --------------------------------------------------------

--
-- Table structure for table `Books`
--

CREATE TABLE `Books` (
  `book_id` int(11) NOT NULL,
  `isbn_no` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `edition` int(11) NOT NULL,
  `publisher` varchar(255) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Books`
--

INSERT INTO `Books` (`book_id`, `isbn_no`, `name`, `edition`, `publisher`, `price`) VALUES
(1, 32132, 'Physics', 3, 'New India', 432.43),
(2, 4343245, 'Maths', 5, 'New India', 433.55),
(3, 5345354, 'Operating System', 4, 'Prentence', 550),
(4, 234242, 'Unix', 4, 'Tata McGraw Hill', 543.21),
(5, 434234, 'Chemistry', 5, 'New India', 432),
(6, 1413459, 'ASP.NET', 7, 'Tata McGraw Hill', 786),
(7, 678687, 'Real Analysis', 3, 'New India', 433),
(8, 423423423, 'Head First', 10, 'McGraw Hill', 423);

-- --------------------------------------------------------

--
-- Table structure for table `issued_books`
--

CREATE TABLE `issued_books` (
  `id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `isbn_no` int(11) NOT NULL,
  `book_name` varchar(255) NOT NULL,
  `student_id` int(11) NOT NULL,
  `student_name` varchar(255) NOT NULL,
  `year` varchar(50) NOT NULL,
  `date_of_issue` varchar(255) NOT NULL,
  `date_of_return` varchar(255) NOT NULL,
  `returned` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `issued_books`
--

INSERT INTO `issued_books` (`id`, `book_id`, `isbn_no`, `book_name`, `student_id`, `student_name`, `year`, `date_of_issue`, `date_of_return`, `returned`) VALUES
(1, 1, 32132, 'Physics', 2, 'Rohan aaa Shinge', 'Third Year', '17/08/2017', '1/01/2017', 1),
(5, 1, 32132, 'Physics', 3, 'Akshay bbb Patil', 'Third Year', '18/08/2017', '1/01/2017', 0),
(6, 1, 32132, 'Physics', 3, 'Akshay bbb Patil', 'Third Year', '21/08/2017', '1/01/2017', 0),
(7, 3, 5345354, 'Operating System', 6, 'Prince qqq Verma', 'Second Year', '21/08/2017', '1/01/2017', 0),
(8, 1, 32132, 'Physics', 2, 'Rohan aaa Shinge', 'Third Year', '21/08/2017', '1/01/2017', 1),
(9, 6, 1413459, 'ASP.NET', 8, 'Ganesh bbbb Yadav', 'First Year', '22/08/2017', '29/08/2017', 1),
(10, 7, 678687, 'Real Analysis', 9, 'sadasd asdasd asdsd', 'First Year', '25/08/2017', '31/08/2017', 1),
(11, 8, 423423423, 'Head First', 5, 'Nitin ddd Mishra', 'Third Year', '1/09/2017', '8/09/2017', 0);

-- --------------------------------------------------------

--
-- Table structure for table `logtable`
--

CREATE TABLE `logtable` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `loggedtime` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logtable`
--

INSERT INTO `logtable` (`id`, `username`, `loggedtime`) VALUES
(1, 'admin', '24/08/17 21:43:15'),
(2, 'admin', '24/08/17 22:27:18'),
(3, 'admin', '25/08/17 13:53:46'),
(4, 'admin', '25/08/17 13:55:24'),
(5, 'ropali', '25/08/17 19:19:24'),
(6, 'ropali', '25/08/17 19:24:19'),
(7, 'ropali', '25/08/17 19:25:26'),
(8, 'ropali', '25/08/17 19:26:40'),
(9, 'admin', '25/08/17 19:28:01'),
(10, 'admin', '25/08/17 19:30:28'),
(11, 'admin', '25/08/17 19:31:28'),
(12, 'admin', '25/08/17 19:39:32'),
(13, 'admin', '25/08/17 19:40:27'),
(14, 'admin', '25/08/17 20:03:19'),
(15, 'admin', '25/08/17 20:04:51'),
(16, 'admin', '29/08/17 21:21:09'),
(17, 'admin', '01/09/17 10:33:35'),
(18, 'admin', '01/09/17 10:43:52');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `middle_name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `roll_no` int(11) NOT NULL,
  `year` varchar(20) NOT NULL,
  `branch` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `student_id`, `name`, `middle_name`, `surname`, `roll_no`, `year`, `branch`) VALUES
(1, 1, 'RopAli', 'Rehan', 'Munshi', 14, 'Third Year', 'Computer Science'),
(2, 2, 'Rohan', 'aaa', 'Shinge', 15, 'Third Year', 'Computer Science'),
(3, 3, 'Akshay', 'bbb', 'Patil', 21, 'Third Year', 'Computer Science'),
(5, 5, 'Nitin', 'ddd', 'Mishra', 42, 'Third Year', 'Computer Science'),
(6, 6, 'Prince', 'qqq', 'Verma', 21, 'Second Year', 'Computer Science'),
(7, 7, 'Avinash', 'ddd', 'Yadav', 32, 'Second Year', 'I.T'),
(8, 8, 'Ganesh', 'bbbb', 'Yadav', 45, 'First Year', 'Physics'),
(9, 9, 'sadasd', 'asdasd', 'asdsd', 54, 'First Year', 'I.T');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Accounts`
--
ALTER TABLE `Accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Books`
--
ALTER TABLE `Books`
  ADD PRIMARY KEY (`book_id`);

--
-- Indexes for table `issued_books`
--
ALTER TABLE `issued_books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logtable`
--
ALTER TABLE `logtable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Accounts`
--
ALTER TABLE `Accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `Books`
--
ALTER TABLE `Books`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `issued_books`
--
ALTER TABLE `issued_books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `logtable`
--
ALTER TABLE `logtable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;--
-- Database: `accounts`
--
CREATE DATABASE IF NOT EXISTS `accounts` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `accounts`;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `passwd` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `surname`, `email`, `passwd`) VALUES
(8, 'ropali', 'munshi', 'ropali@admin.com', '5decfce0a70b78ccbc5a3c7dfa853e25'),
(13, 'abc', 'xyz', 'abc@xyz.com', '900150983cd24fb0d6963f7d28e17f72');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;--
-- Database: `cms`
--
CREATE DATABASE IF NOT EXISTS `cms` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cms`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`) VALUES
(4, 'python tutorials'),
(5, 'hacking and cyber security'),
(6, 'php tutorials'),
(7, 'android tutorials'),
(9, 'c++'),
(11, 'javascript');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `post_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contactno` int(10) NOT NULL,
  `image` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `date`, `name`, `username`, `post_id`, `email`, `contactno`, `image`, `comment`, `status`) VALUES
(5, 1493388570, 'ropali', 'user', 5, 'ropalimunshi@gmail.com', 0, 'Unknown_Person.png', 'superb.......!!!!!!!!!!!!', 'approved'),
(6, 1493554238, 'ropali', 'user', 7, 'ropali@gmail.com', 0, 'Unknown_Person.png', 'nasnonaosno', 'approved'),
(7, 1493554283, 'ropali', 'user', 3, 'ropali@gmail.com', 0, 'Unknown_Person.png', 'as cjbcoasncannao', 'approved'),
(8, 1493554323, 'rohan', 'user', 5, 'roahan@gmail.com', 0, 'Unknown_Person.png', 'asdjpajsipjiajsdioj', 'approved'),
(9, 1493554359, 'akshay', 'user', 4, 'akshay@gmail.com', 0, 'Unknown_Person.png', 'asmfansjnajnsjknjkasnkj kja skfbkabsk', 'approved'),
(10, 1493554910, 'RopAli Munshi', '', 5, 'ropali@gmail.com', 0, 'profile2.jpeg', 'asmklmkca', 'approved'),
(11, 1493554966, 'RopAli Munshi', 'ropali', 5, 'ropali@gmail.com', 0, 'profile2.jpeg', 'testing', 'approved'),
(12, 1493555177, 'ropali', 'user', 4, 'ropali@gmail.com', 0, 'Unknown_Person.png', 'ma kki ankah..', 'approved'),
(13, 1493555972, 'ropali', 'user', 6, 'ropali@gmail.com', 0, 'Unknown_Person.png', 'testing', 'approved'),
(14, 1493556001, 'RopAli Munshi', 'ropali', 6, 'ropali@gmail.com', 0, 'profile2.jpeg', 'thanks', 'approved'),
(15, 1493820163, 'ropali', 'user', 17, 'ropalimunshi@gmail.com', 2147483647, 'Unknown_Person.png', 'Hey There.................', 'approved'),
(16, 1493996144, 'ropali', 'user', 20, 'ropali@gmail.com', 0, 'Unknown_Person.png', 'wow.....', 'approved'),
(17, 1499663200, 'ropali', 'user', 20, 'ropali@gmail.com', 0, 'Unknown_Person.png', 'very nice.............', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `images` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `images`) VALUES
(1, '56715853ed4346c96.jpg'),
(2, 'pic1.jpeg'),
(3, 'pic2.jpeg'),
(4, 'android.jpeg'),
(5, 'bg.jpeg'),
(6, 'bits.jpeg'),
(7, 'bg3.jpeg'),
(8, 'bg4.jpeg'),
(9, 'bg5.jpeg'),
(10, 'bg6.jpeg'),
(11, 'computer.png'),
(12, 'bg6.jpeg'),
(13, 'boat.jpeg'),
(14, 'space.jpeg'),
(15, 'hack.jpg'),
(16, 'hacker.jpg'),
(17, 'slider3.jpeg'),
(18, 'slider4.jpeg'),
(19, '1492284814_Skype.png');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `author_image` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `categories` varchar(255) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `post_data` text NOT NULL,
  `views` int(11) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `date`, `title`, `author`, `author_image`, `image`, `categories`, `tags`, `post_data`, `views`, `status`) VALUES
(5, 1492787668, 'How to hack WIFI using fluxion', 'ropali', 'profile2.jpeg', 'slider2.jpeg', 'hacking and cyber security', 'hackking,wifi', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;</p>\r\n<p>Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;</p>\r\n</body>\r\n</html>', 109, 'publish'),
(7, 1492872731, 'PHP Tutorials', 'rohan', 'Unknown_Person.png', 'slider.png', 'php tutorials', 'php,programming', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;</p>\r\n<p>Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;</p>\r\n</body>\r\n</html>', 315, 'publish'),
(10, 1493725940, 'How To Hack Wifi', 'ropali', 'profile2.jpeg', 'wifi.jpeg', 'hacking and cyber security', 'hacking', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;</p>\r\n<p>Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;</p>\r\n</body>\r\n</html>', 4, 'publish'),
(15, 1493727460, 'How To Hack Android', 'ropali', 'profile2.jpeg', 'android.jpeg', 'android tutorials', 'android,hacking, tutorial', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;</p>\r\n<p>Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;</p>\r\n</body>\r\n</html>', 6, 'publish'),
(16, 1493813790, 'C++ Tutorial', 'ropali', 'profile2.jpeg', 'skyrim.jpeg', 'c++', 'c++,programming', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p>Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;</p>\r\n<p>Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;Et nisi facere soluta repellat ut qui quis. Ut at sed sint ut sit et est. Mollitia qui consequatur maxime quaerat molestias autem vel sed. Beatae perspiciatis nostrum et qui. Ex vel nisi omnis beatae est repellendus itaque. Qui ex ab id non voluptatum.&hellip;</p>\r\n</body>\r\n</html>', 2, 'publish'),
(18, 1493915172, 'How To Become A Hacker', 'ropali', 'profile2.jpeg', 'hacker.jpg', 'hacking and cyber security', 'hacking,cyber security,hacker', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<h2 class="title" style="clear: both;"><strong>What Is a Hacker?</strong></h2>\r\n<p>The <a class="ulink" href="http://www.catb.org/jargon" target="_top">Jargon File</a> contains a bunch of definitions of the term &lsquo;hacker&rsquo;, most having to do with technical adeptness and a delight in solving problems and overcoming limits. If you want to know how to <span class="emphasis"><em>become</em></span> a hacker, though, only two are really relevant.</p>\r\n<p>There is a community, a shared culture, of expert programmers and networking wizards that traces its history back through decades to the first time-sharing minicomputers and the earliest ARPAnet experiments. The members of this culture originated the term &lsquo;hacker&rsquo;. Hackers built the Internet. Hackers made the Unix operating system what it is today. Hackers make the World Wide Web work. If you are part of this culture, if you have contributed to it and other people in it know who you are and call you a hacker, you''re a hacker.</p>\r\n<p>The hacker mind-set is not confined to this software-hacker culture. There are people who apply the hacker attitude to other things, like electronics or music &mdash; actually, you can find it at the highest levels of any science or art. Software hackers recognize these kindred spirits elsewhere and may call them &lsquo;hackers&rsquo; too &mdash; and some claim that the hacker nature is really independent of the particular medium the hacker works in. But in the rest of this document we will focus on the skills and attitudes of software hackers, and the traditions of the shared culture that originated the term &lsquo;hacker&rsquo;.</p>\r\n<p>There is another group of people who loudly call themselves hackers, but aren''t. These are people (mainly adolescent males) who get a kick out of breaking into computers and phreaking the phone system. Real hackers call these people &lsquo;crackers&rsquo; and want nothing to do with them. Real hackers mostly think crackers are lazy, irresponsible, and not very bright, and object that being able to break security doesn''t make you a hacker any more than being able to hotwire cars makes you an automotive engineer. Unfortunately, many journalists and writers have been fooled into using the word &lsquo;hacker&rsquo; to describe crackers; this irritates real hackers no end.</p>\r\n<p>The basic difference is this: hackers build things, crackers break them.</p>\r\n<h2 class="title" style="clear: both;"><strong>The Hacker Attitude</strong></h2>\r\n<p>If you want to be a hacker, keep reading. If you want to be a cracker, go read the <a class="ulink" href="news:alt.2600" target="_top">alt.2600</a> newsgroup and get ready to do five to ten in the slammer after finding out you aren''t as smart as you think you are. And that''s all I''m going to say about crackers.</p>\r\n<p>Hackers solve problems and build things, and they believe in freedom and voluntary mutual help. To be accepted as a hacker, you have to behave as though you have this kind of attitude yourself. And to behave as though you have the attitude, you have to really believe the attitude.</p>\r\n<p>But if you think of cultivating hacker attitudes as just a way to gain acceptance in the culture, you''ll miss the point. Becoming the kind of person who believes these things is important for <span class="emphasis"><em>you</em></span> &mdash; for helping you learn and keeping you motivated. As with all creative arts, the most effective way to become a master is to imitate the mind-set of masters &mdash; not just intellectually but emotionally as well.</p>\r\n<p>Or, as the following modern Zen poem has it:</p>\r\n<div class="literallayout">\r\n<p><br /> &nbsp;&nbsp;&nbsp;&nbsp;To&nbsp;follow&nbsp;the&nbsp;path:<br /> &nbsp;&nbsp;&nbsp;&nbsp;look&nbsp;to&nbsp;the&nbsp;master,<br /> &nbsp;&nbsp;&nbsp;&nbsp;follow&nbsp;the&nbsp;master,<br /> &nbsp;&nbsp;&nbsp;&nbsp;walk&nbsp;with&nbsp;the&nbsp;master,<br /> &nbsp;&nbsp;&nbsp;&nbsp;see&nbsp;through&nbsp;the&nbsp;master,<br /> &nbsp;&nbsp;&nbsp;&nbsp;become&nbsp;the&nbsp;master.</p>\r\n</div>\r\n<p>So, if you want to be a hacker, repeat the following things until you believe them:</p>\r\n<div class="sect2">\r\n<div class="titlepage">\r\n<div>\r\n<div>\r\n<h3 class="title">1. The world is full of fascinating problems waiting to be solved.</h3>\r\n</div>\r\n</div>\r\n</div>\r\n<p>Being a hacker is lots of fun, but it''s a kind of fun that takes lots of effort. The effort takes motivation. Successful athletes get their motivation from a kind of physical delight in making their bodies perform, in pushing themselves past their own physical limits. Similarly, to be a hacker you have to get a basic thrill from solving problems, sharpening your skills, and exercising your intelligence.</p>\r\n<p>If you aren''t the kind of person that feels this way naturally, you''ll need to become one in order to make it as a hacker. Otherwise you''ll find your hacking energy is sapped by distractions like sex, money, and social approval.</p>\r\n<p>(You also have to develop a kind of faith in your own learning capacity &mdash; a belief that even though you may not know all of what you need to solve a problem, if you tackle just a piece of it and learn from that, you''ll learn enough to solve the next piece &mdash; and so on, until you''re done.)</p>\r\n</div>\r\n<div class="sect2">\r\n<div class="titlepage">\r\n<div>\r\n<div>\r\n<h3 class="title">2. No problem should ever have to be solved twice.</h3>\r\n</div>\r\n</div>\r\n</div>\r\n<p>Creative brains are a valuable, limited resource. They shouldn''t be wasted on re-inventing the wheel when there are so many fascinating new problems waiting out there.</p>\r\n<p>To behave like a hacker, you have to believe that the thinking time of other hackers is precious &mdash; so much so that it''s almost a moral duty for you to share information, solve problems and then give the solutions away just so other hackers can solve <span class="emphasis"><em>new</em></span> problems instead of having to perpetually re-address old ones.</p>\r\n<p>Note, however, that "No problem should ever have to be solved twice." does not imply that you have to consider all existing solutions sacred, or that there is only one right solution to any given problem. Often, we learn a lot about the problem that we didn''t know before by studying the first cut at a solution. It''s OK, and often necessary, to decide that we can do better. What''s not OK is artificial technical, legal, or institutional barriers (like closed-source code) that prevent a good solution from being re-used and <span class="emphasis"><em>force</em></span> people to re-invent wheels.</p>\r\n<p>(You don''t have to believe that you''re obligated to give <span class="emphasis"><em>all</em></span> your creative product away, though the hackers that do are the ones that get most respect from other hackers. It''s consistent with hacker values to sell enough of it to keep you in food and rent and computers. It''s fine to use your hacking skills to support a family or even get rich, as long as you don''t forget your loyalty to your art and your fellow hackers while doing it.)</p>\r\n</div>\r\n<div class="sect2">\r\n<div class="titlepage">\r\n<div>\r\n<div>\r\n<h3 class="title">3. Boredom and drudgery are evil.</h3>\r\n</div>\r\n</div>\r\n</div>\r\n<p>Hackers (and creative people in general) should never be bored or have to drudge at stupid repetitive work, because when this happens it means they aren''t doing what only they can do &mdash; solve new problems. This wastefulness hurts everybody. Therefore boredom and drudgery are not just unpleasant but actually evil.</p>\r\n<p>To behave like a hacker, you have to believe this enough to want to automate away the boring bits as much as possible, not just for yourself but for everybody else (especially other hackers).</p>\r\n<p>(There is one apparent exception to this. Hackers will sometimes do things that may seem repetitive or boring to an observer as a mind-clearing exercise, or in order to acquire a skill or have some particular kind of experience you can''t have otherwise. But this is by choice &mdash; nobody who can think should ever be forced into a situation that bores them.)</p>\r\n</div>\r\n<div class="sect2">\r\n<div class="titlepage">\r\n<div>\r\n<div>\r\n<h3 class="title">4. Freedom is good.</h3>\r\n</div>\r\n</div>\r\n</div>\r\n<p>Hackers are naturally anti-authoritarian. Anyone who can give you orders can stop you from solving whatever problem you''re being fascinated by &mdash; and, given the way authoritarian minds work, will generally find some appallingly stupid reason to do so. So the authoritarian attitude has to be fought wherever you find it, lest it smother you and other hackers.</p>\r\n<p>(This isn''t the same as fighting all authority. Children need to be guided and criminals restrained. A hacker may agree to accept some kinds of authority in order to get something he wants more than the time he spends following orders. But that''s a limited, conscious bargain; the kind of personal surrender authoritarians want is not on offer.)</p>\r\n<p>Authoritarians thrive on censorship and secrecy. And they distrust voluntary cooperation and information-sharing &mdash; they only like &lsquo;cooperation&rsquo; that they control. So to behave like a hacker, you have to develop an instinctive hostility to censorship, secrecy, and the use of force or deception to compel responsible adults. And you have to be willing to act on that belief.</p>\r\n</div>\r\n<div class="sect2">\r\n<div class="titlepage">\r\n<div>\r\n<div>\r\n<h3 class="title">5. Attitude is no substitute for competence.</h3>\r\n</div>\r\n</div>\r\n</div>\r\n<p>To be a hacker, you have to develop some of these attitudes. But copping an attitude alone won''t make you a hacker, any more than it will make you a champion athlete or a rock star. Becoming a hacker will take intelligence, practice, dedication, and hard work.</p>\r\n<p>Therefore, you have to learn to distrust attitude and respect competence of every kind. Hackers won''t let posers waste their time, but they worship competence &mdash; especially competence at hacking, but competence at anything is valued. Competence at demanding skills that few can master is especially good, and competence at demanding skills that involve mental acuteness, craft, and concentration is best.</p>\r\n<p>If you revere competence, you''ll enjoy developing it in yourself &mdash; the hard work and dedication will become a kind of intense play rather than drudgery. That attitude is vital to becoming a hacker.</p>\r\n<p><img style="display: block; margin-left: auto; margin-right: auto;" src="media/hack.jpg" alt="hack.jpg" width="574" height="432" /></p>\r\n<div class="titlepage">\r\n<div>\r\n<div>\r\n<h2 class="title" style="clear: both;"><strong>Basic Hacking Skills</strong></h2>\r\n<p>The hacker attitude is vital, but skills are even more vital. Attitude is no substitute for competence, and there''s a certain basic toolkit of skills which you have to have before any hacker will dream of calling you one.</p>\r\n<p>This toolkit changes slowly over time as technology creates new skills and makes old ones obsolete. For example, it used to include programming in machine language, and didn''t until recently involve HTML. But right now it pretty clearly includes the following:</p>\r\n<div class="sect2">\r\n<div class="titlepage">\r\n<div>\r\n<div>\r\n<h3 class="title">1. Learn how to program.</h3>\r\n</div>\r\n</div>\r\n</div>\r\n<p>This, of course, is the fundamental hacking skill. If you don''t know any computer languages, I recommend starting with Python. It is cleanly designed, well documented, and relatively kind to beginners. Despite being a good first language, it is not just a toy; it is very powerful and flexible and well suited for large projects. I have written a more detailed <a class="ulink" href="http://www.linuxjournal.com/article.php?sid=3882" target="_top">evaluation of Python</a>. Good <a class="ulink" href="https://www.python.org/about/gettingstarted/" target="_top"> tutorials</a> are available at the <a class="ulink" href="https://docs.python.org/3/tutorial/" target="_top">Python web site</a>; there''s an excellent third-party one at <a class="ulink" href="http://cscircles.cemc.uwaterloo.ca/" target="_top">Computer Science Circles</a>.</p>\r\n<p>I used to recommend Java as a good language to learn early, but <a class="ulink" href="http://www.crosstalkonline.org/storage/issue-archives/2008/200801/200801-Dewar.pdf" target="_top">this critique</a> has changed my mind (search for <span class="quote">&ldquo;The Pitfalls of Java as a First Programming Language&rdquo;</span> within it). A hacker cannot, as they devastatingly put it <span class="quote">&ldquo;approach problem-solving like a plumber in a hardware store&rdquo;</span>; you have to know what the components actually <span class="emphasis"><em>do</em></span>. Now I think it is probably best to learn C and Lisp first, then Java.</p>\r\n<p>There is perhaps a more general point here. If a language does too much for you, it may be simultaneously a good tool for production and a bad one for learning. It''s not only languages that have this problem; web application frameworks like RubyOnRails, CakePHP, Django may make it too easy to reach a superficial sort of understanding that will leave you without resources when you have to tackle a hard problem, or even just debug the solution to an easy one.</p>\r\n<p>If you get into serious programming, you will have to learn C, the core language of Unix. C++ is very closely related to C; if you know one, learning the other will not be difficult. Neither language is a good one to try learning as your first, however. And, actually, the more you can avoid programming in C the more productive you will be.</p>\r\n<p>C is very efficient, and very sparing of your machine''s resources. Unfortunately, C gets that efficiency by requiring you to do a lot of low-level management of resources (like memory) by hand. All that low-level code is complex and bug-prone, and will soak up huge amounts of your time on debugging. With today''s machines as powerful as they are, this is usually a bad tradeoff &mdash; it''s smarter to use a language that uses the machine''s time less efficiently, but your time much <span class="emphasis"><em>more</em></span> efficiently. Thus, Python.</p>\r\n<p>Other languages of particular importance to hackers include <a class="ulink" href="http://www.perl.com" target="_top">Perl</a> and <a class="ulink" href="http://www.lisp.org/" target="_top">LISP</a>. Perl is worth learning for practical reasons; it''s very widely used for active web pages and system administration, so that even if you never write Perl you should learn to read it. Many people use Perl in the way I suggest you should use Python, to avoid C programming on jobs that don''t require C''s machine efficiency. You will need to be able to understand their code.</p>\r\n<p>LISP is worth learning for a different reason &mdash; the profound enlightenment experience you will have when you finally get it. That experience will make you a better programmer for the rest of your days, even if you never actually use LISP itself a lot. (You can get some beginning experience with LISP fairly easily by writing and modifying editing modes for the Emacs text editor, or Script-Fu plugins for the GIMP.)</p>\r\n<p>It''s best, actually, to learn all five of Python, C/C++, Java, Perl, and LISP. Besides being the most important hacking languages, they represent very different approaches to programming, and each will educate you in valuable ways.</p>\r\n<p>But be aware that you won''t reach the skill level of a hacker or even merely a programmer simply by accumulating languages &mdash; you need to learn how to think about programming problems in a general way, independent of any one language. To be a real hacker, you need to get to the point where you can learn a new language in days by relating what''s in the manual to what you already know. This means you should learn several very different languages.</p>\r\n<p>I can''t give complete instructions on how to learn to program here &mdash; it''s a complex skill. But I can tell you that books and courses won''t do it &mdash; many, maybe <span class="emphasis"><em>most</em></span> of the best hackers are self-taught. You can learn language features &mdash; bits of knowledge &mdash; from books, but the mind-set that makes that knowledge into living skill can be learned only by practice and apprenticeship. What will do it is (a) <span class="emphasis"><em>reading code</em></span> and (b) <span class="emphasis"><em>writing code</em></span>.</p>\r\n<p>Peter Norvig, who is one of Google''s top hackers and the co-author of the most widely used textbook on AI, has written an excellent essay called <a class="ulink" href="http://norvig.com/21-days.html" target="_top">Teach Yourself Programming in Ten Years</a>. His "recipe for programming success" is worth careful attention.</p>\r\n<p>Learning to program is like learning to write good natural language. The best way to do it is to read some stuff written by masters of the form, write some things yourself, read a lot more, write a little more, read a lot more, write some more ... and repeat until your writing begins to develop the kind of strength and economy you see in your models.</p>\r\n<p>I have had more to say about this learning process in <a class="ulink" href="http://www.catb.org/esr/faqs/hacking-howto.html" target="_top">How To Learn Hacking</a>. It''s a simple set of instructions, but not an easy one.</p>\r\n<p>Finding good code to read used to be hard, because there were few large programs available in source for fledgeling hackers to read and tinker with. This has changed dramatically; open-source software, programming tools, and operating systems (all built by hackers) are now widely available. Which brings me neatly to our next topic...</p>\r\n</div>\r\n<div class="sect2">\r\n<div class="titlepage">\r\n<div>\r\n<div>\r\n<h3 class="title">2. Get one of the open-source Unixes and learn to use and run it.</h3>\r\n</div>\r\n</div>\r\n</div>\r\n<p>I''ll assume you have a personal computer or can get access to one. (Take a moment to appreciate how much that means. The hacker culture originally evolved back when computers were so expensive that individuals could not own them.) The single most important step any newbie can take toward acquiring hacker skills is to get a copy of Linux or one of the BSD-Unixes, install it on a personal machine, and run it.</p>\r\n<p>Yes, there are other operating systems in the world besides Unix. But they''re distributed in binary &mdash; you can''t read the code, and you can''t modify it. Trying to learn to hack on a Microsoft Windows machine or under any other closed-source system is like trying to learn to dance while wearing a body cast.</p>\r\n<p>Under Mac OS X it''s possible, but only part of the system is open source &mdash; you''re likely to hit a lot of walls, and you have to be careful not to develop the bad habit of depending on Apple''s proprietary code. If you concentrate on the Unix under the hood you can learn some useful things.</p>\r\n<p>Unix is the operating system of the Internet. While you can learn to use the Internet without knowing Unix, you can''t be an Internet hacker without understanding Unix. For this reason, the hacker culture today is pretty strongly Unix-centered. (This wasn''t always true, and some old-time hackers still aren''t happy about it, but the symbiosis between Unix and the Internet has become strong enough that even Microsoft''s muscle doesn''t seem able to seriously dent it.)</p>\r\n<p>So, bring up a Unix &mdash; I like Linux myself but there are other ways (and yes, you <span class="emphasis"><em>can</em></span> run both Linux and Microsoft Windows on the same machine). Learn it. Run it. Tinker with it. Talk to the Internet with it. Read the code. Modify the code. You''ll get better programming tools (including C, LISP, Python, and Perl) than any Microsoft operating system can dream of hosting, you''ll have fun, and you''ll soak up more knowledge than you realize you''re learning until you look back on it as a master hacker.</p>\r\n<p>For more about learning Unix, see <a class="ulink" href="http://catb.org/%7Eesr/faqs/loginataka.html" target="_top">The Loginataka</a>. You might also want to have a look at <a class="ulink" href="http://catb.org/%7Eesr/writings/taoup/" target="_top">The Art Of Unix Programming</a>.</p>\r\n<p>The blog <a class="ulink" href="https://letsgolarval.wordpress.com/" target="_top">Let''s Go Larval!</a> is a window on the learning process of a a new Linux user that I think is unusually lucid and helpful. The post <a class="ulink" href="https://letsgolarval.wordpress.com/2015/06/23/how-i-learned-linux/" target="_top">How I Learned Linux</a> makes a good starting point.</p>\r\n<p>To get your hands on a Linux, see the <a class="ulink" href="http://www.linux.org/" target="_top">Linux Online!</a> site; you can download from there or (better idea) find a local Linux user group to help you with installation.</p>\r\n<p>During the first ten years of this HOWTO''s life, I reported that from a new user''s point of view, all Linux distributions are almost equivalent. But in 2006-2007, an actual best choice emerged: <a class="ulink" href="http://www.ubuntu.com/" target="_top">Ubuntu</a>. While other distros have their own areas of strength, Ubuntu is far and away the most accessible to Linux newbies. Beware, though, of the hideous and nigh-unusable "Unity" desktop interface that Ubuntu introduced as a default a few years later; the Xubuntu or Kubuntu variants are better.</p>\r\n<p>You can find BSD Unix help and resources at <a class="ulink" href="http://www.bsd.org" target="_top">www.bsd.org</a>.</p>\r\n<p>A good way to dip your toes in the water is to boot up what Linux fans call a <a class="ulink" href="http://www.livecdnews.com/" target="_top">live CD</a>, a distribution that runs entirely off a CD or USB stick without having to modify your hard disk. This may be slow, because CDs are slow, but it''s a way to get a look at the possibilities without having to do anything drastic.</p>\r\n<p>I have written a primer on the <a class="ulink" href="http://en.tldp.org/HOWTO/Unix-and-Internet-Fundamentals-HOWTO/index.html" target="_top">basics of Unix and the Internet</a>.</p>\r\n<p>I used to recommend against installing either Linux or BSD as a solo project if you''re a newbie. Nowadays the installers have gotten good enough that doing it entirely on your own is possible, even for a newbie. Nevertheless, I still recommend making contact with your local Linux user''s group and asking for help. It can''t hurt, and may smooth the process.</p>\r\n</div>\r\n<div class="sect2">\r\n<div class="titlepage">\r\n<div>\r\n<div>\r\n<h3 class="title"><a id="skills3"></a>3. Learn how to use the World Wide Web and write HTML.</h3>\r\n</div>\r\n</div>\r\n</div>\r\n<p>Most of the things the hacker culture has built do their work out of sight, helping run factories and offices and universities without any obvious impact on how non-hackers live. The Web is the one big exception, the huge shiny hacker toy that even <span class="emphasis"><em>politicians</em></span> admit has changed the world. For this reason alone (and a lot of other good ones as well) you need to learn how to work the Web.</p>\r\n<p>This doesn''t just mean learning how to drive a browser (anyone can do that), but learning how to write HTML, the Web''s markup language. If you don''t know how to program, writing HTML will teach you some mental habits that will help you learn. So build a home page.</p>\r\n<p>But just having a home page isn''t anywhere near good enough to make you a hacker. The Web is full of home pages. Most of them are pointless, zero-content sludge &mdash; very snazzy-looking sludge, mind you, but sludge all the same (for more on this see <a class="ulink" href="http://catb.org/%7Eesr/html-hell.html" target="_top">The HTML Hell Page</a>).</p>\r\n<p>To be worthwhile, your page must have <span class="emphasis"><em>content</em></span> &mdash; it must be interesting and/or useful to other hackers. And that brings us to the next topic...</p>\r\n</div>\r\n<div class="sect2">\r\n<div class="titlepage">\r\n<div>\r\n<div>\r\n<h3 class="title">4. If you don''t have functional English, learn it.</h3>\r\n</div>\r\n</div>\r\n</div>\r\n<p>As an American and native English-speaker myself, I have previously been reluctant to suggest this, lest it be taken as a sort of cultural imperialism. But several native speakers of other languages have urged me to point out that English is the working language of the hacker culture and the Internet, and that you will need to know it to function in the hacker community.</p>\r\n<p>Back around 1991 I learned that many hackers who have English as a second language use it in technical discussions even when they share a birth tongue; it was reported to me at the time that English has a richer technical vocabulary than any other language and is therefore simply a better tool for the job. For similar reasons, translations of technical books written in English are often unsatisfactory (when they get done at all).</p>\r\n<p>Linus Torvalds, a Finn, comments his code in English (it apparently never occurred to him to do otherwise). His fluency in English has been an important factor in his ability to recruit a worldwide community of developers for Linux. It''s an example worth following.</p>\r\n<p>Being a native English-speaker does not guarantee that you have language skills good enough to function as a hacker. If your writing is semi-literate, ungrammatical, and riddled with misspellings, many hackers (including myself) will tend to ignore you. While sloppy writing does not invariably mean sloppy thinking, we''ve generally found the correlation to be strong &mdash; and we have no use for sloppy thinkers. If you can''t yet write competently, learn to.</p>\r\n<div class="mediaobject">&nbsp;</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>\r\n</body>\r\n</html>', 2, 'publish');
INSERT INTO `posts` (`id`, `date`, `title`, `author`, `author_image`, `image`, `categories`, `tags`, `post_data`, `views`, `status`) VALUES
(20, 1493916417, '4 ways on How Hackers Can Hack Your Facebook Password', 'ropali', 'profile2.jpeg', 'fb2.jpeg', 'hacking and cyber security', 'facebook hacking,password hacking,hacking', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p><span class="Apple-style-span" style="font-family: ''verdana'' , sans-serif;">Today i thought to uncover all the methods used to hack facebook password,</span><br /> <br /> <span class="Apple-style-span" style="font-family: ''verdana'' , sans-serif;">I will cover 4 methods over here:</span><br /> <br /> <strong><span class="Apple-style-span" style="font-family: ''verdana'' , sans-serif;">1.</span></strong> <strong><a title="How to hack facebook" href="http://rafayhackingarticles.blogspot.com/2009/07/how-to-hack-facebook-account.html"><span class="Apple-style-span" style="color: #3d85c6;"><span class="Apple-style-span" style="font-family: ''verdana'' , sans-serif;">Facebook Phishing</span></span></a></strong><br /> <strong><span class="Apple-style-span" style="font-family: ''verdana'' , sans-serif;">2.</span></strong> <strong><a href="http://rafayhackingarticles.blogspot.com/2010/01/remote-password-hacking-software_07.html"><span class="Apple-style-span" style="color: #3d85c6;"><span class="Apple-style-span" style="font-family: ''verdana'' , sans-serif;">Keylogging</span></span></a></strong><br /> <strong><span class="Apple-style-span" style="font-family: ''verdana'' , sans-serif;">3.</span></strong><span class="Apple-style-span" style="font-family: ''verdana'' , sans-serif;"> Social engineering</span><br /> <strong><span class="Apple-style-span" style="font-family: ''verdana'' , sans-serif;">4</span></strong><span class="Apple-style-span" style="font-family: ''verdana'' , sans-serif;">. Primary email address hack</span></p>\r\n<p><span class="Apple-style-span" style="font-family: ''verdana'' , sans-serif;"><strong>Facebook phishing:</strong><br /> </span></p>\r\n<p><span class="Apple-style-span" style="font-family: ''verdana'' , sans-serif;">I have taken this method first because i think this is the most popular method/way of hacking facebook. I studied various facebook surveys taken on web about hacking facebook. The results of these surveys show "Phishing" as the most used method to hack facebook and to note&hellip;"Phishing is favorite method of facebook hackers". So, friends.. beware of facebook Phishing. Facebook staff is working hard to avoid these Facebook phishers. Phishing not only allows you to hack Facebook but also almost any email account. You have to only get the trick used to make a phisher, which i think is very easy. I learnt it without any difficulty. But, remember, this is only for educational purpose. I will not extend this topic over here as i have added more on Phishing in my article <strong><a href="http://rafayhackingarticles.blogspot.com/2009/07/how-to-hack-facebook-account.html">How to hack facebook password</a></strong><br /> <br /> <strong>Keylogging:</strong><br /> <br /></span></p>\r\n<p><span class="Apple-style-span" style="font-family: ''verdana'' , sans-serif;"> This is my second favorite, as only thing you have to do is remotely install a keylogger application (if you don''t have any physical access to victim computer). Keylogging becomes more easy if you have physical access to victim computer as only thing you have to do is install a keylogger and direct it to your destination so that it will send all recorded keystrokes to pointed destination. What a keylogger does is it records the keystrokes into a log file and then you can use these logs to get required Facebook password and thus can hack facebook password. I have posted detailed information of top keyloggers in the trade for more information see my <a href="http://rafayhackingarticles.blogspot.com/search/label/Password%20Hacking%20softwares"><strong><span class="Apple-style-span" style="color: #3d85c6;">password hacking softwares</span></strong></a> section<br /> <br /> <strong>3. Social engineering:</strong><br /> <br /> This sounds to be pretty not working at beginning. Even I was neglecting this way. But, once, I thought of using it against my friend on Facebook and i <strong>got his Facebook password</strong> very easily by this method. I think many of you might be knowing how what this social engineering, For newbies, social engineering is method of retrieving password or answer of security question simply be quering with the victim. You have to be very careful while using this as victim must not be aware of your intention. Just ask him cautiously using your logic.<br /> <br /> <br /> <strong>4.Primary email address hack </strong><br /></span></p>\r\n<div id="TixyyLink" style="background-color: transparent; color: black; overflow: hidden; text-align: left; text-decoration: none;"><br /> <span class="Apple-style-span" style="font-family: ''verdana'' , sans-serif;">If </span><span style="font-weight: bold;"><span class="Apple-style-span" style="font-family: ''verdana'' , sans-serif;">Facebook hacker</span></span><span class="Apple-style-span" style="font-family: ''verdana'' , sans-serif;">, by some means, hacks your gmail or yahoo account which you are using as primary email address, then this Facebook hacker can easily </span><strong><span class="Apple-style-span" style="font-family: ''verdana'' , sans-serif;">hack your Facebook password</span></strong><span class="Apple-style-span" style="font-family: ''verdana'' , sans-serif;"> using "</span><strong><span class="Apple-style-span" style="font-family: ''verdana'' , sans-serif;">Forgot password</span></strong><span class="Apple-style-span" style="font-family: ''verdana'' , sans-serif;">" trick. He will simply ask Facebook to send password reset email to your primary email address- which is already hacked. Thus, your Facebook account password will be reset and it will be hacked !!!</span><br /> <span class="Apple-style-span" style="font-family: ''verdana'' , sans-serif;"><br /> </span><br /> <span class="Apple-style-span" style="font-family: ''verdana'' , sans-serif;">So, always remember to protect your Facebook primary email address and try to keep unknown or useless mail id as your primary email address</span></div>\r\n<div id="TixyyLink" style="background-color: transparent; overflow-x: hidden; overflow-y: hidden; text-align: left; border: medium none initial;">\r\n<div style="color: black; text-decoration: none;"><span class="Apple-style-span" style="font-family: ''verdana'' , sans-serif;">So far, i found these </span><strong><span class="Apple-style-span" style="font-family: ''verdana'' , sans-serif;">Facebook hacking methods</span></strong><span class="Apple-style-span" style="font-family: ''verdana'' , sans-serif;"> as best and working ways to </span><strong><span class="Apple-style-span" style="font-family: ''verdana'' , sans-serif;">hack facebook account passwords</span></strong><span class="Apple-style-span" style="font-family: ''verdana'' , sans-serif;">. I never encourage </span><strong><em><span class="Apple-style-span" style="font-family: ''verdana'' , sans-serif;">hacking Facebook</span></em></strong><span class="Apple-style-span" style="font-family: ''verdana'' , sans-serif;"> or any email account,,I just wanna make you aware about Facebook dangers online. I will appreciate your effort if you mention any other Facebook hacking method.&nbsp;</span></div>\r\n</div>\r\n</body>\r\n</html>', 9, 'publish');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `salt` varchar(255) NOT NULL DEFAULT '$2y$10$usesomesillystringforsalt'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `date`, `first_name`, `last_name`, `username`, `email`, `image`, `password`, `role`, `details`, `salt`) VALUES
(15, 1493103348, 'akshay', 'patil', 'patil', 'patil@gmail.com', 'pic4.jpeg', '$2y$10$usesomesillystringforee0AT2k9jX7ebLQ4jNxHU7lDaa8VGJxG', 'author', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '$2y$10$usesomesillystringforsalt'),
(17, 1493126320, 'RopAli', 'Munshi', 'ropali', 'ropali@gmail.com', 'profile2.jpeg', '$2y$10$usesomesillystringforeaiSs43aI04J8aG6A/z01rOwMH.nsoci', 'admin', 'A programmer by profession and hacker by heart........', '$2y$10$usesomesillystringforsalt'),
(18, 1493189725, 'rohan', 'shinge', 'rohan', 'rohan@gmail.com', '56715853ed4346c96.jpg', '$2y$10$usesomesillystringforeU9wW9crer2skO9hZRWDp33SRzeHnTPO', 'author', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '$2y$10$usesomesillystringforsalt'),
(19, 1493189826, 'imteyaz', 'ansari', 'imteyaz', 'imteyaz@gmail.com', 'pic3.jpeg', '$2y$10$usesomesillystringforeewgimV35rLYwbUzAumZaioXZfiIfPXS', 'author', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '$2y$10$usesomesillystringforsalt'),
(20, 1493191313, 'ganesh', 'yadav', 'ganesh', 'ganesh@gmail.com', 'pic2.jpeg', '$2y$10$usesomesillystringforeqWQ2lwNvaxvq3fndEhw/IszgCYNn/cy', 'author', 'Hello ,My name is Ganesh Yadav.Im a technology expert.I have have expertise in the field of processor and michrochip ,microcontroller, asembelly language.', '$2y$10$usesomesillystringforsalt');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `last_name` (`last_name`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;--
-- Database: `dvwa`
--
CREATE DATABASE IF NOT EXISTS `dvwa` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `dvwa`;

-- --------------------------------------------------------

--
-- Table structure for table `guestbook`
--

CREATE TABLE `guestbook` (
  `comment_id` smallint(5) UNSIGNED NOT NULL,
  `comment` varchar(300) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guestbook`
--

INSERT INTO `guestbook` (`comment_id`, `comment`, `name`) VALUES
(1, 'This is a test comment.', 'test');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(6) NOT NULL,
  `first_name` varchar(15) DEFAULT NULL,
  `last_name` varchar(15) DEFAULT NULL,
  `user` varchar(15) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `avatar` varchar(70) DEFAULT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `failed_login` int(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `user`, `password`, `avatar`, `last_login`, `failed_login`) VALUES
(1, 'admin', 'admin', 'admin', '5f4dcc3b5aa765d61d8327deb882cf99', 'http://localhost/dvwa/hackable/users/admin.jpg', '2017-05-07 16:28:34', 0),
(2, 'Gordon', 'Brown', 'gordonb', 'e99a18c428cb38d5f260853678922e03', 'http://localhost/dvwa/hackable/users/gordonb.jpg', '2017-05-07 16:28:34', 0),
(3, 'Hack', 'Me', '1337', '8d3533d75ae2c3966d7e0d4fcc69216b', 'http://localhost/dvwa/hackable/users/1337.jpg', '2017-05-07 16:28:34', 0),
(4, 'Pablo', 'Picasso', 'pablo', '0d107d09f5bbe40cade3de5c71e9e9b7', 'http://localhost/dvwa/hackable/users/pablo.jpg', '2017-05-07 16:28:34', 0),
(5, 'Bob', 'Smith', 'smithy', '5f4dcc3b5aa765d61d8327deb882cf99', 'http://localhost/dvwa/hackable/users/smithy.jpg', '2017-05-07 16:28:34', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `guestbook`
--
ALTER TABLE `guestbook`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `guestbook`
--
ALTER TABLE `guestbook`
  MODIFY `comment_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;--
-- Database: `hotelmis`
--
CREATE DATABASE IF NOT EXISTS `hotelmis` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `hotelmis`;

-- --------------------------------------------------------

--
-- Table structure for table `agents`
--

CREATE TABLE `agents` (
  `agentid` int(11) NOT NULL,
  `agentname` varchar(65) NOT NULL,
  `agents_ac_no` char(6) NOT NULL,
  `contact_person` varchar(65) DEFAULT NULL,
  `telephone` varchar(21) DEFAULT NULL,
  `fax` varchar(21) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `billing_address` varchar(15) DEFAULT NULL,
  `town` varchar(35) DEFAULT NULL,
  `postal_code` int(10) DEFAULT NULL,
  `road_street` varchar(65) DEFAULT NULL,
  `building` varchar(65) DEFAULT NULL,
  `ratesid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 120832 kB; InnoDB free: 120832 kB; InnoDB free:';

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`agentid`, `agentname`, `agents_ac_no`, `contact_person`, `telephone`, `fax`, `email`, `billing_address`, `town`, `postal_code`, `road_street`, `building`, `ratesid`) VALUES
(1, 'Kemri', 'K001', 'Hamida', '254-(0)41-522063', NULL, NULL, '230', 'Kilifi', 80108, NULL, NULL, 0),
(2, 'Plan', 'K002', 'Johnson', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
(5, 'Kiteco', 'K003', 'Charo', '', '', '', NULL, '', NULL, '', '', 0),
(6, 'Kilifi District Hospital', 'K006', 'Saulo', '', '', '', NULL, '', NULL, NULL, 'NULL', 0),
(7, 'Mnarani', 'K009', 'Steve', '', '', '', NULL, '', NULL, NULL, 'NULL', 0),
(8, 'KDDP', 'K010', 'Kombe', '', '', '', NULL, '', NULL, NULL, 'NULL', 0),
(9, 'TTN', 'K015', 'Tony', '', '', '', NULL, '', NULL, NULL, 'NULL', 0),
(10, 'World Vision', 'K055', 'Terry', '500263', NULL, NULL, '748', 'Kilifi', NULL, NULL, NULL, 0),
(11, 'Wonder Nuts', 'KN008', 'Pandre', '522063', NULL, NULL, '389', 'Kilifi', 80108, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `bill_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL COMMENT 'booking/reservation id',
  `date_billed` datetime NOT NULL,
  `billno` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) DEFAULT NULL,
  `date_checked` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 120832 kB; InnoDB free: 120832 kB; InnoDB free:';

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`bill_id`, `book_id`, `date_billed`, `billno`, `status`, `date_checked`) VALUES
(1, 1, '2006-08-22 00:00:00', 1, NULL, NULL),
(2, 2, '2006-08-27 00:00:00', 2, NULL, NULL),
(3, 3, '2006-08-29 00:00:00', 3, NULL, NULL),
(4, 1, '2006-08-29 00:00:00', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `book_id` int(11) NOT NULL,
  `guestid` varchar(40) NOT NULL,
  `booking_type` char(1) NOT NULL COMMENT 'direct/agent',
  `meal_plan` char(2) NOT NULL COMMENT 'bo/bb/hb/fb',
  `no_adults` tinyint(2) DEFAULT NULL,
  `no_child` tinyint(2) DEFAULT NULL,
  `checkin_date` date NOT NULL,
  `checkout_date` date NOT NULL,
  `residence_id` char(2) DEFAULT NULL COMMENT 'country_code',
  `payment_mode` tinyint(2) DEFAULT NULL,
  `agents_ac_no` char(6) DEFAULT NULL,
  `roomid` int(11) NOT NULL,
  `checkedin_by` int(11) DEFAULT NULL,
  `invoice_no` varchar(15) DEFAULT NULL,
  `billed` tinyint(1) DEFAULT NULL,
  `checkoutby` int(5) DEFAULT NULL,
  `codatetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 121856 kB; InnoDB free: 115712 kB; InnoDB free:';

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`book_id`, `guestid`, `booking_type`, `meal_plan`, `no_adults`, `no_child`, `checkin_date`, `checkout_date`, `residence_id`, `payment_mode`, `agents_ac_no`, `roomid`, `checkedin_by`, `invoice_no`, `billed`, `checkoutby`, `codatetime`) VALUES
(1, '1', 'D', 'BB', 1, NULL, '2006-08-22', '2006-08-25', 'KE', 1, NULL, 11, 1, NULL, 1, 2, '2006-08-22 16:02:08'),
(2, '2', 'A', 'BO', 1, NULL, '2006-08-27', '2006-08-29', 'KE', 1, NULL, 19, 1, NULL, 1, 2, '2006-08-25 14:52:01'),
(3, '2', 'D', 'BO', 1, NULL, '2006-08-29', '2006-08-31', 'KE', 1, NULL, 18, 1, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `countryid` smallint(6) NOT NULL,
  `country` varchar(150) NOT NULL,
  `countrycode` char(10) NOT NULL,
  `subscriber` char(19) DEFAULT NULL,
  `nationality` varchar(150) DEFAULT NULL,
  `currency` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 121856 kB; InnoDB free: 121856 kB; InnoDB free:';

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`countryid`, `country`, `countrycode`, `subscriber`, `nationality`, `currency`) VALUES
(1, 'ANDORRA, PRINCIPALITY OF                               ', 'AD', '', NULL, NULL),
(2, 'UNITED ARAB EMIRATES                                   ', 'AE', '971', NULL, NULL),
(3, 'AFGHANISTAN, ISLAMIC STATE OF                          ', 'AF', '', NULL, NULL),
(4, 'ANTIGUA AND BARBUDA                                    ', 'AG', '', NULL, NULL),
(5, 'ANGUILLA                                               ', 'AI', '+1-264*', NULL, NULL),
(6, 'ALBANIA                                                ', 'AL', '355', NULL, NULL),
(7, 'ARMENIA                                                ', 'AM', '374', NULL, NULL),
(8, 'NETHERLANDS ANTILLES                                   ', 'AN', '599', NULL, NULL),
(9, 'ANGOLA                                                 ', 'AO', '244', NULL, NULL),
(10, 'ANTARCTICA                                             ', 'AQ', '672', NULL, NULL),
(11, 'ARGENTINA                                              ', 'AR', '54', NULL, NULL),
(12, 'AMERICAN SAMOA                                         ', 'AS', '684', NULL, NULL),
(13, 'AUSTRIA                                                ', 'AT', '43', NULL, NULL),
(14, 'AUSTRALIA                                              ', 'AU', '61', NULL, NULL),
(15, 'ARUBA                                                  ', 'AW', '297', NULL, NULL),
(16, 'AZERBAIDJAN                                            ', 'AZ', '', NULL, NULL),
(17, 'BOSNIA-HERZEGOVINA                                     ', 'BA', '', NULL, NULL),
(18, 'BARBADOS                                               ', 'BB', '+1-246*', NULL, NULL),
(19, 'BANGLADESH                                             ', 'BD', '880', NULL, NULL),
(20, 'BELGIUM                                                ', 'BE', '32', NULL, NULL),
(21, 'BURKINA FASO                                           ', 'BF', '226', NULL, NULL),
(22, 'BULGARIA                                               ', 'BG', '359', NULL, NULL),
(23, 'BAHRAIN                                                ', 'BH', '973', NULL, NULL),
(24, 'BURUNDI                                                ', 'BI', '257', NULL, NULL),
(25, 'BENIN                                                  ', 'BJ', '229', NULL, NULL),
(26, 'BERMUDA                                                ', 'BM', '+1-441*', NULL, NULL),
(27, 'BRUNEI DARUSSALAM                                      ', 'BN', '673', NULL, NULL),
(28, 'BOLIVIA                                                ', 'BO', '591', NULL, NULL),
(29, 'BRAZIL                                                 ', 'BR', '55', NULL, NULL),
(30, 'BAHAMAS                                                ', 'BS', '+1-242*', NULL, NULL),
(31, 'BHUTAN                                                 ', 'BT', '975', NULL, NULL),
(32, 'BOUVET ISLAND                                          ', 'BV', '', NULL, NULL),
(33, 'BOTSWANA                                               ', 'BW', '267', NULL, NULL),
(34, 'BELARUS                                                ', 'BY', '375', NULL, NULL),
(35, 'BELIZE                                                 ', 'BZ', '501', NULL, NULL),
(36, 'CANADA                                                 ', 'CA', '1', NULL, NULL),
(37, 'COCOS (KEELING) ISLANDS                                ', 'CC', '', NULL, NULL),
(38, 'CENTRAL AFRICAN REPUBLIC                               ', 'CF', '236', NULL, NULL),
(39, 'CONGO, THE DEMOCRATIC REPUBLIC OF THE                  ', 'CD', '', NULL, NULL),
(40, 'CONGO                                                  ', 'CG', '242', NULL, NULL),
(41, 'SWITZERLAND                                            ', 'CH', '41', NULL, NULL),
(42, 'IVORY COAST (COTE D''IVOIRE)                            ', 'CI', '', NULL, NULL),
(43, 'COOK ISLANDS                                           ', 'CK', '682', NULL, NULL),
(44, 'CHILE                                                  ', 'CL', '56', NULL, NULL),
(45, 'CAMEROON                                               ', 'CM', '237', NULL, NULL),
(46, 'CHINA                                                  ', 'CN', '', NULL, NULL),
(47, 'COLOMBIA                                               ', 'CO', '57', NULL, NULL),
(48, 'COSTA RICA                                             ', 'CR', '506', NULL, NULL),
(49, 'FORMER CZECHOSLOVAKIA                                  ', 'CS', '', NULL, NULL),
(50, 'CUBA                                                   ', 'CU', '53', NULL, NULL),
(51, 'CAPE VERDE                                             ', 'CV', '', NULL, NULL),
(52, 'CHRISTMAS ISLAND                                       ', 'CX', '53', NULL, NULL),
(53, 'CYPRUS                                                 ', 'CY', '357', NULL, NULL),
(54, 'CZECH REPUBLIC                                         ', 'CZ', '420', NULL, NULL),
(55, 'GERMANY                                                ', 'DE', '49', NULL, NULL),
(56, 'DJIBOUTI                                               ', 'DJ', '253', NULL, NULL),
(57, 'DENMARK                                                ', 'DK', '45', NULL, NULL),
(58, 'DOMINICA                                               ', 'DM', '+1-767*', NULL, NULL),
(59, 'DOMINICAN REPUBLIC                                     ', 'DO', '+1-809*', NULL, NULL),
(60, 'ALGERIA                                                ', 'DZ', '213', NULL, NULL),
(61, 'ECUADOR                                                ', 'EC', '593', NULL, NULL),
(62, 'ESTONIA                                                ', 'EE', '372', NULL, NULL),
(63, 'EGYPT                                                  ', 'EG', '20', NULL, NULL),
(64, 'WESTERN SAHARA                                         ', 'EH', '', NULL, NULL),
(65, 'ERITREA                                                ', 'ER', '291', NULL, NULL),
(66, 'SPAIN                                                  ', 'ES', '34', NULL, NULL),
(67, 'ETHIOPIA                                               ', 'ET', '251', NULL, NULL),
(68, 'FINLAND                                                ', 'FI', '358', NULL, NULL),
(69, 'FIJI                                                   ', 'FJ', '', NULL, NULL),
(70, 'FALKLAND ISLANDS                                       ', 'FK', '', NULL, NULL),
(71, 'MICRONESIA                                             ', 'FM', '', NULL, NULL),
(72, 'FAROE ISLANDS                                          ', 'FO', '298', NULL, NULL),
(73, 'FRANCE                                                 ', 'FR', '33', NULL, NULL),
(74, 'FRANCE (EUROPEAN TERRITORY)                            ', 'FX', '', NULL, NULL),
(75, 'GABON                                                  ', 'GA', '', NULL, NULL),
(76, 'GREAT BRITAIN                                          ', 'GB', '', NULL, NULL),
(77, 'GRENADA                                                ', 'GD', '+1-473*', NULL, NULL),
(78, 'GEORGIA                                                ', 'GE', '995', NULL, NULL),
(79, 'FRENCH GUYANA                                          ', 'GF', '', NULL, NULL),
(80, 'GHANA                                                  ', 'GH', '233', NULL, NULL),
(81, 'GIBRALTAR                                              ', 'GI', '350', NULL, NULL),
(82, 'GREENLAND                                              ', 'GL', '299', NULL, NULL),
(83, 'GAMBIA                                                 ', 'GM', '220', NULL, NULL),
(84, 'GUINEA                                                 ', 'GN', '224', NULL, NULL),
(85, 'USA GOVERNMENT                                         ', 'GOV', '', NULL, NULL),
(86, 'GUADELOUPE (FRENCH)                                    ', 'GP', '', NULL, NULL),
(87, 'EQUATORIAL GUINEA                                      ', 'GQ', '240', NULL, NULL),
(88, 'GREECE                                                 ', 'GR', '30', NULL, NULL),
(89, 'S. GEORGIA & S. SANDWICH ISLS.                         ', 'GS', '', NULL, NULL),
(90, 'GUATEMALA                                              ', 'GT', '502', NULL, NULL),
(91, 'GUAM (USA)                                             ', 'GU', '', NULL, NULL),
(92, 'GUINEA BISSAU                                          ', 'GW', '', NULL, NULL),
(93, 'GUYANA                                                 ', 'GY', '592', NULL, NULL),
(94, 'HONG KONG                                              ', 'HK', '852', NULL, NULL),
(95, 'HEARD AND MCDONALD ISLANDS                             ', 'HM', '', NULL, NULL),
(96, 'HONDURAS                                               ', 'HN', '504', NULL, NULL),
(97, 'CROATIA                                                ', 'HR', '385', NULL, NULL),
(98, 'HAITI                                                  ', 'HT', '509', NULL, NULL),
(99, 'HUNGARY                                                ', 'HU', '36', NULL, NULL),
(100, 'INDONESIA                                              ', 'ID', '62', NULL, NULL),
(101, 'IRELAND                                                ', 'IE', '353', NULL, NULL),
(102, 'ISRAEL                                                 ', 'IL', '972', NULL, NULL),
(103, 'INDIA                                                  ', 'IN', '91', NULL, NULL),
(104, 'BRITISH INDIAN OCEAN TERRITORY                         ', 'IO', '', NULL, NULL),
(105, 'IRAQ                                                   ', 'IQ', '964', NULL, NULL),
(106, 'IRAN                                                   ', 'IR', '98', NULL, NULL),
(107, 'ICELAND                                                ', 'IS', '354', NULL, NULL),
(108, 'ITALY                                                  ', 'IT', '39', NULL, NULL),
(109, 'JAMAICA                                                ', 'JM', '+1-876*', NULL, NULL),
(110, 'JORDAN                                                 ', 'JO', '962', NULL, NULL),
(111, 'JAPAN                                                  ', 'JP', '81', NULL, NULL),
(112, 'KENYA                                                  ', 'KE', '254', NULL, NULL),
(113, 'KYRGYZ REPUBLIC (KYRGYZSTAN)                           ', 'KG', '', NULL, NULL),
(114, 'CAMBODIA, KINGDOM OF                                   ', 'KH', '', NULL, NULL),
(115, 'KIRIBATI                                               ', 'KI', '686', NULL, NULL),
(116, 'COMOROS                                                ', 'KM', '269', NULL, NULL),
(117, 'SAINT KITTS & NEVIS ANGUILLA                           ', 'KN', '', NULL, NULL),
(118, 'NORTH KOREA                                            ', 'KP', '', NULL, NULL),
(119, 'SOUTH KOREA                                            ', 'KR', '', NULL, NULL),
(120, 'KUWAIT                                                 ', 'KW', '965', NULL, NULL),
(121, 'CAYMAN ISLANDS                                         ', 'KY', '+1-345*', NULL, NULL),
(122, 'KAZAKHSTAN                                             ', 'KZ', '7', NULL, NULL),
(123, 'LAOS                                                   ', 'LA', '856', NULL, NULL),
(124, 'LEBANON                                                ', 'LB', '961', NULL, NULL),
(125, 'SAINT LUCIA                                            ', 'LC', '', NULL, NULL),
(126, 'LIECHTENSTEIN                                          ', 'LI', '423', NULL, NULL),
(127, 'SRI LANKA                                              ', 'LK', '94', NULL, NULL),
(128, 'LIBERIA                                                ', 'LR', '231', NULL, NULL),
(129, 'LESOTHO                                                ', 'LS', '266', NULL, NULL),
(130, 'LITHUANIA                                              ', 'LT', '370', NULL, NULL),
(131, 'LUXEMBOURG                                             ', 'LU', '352', NULL, NULL),
(132, 'LATVIA                                                 ', 'LV', '371', NULL, NULL),
(133, 'LIBYA                                                  ', 'LY', '218', NULL, NULL),
(134, 'MOROCCO                                                ', 'MA', '212', NULL, NULL),
(135, 'MONACO                                                 ', 'MC', '377', NULL, NULL),
(136, 'MOLDAVIA                                               ', 'MD', '', NULL, NULL),
(137, 'MADAGASCAR                                             ', 'MG', '261', NULL, NULL),
(138, 'MARSHALL ISLANDS                                       ', 'MH', '692', NULL, NULL),
(139, 'MACEDONIA                                              ', 'MK', '', NULL, NULL),
(140, 'MALI                                                   ', 'ML', '', NULL, NULL),
(141, 'MYANMAR                                                ', 'MM', '95', NULL, NULL),
(142, 'MONGOLIA                                               ', 'MN', '976', NULL, NULL),
(143, 'MACAU                                                  ', 'MO', '', NULL, NULL),
(144, 'NORTHERN MARIANA ISLANDS                               ', 'MP', '', NULL, NULL),
(145, 'MARTINIQUE (FRENCH)                                    ', 'MQ', '', NULL, NULL),
(146, 'MAURITANIA                                             ', 'MR', '222', NULL, NULL),
(147, 'MONTSERRAT                                             ', 'MS', '+1-664*', NULL, NULL),
(148, 'MALTA                                                  ', 'MT', '356', NULL, NULL),
(149, 'MAURITIUS                                              ', 'MU', '230', NULL, NULL),
(150, 'MALDIVES                                               ', 'MV', '960', NULL, NULL),
(151, 'MALAWI                                                 ', 'MW', '265', NULL, NULL),
(152, 'MEXICO                                                 ', 'MX', '52', NULL, NULL),
(153, 'MALAYSIA                                               ', 'MY', '60', NULL, NULL),
(154, 'MOZAMBIQUE                                             ', 'MZ', '258', NULL, NULL),
(155, 'NAMIBIA                                                ', 'NA', '264', NULL, NULL),
(156, 'NEW CALEDONIA (FRENCH)                                 ', 'NC', '', NULL, NULL),
(157, 'NIGER                                                  ', 'NE', '227', NULL, NULL),
(158, 'NORFOLK ISLAND                                         ', 'NF', '672', NULL, NULL),
(159, 'NIGERIA                                                ', 'NG', '234', NULL, NULL),
(160, 'NICARAGUA                                              ', 'NI', '505', NULL, NULL),
(161, 'NETHERLANDS                                            ', 'NL', '31', NULL, NULL),
(162, 'NORWAY                                                 ', 'NO', '47', NULL, NULL),
(163, 'NEPAL                                                  ', 'NP', '977', NULL, NULL),
(164, 'NAURU                                                  ', 'NR', '674', NULL, NULL),
(165, 'NIUE                                                   ', 'NU', '683', NULL, NULL),
(166, 'NEW ZEALAND                                            ', 'NZ', '64', NULL, NULL),
(167, 'OMAN                                                   ', 'OM', '968', NULL, NULL),
(168, 'PANAMA                                                 ', 'PA', '507', NULL, NULL),
(169, 'PERU                                                   ', 'PE', '51', NULL, NULL),
(170, 'POLYNESIA (FRENCH)                                     ', 'PF', '', NULL, NULL),
(171, 'PAPUA NEW GUINEA                                       ', 'PG', '675', NULL, NULL),
(172, 'PHILIPPINES                                            ', 'PH', '63', NULL, NULL),
(173, 'PAKISTAN                                               ', 'PK', '92', NULL, NULL),
(174, 'POLAND                                                 ', 'PL', '48', NULL, NULL),
(175, 'SAINT PIERRE AND MIQUELON                              ', 'PM', '', NULL, NULL),
(176, 'PITCAIRN ISLAND                                        ', 'PN', '', NULL, NULL),
(177, 'PUERTO RICO                                            ', 'PR', '+1-787* or +1-939*', NULL, NULL),
(178, 'PORTUGAL                                               ', 'PT', '351', NULL, NULL),
(179, 'PALAU                                                  ', 'PW', '680', NULL, NULL),
(180, 'PARAGUAY                                               ', 'PY', '595', NULL, NULL),
(181, 'QATAR                                                  ', 'QA', '974', NULL, NULL),
(182, 'REUNION (FRENCH)                                       ', 'RE', '', NULL, NULL),
(183, 'ROMANIA                                                ', 'RO', '40', NULL, NULL),
(184, 'RUSSIAN FEDERATION                                     ', 'RU', '', NULL, NULL),
(185, 'RWANDA                                                 ', 'RW', '', NULL, NULL),
(186, 'SAUDI ARABIA                                           ', 'SA', '966', NULL, NULL),
(187, 'SOLOMON ISLANDS                                        ', 'SB', '677', NULL, NULL),
(188, 'SEYCHELLES                                             ', 'SC', '', NULL, NULL),
(189, 'SUDAN                                                  ', 'SD', '249', NULL, NULL),
(190, 'SWEDEN                                                 ', 'SE', '46', NULL, NULL),
(191, 'SINGAPORE                                              ', 'SG', '65', NULL, NULL),
(192, 'SAINT HELENA                                           ', 'SH', '', NULL, NULL),
(193, 'SLOVENIA                                               ', 'SI', '386', NULL, NULL),
(194, 'SVALBARD AND JAN MAYEN ISLANDS                         ', 'SJ', '', NULL, NULL),
(195, 'SLOVAK REPUBLIC                                        ', 'SK', '421', NULL, NULL),
(196, 'SIERRA LEONE                                           ', 'SL', '232', NULL, NULL),
(197, 'SAN MARINO                                             ', 'SM', '378', NULL, NULL),
(198, 'SENEGAL                                                ', 'SN', '221', NULL, NULL),
(199, 'SOMALIA                                                ', 'SO', '', NULL, NULL),
(200, 'SURINAME                                               ', 'SR', '597', NULL, NULL),
(201, 'SAINT TOME (SAO TOME) AND PRINCIPE                     ', 'ST', '', NULL, NULL),
(202, 'FORMER USSR                                            ', 'SU', '', NULL, NULL),
(203, 'EL SALVADOR                                            ', 'SV', '503', NULL, NULL),
(204, 'SYRIA                                                  ', 'SY', '963', NULL, NULL),
(205, 'SWAZILAND                                              ', 'SZ', '268', NULL, NULL),
(206, 'TURKS AND CAICOS ISLANDS                               ', 'TC', '+1-649*', NULL, NULL),
(207, 'CHAD                                                   ', 'TD', '235', NULL, NULL),
(208, 'FRENCH SOUTHERN TERRITORIES                            ', 'TF', '', NULL, NULL),
(209, 'TOGO                                                   ', 'TG', '', NULL, NULL),
(210, 'THAILAND                                               ', 'TH', '66', NULL, NULL),
(211, 'TADJIKISTAN                                            ', 'TJ', '', NULL, NULL),
(212, 'TOKELAU                                                ', 'TK', '690', NULL, NULL),
(213, 'TURKMENISTAN                                           ', 'TM', '993', NULL, NULL),
(214, 'TUNISIA                                                ', 'TN', '216', NULL, NULL),
(215, 'TONGA                                                  ', 'TO', '', NULL, NULL),
(216, 'EAST TIMOR                                             ', 'TP', '670', NULL, NULL),
(217, 'TURKEY                                                 ', 'TR', '90', NULL, NULL),
(218, 'TRINIDAD AND TOBAGO                                    ', 'TT', '', NULL, NULL),
(219, 'TUVALU                                                 ', 'TV', '688', NULL, NULL),
(220, 'TAIWAN                                                 ', 'TW', '886', NULL, NULL),
(221, 'TANZANIA                                               ', 'TZ', '255', NULL, NULL),
(222, 'UKRAINE                                                ', 'UA', '380', NULL, NULL),
(223, 'UGANDA                                                 ', 'UG', '256', NULL, NULL),
(224, 'UNITED KINGDOM                                         ', 'UK', '44', NULL, NULL),
(225, 'USA MINOR OUTLYING ISLANDS                             ', 'UM', '', NULL, NULL),
(226, 'UNITED STATES                                          ', 'US', '', NULL, NULL),
(227, 'URUGUAY                                                ', 'UY', '598', NULL, NULL),
(228, 'UZBEKISTAN                                             ', 'UZ', '998', NULL, NULL),
(229, 'HOLY SEE (VATICAN CITY STATE)                          ', 'VA', '', NULL, NULL),
(230, 'SAINT VINCENT & GRENADINES                             ', 'VC', '', NULL, NULL),
(231, 'VENEZUELA                                              ', 'VE', '58', NULL, NULL),
(232, 'VIRGIN ISLANDS (BRITISH)                               ', 'VG', '', NULL, NULL),
(233, 'VIRGIN ISLANDS (USA)                                   ', 'VI', '', NULL, NULL),
(234, 'VIETNAM                                                ', 'VN', '84', NULL, NULL),
(235, 'VANUATU                                                ', 'VU', '678', NULL, NULL),
(236, 'WALLIS AND FUTUNA ISLANDS                              ', 'WF', '681', NULL, NULL),
(237, 'SAMOA                                                  ', 'WS', '', NULL, NULL),
(238, 'YEMEN                                                  ', 'YE', '967', NULL, NULL),
(239, 'MAYOTTE                                                ', 'YT', '', NULL, NULL),
(240, 'YUGOSLAVIA                                             ', 'YU', '', NULL, NULL),
(241, 'SOUTH AFRICA                                           ', 'ZA', '27', NULL, NULL),
(242, 'ZAMBIA                                                 ', 'ZM', '260', NULL, NULL),
(243, 'ZAIRE                                                  ', 'ZR', '', NULL, NULL),
(244, 'ZIMBABWE                                               ', 'ZW', '263', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `details`
--

CREATE TABLE `details` (
  `itemid` int(11) NOT NULL,
  `item` varchar(35) NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  `sale` tinyint(1) DEFAULT NULL,
  `expense` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 120832 kB; InnoDB free: 120832 kB; InnoDB free:';

--
-- Dumping data for table `details`
--

INSERT INTO `details` (`itemid`, `item`, `description`, `sale`, `expense`) VALUES
(1, 'Accomodation', NULL, NULL, NULL),
(2, 'Bar', NULL, NULL, NULL),
(3, 'Conference', NULL, NULL, NULL),
(4, 'Restaurant', NULL, NULL, NULL),
(5, 'Laundry', NULL, NULL, NULL),
(6, 'Other', NULL, NULL, NULL),
(7, 'Trousers', 'Laundry', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctypes`
--

CREATE TABLE `doctypes` (
  `doc_id` int(11) NOT NULL,
  `doc_code` varchar(5) NOT NULL,
  `doc_type` varchar(25) NOT NULL,
  `remarks` longtext,
  `accounts` tinyint(4) DEFAULT NULL,
  `cooperative` tinyint(4) DEFAULT NULL,
  `payroll` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 120832 kB; InnoDB free: 120832 kB; InnoDB free:';

--
-- Dumping data for table `doctypes`
--

INSERT INTO `doctypes` (`doc_id`, `doc_code`, `doc_type`, `remarks`, `accounts`, `cooperative`, `payroll`) VALUES
(1, 'RECEI', 'RECEIPT                  ', NULL, 1, 1, NULL),
(2, 'INVOI', 'INVOICE                  ', NULL, 1, 1, NULL),
(3, 'ADVAN', 'ADVANCE                  ', NULL, 1, NULL, 1),
(4, 'SPADV', 'SPECIAL ADVANCE          ', NULL, 1, NULL, 1),
(5, 'LOANS', 'LOANS                    ', NULL, NULL, 1, 1),
(6, 'SHARE', 'SHARES                   ', NULL, NULL, 1, 1),
(7, 'OVEDE', 'OVER DEDUCTION           ', NULL, NULL, 1, 1),
(8, 'UNDED', 'UNDER DEDUCTION          ', NULL, 1, 1, 1),
(9, 'CSHPV', 'CASH PAYMENT VOUCHER     ', NULL, NULL, 1, NULL),
(10, 'CSHRV', 'CASH RECEIVED VOUCHER    ', NULL, NULL, 1, NULL),
(11, 'CHQRV', 'CHEQUE RECEIVED VOUCHER  ', NULL, NULL, 1, NULL),
(12, 'CRVCH', 'CREDIT VOUCHER           ', NULL, 1, 1, 1),
(13, 'DRVCH', 'DEBIT VOUCHER            ', NULL, 1, 1, 1),
(14, 'CDPVC', 'CASH DEPOSIT VOUCHER     ', NULL, NULL, NULL, NULL),
(15, 'CHDVC', 'CHEQUE DEPOSIT VOUCHER   ', NULL, 1, 1, NULL),
(16, 'PCSVC', 'PETTY CASH VOUCER        ', NULL, NULL, NULL, NULL),
(17, 'WTVCH', 'WITHDRAWAL VOUCHER       ', NULL, 1, 1, NULL),
(18, 'CRADV', 'CREDIT ADVICE            ', NULL, 1, 1, 0),
(19, 'DRADV', 'DEBIT ADVICE             ', NULL, 1, 1, NULL),
(20, 'IMPVC', 'IMPREST VOUCHER          ', NULL, 1, 1, NULL),
(21, 'chit', 'chits', 'for credit sales', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `guestbook`
--

CREATE TABLE `guestbook` (
  `gb_index` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `message` mediumtext,
  `reply` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guestbook`
--

INSERT INTO `guestbook` (`gb_index`, `name`, `email`, `date`, `message`, `reply`) VALUES
(1, 'Tony', 'tkazungu@kilifi.mimcom.net', '2006-03-29 16:46:39', 'good', NULL),
(2, 'Metrine', 'msaisi@lycos.com', '2006-03-29 16:56:01', 'wddw', NULL),
(3, 'Metrine', 'msaisi@lycos.com', '2006-03-30 08:49:59', 'Trial', NULL),
(4, 'Tony Iha Kazungu', 'tiha@taifaweb.net', '2006-04-02 09:39:56', 'Got to start from somewhere', NULL),
(5, 'Tony Iha Kazungu', 'tiha@taifaweb.net', '2006-04-02 09:43:16', 'Got to start from somewhere', NULL),
(6, 'Metrine Muhavi', 'msaisi@lycos.com', '2006-04-02 09:56:14', 'Well done hubby', NULL),
(7, 'fgfd', '@', '2006-04-02 10:02:25', 'ddd', NULL),
(8, 'dsd', '@', '2006-04-02 10:07:24', 'dfd', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `guests`
--

CREATE TABLE `guests` (
  `guestid` int(11) NOT NULL,
  `lastname` varchar(40) NOT NULL,
  `firstname` varchar(20) DEFAULT NULL,
  `middlename` varchar(15) DEFAULT NULL,
  `pp_no` varchar(15) DEFAULT NULL,
  `idno` int(11) UNSIGNED DEFAULT NULL,
  `countrycode` char(2) NOT NULL,
  `pobox` varchar(10) DEFAULT NULL,
  `town` varchar(30) DEFAULT NULL,
  `postal_code` varchar(5) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `mobilephone` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 121856 kB; InnoDB free: 115712 kB; InnoDB free:';

--
-- Dumping data for table `guests`
--

INSERT INTO `guests` (`guestid`, `lastname`, `firstname`, `middlename`, `pp_no`, `idno`, `countrycode`, `pobox`, `town`, `postal_code`, `phone`, `email`, `mobilephone`) VALUES
(1, 'Kazungu', 'Tony', 'Iha', NULL, 13487317, 'KE', '938', 'Kilifi', '80108', '041-522482', 'tiha@taifaweb.net', '0733-716747'),
(2, 'Mramba', 'Joseph', 'Kazungu', NULL, 13487316, 'KE', '389', 'Kilifi', '80108', '041-522482', 'jmramba@lycos.com', '0722-851632'),
(3, 'Emilly', 'Anne', 'Boodled', '03334071114', NULL, 'IO', '', '', '', '0044', '', '2089402800'),
(4, 'Engelsman', 'Floris', 'Alexander', '474187396', NULL, 'DE', '74523', 'SCHWAB.HALL', '', '', '', ''),
(5, 'Muiruri', 'Isabel', 'mugure', NULL, 11816707, 'KE', '', '', '', '0722277559', '', ''),
(6, 'Okombo', 'Okoth', '', NULL, 4827722, 'KE', '00508', 'Nairobi', '76420', '', '', '0721468696');

-- --------------------------------------------------------

--
-- Table structure for table `payment_mode`
--

CREATE TABLE `payment_mode` (
  `paymentid` int(11) NOT NULL,
  `payment_option` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 120832 kB';

--
-- Dumping data for table `payment_mode`
--

INSERT INTO `payment_mode` (`paymentid`, `payment_option`) VALUES
(1, 'Cash'),
(2, 'Credit Card'),
(3, 'Cheque'),
(4, 'Company'),
(5, 'Money Order'),
(6, 'Western Union');

-- --------------------------------------------------------

--
-- Table structure for table `php_session`
--

CREATE TABLE `php_session` (
  `session_id` varchar(32) NOT NULL DEFAULT '',
  `user_id` varchar(16) DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `session_data` longtext
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rates`
--

CREATE TABLE `rates` (
  `ratesid` int(11) NOT NULL,
  `bookingtype` char(1) NOT NULL COMMENT 'Direct/Agent',
  `occupancy` char(1) NOT NULL COMMENT 'single/double/family',
  `rate_type` char(1) NOT NULL COMMENT 'resident/non-resident',
  `bo` decimal(10,0) NOT NULL,
  `bb` decimal(10,0) NOT NULL,
  `hb` decimal(10,0) NOT NULL,
  `fb` decimal(10,0) NOT NULL,
  `currency` varchar(45) NOT NULL,
  `date_started` date NOT NULL,
  `date_stopped` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 120832 kB; InnoDB free: 120832 kB; InnoDB free:';

--
-- Dumping data for table `rates`
--

INSERT INTO `rates` (`ratesid`, `bookingtype`, `occupancy`, `rate_type`, `bo`, `bb`, `hb`, `fb`, `currency`, `date_started`, `date_stopped`) VALUES
(1, 'D', 'S', 'R', '700', '950', '1550', '1950', 'Ksh.', '2006-07-01', '2006-07-09');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` int(11) NOT NULL,
  `reserved_through` varchar(15) NOT NULL,
  `guestid` varchar(40) NOT NULL,
  `reservation_by` varchar(35) DEFAULT NULL,
  `reservation_by_phone` varchar(23) DEFAULT NULL,
  `datereserved` date NOT NULL,
  `reserve_checkindate` date NOT NULL,
  `reserve_checkoutdate` date DEFAULT NULL,
  `no_adults` tinyint(2) DEFAULT NULL,
  `no_child0_5` tinyint(2) DEFAULT NULL,
  `no_child6_12` tinyint(2) DEFAULT NULL,
  `no_babies` tinyint(2) DEFAULT NULL,
  `meal_plan` char(2) DEFAULT NULL,
  `billing_instructions` text,
  `deposit` decimal(9,2) DEFAULT NULL,
  `agents_ac_no` char(6) DEFAULT NULL,
  `voucher_no` varchar(15) DEFAULT NULL,
  `reserved_by` int(11) NOT NULL,
  `date_reserved` date DEFAULT NULL,
  `confirmed_by` int(11) DEFAULT NULL,
  `confirmed_date` date DEFAULT NULL,
  `roomid` int(11) NOT NULL,
  `billed` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 121856 kB; InnoDB free: 115712 kB; InnoDB free:';

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reservation_id`, `reserved_through`, `guestid`, `reservation_by`, `reservation_by_phone`, `datereserved`, `reserve_checkindate`, `reserve_checkoutdate`, `no_adults`, `no_child0_5`, `no_child6_12`, `no_babies`, `meal_plan`, `billing_instructions`, `deposit`, `agents_ac_no`, `voucher_no`, `reserved_by`, `date_reserved`, `confirmed_by`, `confirmed_date`, `roomid`, `billed`) VALUES
(1, 'T', '3', NULL, NULL, '2006-08-29', '2006-08-31', '2006-09-04', 1, NULL, NULL, NULL, 'BB', NULL, '650.00', NULL, NULL, 2, NULL, NULL, NULL, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `roomid` int(11) NOT NULL,
  `roomno` mediumint(3) NOT NULL DEFAULT '0',
  `roomtypeid` int(11) DEFAULT NULL,
  `roomname` varchar(35) DEFAULT NULL,
  `noofrooms` tinyint(3) DEFAULT NULL,
  `occupancy` tinyint(2) DEFAULT NULL,
  `tv` char(1) DEFAULT NULL,
  `aircondition` char(1) DEFAULT NULL,
  `fun` char(1) DEFAULT NULL,
  `safe` char(1) DEFAULT NULL,
  `fridge` char(1) DEFAULT NULL,
  `status` char(1) DEFAULT NULL COMMENT '(V)acant/(R)eserverd/(B)ooked/(L)ocked',
  `photo` longblob,
  `filetype` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 119808 kB; InnoDB free: 119808 kB; InnoDB free:';

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`roomid`, `roomno`, `roomtypeid`, `roomname`, `noofrooms`, `occupancy`, `tv`, `aircondition`, `fun`, `safe`, `fridge`, `status`, `photo`, `filetype`) VALUES
(1, 102, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'V', NULL, NULL),
(2, 103, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'V', NULL, NULL),
(3, 104, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'V', NULL, NULL),
(4, 105, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'V', NULL, NULL),
(5, 106, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'V', NULL, NULL),
(6, 109, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'R', NULL, NULL),
(7, 110, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'V', NULL, NULL),
(8, 111, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'V', NULL, NULL),
(9, 112, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'V', NULL, NULL),
(10, 113, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'V', NULL, NULL),
(11, 114, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'V', NULL, NULL),
(12, 201, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'V', NULL, NULL),
(13, 202, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'V', NULL, NULL),
(14, 203, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'V', NULL, NULL),
(15, 204, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'V', NULL, NULL),
(16, 205, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'V', NULL, NULL),
(17, 206, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'V', NULL, NULL),
(18, 208, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'B', NULL, NULL),
(19, 209, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'V', NULL, NULL),
(20, 210, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'V', NULL, NULL),
(21, 211, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'V', NULL, NULL),
(22, 212, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'V', NULL, NULL),
(23, 213, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'V', NULL, NULL),
(24, 214, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'V', NULL, NULL),
(25, 301, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'V', NULL, NULL),
(26, 302, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'V', NULL, NULL),
(27, 303, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'V', NULL, NULL),
(28, 304, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'V', NULL, NULL),
(29, 305, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'V', NULL, NULL),
(30, 306, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'V', NULL, NULL),
(31, 307, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'V', NULL, NULL),
(32, 308, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'V', NULL, NULL),
(33, 309, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'V', NULL, NULL),
(34, 310, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'V', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roomtype`
--

CREATE TABLE `roomtype` (
  `roomtypeid` int(11) NOT NULL,
  `roomtype` varchar(15) NOT NULL,
  `description` tinytext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roomtype`
--

INSERT INTO `roomtype` (`roomtypeid`, `roomtype`, `description`) VALUES
(1, 'standard', NULL),
(2, 'family', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id_session` varchar(32) NOT NULL DEFAULT '',
  `moment` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transno` int(11) NOT NULL,
  `billno` int(11) NOT NULL,
  `doc_type` char(15) NOT NULL COMMENT 'Receipt/Invoice/Chit/Bill',
  `doc_no` int(11) NOT NULL,
  `doc_date` date NOT NULL,
  `details` varchar(65) NOT NULL,
  `dr` decimal(10,2) DEFAULT NULL,
  `cr` decimal(10,2) DEFAULT NULL,
  `trans_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Bill Postings; InnoDB free: 120832 kB; InnoDB free: 120832 k';

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transno`, `billno`, `doc_type`, `doc_no`, `doc_date`, `details`, `dr`, `cr`, `trans_date`) VALUES
(1, 1, 'Reciept', 161, '2006-08-23', '1', NULL, '650.00', '2006-08-22 09:09:44');

-- --------------------------------------------------------

--
-- Table structure for table `transtype`
--

CREATE TABLE `transtype` (
  `trans_id` int(11) NOT NULL,
  `trans_code` varchar(5) NOT NULL,
  `trans_type` varchar(25) NOT NULL,
  `remarks` longtext,
  `accounts` tinyint(4) DEFAULT NULL,
  `cooperative` tinyint(4) DEFAULT NULL,
  `payroll` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 120832 kB; InnoDB free: 120832 kB; InnoDB free:';

--
-- Dumping data for table `transtype`
--

INSERT INTO `transtype` (`trans_id`, `trans_code`, `trans_type`, `remarks`, `accounts`, `cooperative`, `payroll`) VALUES
(1, 'RECEI', 'RECEIPT                  ', NULL, 1, 1, NULL),
(2, 'PAYME', 'PAYMENTS                 ', NULL, 1, 1, NULL),
(3, 'RECOV', 'RECOVERY                 ', NULL, NULL, 1, 1),
(4, 'DEDUC', 'DEDUCTIONS               ', NULL, NULL, 1, 1),
(5, 'CONTR', 'CONTRIBUTIONS            ', NULL, NULL, 1, 1),
(6, 'ADJUS', 'ADJUSTMENTS              ', NULL, NULL, 1, 1),
(7, 'REFUN', 'REFUNDS                  ', NULL, NULL, 1, 1),
(8, 'TRANS', 'Transfers', 'Transfering funds', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` smallint(6) NOT NULL,
  `fname` varchar(25) NOT NULL,
  `sname` varchar(25) NOT NULL,
  `loginname` varchar(15) NOT NULL,
  `pass` varchar(32) NOT NULL,
  `phone` int(25) DEFAULT NULL,
  `mobile` int(11) DEFAULT NULL,
  `fax` int(11) DEFAULT NULL,
  `email` varchar(65) DEFAULT NULL,
  `dateregistered` date DEFAULT NULL,
  `countrycode` smallint(6) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `guest` tinyint(1) NOT NULL DEFAULT '0',
  `reservation` tinyint(1) NOT NULL DEFAULT '0',
  `booking` tinyint(1) NOT NULL DEFAULT '0',
  `agents` tinyint(1) NOT NULL DEFAULT '0',
  `rooms` tinyint(1) NOT NULL DEFAULT '0',
  `billing` tinyint(1) NOT NULL DEFAULT '0',
  `rates` tinyint(1) NOT NULL DEFAULT '0',
  `lookup` tinyint(1) NOT NULL DEFAULT '0',
  `reports` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 121856 kB; InnoDB free: 121856 kB; InnoDB free:';

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `fname`, `sname`, `loginname`, `pass`, `phone`, `mobile`, `fax`, `email`, `dateregistered`, `countrycode`, `admin`, `guest`, `reservation`, `booking`, `agents`, `rooms`, `billing`, `rates`, `lookup`, `reports`) VALUES
(1, 'Tony', 'Kazungu', 'tiha', 'f9b96489e9fd87f2cac2addbe813b615', 735716747, 735716747, NULL, 'tkazungu@kilifi.mimcom.net', NULL, 112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 'Tony', 'Iha', 'admin', '1b3231655cebb7a1f783eddf27d254ca', NULL, NULL, NULL, NULL, '2006-07-07', NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(3, 'Mohamed', 'Said', 'msaid', 'b7b791e873f143d5318310e59022175d', NULL, NULL, NULL, NULL, '2006-07-11', NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
(4, 'Metrine', 'Saisi', 'msaisi', '3edfba58e66acf6f73742e7fbdb908c6', NULL, NULL, NULL, NULL, '2006-07-11', NULL, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0),
(5, 'demo', 'demo', 'demo', 'fe01ce2a7fbac8fafaed7c982a04e229', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_online`
--

CREATE TABLE `users_online` (
  `id` bigint(20) NOT NULL,
  `timestamp` int(15) NOT NULL DEFAULT '0',
  `ip` varchar(40) NOT NULL DEFAULT '',
  `file` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_online`
--

INSERT INTO `users_online` (`id`, `timestamp`, `ip`, `file`) VALUES
(591, 1143969163, '127.0.0.1', '/titanic/photogallery/photo.php'),
(592, 1143969164, '127.0.0.1', '/titanic/photogallery/photo.php'),
(593, 1143969166, '127.0.0.1', '/titanic/photogallery/photo.php'),
(594, 1143969168, '127.0.0.1', '/titanic/photogallery/photo.php'),
(595, 1143969169, '127.0.0.1', '/titanic/photogallery/photo.php'),
(596, 1143969171, '127.0.0.1', '/titanic/photogallery/photo.php'),
(597, 1143969177, '127.0.0.1', '/titanic/photogallery/photo.php'),
(598, 1143969179, '127.0.0.1', '/titanic/photogallery/photo.php'),
(599, 1143969450, '127.0.0.1', '/titanic/rooms.php'),
(600, 1143969457, '127.0.0.1', '/titanic/offers.php'),
(601, 1143969458, '127.0.0.1', '/titanic/location.php'),
(572, 1143969021, '127.0.0.1', '/titanic/index.php'),
(573, 1143969023, '127.0.0.1', '/titanic/ourservices.php'),
(574, 1143969023, '127.0.0.1', '/titanic/ourservices.php'),
(575, 1143969025, '127.0.0.1', '/titanic/rooms.php'),
(576, 1143969028, '127.0.0.1', '/titanic/menu.php'),
(577, 1143969034, '127.0.0.1', '/titanic/dailymenu.php'),
(578, 1143969034, '127.0.0.1', '/titanic/menu.php'),
(579, 1143969038, '127.0.0.1', '/titanic/offers.php'),
(580, 1143969039, '127.0.0.1', '/titanic/location.php'),
(581, 1143969046, '127.0.0.1', '/titanic/index.php'),
(582, 1143969051, '127.0.0.1', '/titanic/index.php'),
(583, 1143969062, '127.0.0.1', '/titanic/index.php'),
(584, 1143969073, '127.0.0.1', '/titanic/reservation.php'),
(585, 1143969075, '127.0.0.1', '/titanic/contactus.php'),
(586, 1143969078, '127.0.0.1', '/titanic/photogallery/photo.php'),
(587, 1143969152, '127.0.0.1', '/titanic/photogallery/photo.php'),
(588, 1143969155, '127.0.0.1', '/titanic/photogallery/photo.php'),
(589, 1143969157, '127.0.0.1', '/titanic/photogallery/photo.php'),
(590, 1143969159, '127.0.0.1', '/titanic/photogallery/photo.php'),
(571, 1143969018, '127.0.0.1', '/titanic/index.php');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agents`
--
ALTER TABLE `agents`
  ADD PRIMARY KEY (`agentid`),
  ADD UNIQUE KEY `agentcode` (`agents_ac_no`);

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`bill_id`,`billno`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`book_id`),
  ADD UNIQUE KEY `id` (`book_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`countryid`),
  ADD UNIQUE KEY `countrycode` (`countrycode`),
  ADD KEY `country` (`country`);

--
-- Indexes for table `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`itemid`);

--
-- Indexes for table `doctypes`
--
ALTER TABLE `doctypes`
  ADD PRIMARY KEY (`doc_id`);

--
-- Indexes for table `guestbook`
--
ALTER TABLE `guestbook`
  ADD PRIMARY KEY (`gb_index`);

--
-- Indexes for table `guests`
--
ALTER TABLE `guests`
  ADD PRIMARY KEY (`guestid`),
  ADD UNIQUE KEY `id` (`guestid`);

--
-- Indexes for table `payment_mode`
--
ALTER TABLE `payment_mode`
  ADD PRIMARY KEY (`paymentid`);

--
-- Indexes for table `php_session`
--
ALTER TABLE `php_session`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `last_updated` (`last_updated`);

--
-- Indexes for table `rates`
--
ALTER TABLE `rates`
  ADD PRIMARY KEY (`ratesid`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`),
  ADD UNIQUE KEY `id` (`reservation_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`roomid`,`roomno`);

--
-- Indexes for table `roomtype`
--
ALTER TABLE `roomtype`
  ADD PRIMARY KEY (`roomtypeid`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transno`);

--
-- Indexes for table `transtype`
--
ALTER TABLE `transtype`
  ADD PRIMARY KEY (`trans_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`),
  ADD UNIQUE KEY `userid` (`userid`),
  ADD UNIQUE KEY `loginname` (`loginname`),
  ADD KEY `names` (`fname`,`sname`);

--
-- Indexes for table `users_online`
--
ALTER TABLE `users_online`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ip` (`ip`),
  ADD KEY `file` (`file`),
  ADD KEY `timestamp` (`timestamp`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `agents`
--
ALTER TABLE `agents`
  MODIFY `agentid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `bill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `countryid` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=245;
--
-- AUTO_INCREMENT for table `details`
--
ALTER TABLE `details`
  MODIFY `itemid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `doctypes`
--
ALTER TABLE `doctypes`
  MODIFY `doc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `guestbook`
--
ALTER TABLE `guestbook`
  MODIFY `gb_index` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `guests`
--
ALTER TABLE `guests`
  MODIFY `guestid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `payment_mode`
--
ALTER TABLE `payment_mode`
  MODIFY `paymentid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `rates`
--
ALTER TABLE `rates`
  MODIFY `ratesid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `roomid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `roomtype`
--
ALTER TABLE `roomtype`
  MODIFY `roomtypeid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `transtype`
--
ALTER TABLE `transtype`
  MODIFY `trans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users_online`
--
ALTER TABLE `users_online`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=602;--
-- Database: `java`
--
CREATE DATABASE IF NOT EXISTS `java` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `java`;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `empNo` int(11) DEFAULT NULL,
  `empName` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`empNo`, `empName`) VALUES
(1, 'ropali'),
(2, 'rohan'),
(3, 'dubey'),
(4, 'patil'),
(5, 'suhas'),
(6, 'utkarsh'),
(7, 'nitin');
--
-- Database: `myboutique`
--
CREATE DATABASE IF NOT EXISTS `myboutique` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `myboutique`;

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `brandname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`id`, `brandname`) VALUES
(2, 'nike'),
(3, 'polo'),
(4, 'lazzer'),
(9, 'reebok'),
(10, 'eva moda'),
(11, 'levi&#039;s');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `items` text NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `paid` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `items`, `product_id`, `customer_id`, `paid`) VALUES
(20, '[{"id":"1","size":"32","quantity":2}]', 1, 3, 1),
(34, '[{"id":"11","size":"small","quantity":1}]', 11, 2, 1),
(35, '[{"id":"13","size":"small","quantity":1}]', 13, 2, 1),
(36, '[{"id":"19","size":"small","quantity":2}]', 19, 2, 1),
(37, '[{"id":"9","size":"small","quantity":"1"}]', 9, 3, 1),
(38, '[{"id":"20","size":"medium","quantity":"1"}]', 20, 3, 1),
(39, '[{"id":"2","size":"medium","quantity":"1"}]', 2, 3, 1),
(40, '[{"id":"2","size":"medium","quantity":"2"}]', 2, 2, 1),
(41, '[{"id":"9","size":"small","quantity":"2"}]', 9, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `parent` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `parent`) VALUES
(1, 'men', 0),
(2, 'women', 0),
(3, 'girls', 0),
(4, 'Shirts', 1),
(5, 'pants', 1),
(6, 'shoes', 1),
(7, 'accessories', 1),
(8, 'shirts', 2),
(9, 'Dresses', 2),
(10, 'footwears', 2),
(11, 'jeans', 2),
(12, 'shirts', 3),
(13, 'dresses', 3),
(17, 'footwears', 3),
(40, 'boys', 0),
(41, 'shirts', 40),
(42, 'Jeans', 40),
(47, 'Shoes', 40),
(48, 'accessories', 40),
(49, 'accessories', 2);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `contact_no` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `full_name`, `email`, `password`, `contact_no`) VALUES
(2, 'ropali munshi', 'ropali@gmail.com', '$2y$10$shg/tfWpCfbziXssDmlCZOtUOvWtFX/58PUmwAElM01FNhUxn2C8u', 1010101010),
(3, 'imteyaz', 'imteyaz@gmail.com', '$2y$10$SendhbGTL9sMUpGoevkumesJlQoIFV.HJ2N5Fwrpsscw6ZGge19zq', 1561651656),
(4, 'suhas dayare', 'suhas@gmail.com', '$2y$10$8i.ZRAKVJ2EiRAB6A1qzreRTqqzv./uRYq8XyXcYquwJUJ10OZ9W.', 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `list_price` decimal(10,2) NOT NULL,
  `brand` int(11) NOT NULL,
  `categories` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `featured` tinyint(4) NOT NULL DEFAULT '0',
  `sizes` text NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title`, `price`, `list_price`, `brand`, `categories`, `image`, `description`, `featured`, `sizes`, `deleted`) VALUES
(1, 'levi`s jeans', '31.54', '33.43', 11, '5', 'men4.png', 'This jeans are amazing and you will look sexy in it.', 1, '32:2,34:3,36:2,36:4,40:5', 0),
(2, 'Beutifull Shirt', '14.12', '20.12', 2, '4', 'men1.png', 'This is a cotton shirt with checks patter which will look good on you', 1, 'small:3, medium:3, large:6,xxxl:4', 0),
(9, 'Nike T-Shirt', '20.00', '25.00', 2, '4', 'men35aae2e2760cfd825720cd86f2a5ae596.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#039;s standard dummy text ever since the 1500s, ', 1, 'small:3,large:2', 0),
(10, 'A Beatifull Dress', '30.00', '32.00', 4, '9', 'women2daf02daebfe58604b36f44565b45ee79.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#039;s s', 1, 'small:3,large:2,medium:2', 0),
(11, 'American Dress', '31.00', '34.00', 4, '9', 'women32d8ac8a8a37cf0a4f2f2277d5c527809.png', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#039;s standard dummy text ever since the 1500s, ', 1, 'small:3,large:2,medium:3', 0),
(13, 'Polo Hoodi ', '23.00', '24.99', 2, '8', 'boys11f57d6fb95752b40821cda1796745325.png', 'Nike Full Sleeve Solid Kid&#039;s Sweatshirt', 1, 'small:3,large:2', 0),
(15, 'Leather Handmade Purse', '25.23', '28.00', 1, '49', 'women58edf7e4b5326563abc4220c2b3a20977.png', 'Yours Luggage Hand-held Bag', 0, 'small:3,medium:2', 1),
(16, 'Little Boy Suit', '20.21', '23.43', 4, '41', 'boys2dfb62fd08e8de8f9af7a6dbb2e3aef5c.png', 'A suite for little boys.Most comfortable suit for kids', 1, 'small:6,medium:4', 0),
(17, 'Winter Jacket', '30.12', '32.00', 9, '41', 'boys33ee11dd7820c95679447c40c78f761e4.png', 'A comfortable winter jacket for boys', 1, 'small:10,medium:4', 0),
(18, 'Pink Dress', '16.98', '18.00', 10, '13', 'girls1beaf0184a76a9249d20753911d699d8c.png', 'A cute dress for little girls', 1, 'small:6,medium:4', 0),
(19, 'A night suit', '13.00', '14.00', 4, '13', 'girls3a494999a3e0966b22726259f001de9d3.png', 'A night suit for girls', 1, 'small:8,medium:4', 0),
(20, 'a pricess dress', '38.43', '40.00', 4, '13', 'dress911a6ebbd26bec365dab6dfeeaeaea2b.png', 'A cute princess dress for little girls', 1, 'small:10,medium:8', 0),
(21, 'High Heels Rebbok', '20.00', '22.87', 2, '10', 'women6326ef48b06a7b81d0c57001f04fde5cb.png', 'High heel sandal for nice womens.', 1, '7:8,8:4,9:6', 0);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `contact_no` int(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `product_details` text NOT NULL,
  `total_amount` varchar(10) NOT NULL,
  `invoice_id` int(10) NOT NULL,
  `date_of_purchase` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `customer_name`, `address`, `contact_no`, `email`, `product_details`, `total_amount`, `invoice_id`, `date_of_purchase`) VALUES
(1, 'ropali munshi', '{"street":"17 section","city":"ulhasnagar","state":"maharashtra","zip_code":"421003"}', 1656512, 'ropali@gmail.com', '[{"id":"11","size":"small","quantity":1}]', '31', 302244, '29/06/2017'),
(2, 'ropali munshi', '{"street":"17 section","city":"ulhasnagar","state":"maharashtra","zip_code":"421003"}', 1656512, 'ropali@gmail.com', '[{"id":"13","size":"small","quantity":1}]', '23', 558915, '29/06/2017'),
(3, 'ropali munshi', '{"street":"17 section","city":"ulhasnagar","state":"maharashtra","zip_code":"421003"}', 1656512, 'ropali@gmail.com', '[{"id":"19","size":"small","quantity":2}]', '26', 160539, '29/06/2017'),
(4, 'imteyaz ansari', '{"street":"khemani","city":"mharal","state":"maharashtra","zip_code":"254693"}', 156115161, 'imteyaz@gmail.com', '[{"id":"1","size":"32","quantity":2}]', '63.08', 199734, '29/06/2017'),
(5, 'imteyaz ansari', '{"street":"khmeani","city":"mharal","state":"maharashtra","zip_code":"156156"}', 16565661, 'imteyaz@gmail.com', '[{"id":"1","size":"32","quantity":2}]', '63.08', 376585, '29/06/2017'),
(6, 'imteyaz ansari', '{"street":"khmeani","city":"mharal","state":"maharashtra","zip_code":"156156"}', 16565661, 'imteyaz@gmail.com', '[{"id":"9","size":"small","quantity":"1"}]', '20', 417781, '29/06/2017'),
(8, 'imteyaz ansari', '{"street":"khemani","city":"mharal","state":"maaharashtra","zip_code":"211515"}', 1165161561, 'imteyaz@gmail.com', '[{"id":"2","size":"medium","quantity":"1"}]', '14.12', 676177, '29/06/2017'),
(9, 'ropali munshi', '{"street":"dasdasd","city":"unr","state":"maharashtra","zip_code":"421003"}', 1561111565, 'ropali@gmail.com', '[{"id":"2","size":"medium","quantity":"2"}]', '$28.24', 963838, '10/07/2017'),
(10, 'ropali munshi', '{"street":"dasdasd","city":"unr","state":"maharashtra","zip_code":"421003"}', 1561111565, 'ropali@gmail.com', '[{"id":"9","size":"small","quantity":"2"}]', '$40.00', 116138, '10/07/2017');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `join_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` varchar(255) NOT NULL,
  `permissions` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `join_date`, `last_login`, `permissions`, `image`) VALUES
(1, 'admin admin', 'admin@admin.com', '$2y$10$ROwvffyUsU/t4dpkKaUhkOrxXdJABEqokVXnYM88mRMRwtjoAsJu6', '2017-06-01 15:11:11', '1499662696', 'admin,editor', 'Unknown_Person-d563e0f76697602976a30b92fca0fe7f.png'),
(2, 'ropali munshi', 'ropali@gmail.com', '$2y$10$hG8RxW4Ws5Elg9mEgoJpEuZRFf6.UfciWnE7cBVsHJOHMeniSrkSG', '2017-06-03 12:26:54', '1497321274', 'editor', 'profile2.jpeg'),
(9, 'imteyaz ansari', 'ansaria@gmail.com', '$2y$10$0DeTRDES03oiBCTvS5WcAOOMrTgKaAgRaOoDsWG7PDffcPD4g03kS', '2017-06-04 09:57:55', '1496582914', 'editor', 'homecoming9487adc92da26b49ea16605b4b33da4e.jpeg'),
(10, 'sid varma', 'sid@dummy.com', '$2y$10$UnJmrXp27vdnbDRanY1POev90//w9apHdN3SRzLAjYSVEcHXvh5.a', '2017-06-05 09:24:25', '1496675299', 'editor ', 'lambo-0f6ef3c7831867edb472f2db358d1a56.jpeg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;--
-- Database: `online_test`
--
CREATE DATABASE IF NOT EXISTS `online_test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `online_test`;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `questions` text NOT NULL,
  `option_A` varchar(255) NOT NULL,
  `option_B` varchar(255) NOT NULL,
  `option_C` varchar(255) NOT NULL,
  `option_D` varchar(255) NOT NULL,
  `answer` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `questions`, `option_A`, `option_B`, `option_C`, `option_D`, `answer`) VALUES
(1, 'What did Jesus feed the multitude at the Sea of Tiberias?', 'A. 5 loaves of bread and 2 fishes', 'B. 5 loaves of bread and 5 fishes', 'C. 2 loaves of bread and 5 fishes', 'D. 2 loaves of bread and 2 fishes', 'A'),
(2, 'Who is the Father of Joshua?', 'A. Shittim', 'B. Nun', 'C. Aaron', 'D. Samuel', 'B'),
(3, 'What is the name of the prophet from Tishbite whose parental lineage was unknown?', 'A. Elisha ', 'B. Micah', 'C. Elijah', 'D. Uriah', 'C'),
(4, 'Who is the father of Samson?', 'A. Tera', 'B. Manoah', 'C. Benjamin', 'D. Micah', 'B'),
(5, 'The gifts of the Holy Spirit can be grouped into how many categories? ', 'A. 4', 'B. 2', 'C. 3', 'D. 1', 'C'),
(6, 'How many souls were won at Peter''s 2nd sermon after the day of Pentecost?', 'A. 3000', 'B. 2000', 'C. 5000', 'D. 20000', 'C'),
(7, 'What is the name of Saul''s companion that later backslided?', 'A. Barnabas', 'B. Tychicus', 'C. Linus', 'D. Demas', 'D'),
(8, 'All but one of the following are minor prophets?', 'A. Obadiah', 'B. Hosea', 'C. Nahum', 'D. Ezekiel', 'D'),
(9, 'How many generations are there from Abraham to David?', 'A. 14', 'B. 15', 'C. 16', 'D. 17', 'A'),
(10, 'Who is the Earthly grandfather of Jesus Christ?', 'A. Eleazar', 'B. Jacob', 'C. Mathan', 'D. Azor', 'B');

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `id` int(11) NOT NULL,
  `matric_number` varchar(10) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `result` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `matric_number` (`matric_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Dumping data for table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'server', 'myboutique', '{"quick_or_custom":"quick","what":"sql","db_select[]":["Library","accounts","cms","dvwa","hotelmis","java","myboutique","online_test","phpmyadmin","pizzaria","project","student","test","user"],"output_format":"sendit","filename_template":"@SERVER@","remember_template":"on","charset":"utf-8","compression":"none","maxsize":"","yaml_structure_or_data":"data","htmlword_structure_or_data":"structure_and_data","htmlword_null":"NULL","sql_include_comments":"something","sql_header_comment":"","sql_compatibility":"NONE","sql_structure_or_data":"structure_and_data","sql_create_table":"something","sql_auto_increment":"something","sql_create_view":"something","sql_procedure_function":"something","sql_create_trigger":"something","sql_backquotes":"something","sql_type":"INSERT","sql_insert_syntax":"both","sql_max_query_size":"50000","sql_hex_for_binary":"something","sql_utc_time":"something","json_structure_or_data":"data","phparray_structure_or_data":"data","pdf_report_title":"","pdf_structure_or_data":"data","latex_caption":"something","latex_structure_or_data":"structure_and_data","latex_structure_caption":"Structure of table @TABLE@","latex_structure_continued_caption":"Structure of table @TABLE@ (continued)","latex_structure_label":"tab:@TABLE@-structure","latex_relation":"something","latex_comments":"something","latex_mime":"something","latex_columns":"something","latex_data_caption":"Content of table @TABLE@","latex_data_continued_caption":"Content of table @TABLE@ (continued)","latex_data_label":"tab:@TABLE@-data","latex_null":"\\\\textit{NULL}","excel_null":"NULL","excel_edition":"win","excel_structure_or_data":"data","csv_separator":",","csv_enclosed":"\\"","csv_escaped":"\\"","csv_terminated":"AUTO","csv_null":"NULL","csv_structure_or_data":"data","texytext_structure_or_data":"structure_and_data","texytext_null":"NULL","mediawiki_structure_or_data":"data","mediawiki_caption":"something","mediawiki_headers":"something","odt_structure_or_data":"structure_and_data","odt_relation":"something","odt_comments":"something","odt_mime":"something","odt_columns":"something","odt_null":"NULL","codegen_structure_or_data":"data","codegen_format":"0","ods_null":"NULL","ods_structure_or_data":"data","":null,"as_separate_files":null,"htmlword_columns":null,"sql_dates":null,"sql_relation":null,"sql_mime":null,"sql_use_transaction":null,"sql_disable_fk":null,"sql_views_as_tables":null,"sql_metadata":null,"sql_drop_database":null,"sql_drop_table":null,"sql_if_not_exists":null,"sql_truncate":null,"sql_delayed":null,"sql_ignore":null,"json_pretty_print":null,"excel_removeCRLF":null,"excel_columns":null,"csv_removeCRLF":null,"csv_columns":null,"texytext_columns":null,"ods_columns":null}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{"db":"Library","table":"Accounts"},{"db":"Library","table":"logtable"},{"db":"Library","table":"Books"},{"db":"Library","table":"issued_books"},{"db":"Library","table":"students"},{"db":"java","table":"test"},{"db":"online_test","table":"questions"},{"db":"online_test","table":"result"},{"db":"cms","table":"users"},{"db":"myboutique","table":"products"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'Library', 'issued_books', '[]', '2017-08-19 15:18:53');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2017-02-19 07:29:03', '{"collation_connection":"utf8mb4_unicode_ci"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;--
-- Database: `pizzaria`
--
CREATE DATABASE IF NOT EXISTS `pizzaria` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `pizzaria`;

-- --------------------------------------------------------

--
-- Table structure for table `pizza_order`
--

CREATE TABLE `pizza_order` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `address` text NOT NULL,
  `order_date` varchar(20) NOT NULL,
  `payment_type` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pizza_order`
--

INSERT INTO `pizza_order` (`id`, `name`, `address`, `order_date`, `payment_type`) VALUES
(1, 'test', 'test', '2017-04-19', 'cod'),
(2, 'ali', 'admklnlsnlasl', '14-Apr-2017', 'cod'),
(3, 'asasd', 'accac', '14-Apr-2017', 'cod'),
(4, 'asdsdasd', 'aassmlmosam', '14-Apr-2017', 'cc'),
(5, 'sd', 'SACASC', '14-Apr-2017', 'cod'),
(6, 'adssd', 'daa', '14-Apr-2017', 'cod'),
(7, 'andsjnajdn', 'lalnal', '14-Apr-2017', 'cod'),
(8, 'qwerty', 'asdanjandjasjdn', '14-Apr-2017', 'dc'),
(9, 'ropali', 'unr-3', '14-Apr-2017', 'dc'),
(10, 'ropali', 'unr', '14-Apr-2017', 'dc');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `ID` int(11) NOT NULL,
  `mob_no` int(10) NOT NULL,
  `name` varchar(256) NOT NULL,
  `surname` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `passwd` varchar(256) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`ID`, `mob_no`, `name`, `surname`, `email`, `passwd`, `address`) VALUES
(2, 1231231234, 'rohan', 'shinge', 'rohan@gmail.com', 'rohan', 'kalyan west.'),
(3, 2147483647, 'akshay', 'patil', 'akshay@gmail.com', 'akshay', 'ulhasnagr - 421004.'),
(4, 1010101010, 'admin', 'admin', 'admin@admin.com', 'admin', 'admin lives on server....'),
(5, 1111111111, 'imteyaz', 'ansari', 'imteyaz@gmail.com', 'ansari', 'maralgaon'),
(6, 1651166566, 'yogendra', 'saw', 'saw@gmail.com', 'saw', 'kalyan'),
(7, 1165611655, 'ropali', 'munshi', 'ropali@gmail.com', 'ropali', 'ulhasnagr'),
(9, 216516165, 'abc', 'abc', 'abc@abc.com', 'abc', 'abcd'),
(10, 1655165165, 'ropali', 'munshi', 'ropali@gmail.com', 'ropali', 'unr'),
(11, 2147483647, 'ropali', 'munshi', 'rop@gmail.com', 'rop', 'unr'),
(12, 2147483647, 'abc', 'abc', 'abc@gmail.com', 'abc', 'nowhere');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pizza_order`
--
ALTER TABLE `pizza_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pizza_order`
--
ALTER TABLE `pizza_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;--
-- Database: `project`
--
CREATE DATABASE IF NOT EXISTS `project` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `project`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`) VALUES
(11, 'babars'),
(12, 'zohaib'),
(16, 'hellos');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `post_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `date`, `name`, `username`, `post_id`, `email`, `website`, `image`, `comment`, `status`) VALUES
(1, 1012456788, 'babar', 'babar786', 4, 'jeljda@gmailc.om', 'jlsdjf.com', 'unknown-picture.png', 'this is demo comment. this is demo comment. this is demo comment. this is demo comment. this is demo comment. this is demo comment. this is demo comment. this is demo comment. this is demo comment. this is demo comment. this is demo comment. this is demo comment. this is demo comment. this is demo comment. this is demo comment. this is demo comment. this is demo comment. this is demo comment. this is demo comment. this is demo comment. this is demo comment. this is demo comment. this is demo comment. this is demo comment. ', 'approve'),
(10, 1454232171, 'saleem', 'user', 3, 'lasjfads@gmail.com', 'jflajadsflfdasj.com', 'unknown-picture.png', 'pakistan ', 'approve'),
(11, 1454233069, 'Muhammad Babar,', 'babar786', 3, 'babar786@gmail.com', '', 'slider-img2.jpg', 'great work', 'approve'),
(12, 1454451788, 'lldfsjadsfd', 'user', 15, 'ljadslfjaslasfj', 'jasdlfjaldkjdf', 'unknown-picture.png', 'helolo', 'approve'),
(13, 1454453211, 'ildjladfjadl', 'user', 1, 'jasdlfjadljf', 'ldjlfajf', 'unknown-picture.png', 'ldasfjladjfdlkfdasj', 'approve'),
(14, 1454453241, 'Muhammad Babar,', 'babar786', 1, 'babar786@gmail.com', '', 'slider-img2.jpg', 'good', 'approve'),
(15, 1454454437, 'Muhammad Babar', 'babar786', 1, 'babar786@gmail.com', '', 'slider-img2.jpg', 'hello', 'pending'),
(16, 1454499324, 'asdjlfjdsal', 'user', 15, 'kjsdaljfdafslkj', 'ljdfljladkjf', 'unknown-picture.png', 'dlsfjldasjflda', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `image`) VALUES
(27, 'Facebook-Page-Cover-photo.png'),
(28, 'sohail card.jpg'),
(29, 'usman visiting cards.jpg'),
(30, 'visiting Card of nadeem.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `author_image` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `categories` varchar(255) NOT NULL,
  `tags` varchar(255) NOT NULL,
  `post_data` text NOT NULL,
  `views` int(11) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `date`, `title`, `author`, `author_image`, `image`, `categories`, `tags`, `post_data`, `views`, `status`) VALUES
(1, 1457895484, 'Here are some of my Visiting Cards list. hello gee', 'babar786', 'profile-black.jpg', 'Babar786 Wallpaper.jpg', 'hellos', 'jadslfjadlj', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p><strong>babar Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><img style="display: block; margin-left: auto; margin-right: auto;" src="media/visiting Card of nadeem.jpg" alt="visiting Card of nadeem.jpg" width="518" height="296" /></p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><img style="display: block; margin-left: auto; margin-right: auto;" src="media/usman visiting cards.jpg" alt="usman visiting cards.jpg" width="457" height="259" /></p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><img style="display: block; margin-left: auto; margin-right: auto;" src="media/sohail card.jpg" alt="sohail card.jpg" width="349" height="200" /></p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><img style="display: block; margin-left: auto; margin-right: auto;" src="media/Facebook-Page-Cover-photo.png" alt="Facebook-Page-Cover-photo.png" width="524" height="194" /></p>\r\n</body>\r\n</html>', 55, 'publish'),
(11, 1454400657, 'Here are some of my Visiting Cards list. hello gee', 'babar786', 'slider-img2.jpg', 'Babar786 Wallpaper.jpg', 'hellos', 'jadslfjadlj', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p><strong>babar Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><img style="display: block; margin-left: auto; margin-right: auto;" src="media/visiting Card of nadeem.jpg" alt="visiting Card of nadeem.jpg" width="518" height="296" /></p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><img style="display: block; margin-left: auto; margin-right: auto;" src="media/usman visiting cards.jpg" alt="usman visiting cards.jpg" width="457" height="259" /></p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><img style="display: block; margin-left: auto; margin-right: auto;" src="media/sohail card.jpg" alt="sohail card.jpg" width="349" height="200" /></p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><img style="display: block; margin-left: auto; margin-right: auto;" src="media/Facebook-Page-Cover-photo.png" alt="Facebook-Page-Cover-photo.png" width="524" height="194" /></p>\r\n</body>\r\n</html>', 6, 'publish'),
(12, 1454401102, 'Here are some of my Visiting Cards list. hello geejjjj', 'babar786', 'slider-img2.jpg', 'Babar786 Wallpaper.jpg', 'hellos', 'jadslfjadlj', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p><strong>babar Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><img style="display: block; margin-left: auto; margin-right: auto;" src="media/visiting Card of nadeem.jpg" alt="visiting Card of nadeem.jpg" width="518" height="296" /></p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><img style="display: block; margin-left: auto; margin-right: auto;" src="media/usman visiting cards.jpg" alt="usman visiting cards.jpg" width="457" height="259" /></p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><img style="display: block; margin-left: auto; margin-right: auto;" src="media/sohail card.jpg" alt="sohail card.jpg" width="349" height="200" /></p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><img style="display: block; margin-left: auto; margin-right: auto;" src="media/Facebook-Page-Cover-photo.png" alt="Facebook-Page-Cover-photo.png" width="524" height="194" /></p>\r\n</body>\r\n</html>', 1, 'publish'),
(13, 1454403833, 'Here are some of my Visiting Cards list. hello gee', 'babar786', 'slider-img2.jpg', 'Babar786 Wallpaper.jpg', 'hellos', 'jadslfjadlj', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p><strong>babar Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><img style="display: block; margin-left: auto; margin-right: auto;" src="media/visiting Card of nadeem.jpg" alt="visiting Card of nadeem.jpg" width="518" height="296" /></p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><img style="display: block; margin-left: auto; margin-right: auto;" src="media/usman visiting cards.jpg" alt="usman visiting cards.jpg" width="457" height="259" /></p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><img style="display: block; margin-left: auto; margin-right: auto;" src="media/sohail card.jpg" alt="sohail card.jpg" width="349" height="200" /></p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><img style="display: block; margin-left: auto; margin-right: auto;" src="media/Facebook-Page-Cover-photo.png" alt="Facebook-Page-Cover-photo.png" width="524" height="194" /></p>\r\n</body>\r\n</html>', 1, 'publish'),
(14, 1454403933, 'Here are some of my Visiting Cards list. hello gee', 'babar786', 'slider-img2.jpg', 'Facebook-Page-Cover-photo.png', 'hellos', 'jadslfjadlj', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p><strong>babar Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><img style="display: block; margin-left: auto; margin-right: auto;" src="media/visiting Card of nadeem.jpg" alt="visiting Card of nadeem.jpg" width="518" height="296" /></p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><img style="display: block; margin-left: auto; margin-right: auto;" src="media/usman visiting cards.jpg" alt="usman visiting cards.jpg" width="457" height="259" /></p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><img style="display: block; margin-left: auto; margin-right: auto;" src="media/sohail card.jpg" alt="sohail card.jpg" width="349" height="200" /></p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><img style="display: block; margin-left: auto; margin-right: auto;" src="media/Facebook-Page-Cover-photo.png" alt="Facebook-Page-Cover-photo.png" width="524" height="194" /></p>\r\n</body>\r\n</html>', 0, 'publish'),
(15, 1454405440, 'My new post', 'babar786', 'slider-img2.jpg', 'sohail card.jpg', 'babars', 'babar', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<p><strong>Muhammad BAbar</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><img style="display: block; margin-left: auto; margin-right: auto;" src="media/visiting Card of nadeem.jpg" alt="visiting Card of nadeem.jpg" width="518" height="296" /></p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><img style="display: block; margin-left: auto; margin-right: auto;" src="media/usman visiting cards.jpg" alt="usman visiting cards.jpg" width="457" height="259" /></p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><img style="display: block; margin-left: auto; margin-right: auto;" src="media/sohail card.jpg" alt="sohail card.jpg" width="349" height="200" /></p>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n<p><img style="display: block; margin-left: auto; margin-right: auto;" src="media/Facebook-Page-Cover-photo.png" alt="Facebook-Page-Cover-photo.png" width="524" height="194" /></p>\r\n</body>\r\n</html>', 4, 'publish'),
(16, 1493994759, 'lorem ipsum', 'ropali', 'profile2.jpeg', 'slider-img2.jpg', 'zohaib', 'sajdnjas', '<!DOCTYPE html>\r\n<html>\r\n<head>\r\n</head>\r\n<body>\r\n<div>\r\n<h2>What is Lorem Ipsum?</h2>\r\n<p><strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n</div>\r\n<div>\r\n<h2>Why do we use it?</h2>\r\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n</div>\r\n<p>&nbsp;</p>\r\n<div>\r\n<h2>Where does it come from?</h2>\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.</p>\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>\r\n</div>\r\n</body>\r\n</html>', 0, 'publish');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `salt` varchar(255) NOT NULL DEFAULT '$2y$10$quickbrownfoxjumpsover'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `date`, `first_name`, `last_name`, `username`, `email`, `image`, `password`, `role`, `details`, `salt`) VALUES
(5, 1453895906, 'Muhammad', 'Babar', 'babar786', 'babar786@gmail.com', 'slider-img2.jpg', '$2y$10$quickbrownfoxjumpsoveexEmbfnPD8RTxbh.VqZ2.r/GX9Z/7EB6', 'admin', 'Hello i am muhammad Babar', '$2y$10$quickbrownfoxjumpsover'),
(10, 1454447845, 'Nadeem', 'Haroon', 'falakbutt', 'falakbutt@gmail.com', '1443940709885.jpg', '$2y$10$quickbrownfoxjumpsoveexEmbfnPD8RTxbh.VqZ2.r/GX9Z/7EB6', 'author', 'My name is Nadeem Haroon Butt. And i am aslo blogger and bloggin is my hobby and passion. I am also a web and graphic designer. And i am 21 years old. and work for this site.', '$2y$10$quickbrownfoxjumpsover'),
(11, 1454447938, 'Kashif', 'Fayyaz', 'kashif', 'jdalfdaj@gmail.com', '1443939705810.jpg', '$2y$10$quickbrownfoxjumpsoveexEmbfnPD8RTxbh.VqZ2.r/GX9Z/7EB6', 'author', 'Hello My name is Kashif and i am a developer. I am 25 years old and Working for a reputed company. Bloggin is my passion.', '$2y$10$quickbrownfoxjumpsover'),
(12, 1454448388, 'Usman', 'Arshad', 'usman', 'asldjfdjas@gmail.com', '2013-01-01 12.41.53.jpg', '$2y$10$quickbrownfoxjumpsoveexEmbfnPD8RTxbh.VqZ2.r/GX9Z/7EB6', 'author', '', '$2y$10$quickbrownfoxjumpsover');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;--
-- Database: `student`
--
CREATE DATABASE IF NOT EXISTS `student` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `student`;

-- --------------------------------------------------------

--
-- Table structure for table `stud_info`
--

CREATE TABLE `stud_info` (
  `ID` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `surname` varchar(40) NOT NULL,
  `user_name` varchar(40) NOT NULL,
  `passwd` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stud_info`
--

INSERT INTO `stud_info` (`ID`, `name`, `surname`, `user_name`, `passwd`) VALUES
(1, 'ropali', 'munshi', 'admin', 'admin'),
(2, 'akshay', 'patil', 'akshay', 'akshay123'),
(3, 'rohan', 'shinge', 'rohan', 'rohan123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `stud_info`
--
ALTER TABLE `stud_info`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `stud_info`
--
ALTER TABLE `stud_info`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`` PROCEDURE `AddGeometryColumn` (`catalog` VARCHAR(64), `t_schema` VARCHAR(64), `t_name` VARCHAR(64), `geometry_column` VARCHAR(64), `t_srid` INT)  begin
  set @qwe= concat('ALTER TABLE ', t_schema, '.', t_name, ' ADD ', geometry_column,' GEOMETRY REF_SYSTEM_ID=', t_srid); PREPARE ls from @qwe; execute ls; deallocate prepare ls; end$$

CREATE DEFINER=`` PROCEDURE `DropGeometryColumn` (`catalog` VARCHAR(64), `t_schema` VARCHAR(64), `t_name` VARCHAR(64), `geometry_column` VARCHAR(64))  begin
  set @qwe= concat('ALTER TABLE ', t_schema, '.', t_name, ' DROP ', geometry_column); PREPARE ls from @qwe; execute ls; deallocate prepare ls; end$$

DELIMITER ;
--
-- Database: `user`
--
CREATE DATABASE IF NOT EXISTS `user` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `user`;

-- --------------------------------------------------------

--
-- Table structure for table `accept`
--

CREATE TABLE `accept` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `checkin` varchar(20) NOT NULL,
  `checkout` varchar(20) NOT NULL,
  `hotelname` varchar(20) NOT NULL,
  `roomtype` varchar(20) NOT NULL,
  `price` varchar(20) NOT NULL,
  `troom` varchar(20) NOT NULL,
  `tprice` varchar(20) NOT NULL,
  `bank` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accept`
--

INSERT INTO `accept` (`id`, `name`, `country`, `contact`, `email`, `checkin`, `checkout`, `hotelname`, `roomtype`, `price`, `troom`, `tprice`, `bank`) VALUES
(4, 'Sawan mahmud', 'Bangladesh', '01738214430', 'sawan@gmail.com', '2016-09-15', '2016-09-16', 'Grand Orient', 'Delux', '$250', '3', '$750', '017382144302');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('nishat', '113059'),
('riyad', '113023'),
('sawan', '113019'),
('tarek', '113024'),
('sujan', '113060');

-- --------------------------------------------------------

--
-- Table structure for table `approved`
--

CREATE TABLE `approved` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `checkin` varchar(20) NOT NULL,
  `checkout` varchar(20) NOT NULL,
  `hotelname` varchar(20) NOT NULL,
  `roomtype` varchar(20) NOT NULL,
  `price` varchar(20) NOT NULL,
  `troom` varchar(20) NOT NULL,
  `tprice` varchar(20) NOT NULL,
  `bank` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `approved`
--

INSERT INTO `approved` (`id`, `name`, `country`, `contact`, `email`, `checkin`, `checkout`, `hotelname`, `roomtype`, `price`, `troom`, `tprice`, `bank`) VALUES
(2, 'Tarek Rahman', 'Bangladesh', '01738214430', 'tarek@yahoo.com', '2016-09-13', '2016-09-13', 'Grand Orient', 'Delux', '$250', '3', '$750', '017382144302'),
(3, 'Tarek Rahman', 'Bangladesh', '01738214430', 'tarek@yahoo.com', '2016-09-13', '2016-09-14', 'Grand Orient', 'Delux', '$250', '3', '$750', '017382144302');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `contact` varchar(30) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `checkin` varchar(30) DEFAULT NULL,
  `checkout` varchar(30) DEFAULT NULL,
  `hotelname` varchar(30) DEFAULT NULL,
  `roomtype` varchar(30) DEFAULT NULL,
  `price` varchar(30) DEFAULT NULL,
  `troom` varchar(30) DEFAULT NULL,
  `tprice` varchar(30) DEFAULT NULL,
  `bank` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`id`, `name`, `country`, `contact`, `email`, `checkin`, `checkout`, `hotelname`, `roomtype`, `price`, `troom`, `tprice`, `bank`) VALUES
(5, 'Taufiqur Rahman', 'Bangladesh', '01738214430', 'taufiq@yahoo.com', '2016-09-20', '2016-09-21', 'Grand Orient', 'Standard Room', '$250', '1', '$750', '017382144302'),
(6, 'Sujan mahmud', 'Bangladesh', '01771220983', 'sujan@gmail.com', '2016-09-13', '2016-09-14', 'Hotel agrabad', 'Standard Room', '185', '1', '$750', '017382144302'),
(7, 'ropali', 'india', '887121232', 'ropali@gmail.com', '12/12/12', '13/12/13', 'Grand Graiedn', 'Delux', '12123', '3', '1232312', '2312312312323');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `name` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `con_pass` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`name`, `username`, `password`, `con_pass`, `email`) VALUES
('sujan', 'sujan', '12345', '12345', 'sujan@gmail.com'),
('tarek', 'tarek', '12345', '12345', 'tarek@yahoo.com'),
('Taufiqur Rahman', 'taufiqur', '12345', '12345', 'taufiq@yahoo.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accept`
--
ALTER TABLE `accept`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `approved`
--
ALTER TABLE `approved`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accept`
--
ALTER TABLE `accept`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `approved`
--
ALTER TABLE `approved`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
