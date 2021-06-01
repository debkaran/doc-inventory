-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 31, 2021 at 09:25 AM
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
CREATE DATABASE IF NOT EXISTS `doc_inventory` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `doc_inventory`;

-- --------------------------------------------------------

--
-- Table structure for table `default_user_space`
--

CREATE TABLE `default_user_space` (
  `id` int(11) NOT NULL,
  `storage_space` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `temp_file_details`
--

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
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` varchar(6) NOT NULL DEFAULT 'user' COMMENT 'admin/user',
  `password` varchar(256) NOT NULL,
  `profile_picture` text NOT NULL,
  `storage_space` float NOT NULL,
  `dob` date NOT NULL,
  `created_date` datetime DEFAULT NULL COMMENT 'Account created date',
  `last_login_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`id`, `name`, `email`, `role`, `password`, `profile_picture`, `storage_space`, `dob`, `created_date`, `last_login_time`) VALUES
(1, 'deb', 'debkaransinghania@gmail.com', 'user', 'debkaran', '/home/deb/Downloads/earth.gif', 5, '2021-05-13', NULL, NULL),
(2, 'Ram', 'ram@gmail.com', 'user', 'ram', '/home/deb/Downloads/nature.jpeg', 5, '2021-04-30', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `temp_file_details`
--
ALTER TABLE `temp_file_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `temp_file_details`
--
ALTER TABLE `temp_file_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
