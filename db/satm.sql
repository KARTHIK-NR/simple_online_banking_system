-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2023 at 09:53 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `satm`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `aid` int(100) NOT NULL,
  `account_no` varchar(100) CHARACTER SET armscii8 NOT NULL,
  `name` varchar(100) CHARACTER SET armscii8 NOT NULL,
  `address` varchar(250) CHARACTER SET armscii8 NOT NULL,
  `password` varchar(20) CHARACTER SET armscii8 NOT NULL,
  `mobile_no` bigint(30) NOT NULL,
  `status` varchar(100) CHARACTER SET armscii8 NOT NULL DEFAULT 'pending',
  `balance` bigint(100) NOT NULL DEFAULT 0,
  `withdraw_limit` int(20) NOT NULL DEFAULT 20000,
  `pass_recovery` varchar(150) CHARACTER SET armscii8 DEFAULT NULL,
  `pass_hint` varchar(100) CHARACTER SET armscii8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`aid`, `account_no`, `name`, `address`, `password`, `mobile_no`, `status`, `balance`, `withdraw_limit`, `pass_recovery`, `pass_hint`) VALUES
(4, 'MYS906641', 'sam', 'jsjlslsls', 'gah', 1526283010, 'approved', 12550, 10000, 'What was the name of your first pet', 'kind'),
(6, 'MYS877291', 'abc', 'kingroad', 'abc', 6485765100, 'blockrequest', 23950, 20000, 'What was your childhood nickname', 'hint'),
(7, 'MYS523431', 'name', 'kingroad', 'd', 6776999900, 'pending', 0, 20000, NULL, NULL),
(8, 'MYS489041', 'John', 'road', 'john', 8765877200, 'pending', 0, 20000, NULL, NULL),
(13, 'MYS347601', 'New User', 'mysore', '123', 8770405400, 'approved', 2800, 30000, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `mid` int(100) NOT NULL,
  `m_name` varchar(100) CHARACTER SET armscii8 NOT NULL,
  `m_password` varchar(100) CHARACTER SET armscii8 NOT NULL,
  `daily_limit_no` int(20) NOT NULL DEFAULT 5
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`mid`, `m_name`, `m_password`, `daily_limit_no`) VALUES
(1, 'admin', 'admin', 5);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `tid` int(100) NOT NULL,
  `date_time` datetime NOT NULL DEFAULT current_timestamp(),
  `type` varchar(100) CHARACTER SET armscii8 NOT NULL DEFAULT 'self',
  `from_acc_no` varchar(100) CHARACTER SET armscii8 NOT NULL,
  `to_acc_no` varchar(100) CHARACTER SET armscii8 NOT NULL,
  `amount` bigint(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`aid`),
  ADD UNIQUE KEY `account_no` (`account_no`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`mid`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`tid`),
  ADD KEY `from_acc_no` (`from_acc_no`),
  ADD KEY `to_acc_no` (`to_acc_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `aid` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `manager`
--
ALTER TABLE `manager`
  MODIFY `mid` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `tid` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`from_acc_no`) REFERENCES `account` (`account_no`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`to_acc_no`) REFERENCES `account` (`account_no`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
