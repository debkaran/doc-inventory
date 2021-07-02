-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 01, 2021 at 08:43 PM
-- Server version: 5.7.34-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `doc_inventory`
--
DROP DATABASE IF EXISTS `doc_inventory`;
CREATE DATABASE IF NOT EXISTS `doc_inventory` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `doc_inventory`;

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `CreateAccount`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateAccount` (IN `name` VARCHAR(100), IN `email` VARCHAR(100), IN `password` VARCHAR(256), IN `profile_picture` TEXT, IN `dob` DATE, OUT `l_account_id` INT)  BEGIN
    DECLARE s_space float DEFAULT 0.0;
    
    START TRANSACTION;
    
SELECT 
    storage_space
INTO s_space FROM
    default_user_space;
        
	SELECT s_space;
    
        INSERT INTO user_details(`name`, `email`,  `password`, `profile_picture`, `storage_space`, `dob`)
    VALUES(name, email, password, profile_picture, s_space, dob);
    
        SET l_account_id = LAST_INSERT_ID();
    
    	COMMIT;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `default_user_space`
--
-- Creation: Jun 26, 2021 at 03:45 AM
--

DROP TABLE IF EXISTS `default_user_space`;
CREATE TABLE `default_user_space` (
  `id` int(11) NOT NULL,
  `storage_space` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `default_user_space`
--

INSERT INTO `default_user_space` (`id`, `storage_space`) VALUES
(1, 5);

--
-- Triggers `default_user_space`
--
DROP TRIGGER IF EXISTS `after_default_user_space_update`;
DELIMITER $$
CREATE TRIGGER `after_default_user_space_update` AFTER UPDATE ON `default_user_space` FOR EACH ROW BEGIN
	DECLARE balance_space float;
    set balance_space = new.storage_space - old.storage_space;
    SET SQL_SAFE_UPDATES = 0;
    INSERT INTO default_user_space_log(old_storage_space, new_storage_space)
        VALUES(old.storage_space, new.storage_space);
    update user_details set storage_space = storage_space + balance_space 
		where role = 'user';
	SET SQL_SAFE_UPDATES = 1;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `default_user_space_log`
--
-- Creation: Jun 26, 2021 at 03:45 AM
--

DROP TABLE IF EXISTS `default_user_space_log`;
CREATE TABLE `default_user_space_log` (
  `id` int(11) NOT NULL,
  `old_storage_space` float NOT NULL,
  `new_storage_space` float NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `default_user_space_log`
--

INSERT INTO `default_user_space_log` (`id`, `old_storage_space`, `new_storage_space`, `created_date`) VALUES
(4, 5, 6, '2021-06-12 23:38:00'),
(5, 6, 5, '2021-06-12 23:42:25'),
(6, 5, 7, '2021-06-13 11:02:05'),
(7, 7, 5, '2021-06-13 11:02:58'),
(8, 5, 5, '2021-06-13 11:04:02'),
(9, 5, 5, '2021-06-13 11:04:24'),
(10, 5, 10, '2021-06-13 11:05:24'),
(11, 10, 5, '2021-06-13 11:05:40'),
(12, 5, 7, '2021-06-13 11:06:40'),
(13, 7, 2, '2021-06-13 11:08:06'),
(14, 2, 5, '2021-06-13 11:08:49');

-- --------------------------------------------------------

--
-- Table structure for table `temp_file_details`
--
-- Creation: Jun 26, 2021 at 03:45 AM
--

DROP TABLE IF EXISTS `temp_file_details`;
CREATE TABLE `temp_file_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'forign key of user_details(id)',
  `file_name` text NOT NULL COMMENT 'only file name',
  `file_type` varchar(2) NOT NULL COMMENT 'f = file, d = directory',
  `file_path` text NOT NULL COMMENT 'fully qualified file name',
  `content_type` varchar(100) NOT NULL,
  `file_size` float NOT NULL COMMENT 'In bytes',
  `physical_upload_directory` text NOT NULL,
  `relative_upload_directory` text NOT NULL,
  `parent_directory_name` varchar(256) NOT NULL COMMENT 'only selected upload folder'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--
-- Creation: Jun 26, 2021 at 03:45 AM
--

DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `email` varchar(250) DEFAULT NULL,
  `pass` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `email`, `pass`) VALUES
(2, 'suvankarsen@outlook.com', '123'),
(3, 'suvankarsen@outlook.com', '858589');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--
-- Creation: Jun 26, 2021 at 03:45 AM
-- Last update: Jul 01, 2021 at 01:17 PM
--

DROP TABLE IF EXISTS `user_details`;
CREATE TABLE `user_details` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` varchar(6) NOT NULL DEFAULT 'user' COMMENT 'admin/user',
  `password` varchar(256) NOT NULL,
  `profile_picture` text NOT NULL,
  `storage_space` float NOT NULL,
  `dob` date NOT NULL,
  `created_date` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Account created date',
  `last_login_time` datetime DEFAULT NULL,
  `no_of_failure_login` int(11) NOT NULL DEFAULT '0',
  `last_failure_login_time` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`id`, `name`, `email`, `role`, `password`, `profile_picture`, `storage_space`, `dob`, `created_date`, `last_login_time`, `no_of_failure_login`, `last_failure_login_time`, `is_active`, `is_delete`) VALUES
(2, 'Ram', 'ram@gmail.com', 'user', 'ram', '/home/deb/Downloads/nature.jpeg', 5, '2021-04-30', NULL, NULL, 0, NULL, 0, 0),
(9, 'user1', 'user1@gmail.com', 'user', 'passOfUser1', 'c:\\default_picture.jpg', 5, '1989-10-15', '2021-06-12 18:31:08', NULL, 0, NULL, 0, 0),
(10, 'user2', 'user2@gmail.com', 'user', 'passOfUser2', 'c:\\default_picture.jpg', 5, '1989-10-15', '2021-06-12 20:27:10', NULL, 0, NULL, 0, 0),
(25, 'Suvankar Sen', 'suvankar@outlook.com', 'user', '123456', 'http://localhost:8080/doc-inventory/profile-image?text=S', 5, '2020-12-27', '2021-06-14 14:14:05', NULL, 0, NULL, 0, 0),
(33, 'Suvankar Sen', 'suvankarsen89@gmail.com', 'user', '123456', 'http://localhost:8080/doc-inventory/profile-image?text=S', 5, '2020-12-27', '2021-06-19 11:44:11', NULL, 0, NULL, 0, 0),
(39, 'Deb Karan Singhania', 'debkaransinghania@gmail.com', 'user', 'debkaran', 'http://localhost:8080/doc-inventory/profile-image?text=D', 5, '1999-12-26', '2021-07-01 18:47:40', NULL, 0, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_otp_details`
--
-- Creation: Jul 01, 2021 at 04:46 AM
-- Last update: Jul 01, 2021 at 01:28 PM
--

DROP TABLE IF EXISTS `user_otp_details`;
CREATE TABLE `user_otp_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `source_page` varchar(100) DEFAULT NULL,
  `otp` varchar(512) DEFAULT NULL,
  `otp_generation_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `is_used` tinyint(1) DEFAULT '0',
  `is_delete` tinyint(4) DEFAULT '0',
  `is_expired` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_otp_details`
--

INSERT INTO `user_otp_details` (`id`, `user_id`, `source_page`, `otp`, `otp_generation_date`, `is_used`, `is_delete`, `is_expired`) VALUES
(2, 20, NULL, 'vWEaZCxw', '2021-06-14 11:30:15', 0, 0, 1),
(3, 21, NULL, 'qiA22fxN', '2021-06-14 12:05:04', 0, 0, 1),
(4, 24, NULL, 'D9MZ24f7', '2021-06-14 14:08:16', 0, 0, 1),
(5, 25, NULL, 'AO6esewT', '2021-06-14 14:14:05', 0, 0, 1),
(6, 26, NULL, 'uRA5dZTw', '2021-06-19 11:00:11', 0, 0, 1),
(7, 27, NULL, 'zoyIoMpA', '2021-06-19 11:08:49', 0, 0, 1),
(8, 28, NULL, 'enx6z1lc', '2021-06-19 11:19:47', 0, 0, 1),
(9, 30, NULL, '8ApRaVfA', '2021-06-19 11:29:38', 0, 0, 1),
(10, 31, NULL, 'ZBdetfYZ', '2021-06-19 11:31:53', 0, 0, 1),
(11, 32, NULL, 'YQynHtV8', '2021-06-19 11:37:48', 0, 0, 1),
(12, 33, 'registration', 'mwc4Uh7x', '2021-06-19 11:44:12', 0, 0, 1),
(13, 33, 'registration', 'w88wH8Zc', '2021-06-23 09:16:29', 0, 0, 1),
(19, 39, 'registration', 'mEdenpnx', '2021-07-01 18:47:41', 0, 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `default_user_space`
--
ALTER TABLE `default_user_space`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `default_user_space_log`
--
ALTER TABLE `default_user_space_log`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `temp_file_details`
--
ALTER TABLE `temp_file_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_otp_details`
--
ALTER TABLE `user_otp_details`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `default_user_space`
--
ALTER TABLE `default_user_space`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `default_user_space_log`
--
ALTER TABLE `default_user_space_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `temp_file_details`
--
ALTER TABLE `temp_file_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `user_otp_details`
--
ALTER TABLE `user_otp_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
DELIMITER $$
--
-- Events
--
DROP EVENT `otp_expired_event`$$
CREATE DEFINER=`root`@`localhost` EVENT `otp_expired_event` ON SCHEDULE EVERY 1 MINUTE STARTS '2021-07-01 10:27:41' ON COMPLETION NOT PRESERVE ENABLE DO update user_otp_details set `is_expired` = true WHERE `otp_generation_date` < (NOW() - INTERVAL 10 MINUTE) and `is_expired` is false$$

DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
